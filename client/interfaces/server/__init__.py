import os
import signal
import sys
from threading import Thread
import time
import socket
import state

TICKRATE = 1/10
HOST = "127.0.0.1"
PORT = 5000

import capnp
schema_capnp = capnp.load('interfaces/server/schema.capnp')


class ServerInterface:
    def __init__(self) -> None:
        self.sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

    def run(self):
        try:
            self.sock.connect((HOST,PORT))
        except Exception as e:
            print("[ServerThread]", e)
            os._exit(-1)
        while True:
            # print("[tick]")
            self.tick()
            time.sleep(TICKRATE)

    def tick(self):
        tx = schema_capnp.Tx.new_message()
        # print(state.state)
        tx.angle = state.state.rotation_amount
        tx.propulsion = state.state.accelerating
        tx.shoot = state.state.shooting
        self.sock.sendall(tx.to_bytes())

serverinterface = ServerInterface()
server_thread = Thread(target=serverinterface.run)
server_thread.daemon = True
