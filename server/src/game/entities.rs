use crate::game::lib::Vec2;
use rand::Rng;
use std::f32::consts::PI;

#[derive(Default)]
pub struct Bullet {
    position: Vec2,
    velocity: Vec2,
    lifetime: u8,
}

impl Bullet {
    fn new(rotation: f32) -> Self {
        let bullet_speed: f32 = 1.0;
        Bullet {
            lifetime: 100,
            velocity: Vec2 {
                x: bullet_speed * rotation.cos(),
                y: bullet_speed * rotation.sin(),
            },
            ..Default::default()
        }
    }
}

impl Bullet {
    fn calculate_motion(&mut self) {
        self.position.add_modulo(&self.velocity);
        self.lifetime -= 1;
    }
}

#[derive(Default)]
pub struct Player {
    pub position: Vec2,
    pub velocity: Vec2,
    pub rotation: f32,

    pub lives: u8,
    pub invincability_timer: u32,

    // accel_scale: i64,
    // decay_mul: i64,
    // decay_exp: f64,
    // size_scale: i64,
    pub in_angle: f32,
    pub in_propulsion: bool,
    pub in_shoot: bool,
}

impl Player {
    pub fn new() -> Player {
        Player {
            lives: 3,
            position: Vec2 { x: 0.5, y: 0.5 },
            ..Default::default()
        }
    }

    pub fn calculate_motion(&mut self, dt: u32) {
        self.rotation += dt as f32 * self.in_angle / 200f32;
        self.velocity
            .apply_propulsion(self.in_propulsion, self.rotation, dt);
        self.position.add_modulo(&Vec2 {
            x: self.velocity.x * dt as f32,
            y: self.velocity.y * dt as f32,
        });

        //TODO emit bullets
    }
}

#[derive(Default)]
pub struct Asteroid {
    pub position: Vec2,
    pub velocity: Vec2,
    pub angle: f32,
    pub size: u8, // 4 -> 2 -> 1  -  i think?
    pub rotation: f32,
    // speed_mul: i64,
    // size_mul: i64,
}

impl Asteroid {
    pub fn new() -> Self {
        Asteroid {
            size: 4,
            rotation: rand::thread_rng().gen_range(0.0..2.0 * PI),
            position: Vec2::random_pos(),
            velocity: Vec2::random_vel(),
            ..Default::default()
        }
    }

    pub fn calculate_motion(&mut self, dt: u32) {
        self.position.add_modulo(&Vec2 {
            x: self.velocity.x * dt as f32,
            y: self.velocity.y * dt as f32,
        });
    }

    fn handle_shot(&mut self) {
        // break into two seperate asteroids, where size is halved
    }
    // fn calculate_motion(&mut self, settings: &GameParams) {
    //     self.pos.mod_add(self.velocity, settings.size);
    // }
}
