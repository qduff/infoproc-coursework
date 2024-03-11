use std::collections::HashMap;
use std::net::SocketAddr;
mod lib;
// mod game_params;
// use game_params::GameParams;

mod entities;
pub use entities::*;

use crate::game::lib::Vec2;

#[derive(Default)]
pub struct Game {
    pub players: HashMap<SocketAddr, Player>,
    pub asteroids: Vec<Asteroid>,
    // bullets: Vec<Bullet>,
    // settings: game_params::GameParams,
}

impl Game {
    pub fn new() -> Game {
        Game {
            ..Default::default()
        }
    }

    pub fn tick(&mut self, dt: u32) {
        if self.asteroids.iter().filter(|a| a.lives == 3).count() < 4 {
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
        // player / bullet collisions
        for (_, player) in &mut self.players {
            player.invincability_timer -= std::cmp::min(dt, player.invincability_timer);
            // player asteroid collisions
            for asteroid in &mut self.asteroids {
                if player.position.distance_to(&asteroid.position) < (player.size + asteroid.size) {
                    if player.invincability_timer == 0 {
                        if player.lives == 1 {
                            println!("oof!");
                        } else {
                            player.lives -= 1;
                            player.position = Vec2 { x: 0.5, y: 0.5 };
                            player.velocity = Vec2 { x: 0.0, y: 0.0 };
                            // leave rotation
                            player.invincability_timer = 3000;
                        }
                    }
                }
            }

            // bullet collisions
            for bullet in &mut player.bullets {
                // bullet asteroid collisions
                let mut a_index = 0;
                while a_index < self.asteroids.len() {
                    if bullet.position.distance_to( &self.asteroids[a_index].position ) < self.asteroids[a_index].size {
                        if (self.asteroids[a_index].hit() == 0){
                            self.asteroids.remove(a_index);
                        } else {
                            a_index += 1;
                        }
                        bullet.lifetime = 1;
                    }else{
                        a_index += 1;
                    }
                }
                
            }
        }
        // asteroid asteroid collisions
        for a in 0..self.asteroids.len() {
            for b in 0..self.asteroids.len() {
                if a >= b {
                    continue;
                }
                if self.asteroids[a].position.distance_to(&self.asteroids[b].position)
                    < self.asteroids[a].size + self.asteroids[b].size
                {
                    // let unit = self.asteroids[a].position.unit_vector_to(&self.asteroids[b].position);
                    // TODO use this vector to determine new vectors
                    self.asteroids[a].velocity = self.asteroids[a].velocity.negate();
                    self.asteroids[b].velocity = self.asteroids[b].velocity.negate();

                }
            }
        }
    }
}
