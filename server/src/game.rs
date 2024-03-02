use std::collections::VecDeque;

mod lib;
use lib::Coord as Coord;
use lib::u8_to_degrees as u8_to_degrees;

mod game_params;
use game_params::GameParams as GameParams;

#[derive(Debug, Copy, Clone)]
struct Bullet{
    pos: Coord,
    velocity: Coord,
    lifetime: u8,
}

impl Bullet{

    fn calculate_motion(&mut self, settings: &GameParams){
        self.pos.mod_add(self.velocity,settings.size)
    }
}

#[derive(Debug, Clone)]
struct Player{
    pos: Coord,
    angle: u8, // on a 0 255 scale
    velocity: Coord,
    angular_velocity: i8,
    lives: u8,
    accel: bool,

    bullets: VecDeque<Bullet>,

    max_lives: u8,
    accel_scale: i64,
    decay_mul: i64,
    decay_exp: f64,
    size_scale: i64,
}

struct Astroid{
    pos: Coord,
    angle: u8, // on a 0 255 scale
    velocity: Coord,
    lives: u8 ,// splits off into multiple 

    speed_mul: i64,
    size_mul: i64,
}

//TODO: struct Saucer{}

impl Player{ 
    fn new(config: &game_params::GameParams) -> Player{ 
        Player{
            pos: Coord{//TODO
                x: 50,
                y: 50,
            },
            angle: 0, 
            velocity: Coord{//TODO
                x:0,
                y:0,
            },
            angular_velocity: 0,
            lives: config.player_start_lives,
            accel: false,

            bullets: VecDeque::new(),

            max_lives: config.player_start_lives,
            accel_scale: config.player_accel_scale,
            decay_mul: config.player_decay_mul,
            decay_exp: config.player_decay_exp,
            size_scale: config.player_size_scale,
        }
    }

    fn calculate_motion(&mut self, settings: &GameParams){
        
        // update player
        self.angle = self.angle.wrapping_add(self.angular_velocity as u8);
        self.update_velocity();
        self.pos.mod_add(self.velocity, settings.size);

        // remove dead bullets
        while self.bullets.len() > 0 && self.bullets[0].lifetime == 0{
            self.bullets.pop_front();
        }

        // update bullet position
        for b in &mut self.bullets{
            b.calculate_motion(settings);
        }
    }
}

// helper functions
impl Player{
    fn update_velocity(&mut self){
        //apply drag
        //TODO verify my physics is correct (trying to modle nutonian)
        let mut tmp:f64 = self.velocity.x as f64;
        tmp.powf(self.decay_exp);
        tmp *= self.decay_mul as f64;
        self.velocity.x += tmp as i64;

        let mut tmp:f64 = self.velocity.y as f64;
        tmp.powf(self.decay_exp);
        tmp *= self.decay_mul as f64;
        self.velocity.y += tmp as i64;

        //apply acceleration TODO: apply direction
        if self.accel{
 
            self.velocity.x *= self.accel_scale * self.accel as i64
                            * u8_to_degrees(self.angle).cos() as i64;

            self.velocity.y *= self.accel_scale * self.accel as i64
                            * u8_to_degrees(self.angle).sin() as i64;
        }
    }

}

impl Astroid{
    fn new(config: &game_params::GameParams) -> Self{
        Astroid{
            pos: Coord{x:0,y:0},
            angle: 0,
            velocity: Coord{x:0, y:0},
            lives: 3,

            speed_mul: config.astroid_speed_mul,
            size_mul: config.astroid_size_mul,
        }
    }

    fn get_size(&self) -> i64{
        self.lives as i64 * self.size_mul
    }

    fn calculate_motion(&mut self, settings: &GameParams){
        self.pos.mod_add(self.velocity, settings.size);
    }
}

pub struct Game{
    players: Vec<Player>,
    astroids: Vec<Astroid>,
    settings: game_params::GameParams,
}

impl Game{
    // setup
    fn new() -> Game {
        Game{
            players: vec![],
            astroids: vec![],
            settings: game_params::GameParams::default_params(),
        }
    }

    fn add_player(&mut self) -> i8 { // returns player number
        self.players.push(Player::new(&self.settings));
        self.players.len() as i8 - 1
    }

    // interface

    fn step(&mut self){
        self.step_motion();
        self.collisions(); // IDK if this not taking motion into account when calculating collisions is a good idea
    }

    fn step_motion(&mut self){
        for player in &mut self.players{
            player.calculate_motion(& self.settings);
        }
        for astroid in &mut self.astroids{
            astroid.calculate_motion(& self.settings);
        }
    }

    fn collisions(&mut self){

    }

    fn set_player_inputs(&mut self, player_no: u8, booster: bool, yaw: f32){
            if (yaw.abs() > 1.0 // rotation on scale -1 to 1
                || player_no >= self.players.len() as u8) {
                return; 
            }
            self.players[player_no as usize].angular_velocity = (yaw * self.settings.player_yaw_scale as f32) as i8;
        }

    fn get_serialized(&mut self){
        //TODO
    }
}

