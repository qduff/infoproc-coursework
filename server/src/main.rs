pub mod game;
// pub mod lobby;
mod net;

use std::collections::HashMap;
use std::net::SocketAddr;
use std::sync::{Arc, RwLock};
use std::thread;

use game::{tickthread, Game, GlobalState, Player};


pub mod schema_capnp {
    include!(concat!(env!("OUT_DIR"), "/schema_capnp.rs"));
}


fn main() {
    let gamestate: Arc<RwLock<GlobalState>> = Arc::new(RwLock::new(GlobalState::new()));
    gamestate.write().unwrap().games.push(Game::new());

    let game_arc = Arc::clone(&gamestate);
    thread::spawn(move || tickthread(game_arc));


    let net_arc = Arc::clone(&gamestate);
    thread::spawn(move || net::net_thread(net_arc));

    loop {
        thread::sleep(std::time::Duration::from_secs(1));
        println!("{} connections",  Arc::strong_count(&gamestate) - 3);
    }

    // lobby::net::net_thread();
    // Ok(())
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
