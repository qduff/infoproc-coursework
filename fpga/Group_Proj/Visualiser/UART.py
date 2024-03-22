import subprocess

from matplotlib import pyplot as plt

from matplotlib.animation import FuncAnimation

from collections import deque

from threading import Thread

MAX = 100
y = deque(maxlen=MAX)

proc = subprocess.Popen(

    "D:\\intelFPGA_lite\\18.1\\quartus\\bin64\\nios2-terminal.exe",

    stdin=subprocess.PIPE,

    stdout=subprocess.PIPE,

)


def collect(out):
    print("colecting")

    while True:

        l = out.readline().rstrip()

        try:
            print(l)

            y.append(int(l.decode("utf-8").split(",")[0]))

        except Exception:

            continue


t = Thread(target=collect, args=[proc.stdout])

t.daemon = True

t.start()

fig, ax = plt.subplots()

ln, = plt.plot(range(len(y)), y, marker='o', ms=1)


def init():
    ax.set_xlim(0, MAX)

    ax.set_ylim(-100, 100)

    return ln,


def update(frame):
    ln.set_data(range(0, len(y)), y)

    return ln,


ani = FuncAnimation(fig, update, frames=range(MAX),

                    init_func=init, blit=True)

plt.show()
