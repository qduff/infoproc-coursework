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
        
        println!("waiting for command");

        let reader = serialize::read_message(&stream, ReaderOptions::new()).unwrap();
        let command = reader
            .get_root::<crate::schema_capnp::command::Reader>()
            .unwrap();
        println!("command recieved: {:?}", command);

        let mut message = ::capnp::message::Builder::new_default();
        let mut response = message.init_root::<crate::schema_capnp::command::Builder>();
        
        {
            //TODO: handle commands and send response
            response.set_command("hello");

        }

        let mut out: Vec<u8> = Vec::new();
        capnp::serialize::write_message(&mut out, &message).unwrap();
        stream.write_all(out.as_slice()).unwrap();
    }
}


pub fn net_thread() {
    let state: Arc<RwLock<LobbyState>> = Arc::new(RwLock::new(LobbyState::default()));
    let l = std::net::TcpListener::bind("0.0.0.0:5003").unwrap();

    for stream in l.incoming() {
        let stream = stream.unwrap();
        let data = Arc::clone(&state);
        thread::spawn(move || {
            handle_conn(stream, data);
        });
    }
}