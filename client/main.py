import time
from interfaces.fpga import fpga_thread
from interfaces.server import server_thread

fpga_thread.start()
server_thread.start()

while True:
    # Game rendering goes here in main thread
    time.sleep(1000)