pub mod game;
pub mod lobby;
mod net;

use anyhow;
use std::sync::{Arc, RwLock};
use std::thread;

pub const TICKRATE : u32 = 15; // ms

pub mod schema_capnp {
    include!(concat!(env!("OUT_DIR"), "/schema_capnp.rs"));
}


fn main() -> anyhow::Result<()> {
    //test_db().await?;
    let gamestate: Arc<RwLock<game::Game>> = Arc::new(RwLock::new(game::Game::new()));

    let net_arc = Arc::clone(&gamestate);
    // thread::spawn(move || net::net_thread(net_arc));

    lobby::net::net_thread();
    Ok(())
}

/*/
async fn test_db() -> anyhow::Result<()> {
    let pid = lobby::lib::create_player(&String::from("lol"), &String::from("wow how secure")).await?;
    println!("player lol has id {}", pid);

    lobby::lib::create_lobby(&String::from("test lobby"), pid).await?;
    let lobbies = lobby::lib::get_lobby_list().await?;
    println!("avalible lobbies:");
    for l in lobbies{
        println!("{:?}", l);
    }
    
    Ok(())
}
*/
