pub mod game;
pub mod lobby;
mod net;

use anyhow;
use std::sync::{Arc, RwLock};
use std::thread;

const TICKRATE : u32 = 15; // ms

pub mod schema_capnp {
    include!(concat!(env!("OUT_DIR"), "/schema_capnp.rs"));
}

#[tokio::main]
async fn main() -> anyhow::Result<()> {
    test_db().await?;
    let gamestate: Arc<RwLock<game::Game>> = Arc::new(RwLock::new(game::Game::new()));

    let net_arc = Arc::clone(&gamestate);
    thread::spawn(move || net::net_thread(net_arc));

    loop {
        let start = std::time::Instant::now();
        gamestate.write().unwrap().tick(TICKRATE);
        thread::sleep(std::time::Duration::from_millis(TICKRATE as u64));
        //println!("tick [{}ms] - {} players", start.elapsed().as_millis(),  &gamestate.read().unwrap().players.len());
    }
}

async fn test_db() -> anyhow::Result<()> {
    let pid = lobby::create_player(&String::from("lol"), &String::from("wow how secure")).await?;
    lobby::get_player_id(&String::from("lol")).await?;
    println!("player lol has id {}", pid);

    lobby::create_lobby(&String::from("test lobby"), pid).await?;
    let lobbies = lobby::get_lobby_list().await?;
    println!("avalible lobbies:");
    for l in lobbies{
        println!("{:?}", l);
    }
    

    Ok(())
}
