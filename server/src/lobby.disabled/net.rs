use capnp::message::ReaderOptions;
use capnp::serialize;
use rand::rngs::adapter::ReadError;
// use std::collections::HashMap;
use std::io::prelude::*;
// use std::net::SocketAddr;
use std::sync::{Arc, RwLock};
use std::thread;
use futures::executor::block_on;

use crate::game;
use crate::lobby::lib::{self, handle_command};
use crate::lobby::net;
use bimap::BiMap;

#[derive(Default, Clone)]
pub struct LobbyState {
    pub logged_in: BiMap<std::net::SocketAddr, i64>,
}

async fn handle_conn(mut stream: std::net::TcpStream, state: Arc<RwLock<LobbyState>>) {
    let addr = stream.peer_addr().unwrap();

    loop{
        let reader = serialize::read_message(&stream, ReaderOptions::new());

        match reader {
            Err(_) => {break},
            Ok(_) => {}
        }
        let reader = reader.unwrap();

        let command = reader
            .get_root::<crate::schema_capnp::command::Reader>()
            .unwrap();

        let mut message = ::capnp::message::Builder::new_default();
        let mut response = message.init_root::<crate::schema_capnp::command::Builder>();

        {
            //TODO: handle commands and send response
            let mut command_str: String = String::from("error");
            match command.get_command(){
                Err(capnp::Error { kind: E, extra })  => println!("get_command error"),
                Ok(s)  => command_str = s.to_string().expect("utf8 error"),
            }
            response.set_command(lib::handle_command(command_str, &addr, &state).await.expect("command error"));

        }
        let mut out: Vec<u8> = Vec::new();
        capnp::serialize::write_message(&mut out, &message).unwrap();
        stream.write_all(out.as_slice()).unwrap();
    }

    lib::handle_command(String::from("logout"), &addr, &state).await.expect("command error");

}

pub fn net_thread() {
    let state: Arc<RwLock<LobbyState>> = Arc::new(RwLock::new(LobbyState::default()));
    let l = std::net::TcpListener::bind("0.0.0.0:5003").unwrap();

    for stream in l.incoming() {
        let stream = stream.unwrap();
        let data = Arc::clone(&state);
        thread::spawn(move || {
            block_on( handle_conn(stream, data) );
        });
    }
}

