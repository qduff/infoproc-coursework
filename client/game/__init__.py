import time
from raylibpy import *
import math
import copy
import state
from interfaces.server import schema_capnp, POLLRATE as pollrate

ARROW = [[-.015, .025],
         [.015, .025],
         [.00, -.025]]

ASTEROID = [[-.010, .020],
            [0, .030],
            [.020, .020],
            [.010, .010],
            [.020, -.010],
            [.00, -.030],
            [-.010, -.010],
            [-.040, 0]]

WIDTH = 800
HEIGHT = 800

def draw_shape(shape, offset: list[float, float], angle: float = 0,  scale: int = 1, color: Color = WHITE) -> None:
    draw_shape_single(shape, offset, angle, scale, color)
    if offset[0] < 0.3:
        draw_shape_single(shape, [offset[0]+1, offset[1]], angle, scale, color)
        draw_shape_single(shape, [offset[0]+1, offset[1]+1], angle, scale, color)
        draw_shape_single(shape, [offset[0]+1, offset[1]-1], angle, scale, color)
    if offset[0] > 0.7:
        draw_shape_single(shape, [offset[0]-1, offset[1]], angle, scale, color)
        draw_shape_single(shape, [offset[0]-1, offset[1]+1], angle, scale, color)
        draw_shape_single(shape, [offset[0]-1, offset[1]-1], angle, scale, color)
    if offset[1] < 0.3:
        draw_shape_single(shape, [offset[0], offset[1]+1], angle, scale, color)
        draw_shape_single(shape, [offset[0]+1, offset[1]+1], angle, scale, color)
        draw_shape_single(shape, [offset[0]-1, offset[1]+1], angle, scale, color)
    if offset[1] > 0.7:
        draw_shape_single(shape, [offset[0], offset[1]-1], angle, scale, color)
        draw_shape_single(shape, [offset[0]+1, offset[1]-1], angle, scale, color)
        draw_shape_single(shape, [offset[0]-1, offset[1]-1], angle, scale, color)


def draw_shape_single(shape, offset: list[float, float], angle: float = 0,  scale: int = 1, color: Color = WHITE) -> None:
    l = len(shape)
    transformed = [[((row[0]*math.cos(angle) - row[1]*math.sin(angle))*scale + offset[0])*WIDTH,
                    ((row[1]*math.cos(angle) + row[0]*math.sin(angle))*scale + offset[1] )*HEIGHT]
                   for row in shape]
    for i in range(l):
        draw_line(transformed[i][0], transformed[i][1], transformed[(
            i+1) % l][0], transformed[(i+1) % l][1], color)


def run():

    # while state.rx == None: time.sleep(5); print("Waiting to connect...")

    if VSYNC_EN := True:
        set_config_flags(FLAG_VSYNC_HINT)
    else:
        set_target_fps(60)

    init_window(WIDTH, HEIGHT, "Game")
    rl_enable_smooth_lines()

    while not window_should_close():
        begin_drawing()

        clear_background(BLACK)
        draw_text(
            f"rtt: {state.rtt*1000:.2f}ms ", 10, 10, 20, LIGHTGRAY)
        draw_text(
            f"pollrate: t:{pollrate}ms r:{state.pollrate*1000:.2f}ms ", 10, 30, 20, LIGHTGRAY)

        draw_text(
            f'Frametime{": vsync" if VSYNC_EN else ""}: {get_frame_time()*1000:.2f}ms', 10, 50, 20, LIGHTGRAY)

        for player in state.rx.players:
            if player.type == schema_capnp.Player.PlayerType.myPlayer:
                draw_shape(ARROW, [player.x, player.y], player.rotation, 1, GREEN)
                draw_text(f"Lives: {player.lives} ", 10, 70, 20, RED)
            if player.type == schema_capnp.Player.PlayerType.player:
                draw_shape(ARROW, [player.x, player.y], player.rotation, 1, WHITE)

        print(len(state.rx.asteroids))
        for asteroid in state.rx.asteroids:
            print([asteroid.x, asteroid.y])
            draw_shape(ASTEROID, [asteroid.x, asteroid.y], asteroid.rotation, asteroid.size, WHITE)

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
