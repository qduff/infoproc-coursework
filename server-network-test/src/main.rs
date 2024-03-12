pub mod schema_capnp {
    include!(concat!(env!("OUT_DIR"), "/schema_capnp.rs"));
}
use capnp::message::ReaderOptions;
use capnp::serialize;
use std::collections::HashMap;
use std::io::prelude::*;
use std::net::SocketAddr;
use std::sync::{Arc, RwLock};
use std::thread;

fn handle_conn(mut stream: std::net::TcpStream, data: Arc<RwLock<GameState>>) {
    let addr = stream.peer_addr().unwrap();
    {
        let mut w = data.write().unwrap();
        if w.players.get(&addr).is_none() {
            w.players.insert(addr, Player::default());
        }
    }
    loop {
        let mut buf = [0; 24];
        if let Err(_) = stream.read_exact(&mut buf) { break; }
        let reader = serialize::read_message(buf.as_slice(), ReaderOptions::new()).unwrap();
        let tx = reader.get_root::<schema_capnp::tx::Reader>().unwrap();
        {
            let mut writer = data.write().unwrap();
            let handle = writer.players.get_mut(&addr).unwrap();
            handle.in_angle = tx.get_angle();
            handle.in_propulsion = tx.get_propulsion();
            handle.in_shoot = tx.get_shoot();
        }

        // Serialize and send
        let r = data.read().unwrap();
        let mut message = ::capnp::message::Builder::new_default();
        let mut rx = message.init_root::<schema_capnp::rx::Builder>();
        rx.set_lives(3);
        let mut entities = rx.init_entities(r.players.len() as u32);
        println!("here");
        for (i, player) in r.players.iter().enumerate() {
            let mut tmp = entities.reborrow().get(i as u32);
            tmp.set_x(player.1.x);
            tmp.set_y(player.1.y);
            tmp.set_x_vel(player.1.x_vel);
            tmp.set_y_vel(player.1.y_vel);
            tmp.set_rotation(player.1.rotation);
            if player.0 == &addr {
                tmp.set_type(schema_capnp::entity::EntityType::MyPlayer);
            } else {
                tmp.set_type(schema_capnp::entity::EntityType::Player);
            }
        }

        thread::sleep(std::time::Duration::from_millis(20)); // simulate latency

        // if let Err(_) = serialize::write_message(&mut stream, &message) {break;} // changed to avoid buffering, not ideal
        let mut out: Vec<u8> = Vec::new();
        capnp::serialize::write_message(&mut out, &message).unwrap();
        stream.write_all(out.as_slice()).unwrap();
    }
    let mut w = data.write().unwrap();
    w.players.remove(&addr);
}

fn net_thread(data: Arc<RwLock<GameState>>) {
    let l = std::net::TcpListener::bind("127.0.0.1:5001").unwrap();

    for stream in l.incoming() {
        let stream = stream.unwrap();
        let data = Arc::clone(&data);
        thread::spawn(move || {
            handle_conn(stream, data);
        });
    }
}

#[derive(Default)]
struct Player {
    in_angle: f32,
    in_propulsion: bool,
    in_shoot: bool,

    x: f32,
    y: f32,
    x_vel: f32,
    y_vel: f32,
    rotation: f32,
}

#[derive(Default)]
struct GameState {
    players: HashMap<SocketAddr, Player>,
}

fn main() {
    let state: Arc<RwLock<GameState>> = Arc::new(RwLock::new(GameState::default()));

    let net_arc = Arc::clone(&state);
    thread::spawn(move || net_thread(net_arc));

    loop {
        let start = std::time::Instant::now();
        for (addr, player) in &state.read().unwrap().players {
            println!(
                "{:?} -> {} {} {}",
                addr, player.in_angle, player.in_shoot, player.in_propulsion
            )
        }
        thread::sleep(std::time::Duration::from_millis(15));
        println!("tick [{}ms]", start.elapsed().as_millis());
    }
}
