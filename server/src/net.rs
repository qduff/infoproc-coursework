use capnp::message::ReaderOptions;
use capnp::serialize;
// use std::collections::HashMap;
use std::io::prelude::*;
// use std::net::SocketAddr;
use std::sync::{Arc, RwLock};
use std::thread;
use std::net::TcpStream;

use crate::game;

fn create_conn(mut addr: std::net::SocketAddr, data: Arc<RwLock<game::Game>>) -> anyhow::Result<()> {
    {
        let mut w = data.write().unwrap();
        if w.players.get(&addr).is_none() {
            w.players.insert(addr, crate::game::Player::new());
        }
    }
    let mut stream = TcpStream::connect(addr)?;
    loop {
        let mut buf = [0; 24];
        if let Err(_) = stream.read_exact(&mut buf) {
            break;
        }
        let reader = serialize::read_message(buf.as_slice(), ReaderOptions::new()).unwrap();
        let tx = reader
            .get_root::<crate::schema_capnp::tx::Reader>()
            .unwrap();
        {
            let mut writer = data.write().unwrap();
            let handle = writer.players.get_mut(&addr).unwrap();
            handle.in_angle = tx.get_angle();
            handle.in_propulsion = tx.get_propulsion();
            handle.in_shoot = tx.get_shoot();
        }

        // Serialize and send
        let mut message = ::capnp::message::Builder::new_default();
        {
            let r = data.read().unwrap();
            let mut rx = message.init_root::<crate::schema_capnp::rx::Builder>();
            let mut players = rx.reborrow().init_players(r.players.len() as u32);
            for (i, player) in r.players.iter().enumerate() {
                let mut p = players.reborrow().get(i as u32);
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
                    // println!("here");
                    let mut b = bullets.reborrow().get(i as u32);
                    b.set_x(bullet.position.x);
                    b.set_y(bullet.position.y);
                    b.set_x_vel(bullet.velocity.x);
                    b.set_y_vel(bullet.velocity.y);
                    b.set_lifetime(bullet.lifetime);
                }
            }
            let mut asteroids = rx.reborrow().init_asteroids(r.asteroids.len() as u32);
            for (i, asteroid) in r.asteroids.iter().enumerate() {
                let mut c = asteroids.reborrow().get(i as u32);
                c.set_x(asteroid.position.x);
                c.set_y(asteroid.position.y);
                c.set_x_vel(asteroid.velocity.x);
                c.set_y_vel(asteroid.velocity.y);
                c.set_size(asteroid.size);
                c.set_seed(asteroid.seed);
            }
        }

        thread::sleep(std::time::Duration::from_millis(40)); // simulate latency

        // if let Err(_) = serialize::write_message(&mut stream, &message) {break;} // changed to avoid buffering, not ideal
        let mut out: Vec<u8> = Vec::new();
        capnp::serialize::write_message(&mut out, &message).unwrap();
        stream.write_all(out.as_slice()).unwrap();
    }
    let mut w = data.write().unwrap();
    // w.players.remove(&addr);
    Ok(())
}

/*/
pub fn net_thread(data: Arc<RwLock<game::Game>>) {
    let l = std::net::TcpListener::bind("0.0.0.0:5002").unwrap();

    for stream in l.incoming() {
        let stream = stream.unwrap();
        let data = Arc::clone(&data);
        thread::spawn(move || {
            handle_conn(stream, data);
        });
    }
}
*/

pub fn create_match(players: Vec<std::net::SocketAddr>){
    println!("creating game");
    let gamestate: Arc<RwLock<game::Game>> = Arc::new(RwLock::new(game::Game::new()));

    for p in players{
        let data = Arc::clone(&gamestate);
        let addr = std::net::SocketAddr::new(p.ip(),p.port() + 1);
        //TODO: spawn net thread that reaches out to clients game thread
    }
    loop {
        let start = std::time::Instant::now();
        gamestate.write().unwrap().tick(crate::TICKRATE);
        thread::sleep(std::time::Duration::from_millis(crate::TICKRATE as u64));
        //println!("tick [{}ms] - {} players", start.elapsed().as_millis(),  &gamestate.read().unwrap().players.len());
    }
}
