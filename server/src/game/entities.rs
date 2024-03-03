use crate::game::lib::Coord;

// #[derive(Clone)]
pub struct Bullet {
    position: Coord,
    velocity: Coord,

    lifetime: u8,
}

impl Default for Bullet {
    fn default() -> Self {
        Bullet {
            lifetime: 5,
            ..Default::default()
        }
    }
}

impl Bullet {
    fn calculate_motion(&mut self) {
        self.position.add_modulo(&self.velocity)
    }
}

#[derive(Default)]
pub struct Player {
    pub position: Coord,
    pub velocity: Coord,
    pub rotation: f32,

    pub lives: u8,

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
            position: Coord { x: 0.5, y: 0.5 },
            ..Default::default()
        }
    }

    pub fn calculate_motion(&mut self) {
        // calculate motion
        self.rotation += self.in_angle / 15f32;
        self.velocity.apply_propulsion(self.in_propulsion, self.rotation);
        self.position.add_modulo(&self.velocity);

        //TODO emit bullets
    }
}

pub struct Asteroid {
    position: Coord,
    velocity: Coord,
    angle: f32,
    size: u8, // 4 -> 2 -> 1  -  i think?

              // speed_mul: i64,
              // size_mul: i64,
}

impl Default for Asteroid {
    fn default() -> Self {
        Asteroid {
            size: 4,
            ..Default::default()
        }
    }
}

impl Asteroid {
    fn handle_shot(&mut self) {
        // break into two seperate asteroids, where size is halved
    }
    // fn calculate_motion(&mut self, settings: &GameParams) {
    //     self.pos.mod_add(self.velocity, settings.size);
    // }
}
