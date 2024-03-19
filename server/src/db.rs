use r2d2::Pool;
use r2d2_sqlite::SqliteConnectionManager;
use std::sync::Arc;

pub fn db_init(pool: Arc<Pool<SqliteConnectionManager>>) {
    pool.get()
        .unwrap()
        .execute(
        "CREATE TABLE  IF NOT EXISTS Players (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            username TEXT UNIQUE NOT NULL,
            password TEXT NOT NULL
        );", rusqlite::params![])
        .unwrap();
    pool.get()
        .unwrap()
        .execute(
        "CREATE TABLE IF NOT EXISTS Games (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT NOT NULL,
            time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
        );", rusqlite::params![])
        .unwrap();
    pool.get()
        .unwrap()
        .execute(
        "CREATE TABLE IF NOT EXISTS PlayerGames (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            player_id INTEGER NOT NULL,
            game_id INTEGER NOT NULL,
            score INTEGER,
            FOREIGN KEY (player_id) REFERENCES Players(id),
            FOREIGN KEY (game_id) REFERENCES Games(id)
        );", rusqlite::params![])
        .unwrap();
}
