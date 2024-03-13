use sqlx::sqlite::SqlitePool;
use std::env;
use anyhow;
use std::sync::{Arc, RwLock};
use std::thread;
use crate::game;
use crate::lobby::net::LobbyState;

pub async fn handle_command(command: String, address: &std::net::SocketAddr,state : &Arc<RwLock<LobbyState>>) -> anyhow::Result<String> {
    let mut response = String::from("invalid command");
    let chunks: Vec<&str> = command.split_whitespace().collect();
    if chunks.len() == 0 {
        return Ok(response);
    }
    println!("{}",chunks[0]);
    match chunks[0]{
        "test" => {response = String::from("success")}
        "lobbies" => {response = display_lobby_list().await?}
        "login" => {response = login(chunks, address, state).await?}
        "logout" => {response = login(chunks, address, state).await?}
        "create_account" => {response = create_account(chunks, address, state).await?}
        "join_lobby" => {response = join_lobby(chunks, address, state).await?}
        "leave_lobby" => {response = leave_lobby(chunks, address, state).await?}
        "start" => {response = start(chunks, address, state).await?}
        "create_lobby" => {response = create_lobby(chunks, address, state).await?}
        "clean_lobbies" => {response = clean_lobbies().await?}
        &_ => {}
    }

    Ok(response)
}

// text interface handling

pub async fn start(chunks: Vec<&str>, address: &std::net::SocketAddr,state : &Arc<RwLock<LobbyState>>) -> anyhow::Result<String> {
    
    let mut player_id = -1;
    {
        match state.read().unwrap().logged_in.get_by_left(address){
            None => return Ok(String::from("you aren't logged in")),
            Some(num) => player_id = *num
        }
    }

    let mut lob_id: i64 = -1;
    match get_lobby_from_player(player_id).await{
        Err(_) => return Ok(String::from("you aren't in a lobby")),
        Ok(r) => lob_id = r
    }

    match get_player_is_admin(player_id).await{
        Err(_) => return Ok(String::from("this is wierd")),
        Ok(r) => {if !r {return Ok(String::from("you aren't admin"))}}
    }

    let players = set_lobby_start(lob_id).await?;
    let mut player_ips: Vec<std::net::SocketAddr> = Vec::new();

    let gamestate: Arc<RwLock<game::Game>> = Arc::new(RwLock::new(game::Game::new()));
    //TODL: spin up game correctly
    for p in players {
        let mut addr = *address;
        
        match state.read().unwrap().logged_in.get_by_right(&p) {
            None => return Ok(String::from("unknown error")),
            Some(val) => addr = *val
        }

        player_ips.push(addr);
    }    

    //run it! still errors out!

    thread::spawn(move || crate::net::create_match(player_ips));

    Ok(String::from("game starting"))
}

pub async fn login(chunks: Vec<&str>, address: &std::net::SocketAddr,state : &Arc<RwLock<LobbyState>>) -> anyhow::Result<String> {
    
    if chunks.len()==0{
        return Ok(String::from("wtfevenisthis"));
    }

    if(chunks[0] == "logout"){
        println!("logging out");
        let mut tmp = Vec::new();
        tmp.push(chunks[0]);
        leave_lobby(tmp, address, state).await?;
        state.write().unwrap().logged_in.remove_by_left(address);
        return Ok(String::from("logout successful"));
    }  

    if chunks.len()!=3{
        return Ok(String::from("expected 3 arguments"));
    }

    let id_result = get_player_id(&String::from(chunks[1]),&String::from(chunks[2])).await;
    let mut id: i64 = -1;

    match id_result {
        Err(_) => return Ok(String::from("login fialed")),
        Ok(r) => id = r        
        }
    println!("{}", id);
    state.write().unwrap().logged_in.insert(*address , id);
    return Ok(String::from("login successful"));
                                                                                                                                                        
}

pub async fn leave_lobby(chunks: Vec<&str>, address: &std::net::SocketAddr,state : &Arc<RwLock<LobbyState>>) -> anyhow::Result<String> {
    if chunks.len()<1{
        return Ok(String::from("leave_lobby expected 0 arguments"));
    }

    let mut result: String = String::from("success");
    
    let mut player_id: i64 = -1;
    {
        match state.read().unwrap().logged_in.get_by_left(address){
            None => return Ok(String::from("you aren't logged in")),
            Some(x) => {player_id = *x}
        }
    }
    leave_lobby_db(player_id).await?;
    println!("exited lobby");
    
    return Ok(result);
}


pub async fn create_account(chunks: Vec<&str>, address: &std::net::SocketAddr,state : &Arc<RwLock<LobbyState>>) -> anyhow::Result<String> {

    if chunks.len()!=3{
        return Ok(String::from("create_account expected 2 arguments"));
    }

    let mut result: String = String::from("account created, please log in.");
    // Print table header
    let id = create_player(&String::from(chunks[1]),&String::from(chunks[2])).await?;
    println!("{}", id);

    return Ok(result);
}

// display lobby list table
pub async fn display_lobby_list() -> anyhow::Result<String> {
    let lobbies = get_lobby_list().await?;

    let mut result: String = format!("");
    // Print table header
    (
        "{:<5} | {:<20} | {:<10} | {:<10} | {:<10}",
        "ID", "Name", "Players", "Max", "Started"
    );
    result.push_str("-----------------------------------------------\n");

    // Print lobby information
    for lobby in &lobbies {
        result.push_str(&format!(
            "{:<5} | {:<20} | {:<10} | {:<10} | {:<10}\n",
            lobby.id, lobby.name, lobby.connected_players, lobby.max_players, lobby.started
        ));
    }

    Ok(result)
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
        name,
        secret
    )
    .execute(&mut *conn)
    .await?
    .last_insert_rowid();
    Ok(id)
}

