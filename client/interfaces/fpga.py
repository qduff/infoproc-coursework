from data import stream, parse_data
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
                stream.append(int(l))
            except Exception:
                continue

    t = Thread(target=collect, args=[proc.stdout])

else:
    def collect():
        i = 0
        while True:
            l = math.sin(i)
            stream.append(l)
            Thread(target=parse_data).run()
            i+=0.01
            time.sleep(0.01)

    fpga_thread = Thread(target=collect)


fpga_thread.daemon = True
