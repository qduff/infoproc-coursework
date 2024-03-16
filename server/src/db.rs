use r2d2::Pool;
use r2d2_sqlite::SqliteConnectionManager;
use std::sync::Arc;

pub fn db_init(pool: Arc<Pool<SqliteConnectionManager>>) {
    pool.get()
        .unwrap()
        .execute(
            "
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
        ",
            rusqlite::params![],
        )
        .unwrap();
}
