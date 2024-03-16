use crate::game::lib::Vec2;
use rand::Rng;

#[derive(Default)]
pub struct Bullet {
    pub position: Vec2,
    pub velocity: Vec2,
    pub lifetime: u32,
}

impl Bullet {
    fn new(rotation: f32, location: &Vec2) -> Self {
        let bullet_speed: f32 = 0.01;
        Bullet {
            lifetime: 1000, // 1 second
            velocity: Vec2 {
                x: bullet_speed * rotation.sin(),
                y: -bullet_speed * rotation.cos(),
            },
            position: location.clone(),
            ..Default::default()
        }
    }

    fn calculate_motion(&mut self, dt: u32) {
        self.position.add_modulo(&self.velocity);
        self.lifetime = self.lifetime.checked_sub(dt).unwrap_or(0);
    }
}

#[derive(Default)]
pub struct Player {
    pub position: Vec2,
    pub velocity: Vec2,
    // recoil: Vec2, // rapidly decaying velocity
    pub rotation: f32,
    pub size: f32,

    pub lives: u8,
    pub invincability_timer: u32,
    pub bullets: Vec<Bullet>,
    pub score: u32,
    shoot_cooldown: u32,

    pub in_angle: f32,
    pub in_propulsion: bool,
    pub in_shoot: bool,
}

impl Player {
    pub fn new() -> Player {
        Player {
            lives: 3,
            position: Vec2 { x: 0.5, y: 0.5 },
            size: 0.03,
            invincability_timer: 3000, // start with invincability
            ..Default::default()
        }
    }

    pub fn calculate_motion(&mut self, dt: u32) {
        self.rotation += dt as f32 * self.in_angle / 200f32;
        self.velocity.apply_propulsion(self.in_propulsion, self.rotation, dt);

        if self.shoot_cooldown == 0 {
            if self.in_shoot {
                self.velocity.apply_recoil(true, self.rotation, dt);
                self.shoot_cooldown = 500;
                self.bullets.push(Bullet::new(self.rotation, &self.position));
                self.rotation += rand::thread_rng().gen_range(-0.05..0.05);
            }
        } else {
            self.shoot_cooldown = self.shoot_cooldown.checked_sub(dt).unwrap_or(0);
        };

        self.position.add_modulo(&Vec2 {
            x: self.velocity.x * dt as f32,
            y: self.velocity.y * dt as f32,
        });

        self.bullets.iter_mut().for_each(|b| b.calculate_motion(dt));
        self.bullets.retain(|b| b.lifetime > 0);
    }

}

#[derive(Default)]
pub struct Asteroid {
    pub position: Vec2,
    pub velocity: Vec2,
    pub size: f32,

    pub seed: u8,
}

impl Asteroid {
    pub fn new() -> Self {
        Asteroid {
            size: 0.08,
            position: Vec2::random_pos(),
            velocity: Vec2::random_vel(),
            seed: rand::thread_rng().gen(),
            ..Default::default()
        }
    }

    pub fn new_spec(position: Vec2, velocity: Vec2, size: f32) -> Self {
        Asteroid {
            size: size,
            position: position,
            velocity: velocity,
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

    pub fn get_mass(&self) -> f32{
        self.size.powi(2)
    }
}
