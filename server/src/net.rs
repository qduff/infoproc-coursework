use capnp::message::{ReaderOptions, ScratchSpaceHeapAllocator};
use capnp::serialize;
use std::sync::{Arc, RwLock};
use std::thread;
use r2d2_sqlite::SqliteConnectionManager;
use r2d2::Pool;

use crate::game::Game;
use crate::GlobalState;

fn handle_conn(mut stream: std::net::TcpStream, data: Arc<RwLock<GlobalState>>, pool: Arc<Pool<SqliteConnectionManager>> ) {
    let addr = stream.peer_addr().unwrap();
    let mut gameid :i32 = -1; // not in a game
    let mut uid = -1;
    let mut uname = String::new();

    let mut scratch_space: &mut [u8] = &mut [0; 512];
    let mut allocator = ScratchSpaceHeapAllocator::new(&mut scratch_space);

    loop {

        // reader
        let Ok(reader) = serialize::read_message(&stream, ReaderOptions::new()) else { break; };
        let tx = reader.get_root::<crate::schema_capnp::tx::Reader>().unwrap();

        // writer
        let mut message_builder = ::capnp::message::Builder::new(&mut allocator);
        let mut rx_root = message_builder.init_root::<crate::schema_capnp::rx::Builder>();

        let mut messages: Vec<String> = Vec::new(); // maybe slow initializing every loop

        {
            let mut w = data.write().unwrap();

            // READING

            if gameid >= 0{
                let handle = w.games[gameid as usize].players.get_mut(&addr).unwrap();
                handle.in_angle = tx.get_angle();
                handle.in_propulsion = tx.get_propulsion();
                handle.in_shoot = tx.get_shoot();
            }

            for c in tx.get_commands().unwrap() {
                let cmd = c.unwrap().to_str().unwrap();
                let mut sp = cmd.split(" ");
                match sp.next(){
                    Some(val) => match val{
                        "register" => {
                            if let Some(username) = sp.next() {
                                if let Some(password) = sp.next() {
                                    let ret = pool.get().unwrap().execute("INSERT INTO Players (username, password) VALUES (?, ?)", (username, password));
                                    if ret.is_err(){
                                        messages.push("Failed!".into())
                                    } else{
                                        messages.push("Succeeded!".into());
                                        uid = pool.get().unwrap().last_insert_rowid();
                                        uname = username.to_owned();
                                        println!("{}", uid);
                                    }

                                } else{ messages.push("No password!".into()) }
                            } else{ messages.push("No username!".into()) }
                        }
                        "login" => {
                            if let Some(username) = sp.next() {
                                if let Some(password) = sp.next() {
                                    let pool = pool.get().unwrap();
                                    let mut prep = pool.prepare("SELECT id FROM Players where username=? AND password=?").unwrap();
                                    let mut rows = prep.query(&[&username, &password]).unwrap();
                                    if let Ok(Some(row)) = rows.next() {
                                        messages.push("Success!".into());
                                        uname = username.to_owned();
                                        uid = row.get(0).unwrap();
                                      }else{
                                        messages.push("Failed!".into())
                                      }
                                } else{ messages.push("No password!".into()) }
                            } else{ messages.push("No username!".into()) }
                        }
                        "join" => {
                            if uid != -1{
                                if let Some(name) = sp.next() {
                                    if let Some(num) = w.games.iter().position(|g| g.name == name){
                                            if w.games[num].players.get(&addr).is_none() {
                                                if gameid >= 0{
                                                    if gameid < w.games.len() as i32 {
                                                        messages.push(format!("Leaving {}", gameid));
                                                        w.games[gameid as usize].players.remove(&addr);
                                                    }
                                                }
                                                gameid = num as i32;
                                                w.games[num].players.insert(addr, crate::game::Player::new(uid as u64, uname.to_owned()));
                                                messages.push(format!("Joining {}", gameid))

                                            } else { messages.push("already there".into()) }
                                    } else{ messages.push("Lobby not found".into())
                                    }

                                } else{ messages.push("name needed".into()) }
                            } else {
                            messages.push("Login first!".into())
                            }
                        }
                        "join_id" => {
                            if uid != -1{
                                if let Some(num_st) = sp.next() {
                                    if let Ok(num) = num_st.parse::<usize>(){
                                        if num < w.games.len() {
                                            if w.games[num].players.get(&addr).is_none() {
                                                if gameid >= 0{
                                                    if gameid < w.games.len() as i32 {
                                                        messages.push(format!("Leaving {}", gameid));
                                                        w.games[gameid as usize].players.remove(&addr);
                                                    }
                                                }
                                                gameid = num as i32;
                                                w.games[num].players.insert(addr, crate::game::Player::new(uid as u64, uname.to_owned()));
                                                messages.push(format!("Joining {}", gameid))

                                            } else { messages.push("already there".into()) }
                                        } else { messages.push("No such lobby".into()) }
                                    } else{ messages.push("invalid id".into()) }
                                } else{ messages.push("id needed".into()) }
                            } else {
                            messages.push("Login first!".into())
                            }
                        }
                        "create" => {
                            if uid != -1{
                                if let Some(name) = sp.next() {
                                    if w.games.iter().position(|g| g.name == name).is_none(){
                                        w.games.push(Game::new(name.into()));
                                        if gameid >= 0 { //leave old lobby before joining new lobby
                                            if gameid < w.games.len() as i32 {
                                                messages.push(format!("Leaving {}", gameid));
                                                w.games[gameid as usize].players.remove(&addr);
                                            }
                                        }
                                        gameid = (w.games.len() - 1) as i32;
                                        w.games[gameid as usize].players.insert(addr, crate::game::Player::new(uid as u64, uname.to_owned()));
                                        messages.push("Success!".into())
                                    } else { messages.push("Name must be unique".into())  }
                                }
                            } else {
                                messages.push("Login first!".into());
                            }
                        }
                        "lobbies" => {
                            if w.games.len() == 0{
                                messages.push("No games".into());
                            } else{
                                for (i, game) in w.games.iter().enumerate(){
                                    messages.push(format!("{}: {}", i, game.name));
                                }
                            }
                        }
                        "account" => {
                            if uid != -1{
                                let conn = pool.get().unwrap();
                                let mut stmt = conn.prepare("
                                    SELECT g.name, pg.score
                                    FROM Players p
                                    INNER JOIN PlayerGames pg ON p.id = pg.player_id
                                    INNER JOIN Games g ON pg.game_id = g.id
                                    WHERE p.id = ?
                                ").unwrap();
                                print!("eher");
                                let results = stmt.query_map([uid], |row| {
                                    let gamename: String = row.get(0).unwrap();
                                    let score: i32 = row.get(1).unwrap();
                                    Ok((gamename, score))
                                });
                                if let Ok(mut iter) = results {
                                    while let Some(Ok(result)) = iter.next() {
                                        let (game_name, score) = result;
                                        messages.push(format!(" Game {}: {}", game_name, score));
                                    }
                                } else { println!("Error iterating over results!"); }
                            } else { messages.push("Login first!".into()); }
                        }

                        "lobbyinfo" => {
                            if uid != -1{
                                if gameid >= 0{
                                    messages.push(format!("Name: {}, {} players",
                                        w.games[gameid as usize].name,
                                        w.games[gameid as usize].players.len()))
                                } else { messages.push("not in lobby!".into()) }
                            } else { messages.push("Login first!".into()); }
                        }
                        "start" => {
                            if gameid >= 0{
                                if w.games[gameid as usize].is_running == false {
                                    w.games[gameid as usize].is_running = true;

                                    messages.push("Starting!".into())
                                } else { messages.push("already running!".into()) }
                            } else { messages.push("not in lobby!".into()) }
                        }
                        _ => println!("Unknown command!")
                    }
                    None => println!("Nothing..?")
                }
            }

            // WRITING

            if gameid >= 0 {
                let game = &w.games[gameid as usize];
                rx_root.reborrow().set_running(game.is_running);
                if game.is_running{
                    let mut players = rx_root.reborrow().init_players(game.players.len() as u32);
                    for (i, player) in game.players.iter().enumerate() {
                        let mut p = players.reborrow().get(i as u32);
                        p.set_name(&player.1.name);
                        p.set_x(player.1.position.x);
                        p.set_y(player.1.position.y);
                        p.set_x_vel(player.1.velocity.x);
                        p.set_y_vel(player.1.velocity.y);
                        p.set_rotation(player.1.rotation);
                        p.set_propelling(player.1.in_propulsion);
                        p.set_invincability_timer(player.1.invincability_timer);
                        p.set_score(player.1.score);
                        if player.0 == &addr {
                            p.set_type(crate::schema_capnp::player::PlayerType::MyPlayer);
                            p.set_lives(player.1.lives);
                        } else {
                            p.set_type(crate::schema_capnp::player::PlayerType::Player);
                            p.set_lives(player.1.lives);
                        }
                        let mut bullets = p.reborrow().init_bullets(player.1.bullets.len() as u32);
                        for (i, bullet) in player.1.bullets.iter().enumerate() {
                            let mut b = bullets.reborrow().get(i as u32);
                            b.set_x(bullet.position.x);
                            b.set_y(bullet.position.y);
                            b.set_x_vel(bullet.velocity.x);
                            b.set_y_vel(bullet.velocity.y);
                            b.set_lifetime(bullet.lifetime);
                        }
                    }
                    let mut asteroids = rx_root.reborrow().init_asteroids(w.games[gameid as usize].asteroids.len() as u32);
                    for (i, asteroid) in w.games[gameid as usize].asteroids.iter().enumerate() {
                        let mut c = asteroids.reborrow().get(i as u32);
                        c.set_x(asteroid.position.x);
                        c.set_y(asteroid.position.y);
                        c.set_x_vel(asteroid.velocity.x);
                        c.set_y_vel(asteroid.velocity.y);
                        c.set_size(asteroid.size);
                        c.set_seed(asteroid.seed);
                    }
                }
            } else {
                rx_root.set_running(false);
            }

            for message in messages{
                println!("{}", message);
                //TODO send in packet
            }

        }
        // let r = data.read().unwrap();
        // let mut out: Vec<u8> = Vec::new();
        // capnp::serialize::write_message(&mut out, &message_builder).unwrap();
        // std::io::Write::write_all(&mut stream, out.as_slice()).unwrap();
        capnp::serialize_packed::write_message(&mut stream, &message_builder).unwrap();
        std::io::Write::write(&mut stream, "EOI".as_bytes());
    }
    if gameid >= 0 {
        let mut w = data.write().unwrap();
        w.games[gameid as usize].players.remove(&addr);
    }
}

pub fn net_thread(data: Arc<RwLock<GlobalState>>, pool: Arc<Pool<SqliteConnectionManager>> ) {
    let l = std::net::TcpListener::bind("0.0.0.0:5000").unwrap();

    for stream in l.incoming() {
        let stream = stream.unwrap();
        let data = Arc::clone(&data);
        let pool = Arc::clone(&pool);

        thread::spawn(move || {
            handle_conn(stream, data, pool);
        });
    }
}
