import state
import time
import math
from threading  import Thread
import subprocess

if False:
    proc = subprocess.Popen(
        "/home/qduff/Programs/intelFPGA_lite/18.1/quartus/bin/nios2-terminal",
        stdin=subprocess.PIPE,
        stdout=subprocess.PIPE,
    )

    def collect(out):
        while True:
            l = out.readline().rstrip()
            try:
                # append a float from -1->1, depending on whether angled left/right
                stream.append(l)
            except Exception:
                continue

    t = Thread(target=collect, args=[proc.stdout])

else:
    def collect():
        i = 0
        while True:
            l = math.sin(i)
            state.state = state.State(l, l<-0.7, l>0.7) # generate arb values
            i+=0.01
            time.sleep(0.01)

    fpga_thread = Thread(target=collect)


fpga_thread.daemon = True
