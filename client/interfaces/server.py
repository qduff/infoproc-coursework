from threading import Event, Thread
import time

TICKRATE = 1/10

from data import state

class ServerInterface:
    def __init__(self) -> None:
        pass

    def run(self):
        while True:
            self.tick()
            time.sleep(TICKRATE)

    def tick(self):
        print(state)
        print("tick")

serverinterface = ServerInterface()
server_thread = Thread(target=serverinterface.run)
server_thread.daemon = True
