use sqlx::sqlite::SqlitePool;
use tokio::net::unix::SocketAddr;
use std::env;
use anyhow;
use std::sync::{Arc, RwLock};
use std::thread;
use crate::game;
use crate::net;
use crate::lobby::net::LobbyState;

pub async fn handle_command(name: String, address: &std::net::SocketAddr,state : &Arc<RwLock<LobbyState>>) -> anyhow::Result<String> {
    let mut response = String::from("invalid command");
    let chunks: Vec<&str> = response.split_whitespace().collect();
    if chunks.len() == 0 {
        return Ok(response);
    }

    match chunks[0]{
        "test" => {response = String::from("success")}
        &_ => {}
    }

    Ok(response)
}


// database commands
pub async fn create_player(name: &String, secret: &String) -> anyhow::Result<i64> {
    println!("adding player to database");
    let pool = SqlitePool::connect(&env::var("DATABASE_URL")?).await?;
    let mut conn = pool.acquire().await?;

    let id = sqlx::query!(
        r#"
INSERT INTO players ( name, secret )
VALUES ( ?1, ?2)
        "#,
        name, secret
    )
    .execute(&mut *conn)
    .await?
    .last_insert_rowid();
    Ok(id)
}

pub async fn get_player_id(name: &String) -> anyhow::Result<i64>{
    println!("getting player id");
    let pool = SqlitePool::connect(&env::var("DATABASE_URL")?).await?;

    let result = sqlx::query!(
        r#"
SELECT id
FROM players
WHERE name=?1
        "#,
        name
    )
    .fetch_one(&pool)
    .await?;

    Ok(result.id)
}

// lobby interactions

pub async fn create_lobby(lobby_name: &String, player_id: i64) -> anyhow::Result<i64> {
    let pool = SqlitePool::connect(&env::var("DATABASE_URL")?).await?;
    let mut conn = pool.acquire().await?;

    println!("adding lobby: {} to database", lobby_name);
    let id = sqlx::query!(
        r#"
            INSERT INTO lobbies ( name )
            VALUES ( ?1 )
        "#,
        lobby_name
    )
    .execute(&mut *conn)
    .await?
    .last_insert_rowid();

    join_lobby(id, player_id).await?;

    Ok(id)
}

pub async fn join_lobby(lobby_id: i64, player_id: i64) -> anyhow::Result<()> {
    let pool = SqlitePool::connect(&env::var("DATABASE_URL")?).await?;
    let mut conn = pool.acquire().await?;

    println!("adding player to lobby: {}", lobby_id);
    sqlx::query!(
        r#"
INSERT INTO in_lobby ( lobbyId, playerId, admin)
VALUES ( ?1, ?2, TRUE)
        "#,
        lobby_id, player_id
    )
    .execute(&mut *conn)
    .await?
    .last_insert_rowid();

    Ok(())
}

pub async fn leave_lobby(player_id: i64) -> anyhow::Result<i64> {
    let pool = SqlitePool::connect(&env::var("DATABASE_URL")?).await?;

    let lobby_id: i64 = get_lobby_from_player(player_id).await?;

    println!("removing player form lobby");
    sqlx::query!(
        r#"
DELETE
FROM in_lobby 
WHERE playerId = ?1
        "#,
        player_id
    )
    .execute(&pool)
    .await?;

    clean_lobby(lobby_id).await?;

    Ok(lobby_id)
}


// restore admin and delete if abandonned
pub async fn clean_lobby(lobby_id: i64) -> anyhow::Result<()> {
    let pool = SqlitePool::connect(&env::var("DATABASE_URL")?).await?;
    let mut conn = pool.acquire().await?;
    let mut result: Vec<LobbyInfo> = Vec::new();

    let admin_count = get_lobby_admin_count(lobby_id).await?;
    let player_count = get_lobby_player_count(lobby_id).await?;

    if player_count == 0 {
        sqlx::query!(
            r#"
DELETE
FROM lobbies
WHERE id = ?1 
            "#,
            lobby_id
        )
        .execute(&pool)
        .await?;
    } else if admin_count == 0 {
        sqlx::query!(
            r#"
UPDATE in_lobby
SET admin = TRUE
FROM (
    SELECT playerId 
    FROM in_lobby
    WHERE lobbyId = ?1
    LIMIT 1
) AS filtered
WHERE in_lobby.playerId = filtered.playerId
            "#,
            lobby_id
        )
        .execute(&pool)
        .await?;
    }

    Ok(())
}


// NOTE this still ensured there is at least 1 admin per lobby so may assign new admin if none are left
pub async fn set_admin(player_id: i64, admin_state: bool) -> anyhow::Result<i64> {
    let pool = SqlitePool::connect(&env::var("DATABASE_URL")?).await?;

    let lobby_id: i64 = get_lobby_from_player(player_id).await?;

    sqlx::query!(
        r#"
UPDATE in_lobby
SET admin = ?2
WHERE playerId = ?1
        "#,
        player_id,
        admin_state
    )
    .execute(&pool)
    .await?;

    clean_lobby(lobby_id).await?;

    Ok(lobby_id)
}

