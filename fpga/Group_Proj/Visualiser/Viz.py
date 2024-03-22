"""
File name:   imu_boxControl.py
Developer:   Roy TWu
Description: Visualizing IMU's rotational motion via a cuboid
    03/01/2019 -- File imported from https://github.com/mattzzw/Arduino-mpu6050
    03/02/2019 -- updated to Python3.7, cuboid image is changed to mimic IMU
"""
import array
import time

import pygame
from pygame.locals import *
from OpenGL.GL import *
from OpenGL.GLU import *

import subprocess
from multiprocessing import shared_memory

from collections import deque

from threading import Thread

import mmap
import io

MAX = 100
roll = deque(maxlen=MAX)
pitch = deque(maxlen=MAX)

ax = ay = az = 0.0
yaw_mode = True



def resize(width, height):
    if height == 0:
        height = 1
    glViewport(0, 0, width, height)
    glMatrixMode(GL_PROJECTION)
    glLoadIdentity()
    gluPerspective(45, 1.0 * width / height, 0.1, 100.0)
    glMatrixMode(GL_MODELVIEW)
    glLoadIdentity()


def init():
    glShadeModel(GL_SMOOTH)
    glClearColor(0.0, 0.0, 0.0, 0.0)
    glClearDepth(1.0)
    glEnable(GL_DEPTH_TEST)
    glDepthFunc(GL_LEQUAL)
    glHint(GL_PERSPECTIVE_CORRECTION_HINT, GL_NICEST)


def drawText(position, textString):
    font = pygame.font.SysFont("Courier", 18, True)
    textSurface = font.render(textString, True, (255, 255, 255, 255), (0, 0, 0, 255))
    textData = pygame.image.tostring(textSurface, "RGBA", True)
    glRasterPos3d(*position)
    glDrawPixels(textSurface.get_width(), textSurface.get_height(), GL_RGBA,
                 GL_UNSIGNED_BYTE, textData)


tup_vertices = (
    (1.0, -1.5, -0.2),  # * lower right back
    (1.0, 1.5, -0.2),  # * upper right back
    (-1.0, 1.5, -0.2),  # * upper left back
    (-1.0, -1.5, -0.2),  # * lower left back
    (1.0, -1.5, 0.5),  # * lower right front
    (1.0, 1.5, 0.5),  # * upper right fromt
    (-1.0, 1.5, 0.5),  # * upper left front
    (-1.0, -1.5, 0.5)  # * lower left front
)

tup_edges = (
    (0, 1), (0, 3), (0, 4),
    (2, 1), (2, 3), (2, 6),
    (7, 3), (7, 4), (7, 6),
    (5, 1), (5, 4), (5, 6)
)


