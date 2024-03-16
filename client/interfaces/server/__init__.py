import os
from threading import Thread
import time
import socket
import state
import capnp
# import game


POLLRATE = 50 #ms - determines max rate of polling, will increase if server to slow!
HOST = "127.0.0.1"
PORT = 5000

schema_capnp = capnp.load('interfaces/server/schema.capnp')


class ServerInterface:
    def __init__(self) -> None:
        self.sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

    def run(self):
        try:
            self.sock.connect((HOST,PORT))
            while True:
                start = time.time()
                # print("[tick]")
                # try:
                self.tick()
                    # pass
                state.rtt = time.time() - start
                time.sleep(max(0, POLLRATE/1000 - state.rtt ))
                state.pollrate = time.time() - start

        except Exception as e:
            print("[ServerThread]", e)
            os._exit(-1)


    def tick(self):
        tx = schema_capnp.Tx.new_message()
        tx.angle = state.input.rotation_amount
        tx.propulsion = state.input.accelerating
        tx.shoot = state.input.shooting
        with state.commands_lock:
            tx.commands = state.commands
            state.commands.clear()
        tx.write(self.sock)

        # read
        rx = bytes()
        while len(rx) == 0 or rx[-3:] != b"EOI":
            rx += self.sock.recv(2048)
        rx = rx[:-3]

        state.rx =schema_capnp.Rx.from_bytes_packed(rx)
        if state.rx.messages:
            print("\n".join(state.rx.messages))


serverinterface = ServerInterface()
server_thread = Thread(target=serverinterface.run)
server_thread.daemon = True