pub async fn get_player_id(name: &String, secret: &String) -> anyhow::Result<i64>{
    println!("getting player id");
    let pool = SqlitePool::connect(&env::var("DATABASE_URL")?).await?;

    let result = sqlx::query!(
        r#"
SELECT id
FROM players
WHERE name=?1 AND secret=?2
        "#,
        name,
        secret
    )
    .fetch_one(&pool)
    .await?;

    Ok(result.id)
}

// lobby interactions

pub async fn create_lobby(chunks: Vec<&str>, address: &std::net::SocketAddr,state : &Arc<RwLock<LobbyState>>) -> anyhow::Result<String> {
    let pool = SqlitePool::connect(&env::var("DATABASE_URL")?).await?;
    let mut conn = pool.acquire().await?;

    let lobby_name = chunks[1];

    if chunks.len()!=2{
        return Ok(String::from("expected 1 argument"));
    }
    

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

    let mut params: Vec<&str> = Vec::new();

    let ws: String = String::from(" ");
    let id_str = id.to_string();

    params.push(&ws);
    params.push(&id_str);
    println!("joining");

    let mut tmp = Vec::new();
    tmp.push(chunks[0]);
    tmp.push(&id.to_string().as_str());
    match join_lobby(params, address, state).await{
        Err(_) => {return Ok(String::from("error"))},
        Ok(_) => {}
    }
    println!("before success");
    
    let admin_id = state.read().unwrap().logged_in.get_by_left(address).expect("Admin ID not found").clone();
    println!("join success");

    set_admin(admin_id, true);

    Ok(String::from("success"))
}

pub async fn join_lobby(chunks: Vec<&str>, address: &std::net::SocketAddr,state : &Arc<RwLock<LobbyState>>) -> anyhow::Result<String> {
    let pool = SqlitePool::connect(&env::var("DATABASE_URL")?).await?;
    let mut conn = pool.acquire().await?;
    if chunks.len()!=2{
        return Ok(String::from("expected 1 argument"));
    }

    let mut tmp = Vec::new();
    tmp.push(chunks[0]);

    match leave_lobby(tmp, address, state).await{
        Err(_) => {},
        Ok(_) => {}
    }  

    let tmp;
    match chunks[1].parse::<i64>() {
        Err(_) => return Ok(String::from("pleae use lobby ID")),
        Ok(x) => tmp = x
    }

    let playercount = match get_lobby_player_count((tmp)).await{
        Err(_) => 0,
        Ok(r) => r
    };
    let maxcount = get_max_player_count((chunks[1].parse::<i64>().unwrap())).await?;
    
    println!("check");
    if playercount >= maxcount {
        return Ok(String::from("This lobby is full. Please join another one"));
    }
    
    let player_id: i64;
    match state.read().unwrap().logged_in.get_by_left(address){
        None    => {return Ok(String::from("error"))},
        Some(x) => {player_id = *x}
    }

    println!("adding player to lobby: {}", chunks[1]);
    sqlx::query!(
        r#"
INSERT INTO in_lobby ( lobbyId, playerId)
VALUES ( ?1, ?2)
        "#,
        chunks[1], player_id
    )
    .execute(&mut *conn)
    .await?
    .last_insert_rowid();

    Ok(String::from("Success! You have now joined the lobby"))

}

pub async fn leave_lobby_db(player_id: i64) -> anyhow::Result<i64> {
    let pool = SqlitePool::connect(&env::var("DATABASE_URL")?).await?;

    let lobby_id: i64 = get_lobby_from_player(player_id).await?;

    println!("removing player from lobby");
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

pub async fn clean_lobbies() -> anyhow::Result<String> {
    let pool = SqlitePool::connect(&env::var("DATABASE_URL")?).await?;

    let lobbies = sqlx::query!(
        r#"
SELECT id FROM lobbies
        "#
    )
    .fetch_all(&pool)
    .await?;

    for l in lobbies {
        clean_lobby(l.id).await?;
    }
    Ok(String::from("success"))
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

pub async fn update_admin_status(requester_id: i64, target_player_id: i64, lobby_id: i64, new_admin_status: bool) -> anyhow::Result<()> {
    // Check if the requester is an admin
    let requester_is_admin = get_player_is_admin(requester_id).await?;

    if requester_is_admin {
        // Update the admin status of the target player
        set_admin(target_player_id, new_admin_status).await?;
    } else {
        // Handle case where requester is not an admin
        return Err(anyhow::Error::msg("Requester is not an admin and cannot update admin status"));
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

pub async fn set_lobby_start(game_id: i64) -> anyhow::Result<Vec<i64>> {
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

    let mut result: Vec<i64> = Vec::new();

    for p in players{
        result.push(p.playerId);
    }

    Ok(result)
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

pub async fn get_max_player_count(lobby_id: i64) -> anyhow::Result<i64> {

    let pool = SqlitePool::connect(&env::var("DATABASE_URL")?).await?;

    let max_count = sqlx::query!(
        r#"
SELECT maxPlayers 
FROM lobbies
WHERE id = ?1  
        "#,
        lobby_id 
    )
    
    .fetch_one(&pool).await?;

    Ok(max_count.maxPlayers as i64)

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