def draw():
    global rquad
    glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);

    glLoadIdentity()
    glTranslatef(0, 0.0, -7.0)

    osd_text = "pitch: " + str("{0:.2f}".format(ay)) \
               + ", roll: " + str("{0:.2f}".format(ax))

    if yaw_mode:
        osd_line = osd_text + ", yaw: " + str("{0:.2f}".format(az))
    else:
        osd_line = osd_text

    drawText((-2, -2, 2), osd_line)  # * draw on-screen text

    # * holding the IMU board such that IMU coordinate system is same as
    # * the OpenGL coordinate system
    # * z-y-x Euler angle, R = Rz*Ry*Rx

    # * math the OpenFL coordinate frame to World frame
    glRotatef(-90, 1.0, 0.0, 0.0)

    glRotatef(ax, 1.0, 0.0, 0.0)  # * Roll,  rotate around x-axis
    glRotatef(ay, 0.0, 1.0, 0.0)  # * Pitch, rotate around y-axis
    if yaw_mode:
        glRotatef(az, 0.0, 0.0, 1.0)  # * Yaw,   rotate around z-axis
    else:
        glRotatef(0.0, 0.0, 0.0, 1.0)

    glBegin(GL_LINES)
    for edge in tup_edges:
        for node in edge:
            glVertex3fv(tup_vertices[node])
    glEnd()

    glBegin(GL_QUADS)  # * decalre the type of primitive
    # * top
    glColor3f(0.0, 0.0, 1.0)
    glVertex3f(1.0, 1.5, -0.2)
    glVertex3f(-1.0, 1.5, -0.2)
    glVertex3f(-1.0, 1.5, 0.2)
    glVertex3f(1.0, 1.5, 0.2)

    # * buttom
    glColor3f(0.0, 0.0, 1.0)
    glVertex3f(1.0, -1.5, -0.2)
    glVertex3f(-1.0, -1.5, -0.2)
    glVertex3f(-1.0, -1.5, 0.2)
    glVertex3f(1.0, -1.5, 0.2)

    # * front
    glColor3f(1.0, 0.0, 0.0)
    glVertex3f(1.0, 1.5, 0.2)
    glVertex3f(-1.0, 1.5, 0.2)
    glVertex3f(-1.0, -1.5, 0.2)
    glVertex3f(1.0, -1.5, 0.2)

    # * back
    glColor3f(0.0, 1.0, 0.0)
    glVertex3f(1.0, 1.5, -0.2)
    glVertex3f(-1.0, 1.5, -0.2)
    glVertex3f(-1.0, -1.5, -0.2)
    glVertex3f(1.0, -1.5, -0.2)

    # * left
    glColor3f(0.0, 0.0, 1.0)
    glVertex3f(-1.0, 1.5, 0.2)
    glVertex3f(-1.0, 1.5, -0.2)
    glVertex3f(-1.0, -1.5, -0.2)
    glVertex3f(-1.0, -1.5, 0.2)

    # * right
    glColor3f(0.0, 0.0, 1.0)
    glVertex3f(1.0, 1.5, 0.2)
    glVertex3f(1.0, 1.5, -0.2)
    glVertex3f(1.0, -1.5, -0.2)
    glVertex3f(1.0, -1.5, 0.2)
    glEnd()


def read_data():
    global ax, ay, az
    ax = ay = az = 0.0

    # * while not line_done:
    if len(roll) > 1:
        ax = float(roll[-1])
        ay = float(pitch[-1])


    # * ----- main function -----



def uart():
    proc = subprocess.Popen(

        "D:\\intelFPGA_lite\\18.1\\quartus\\bin64\\nios2-terminal.exe",

        stdin=subprocess.PIPE,

        stdout=subprocess.PIPE,

    )

    def collect(out):
        print("collecting")

        while True:

            l = out.readline().rstrip()
            if not l:
                continue
            try:
                print(l)
                l = l.decode("utf-8").split(",")
                roll.append(l[1])
                pitch.append(l[0])
                time.sleep(0.001)

            except Exception:

                continue

    t = Thread(target=collect, args=[proc.stdout])

    t.daemon = True

    t.start()


def main():
    global yaw_mode

    uart()

    video_flags = OPENGL | DOUBLEBUF

    # * initialize pyGame and create a window
    pygame.init()
    screen = pygame.display.set_mode((640, 480), video_flags)
    pygame.display.set_caption("Press Esc To Quit. Press Z To Toggle Yaw Mode")
    resize(640, 480)
    init()
    frames = 0
    ticks = pygame.time.get_ticks()

    while 1:
        event = pygame.event.poll()
        # * Fix: pyGame window does not close when close button is pressed
        # * 2 way to close the window: click the x button on top of the window
        # *                            or hit Esc key
        if event.type == pygame.QUIT or \
                (event.type == KEYDOWN and event.key == K_ESCAPE):
            pygame.quit()  # * quit pygame properly
            break
        if event.type == KEYDOWN and event.key == K_z:
            yaw_mode = not yaw_mode

        # * reading data from Arduino
        read_data()

        draw()
        pygame.display.flip()  # * update entire display
        frames = frames + 1

    print("fps:  %d" % ((frames * 1000) / (pygame.time.get_ticks() - ticks)))


print(__name__)
if __name__ == '__main__': main()
