import state  # Assuming state module contains the State class
import time
import math
from threading import Thread
import subprocess

proc = subprocess.Popen(
    "/home/qduff/Programs/intelFPGA_lite/18.1/quartus/bin/nios2-terminal",
    stdin=subprocess.PIPE,
    stdout=subprocess.PIPE,
)

if FPGA_ENABLED := False:

    def collect(out):
        while True:
            l = out.readline().rstrip()
            try:
                l = l.split(",")
                # button_val = int(l[0])
                # accelerometer_val = int(l[1])
                # gyroscope_val = int(l[2])
                 #TODO: Update the follwoing thre lines with recieved values
                accel = False
                shoot = False
                rotation_amount = 0.0
                state.state = state.State(rotation_amount, shoot, accel)

                # update_state(button_val, accelerometer_val, gyroscope_val)
            except Exception:
                continue

    fpga_thread = Thread(target=collect, args=[proc.stdout])


    # Initial state              do i need to get back to the initial value????
    state.state = state.State(0, False, False)

else:
    fpga_thread = Thread(target=None)

fpga_thread.daemon = True
