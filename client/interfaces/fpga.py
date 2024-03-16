import state  # Assuming state module contains the State class
from threading import Thread
import subprocess

if FPGA_ENABLED := False:
    proc = subprocess.Popen(
        "/home/qduff/Programs/intelFPGA_lite/18.1/quartus/bin/nios2-terminal",
        stdin=subprocess.PIPE,
        stdout=subprocess.PIPE,
    )
    def collect(out):
        print("collecting!")
        while True:
            line = out.readline().decode("utf-8").rstrip()
            try:
                s = line.split(",")
                state.input.rotation_amount = float(float(s[6])/90)
                state.input.accelerating = bool(int(s[2])==0)
                state.input.shooting = bool(int(s[1])==0)

            except Exception as e:
                print(e)

    fpga_thread = Thread(target=collect, args=[proc.stdout])

else:
    fpga_thread = Thread(target=None)

fpga_thread.daemon = True
