import time
from raylibpy import *
from raylibpy import load_font
import math
import random
import copy
import state
from interfaces.server import schema_capnp, POLLRATE as pollrate
from interfaces.fpga import FPGA_ENABLED

DEBUG = True

WIDTH = 1000
HEIGHT = 1000

ARROW = [[-.015, .025],
         [-.01, .015],
         [.01, .015],
         [.015, .025],
         [.00, -.025]]

PROPEL = [[-.007, .02],
         [.007, .02],
         [.00, .04]]


def generate_asteroid(seed, radius = 0.015, rad_deviation = 0.004, rad_large_prob = 0.2, points = 12, arg_deviation =0.05):
    random.seed(seed)
    asteroid = []
    for p in range(points):
        if (random.random() < rad_large_prob):
            rad_large_prob *= 0.5
            delta_rad = random.uniform(-rad_deviation * 3,-rad_deviation* 2)
        else:
            delta_rad = random.uniform(-rad_deviation, rad_deviation)

        arg = (p * math.pi * 2 / points) + random.uniform(- arg_deviation, arg_deviation)
        rad = radius + delta_rad
        asteroid.append([rad*math.cos(arg),rad*math.sin(arg)])
    return asteroid

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

def generate_stars(n, width, height):
    return [(random.randint(0, width), random.randint(0, height)) for _ in range(n)]

stars = generate_stars(100, WIDTH, HEIGHT)

def draw_stars(stars):
    for star in stars:
        draw_pixel(int(star[0]), int(star[1]), WHITE)

# custom_font = load_font("./game/fonts/lato.ttf") # causes segfault lol

def run():
    while state.rx is None: print("Waiting to connect..."); time.sleep(1)
    if VSYNC_EN := True:
        set_config_flags(FLAG_VSYNC_HINT)
    else:
        set_target_fps(60)

    init_window(WIDTH, HEIGHT, "Game")
    rl_enable_smooth_lines()

    while not window_should_close():
        begin_drawing()
        clear_background(BLACK)

        draw_stars(stars)

        if DEBUG:
            draw_text(f"rtt: {state.rtt*1000:.2f}ms ", 10, 10, 20, LIGHTGRAY)
            draw_text(f"pollrate: t:{pollrate}ms r:{state.pollrate*1000:.2f}ms ", 10, 30, 20, LIGHTGRAY)
            draw_text(f'Frametime{": vsync" if VSYNC_EN else ""}: {get_fps()} FPS - {get_frame_time()*1000:.2f}ms', 10, 50, 20, LIGHTGRAY)

        for i, player in enumerate(state.rx.players):
            draw_text(f'score: {player.score} ', 10, 70, 20, LIGHTGRAY)
            if player.type == schema_capnp.Player.PlayerType.myPlayer:
                if player.lives == 0:
                    col = RED
                    draw_text("WASTED", 150, 400, 150, RED)
                else:
                    col = GREEN
                draw_text(f"Me: {player.lives}", 10, 90 + i * 20, 20, col)
            else:
                if player.lives == 0:
                    col = RED
                else:
                    col = WHITE
                draw_text(f"Player {i+1}: {player.lives}", 10, 90 + i * 20, 20, col)
            if player.invincabilityTimer % 200 > 100:
                col = RED

            if player.lives > 0:
                if DEBUG:
                    draw_circle(player.x*WIDTH, player.y*HEIGHT, 0.03*WIDTH, DARKGRAY)
                draw_shape(ARROW, [player.x, player.y], player.rotation, 1, col)
                if player.propelling:
                    draw_shape(PROPEL, [player.x, player.y], player.rotation, 1, col)

            for bullet in player.bullets:
                draw_circle(bullet.x*WIDTH, bullet.y*HEIGHT, 0.004*WIDTH, WHITE)
                # draw_shape(generate_asteroid(None, 0.015, 0.004,0.2, 12, 0.05), [bullet.x, bullet.y], 0, 0.4, WHITE)
                # draw_shape(generate_asteroid(None, 0.015, 0.004,0.2, 12, 0.05), [bullet.x, bullet.y], 0, 0.3, WHITE) # TODO: generating asteroids like this tanks fps

        for asteroid in state.rx.asteroids:
            if DEBUG:
                draw_circle(asteroid.x*WIDTH, asteroid.y*HEIGHT, asteroid.size*WIDTH, DARKGREEN)
            draw_shape(generate_asteroid(asteroid.seed), [asteroid.x, asteroid.y], 0, asteroid.size * 65, WHITE)

        if not FPGA_ENABLED:
            if is_key_down(KEY_LEFT):
                state.input.rotation_amount = -1
            elif is_key_down(KEY_RIGHT):
                state.input.rotation_amount = 1
            else:
                state.input.rotation_amount = 0

            state.input.accelerating = True if is_key_down(KEY_UP) else False
            state.input.shooting = True if is_key_down(KEY_SPACE) else False


        end_drawing()
    # unload_font(custom_font)
    close_window()