pub async fn set_max_players(game_id: i64, max: i64) -> anyhow::Result<()> {
    let pool = SqlitePool::connect(&env::var("DATABASE_URL")?).await?;

    sqlx::query!(
        r#"
UPDATE lobbies
SET maxPlayers = ?2
WHERE id = ?1
        "#,
        game_id,
        max
    )
    .execute(&pool)
    .await?;


    Ok(())
}

pub async fn start_lobby(game_id: i64) -> anyhow::Result<()> {
    let pool = SqlitePool::connect(&env::var("DATABASE_URL")?).await?;

    sqlx::query!(
        r#"
UPDATE lobbies
SET inGame = TRUE
WHERE id = ?1
        "#,
        game_id,
    )
    .execute(&pool)
    .await?;

    let players = sqlx::query!(
        r#"
SELECT *
FROM in_lobby
WHERE lobbyId = ?1
        "#,
        game_id,
    )
    .fetch_all(&pool)
    .await?;


    let gamestate: Arc<RwLock<game::Game>> = Arc::new(RwLock::new(game::Game::new()));
    //TODL: spin up game correctly
    for p in players{

    }

    let net_arc = Arc::clone(&gamestate);
    thread::spawn(move || net::net_thread(net_arc));

    loop {
        let start = std::time::Instant::now();
        gamestate.write().unwrap().tick(crate::TICKRATE);
        thread::sleep(std::time::Duration::from_millis(crate::TICKRATE as u64));
        //println!("tick [{}ms] - {} players", start.elapsed().as_millis(),  &gamestate.read().unwrap().players.len());
    }

    Ok(())
}

// lobby queries

#[derive(Default, Debug)]
pub struct LobbyInfo {
    id: i64,
    name: String,
    connected_players: i64,
    max_players: i64,
    started: bool,
}

// for listing lobbies to users
pub async fn get_lobby_list() -> anyhow::Result<Vec<LobbyInfo>> {
    let pool = SqlitePool::connect(&env::var("DATABASE_URL")?).await?;
    let mut result: Vec<LobbyInfo> = Vec::new();

    let lobbies = sqlx::query!(
        r#"
SELECT * FROM lobbies
        "#
    )
    .fetch_all(&pool)
    .await?;

    for l in lobbies{
        let player_count = get_lobby_player_count(l.id).await?;
        result.push( LobbyInfo {
            id: l.id,
            name: l.name,
            connected_players: player_count,
            max_players: l.maxPlayers,
            started: l.inGame,
        })
    }

    Ok(result)
}
// display lobby list table
pub async fn display_lobby_list() -> anyhow::Result<()> {
    let lobbies = get_lobby_list().await?;

    // Print table header
    println!(
        "{:<5} | {:<20} | {:<10} | {:<10} | {:<10}",
        "ID", "Name", "Players", "Max", "Started"
    );
    println!("-----------------------------------------------");

    // Print lobby information
    for lobby in &lobbies {
        println!(
            "{:<5} | {:<20} | {:<10} | {:<10} | {:<10}",
            lobby.id, lobby.name, lobby.connected_players, lobby.max_players, lobby.started
        );
    }

    Ok(())
}


pub async fn get_lobby_player_count(lobby_id: i64) -> anyhow::Result<i64> {
    let pool = SqlitePool::connect(&env::var("DATABASE_URL")?).await?;

    let player_count = sqlx::query!(
        r#"
SELECT COUNT(*) AS player_count 
FROM in_lobby 
WHERE lobbyId = ?1
        "#,
        lobby_id
    )
    .fetch_one(&pool)
    .await?;

    Ok(player_count.player_count as i64)
}

pub async fn get_lobby_admin_count(lobby_id: i64) -> anyhow::Result<i64> {
    let pool = SqlitePool::connect(&env::var("DATABASE_URL")?).await?;

    let query_result = sqlx::query!(
        r#"
SELECT COUNT(*) AS admin_count 
FROM in_lobby 
WHERE lobbyId = ?1 AND admin = TRUE
        "#,
        lobby_id
    )
    .fetch_one(&pool)
    .await?;

    Ok(query_result.admin_count as i64)
}

// helper queries
pub async fn get_lobby_from_player(player_id: i64) -> anyhow::Result<i64> {
    let pool = SqlitePool::connect(&env::var("DATABASE_URL")?).await?;

    let query_result = sqlx::query!(
        r#"
SELECT lobbyId
FROM in_lobby 
WHERE playerId = ?1
        "#,
        player_id
    )
    .fetch_one(&pool)
    .await?;

    Ok(query_result.lobbyId)
}

pub async fn get_player_is_admin(player_id: i64) -> anyhow::Result<bool> {
    let pool = SqlitePool::connect(&env::var("DATABASE_URL")?).await?;

    let query_result = sqlx::query!(
        r#"
SELECT admin
FROM in_lobby 
WHERE playerId = ?1
        "#,
        player_id
    )
    .fetch_one(&pool)
    .await?;

    Ok(query_result.admin)
}



// score saving

//TODO: save game outcome


// finished game querying

//TODO: highscore, leaderboards, match history etc