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

// std::Vec();

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
        let r = stream.read_exact(&mut buf);
        if r.is_err() {
            break;
        }

        let reader = serialize::read_message(buf.as_slice(), ReaderOptions::new()).unwrap();
        let tx = reader.get_root::<schema_capnp::tx::Reader>().unwrap();

        let mut writer = data.write().unwrap();
        let handle = writer.players.get_mut(&addr);
        handle.unwrap().in_angle = tx.get_angle();

        // Serialize and send

    }

    let mut w = data.write().unwrap();
    w.players.remove(&stream.peer_addr().unwrap());
}

fn net_thread(data: Arc<RwLock<GameState>>) {
    let l = std::net::TcpListener::bind("127.0.0.1:5000").unwrap();

    for stream in l.incoming() {
        let stream = stream.unwrap();
        let _ = stream.peer_addr().unwrap();
        let data = Arc::clone(&data);
        thread::spawn(move || {
            handle_conn(stream, data);
        });
    }
}

// use std::sync::mpsc::{channel, Sender};

#[derive(Default)]
struct Player {
    in_angle: f32,
    in_propulsion: bool,
    in_shoot: bool,

    x: f32,
    y: f32,
    x_vel: f32,
    y_vel: f32,
}

#[derive(Default)]
struct GameState {
    players: HashMap<SocketAddr, Player>,
}

fn main() {
    let state: Arc<RwLock<GameState>> = Arc::new(RwLock::new(GameState::default()));

    let net_arc = Arc::clone(&state);
    thread::spawn(move || net_thread(net_arc));

    let localstate = state.clone();

    loop {
        println!("ticker");
        for (addr, player) in &localstate.read().unwrap().players {
            println!("{:?} -> {:?}", addr, player.in_angle)
        }

        thread::sleep(std::time::Duration::from_millis(100));
    }
}
