// Coord is a coordinate, where components range from 0->1 and where 0 is top left
use rand::Rng;

#[derive(Default, Debug)]
pub struct Coord {
    pub x: f32,
    pub y: f32,
}

impl Coord {
    pub fn add_modulo(&mut self, rhs: &Coord) {
        self.x = self.x + rhs.x;
        if self.x <= 0f32 {
            self.x += 1f32
        }
        // modulo with f32 does not do what you want
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

    pub fn distance_to(&self, point2: &Coord) -> f32 {
        let dx = self.x - point2.x;
        let dy = self.y - point2.y;
        (dy.powi(2) + dx.powi(2)).sqrt()
    }

    pub fn apply_propulsion(&mut self, propel: bool, rotation: f32, dt: u32) {
        let prop_factor = propel as u8 as f32 * 0.00000055 * dt as f32;
        self.x += prop_factor * rotation.sin();
        self.y += -prop_factor * rotation.cos();
        self.x -= dt as f32 * 1.35f32 * self.x.powi(2) * self.x.signum();
        self.y -= dt as f32 * 1.35f32 * self.y.powi(2) * self.y.signum();
    }

    pub fn random_pos() -> Self{
        let mut rng = rand::thread_rng();
        Self{x: rng.gen_range(0.0..1.0), y : rng.gen_range(0.0..1.0)}
    }
    pub fn random_vel() -> Self{
        let mut rng = rand::thread_rng();
        Self{x: rng.gen_range(-0.0001..0.0001), y : rng.gen_range(-0.0001..0.0001)}
    }

    //TODO implement more advanced movement
}

// #[derive(Debug, Copy, Clone)]
// pub struct CoordInt {
//     pub x: i64,
//     pub y: i64,
// }

// impl CoordInt {
//     pub fn mod_add(&mut self, rhs: Self, max: Self) {
//         self.x = (self.x + rhs.x) % max.x;
//         self.y = (self.y + rhs.y) % max.y;
//     }

//     pub fn mul(&mut self, rhs: i64) {
//         self.x = self.x * rhs;
//         self.y = self.y * rhs;
//     }

//     fn distance_to(&self, point2: &Coord) -> i64 {
//         let dx = self.x - point2.x;
//         let dy = self.y - point2.y;
//         ((dy.pow(2) + dx.pow(2)) as f64).sqrt() as i64
//     }

//     fn set_polar(&mut self, mag: i64, arg: u8) {
//         self.x = u8_to_degrees(arg).sin() as i64 * mag;
//         self.y = u8_to_degrees(arg).cos() as i64 * mag;
//     }
//     //-TODO implement more advanced movement
// }

// pub fn u8_to_degrees(denom: u8) -> f64 {
//     let frac: f64 = 1.0 / denom as f64;
//     let output: f64 = std::f64::consts::PI * 2.0 * frac;
//     output
// }
