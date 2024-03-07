use std::collections::HashMap;
use std::net::SocketAddr;
mod lib;
// mod game_params;
// use game_params::GameParams;

mod entities;
pub use entities::*;

use crate::game::lib::Coord;

#[derive(Default)]
pub struct Game {
    pub players: HashMap<SocketAddr, Player>,
    pub asteroids: Vec<Asteroid>,
    bullets: Vec<Bullet>,
    // settings: game_params::GameParams,
}

impl Game {
    pub fn new() -> Game {
        Game {
            ..Default::default()
        }
    }

    pub fn tick(&mut self, dt: u32) {
        if self.asteroids.iter().filter(|a| a.size == 4).count() < 3 {
            self.asteroids.push(Asteroid::new());
        }
        self.step_motion(dt);
        self.collisions(dt); // IDK if this not taking motion into account when calculating collisions is a good idea
    }

    fn step_motion(&mut self, dt: u32) {
        for (_, player) in &mut self.players {
            player.calculate_motion(dt);
        }
        for asteroid in &mut self.asteroids {
            asteroid.calculate_motion(dt);
        }
    }

    fn collisions(&mut self, dt: u32) {
        // player - asteroid collisions
        for it in &mut self.players.iter_mut().zip(&mut self.asteroids) {
            let ((_, player), asteroid) = it;
            if player.position.distance_to(&asteroid.position) < asteroid.size as f32 / 35.0 {
                if player.invincability_timer == 0 {
                    if player.lives == 1 {
                        println!("dead");
                    } else {
                        player.lives -= 1;
                        player.position = Coord { x: 0.5, y: 0.5 };
                        player.invincability_timer = 1000;
                    }
                } else {
                    player.invincability_timer -= std::cmp::min(dt, player.invincability_timer);
                }
            }
        }
    }
}
