from interfaces.fpga import fpga_thread
from interfaces.server import server_thread
from interfaces.console import console_thread
import game
import time

fpga_thread.start()
console_thread.start()
server_thread.start()
game.run()
# while True:
#     time.sleep(1)
