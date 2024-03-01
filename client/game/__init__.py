from raylibpy import *
import math
import copy
import state


ARROW = [[-15, 25],
         [15, 25],
         [0, -25]]

ASTEROID = [[-10, 20],
            [0, 30],
            [20, 20],
            [10, 10],
            [20, -10],
            [0, -30],
            [-10, -10],
            [-40, 0]]

WIDTH = 800
HEIGHT = 800

def draw_shape(shape, angle, offset, scale, color):
    l = len(shape)
    transformed = [[(row[0]*math.cos(angle) - row[1]*math.sin(angle))*scale + offset[0],
                    (row[1]*math.cos(angle) + row[0]*math.sin(angle))*scale + offset[1]]
                   for row in shape]
    for i in range(l):
        draw_line(transformed[i][0], transformed[i][1], transformed[(
            i+1) % l][0], transformed[(i+1) % l][1], color)


def run():

    init_window(WIDTH, HEIGHT, "Game")
    set_target_fps(60)
    rl_enable_smooth_lines()

    while not window_should_close():
        begin_drawing()

        clear_background(BLACK)
        draw_text(f"Latency: {state.rtt*1000:.2f}ms ", 10, 10, 20, LIGHTGRAY)

        # shape = RotateTranslateShape(ARROW, state.state.rotation_amount, [400,400])
        # draw_triangle_lines(*shape, BLACK)
        #

        # for entity in state.rx.entities:
        #     print(entity)

        draw_shape(ARROW, state.input.rotation_amount, [300, 300], 1, WHITE)


        draw_shape(ASTEROID, 0, [40, 40], 2, WHITE)

        # draw_poly_lines()

        if is_key_down(KEY_LEFT):
            state.input.rotation_amount = -1
        elif is_key_down(KEY_RIGHT):
            state.input.rotation_amount = 1
        else:
            state.input.rotation_amount = 0

        state.input.accelerating = True if  is_key_down(KEY_UP) else False
        state.input.shooting = True if  is_key_down(KEY_SPACE) else False


        end_drawing()
    close_window()
