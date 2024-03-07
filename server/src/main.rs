pub mod game;
mod net;

use std::sync::{Arc, RwLock};
use std::thread;

const TICKRATE : u64 = 15; // ms

pub mod schema_capnp {
    include!(concat!(env!("OUT_DIR"), "/schema_capnp.rs"));
}

fn main() {
    let gamestate: Arc<RwLock<game::Game>> = Arc::new(RwLock::new(game::Game::new()));

    let net_arc = Arc::clone(&gamestate);
    thread::spawn(move || net::net_thread(net_arc));

    loop {
        let start = std::time::Instant::now();
        gamestate.write().unwrap().tick(TICKRATE as f32);
        thread::sleep(std::time::Duration::from_millis(TICKRATE));
        println!("tick [{}ms] - {} players", start.elapsed().as_millis(),  &gamestate.read().unwrap().players.len());
    }
}