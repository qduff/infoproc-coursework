use std::sync::{Arc, RwLock};
use std::thread;

pub mod game;
use game::{tickthread, GlobalState};
mod net;
mod db;
use db::db_init;

use r2d2_sqlite::SqliteConnectionManager;
use r2d2::Pool;

pub mod schema_capnp {
    include!(concat!(env!("OUT_DIR"), "/schema_capnp.rs"));
}

fn main() {
    let gamestate: Arc<RwLock<GlobalState>> = Arc::new(RwLock::new(GlobalState::new()));

    // pooling required
    let sqlite_file = "players.db";
    let manager = SqliteConnectionManager::file(sqlite_file);
    let pool = Arc::new(Pool::new(manager).expect("Pool creation failure!"));
    db_init(pool.clone());

    let game_arc = Arc::clone(&gamestate);
    thread::spawn(move || tickthread(game_arc));

    let net_arc = Arc::clone(&gamestate);
    thread::spawn(move || net::net_thread(net_arc, pool));

    loop {
        thread::sleep(std::time::Duration::from_secs(1));
        println!("{} connections", Arc::strong_count(&gamestate) - 3);
    }
}
