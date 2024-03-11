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
                x: -bullet_speed * (-rotation).sin(),
                y: -bullet_speed * rotation.cos(),
            },
            position: location.clone(),
            ..Default::default()
        }
    }

    fn calculate_motion(&mut self) -> u8 {
        // println!("vel -> x:{}y:{}",self.velocity.x, self.velocity.y);
        self.position.add_modulo(&self.velocity);
        self.lifetime -= 1;
        self.lifetime
    }
}

#[derive(Default)]
pub struct Player {
    pub position: Vec2,
    pub velocity: Vec2,
    recoil: Vec2, // rapidly decaying velocity
    pub rotation: f32,
    pub size: f32,

    pub lives: u8,
    pub invincability_timer: u32,
    pub bullets: Vec<Bullet>,
    shoot_cooldown: u32,

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
        self.recoil = self.recoil.scale(0.8);

        if self.shoot_cooldown == 0 && self.in_shoot {
            self.in_shoot = false;
            self.shoot_cooldown = 15;
            self.bullets.push(Bullet::new(self.rotation, &self.position));

            // recoil
            let mut rng = rand::thread_rng();
            self.rotation +=  rng.gen_range(-0.05..0.05);
            self.recoil = Vec2::from_polar(0.0008,- self.rotation);
            println!("{:?}",self.recoil);

            // self.recoil = self.velocity.subtract(&recoil);
            //self.position.add_modulo(&Vec2::from_polar(0.02, -self.rotation));

        }
        self.shoot_cooldown = self.shoot_cooldown.min(self.shoot_cooldown.wrapping_sub(1));

        self.position.add_modulo(&Vec2 {
            x: (self.velocity.x + self.recoil.x ) * dt as f32,
            y: (self.velocity.y + self.recoil.y) * dt as f32,
        });

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

    pub fn get_velocity(& self) -> Vec2{
        return self.velocity.subtract(&self.recoil);
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

    pub seed: u8,
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
            seed: rand::thread_rng().gen(),
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
