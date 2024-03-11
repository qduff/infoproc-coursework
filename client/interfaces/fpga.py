import state  # Assuming state module contains the State class
import time
import math
from threading import Thread
import subprocess
from collections import deque

button_values = deque(maxlen=1000)
accelerometer_values = deque(maxlen=1000)
gyroscope_values = deque(maxlen=1000)

proc = subprocess.Popen(
    "/home/qduff/Programs/intelFPGA_lite/18.1/quartus/bin/nios2-terminal",
    stdin=subprocess.PIPE,
    stdout=subprocess.PIPE,
)

def collect(out):
    while True:
        l = out.readline().rstrip()
        try:
            l = l.split(",")
            button_val = int(l[0])
            accelerometer_val = int(l[1])
            gyroscope_val = int(l[2])
            button_values.append(button_val)
            accelerometer_values.append(accelerometer_val)
            gyroscope_values.append(gyroscope_val)
            update_state(button_val, accelerometer_val, gyroscope_val)
        except Exception:
            continue

t = Thread(target=collect, args=[proc.stdout])
t.daemon = True
t.start()

def update_state(button_val, accelerometer_val, gyroscope_val):
    accelerometer_val  
    button_val
    gyroscope_val 

    # Update the state
    state.state = state.State(gyroscope_val, button_val, accelerometer_val)

# Initial state              do i need to get back to the initial value????
state.state = state.State(0, False, False)

