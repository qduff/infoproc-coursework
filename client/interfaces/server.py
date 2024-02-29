from threading import Thread
import time
import socket
import state

TICKRATE = 1/10
HOST = "127.0.0.1"
PORT = 5000


class ServerInterface:
    def __init__(self) -> None:
        self.sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

    def run(self):
        self.sock.connect((HOST,PORT))
        while True:
            self.tick()
            time.sleep(TICKRATE)

    def tick(self):
        self.sock.sendall(f'{state.state.rotation_amount}'.encode()) # todo
        print(state.state)
        print("tick")

serverinterface = ServerInterface()
server_thread = Thread(target=serverinterface.run)
server_thread.daemon = True
