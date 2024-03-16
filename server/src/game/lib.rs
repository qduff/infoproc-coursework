// Coord is a coordinate, where components range from 0->1 and where 0 is top left
use rand::Rng;

#[derive(Default, Debug, Copy, Clone)]
pub struct Vec2 {
    pub x: f32,
    pub y: f32,
}

impl Vec2 {
    pub fn add_modulo(&mut self, rhs: &Vec2) { // modulo with f32 does not do what you want
        self.x = self.x + rhs.x;
        if self.x <= 0f32 {
            self.x += 1f32
        }
        else if self.x > 1f32 {
            self.x -= 1f32
        }
        self.y = self.y + rhs.y;
        if self.y <= 0f32 {
            self.y += 1f32
        } else if self.y > 1f32 {
            self.y -= 1f32
        }
    }

    pub fn subtract(&self, point2: &Vec2) -> Vec2 {
        Vec2 {
            x: self.x - point2.x,
            y: self.y - point2.y,
        }
    }

    pub fn dot_product(&self, point2: &Vec2) -> f32 {
             self.x * point2.x +
             self.y * point2.y
    }

    pub fn distance_to(&self, point2: &Vec2) -> f32 {
        let Vec2 { x: dx, y: dy } = self.subtract(point2);
        (dy.powi(2) + dx.powi(2)).sqrt()
    }

    pub fn magnitude(&self) -> f32 {
        (self.x.powi(2) + self.y.powi(2)).sqrt()
    }

    pub fn unit_vector(&self) -> Vec2 {
        let dist = self.magnitude();
        Self {
            x: self.x * 1.0 / dist,
            y: self.y * 1.0 / dist,
        }
    }

    pub fn unit_vector_to(&self, point2: &Vec2) -> Vec2 {
        self.subtract(point2).unit_vector()
    }

    pub fn apply_propulsion(&mut self, propel: bool, rotation: f32, dt: u32) {
        let prop_factor = propel as u8 as f32 * 0.00000055 * dt as f32;
        self.x += prop_factor * rotation.sin();
        self.y += -prop_factor * rotation.cos();
        self.x -= dt as f32 * 1.35f32 * self.x.powi(2) * self.x.signum();
        self.y -= dt as f32 * 1.35f32 * self.y.powi(2) * self.y.signum();
    }

    pub fn apply_recoil(&mut self, propel: bool, rotation: f32, dt: u32) {
        let prop_factor = propel as u8 as f32 * 0.000004 * dt as f32;
        self.x += -prop_factor * rotation.sin();
        self.y += prop_factor * rotation.cos();
    }

    pub fn random_pos() -> Vec2 {
        let mut rng = rand::thread_rng();
        Vec2 {
            x: rng.gen_range(0.0..1.0),
            y: rng.gen_range(0.0..1.0),
        }
    }
    pub fn random_vel() -> Vec2 {
        let mut rng = rand::thread_rng();
        Vec2 {
            x: rng.gen_range(-0.00005..0.00005),
            y: rng.gen_range(-0.00005..0.00005),
        }
    }
}
