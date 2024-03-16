import state  # Assuming state module contains the State class
import time
import math
from threading import Thread
import subprocess



if FPGA_ENABLED := True:
    proc = subprocess.Popen(
        "/home/qduff/Programs/intelFPGA_lite/18.1/quartus/bin/nios2-terminal",
        stdin=subprocess.PIPE,
        stdout=subprocess.PIPE,
    )
    def collect(out):
        print("collecting!")
        while True:
            l = out.readline().decode("utf-8").rstrip()
            try:
                s = l.split(",")
                # print(rotation_amount, shoot, accel, s[1], s[2])
                state.input.rotation_amount = float(float(s[6])/90)
                state.input.accelerating = bool(int(s[2])==0)
                state.input.shooting = bool(int(s[1])==0)

                # update_state(button_val, accelerometer_val, gyroscope_val)
            except Exception as e:
                print(e)

    fpga_thread = Thread(target=collect, args=[proc.stdout])


    # Initial state              do i need to get back to the initial value????
    state.state = state.State(0, False, False)

else:
    fpga_thread = Thread(target=None)

fpga_thread.daemon = True
