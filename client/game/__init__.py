from raylibpy import *
import math
import copy
import state
from interfaces.server import TICKRATE as servertickrate, schema_capnp

ARROW = [[-.03, .05],
         [.03, .05],
         [.00, -.05]]

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


def draw_shape(shape, offset: list[float, float], angle: float = 0,  scale: int = 1, color: Color = WHITE) -> None:
    l = len(shape)
    transformed = [[((row[0]*math.cos(angle) - row[1]*math.sin(angle))*scale + offset[0] + 1)*WIDTH/2,
                    ((row[1]*math.cos(angle) + row[0]*math.sin(angle))*scale + offset[1] + 1)*HEIGHT/2]
                   for row in shape]
    for i in range(l):
        draw_line(transformed[i][0], transformed[i][1], transformed[(
            i+1) % l][0], transformed[(i+1) % l][1], color)


def run():
    if VSYNC_EN := True:
        set_config_flags(FLAG_VSYNC_HINT)
    else:
        set_target_fps(60)

    init_window(WIDTH, HEIGHT, "Game")
    rl_enable_smooth_lines()

    while not window_should_close():
        begin_drawing()

        clear_background(BLACK)
        draw_text(f"Latency: {state.rtt*1000:.2f}ms ", 10, 10, 20, LIGHTGRAY)
        draw_text(
            f"Pollrate: {servertickrate*1000 + state.rtt*1000:.2f}ms ", 10, 30, 20, LIGHTGRAY)
        draw_text(
            f'Frametime{": vsync" if VSYNC_EN else ""}: {get_frame_time()*1000:.2f}ms', 10, 50, 20, LIGHTGRAY)

        for entity in state.rx.entities:
            if entity.type == schema_capnp.Entity.EntityType.myPlayer:
                draw_shape(ARROW, [entity.x, entity.y], entity.rotation, 1, GREEN)
            if entity.type == schema_capnp.Entity.EntityType.player:
                draw_shape(ARROW, [entity.x, entity.y], entity.rotation, 1, WHITE)

        # draw_shape(ASTEROID, [120, 120])

        # draw_poly_lines()

        if is_key_down(KEY_LEFT):
            state.input.rotation_amount = -1
        elif is_key_down(KEY_RIGHT):
            state.input.rotation_amount = 1
        else:
            state.input.rotation_amount = 0

        state.input.accelerating = True if is_key_down(KEY_UP) else False
        state.input.shooting = True if is_key_down(KEY_SPACE) else False

        end_drawing()
    close_window()
