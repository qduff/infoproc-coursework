use capnp::message::ReaderOptions;
use capnp::serialize;
// use std::collections::HashMap;
use std::io::prelude::*;
// use std::net::SocketAddr;
use std::sync::{Arc, RwLock};
use std::thread;

use crate::game;

#[derive(Default)]
struct LobbyState {

}

fn handle_conn(mut stream: std::net::TcpStream, state: Arc<RwLock<LobbyState>>) {
    let addr = stream.peer_addr().unwrap();

    loop {
        let mut buf = [0; 24];
        if let Err(_) = stream.read_exact(&mut buf) {
            break;
        }

        let reader = serialize::read_message(buf.as_slice(), ReaderOptions::new()).unwrap();
        let command = reader
            .get_root::<crate::schema_capnp::command::Reader>()
            .unwrap();
        {
            //TODO: handle commands and send response
        }
    }
}


pub fn net_thread() {
    let state: Arc<RwLock<LobbyState>> = Arc::new(RwLock::new(LobbyState::default()));
    let l = std::net::TcpListener::bind("0.0.0.0:5000").unwrap();

    for stream in l.incoming() {
        let stream = stream.unwrap();
        let data = Arc::clone(&state);
        thread::spawn(move || {
            handle_conn(stream, data);
        });
    }
}