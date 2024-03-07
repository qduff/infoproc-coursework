pub mod game;
mod net;

use std::sync::{Arc, RwLock};
use std::thread;

pub mod schema_capnp {
    include!(concat!(env!("OUT_DIR"), "/schema_capnp.rs"));
}


// fn main() { // example main to eat up unused warnings
//     let mut game = game::Game::new();

//     game.add_player();
//     game.set_player_inputs(0, true, 0.0,true);
//     game.step();
//     game.get_serialized();

// }

const TICKRATE : u64 = 15; // ms
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