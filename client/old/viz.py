# from matplotlib import pyplot as plt
# from matplotlib.animation import FuncAnimation
# from bridge import y
# from threading  import Thread


# fig, ax = plt.subplots()
# ln, = plt.plot(range(len(y)), y, marker='o', ms=1)

# def init():
#     ax.set_xlim(0, 1000)
#     ax.set_ylim(-500, 500)
#     return ln,

# def update(frame):
#     ln.set_data(range(0,len(y)), y)
#     return ln,

# ani = FuncAnimation(fig, update, frames=range(1000),
#                     init_func=init, blit=True)

# ()


# def collect():
#     plt.show()


# plot_thread = Thread(target=plt.show)
# plot_thread.daemon = True
