use crate::game::lib::Vec2;
use rand::Rng;
use std::f32::consts::PI;

#[derive(Default)]
pub struct Bullet {
    pub position: Vec2,
    pub velocity: Vec2,
    pub lifetime: u8,
}

impl Bullet {
    fn new(rotation: f32, location: & Vec2) -> Self {
        let bullet_speed: f32 = 0.01;
        Bullet {
            lifetime: 100,
            velocity: Vec2 {
                x: bullet_speed * rotation.cos(),
                y: bullet_speed * rotation.sin(),
            },
            position: location.clone(),
            ..Default::default()
        }
    }
    
    fn calculate_motion(&mut self) -> u8 {
        println!("vel -> x:{}y:{}",self.velocity.x, self.velocity.y);
        self.position.add_modulo(&self.velocity);
        self.lifetime -= 1;
        self.lifetime
    }
}

#[derive(Default)]
pub struct Player {
    pub position: Vec2,
    pub velocity: Vec2,
    pub rotation: f32,
    pub size: f32,

    pub lives: u8,
    pub invincability_timer: u32,
    pub bullets: Vec<Bullet>,

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
            size: 0.05,
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

        if self.in_shoot {
            self.in_shoot = false;
            self.bullets.push(Bullet::new(self.rotation, &self.position));
        }

        let mut b_index = 0;

        while b_index < self.bullets.len() {
            let lifetime = self.bullets[b_index].calculate_motion();
            if lifetime == 0 {
                self.bullets.remove(b_index);
            }else{
                b_index += 1;
            }
        }

        //TODO emit bullets
    }
}

#[derive(Default)]
pub struct Asteroid {
    pub position: Vec2,
    pub velocity: Vec2,
    pub angle: f32,
    pub size: f32, // 4 -> 2 -> 1  -  i think?
    pub rotation: f32,
    pub lives: u8,
    // speed_mul: i64,
    // size_mul: i64,
}

impl Asteroid {
    pub fn new() -> Self {
        Asteroid {
            size: 0.08,
            rotation: rand::thread_rng().gen_range(0.0..2.0 * PI),
            position: Vec2::random_pos(),
            velocity: Vec2::random_vel(),
            lives: 3,
            ..Default::default()
        }
    }

    pub fn calculate_motion(&mut self, dt: u32) {
        self.position.add_modulo(&Vec2 {
            x: self.velocity.x * dt as f32,
            y: self.velocity.y * dt as f32,
        });
    }

    pub fn hit(&mut self) -> u8 {
        self.lives -= 1;
        self.size /= 2.0;
        self.lives
    }
    // fn calculate_motion(&mut self, settings: &GameParams) {
    //     self.pos.mod_add(self.velocity, settings.size);
    // }
}
