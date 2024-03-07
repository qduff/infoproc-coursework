use std::collections::HashMap;
use std::net::SocketAddr;
mod lib;
// mod game_params;
// use game_params::GameParams;

mod entities;
pub use entities::*;

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

    pub fn tick(&mut self, dt: f32) {
        if self.asteroids.iter().filter(|a| a.size == 4).count() < 3 {
            self.asteroids.push(Asteroid::new());
        }
        self.step_motion(dt);
        self.collisions(); // IDK if this not taking motion into account when calculating collisions is a good idea
    }

    fn step_motion(&mut self, dt: f32) {
        for (_, player) in &mut self.players {
            player.calculate_motion(dt);
        }
        for asteroid in &mut self.asteroids {
            asteroid.calculate_motion(dt);
        }
    }

    fn collisions(&mut self) {}
}
