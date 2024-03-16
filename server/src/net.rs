use capnp::message::ReaderOptions;
use capnp::serialize;
// use std::collections::HashMap;
use std::io::prelude::*;
// use std::net::SocketAddr;
use std::sync::{Arc, RwLock};
use std::thread;

use crate::game::Game;
use crate::GlobalState;

fn handle_conn(mut stream: std::net::TcpStream, data: Arc<RwLock<GlobalState>>) {
    let addr = stream.peer_addr().unwrap();
    let mut gameid :i32 = -1; // not in a game
    loop {

        // reader
        let Ok(reader) = serialize::read_message(&stream, ReaderOptions::new()) else { break; };
        let tx = reader.get_root::<crate::schema_capnp::tx::Reader>().unwrap();

        // writer
        let mut message = ::capnp::message::Builder::new_default();
        let mut rx = message.init_root::<crate::schema_capnp::rx::Builder>();

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
                        "join" => {
                            if let Some(num_st) = sp.next() {
                                if let Ok(num) = num_st.parse::<usize>(){
                                    if num < w.games.len() {
                                        gameid = num as i32;
                                        if w.games[num].players.get(&addr).is_none() {
                                            w.games[num].players.insert(addr, crate::game::Player::new());
                                            println!("Moved!")

                                        } else { println!("already there") }
                                    } else { println!("No such lobby") }
                                } else{ println!("invalid id") }
                            } else{ println!("id needed") }
                        }
                        "start" => {
                            if gameid >= 0{
                                if w.games[gameid as usize].is_running == false {
                                    w.games[gameid as usize].is_running = true;

                                    println!("Starting!")
                                } else { println!("already running!") }
                            } else { println!("not in lobby!") }
                        }
                        _ => println!("Unknown command!")
                    }
                    None => println!("Nothing..?")

                }
            }

            // WRITING

            if gameid >= 0 {
                let game = &w.games[gameid as usize];
                rx.reborrow().set_running(game.is_running);
                if game.is_running{
                    let mut players = rx.reborrow().init_players(game.players.len() as u32);
                    for (i, player) in game.players.iter().enumerate() {
                        let mut tmp = players.reborrow().get(i as u32);
                        tmp.set_x(player.1.position.x);
                        tmp.set_y(player.1.position.y);
                        tmp.set_x_vel(player.1.velocity.x);
                        tmp.set_y_vel(player.1.velocity.y);
                        tmp.set_rotation(player.1.rotation);
                        if player.0 == &addr {
                            tmp.set_type(crate::schema_capnp::player::PlayerType::MyPlayer);
                            tmp.set_lives(player.1.lives);
                        } else {
                            tmp.set_type(crate::schema_capnp::player::PlayerType::Player);
                            tmp.set_lives(player.1.lives);
                        }
                    }
                    let mut asteroids = rx.reborrow().init_asteroids(w.games[gameid as usize].asteroids.len() as u32);
                    for (i, asteroid) in w.games[gameid as usize].asteroids.iter().enumerate() {
                        let mut c = asteroids.reborrow().get(i as u32);
                        c.set_x(asteroid.position.x);
                        c.set_y(asteroid.position.y);
                        c.set_x_vel(asteroid.velocity.x);
                        c.set_y_vel(asteroid.velocity.y);
                        c.set_size(asteroid.size);
                    }
                }
            } else {
                rx.set_running(false);
            }
        }

        // let r = data.read().unwrap();
        let mut out: Vec<u8> = Vec::new();
        capnp::serialize::write_message(&mut out, &message).unwrap();
        stream.write_all(out.as_slice()).unwrap();


    }
    if gameid >= 0 {
        let mut w = data.write().unwrap();
        w.games[gameid as usize].players.remove(&addr);
    }
}

pub fn net_thread(data: Arc<RwLock<GlobalState>>) {
    let l = std::net::TcpListener::bind("0.0.0.0:5000").unwrap();

    for stream in l.incoming() {
        let stream = stream.unwrap();
        let data = Arc::clone(&data);
        thread::spawn(move || {
            handle_conn(stream, data);
        });
    }
}
