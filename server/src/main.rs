use std::sync::{Arc, RwLock};
use std::thread;

pub mod game;
use game::{tickthread, GlobalState};
mod net;

use r2d2_sqlite::SqliteConnectionManager;
use r2d2::Pool;
use rusqlite::params;

pub mod schema_capnp {
    include!(concat!(env!("OUT_DIR"), "/schema_capnp.rs"));
}

fn db_init(pool: Arc<Pool<SqliteConnectionManager>> ){
    pool.get()
        .unwrap()
        .execute("
        CREATE TABLE  IF NOT EXISTS Players (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            username TEXT UNIQUE NOT NULL,
            password TEXT NOT NULL
        );

        CREATE TABLE  IF NOT EXISTS CompletedGames (
            completed_game_id INTEGER PRIMARY KEY AUTOINCREMENT,
            player_id INTEGER NOT NULL,
            game_name TEXT NOT NULL,
            score INTEGER,
            FOREIGN KEY(id) REFERENCES Players(id)
        );
        ", params![])
        .unwrap();
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
