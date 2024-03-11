#from interfaces.fpga import fpga_thread
from interfaces.server import server_thread
import game

#fpga_thread.start()
server_thread.start()
game.run()