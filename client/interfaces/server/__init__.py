import os
import signal
import sys
from threading import Thread
import time
import socket
import state

POLLRATE = 50 #ms - determines max rate of polling, will increase if server to slow!
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
                start = time.time()
                print("[tick]")
                self.tick()
                state.rtt = time.time() - start
                time.sleep(abs(state.rtt - POLLRATE/1000 ))
                state.pollrate = time.time() - start

        except Exception as e:
            print("[ServerThread]", e)
            os._exit(-1)


    def tick(self):
        tx = schema_capnp.Tx.new_message()
        tx.angle = state.input.rotation_amount
        tx.propulsion = state.input.accelerating
        tx.shoot = state.input.shooting
        tx.write(self.sock)

        # read
        rx = self.sock.recv(2048)
        with schema_capnp.Rx.from_bytes(rx) as rx:
            state.rx = rx


serverinterface = ServerInterface()
server_thread = Thread(target=serverinterface.run)
server_thread.daemon = True
