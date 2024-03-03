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


fn main() {
    let gamestate: Arc<RwLock<game::Game>> = Arc::new(RwLock::new(game::Game::new()));

    let net_arc = Arc::clone(&gamestate);
    thread::spawn(move || net::net_thread(net_arc));

    loop {
        let start = std::time::Instant::now();
        for (addr, player) in &gamestate.read().unwrap().players {
            println!(
                "{:?} -> {} {} {}",
                addr, player.in_angle, player.in_shoot, player.in_propulsion
            )
        }
        gamestate.write().unwrap().tick();
        thread::sleep(std::time::Duration::from_millis(100));
        println!("tick [{}ms]", start.elapsed().as_millis());
    }
}