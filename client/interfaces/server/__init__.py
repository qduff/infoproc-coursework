import os
from threading import Thread
import time
import socket
import state
import capnp

POLLRATE = 50 #ms - determines max rate of polling, will increase if server to slow!
HOST = "127.0.0.1"
GAME_PORT = 5004
LOBBY_PORT = 5003

schema_capnp = capnp.load('interfaces/server/schema.capnp')

class LobbyInterface:
    def __init__(self) -> None:
        self.sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

    def run(self):
        try:
            self.sock.connect((HOST,LOBBY_PORT))
            while True:

                command = input(">")

                if state.in_game:
                    print("can't input commands wilst in game")
                    continue

                send_packet = schema_capnp.Command.new_message()
                send_packet.command = command
                send_packet.write(self.sock)

                # read
                with schema_capnp.Command.from_bytes(self.sock.recv(2048)) as rx:
                    print(rx.command)


        except Exception as e:
            print("[LobbyThread]", e)
            os._exit(-1)


class ServerInterface:
    def __init__(self) -> None:
        self.sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

    def run(self):
        try:
            self.sock.bind(("", GAME_PORT))
            self.sock.listen(1)
            conn, addr = self.sock.accept()
            while True:
                start = time.time()
                # print("[tick]")
                self.tick()
                state.rtt = time.time() - start
                time.sleep(max(0, POLLRATE/1000 - state.rtt ))
                state.pollrate = time.time() - start

        except Exception as e:
            print("[ServerThread]", e)
            os._exit(-1)

    def game_thread(self):
        try:
            self.sock.connect((HOST,GAME_PORT))
            while True:
                start = time.time()
                # print("[tick]")
                self.tick()
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
        tx.write(self.sock)

        # read
        rx = self.sock.recv(2048)
        with schema_capnp.Rx.from_bytes(rx) as rx:
            state.rx = rx

lobbyInterface = LobbyInterface()
lobby_thread = Thread(target=lobbyInterface.run)
lobby_thread.daemon = True

serverinterface = ServerInterface()
server_thread = Thread(target=serverinterface.run)
server_thread.daemon = True
