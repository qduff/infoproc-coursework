from raylibpy import *
import math
import copy
import state

ARROW = [[-15, 25],
         [15, 25],
         [0, -25]]

def RotateTranslateShape(shape, angle, offset):
    return [[row[0]*math.cos(angle) - row[1]*math.sin(angle) + offset[0],
             row[1]*math.cos(angle) + row[0]*math.sin(angle) + offset[1]]
             for row in shape]

def run():

    init_window(800, 800, "Game")
    set_target_fps(60)

    while not window_should_close():
        begin_drawing()

        clear_background(RAYWHITE)

        shape = RotateTranslateShape(ARROW, state.state.rotation_amount, [400,400])

        draw_triangle_lines(*shape, BLACK)

        end_drawing()
    close_window()
