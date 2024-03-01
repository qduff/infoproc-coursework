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
            while True:
                print("[tick]")
                self.tick()
                time.sleep(TICKRATE)
        except Exception as e:
            print("[ServerThread]", e)
            os._exit(-1)


    def tick(self):
        start = time.time()
        tx = schema_capnp.Tx.new_message()
        tx.angle = state.input.rotation_amount
        tx.propulsion = state.input.accelerating
        tx.shoot = state.input.shooting
        tx.write(self.sock)

        # read
        rx = self.sock.recv(2048)
        with schema_capnp.Rx.from_bytes(rx) as rx:
            state.rx = rx
        stop = time.time()
        state.rtt = stop - start


serverinterface = ServerInterface()
server_thread = Thread(target=serverinterface.run)
server_thread.daemon = True
