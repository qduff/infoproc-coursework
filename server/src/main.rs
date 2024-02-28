use std::ops::Add; 
use std::ops::AddAssign; 

fn u8_to_degrees(denom: u8) -> f32{
    let frac: f32 = 1.0/denom as f32;
    let output: f32 = std::f32::consts::PI * 2.0 * frac;
    output
}

#[derive(Debug, Clone, Copy)]
struct Coord<T>{
    x: T,
    y: T,
}

impl Add<Coord<i8>> for Coord<u32>{
    type Output = Self;

    fn add(self, rhs: Coord<i8>)-> Self {
        Self{
            x: self.x + match i8::try_into(rhs.x){
                Ok(u32) => u32,
                Err(e) => 0,   
            },
            y: self.y + match i8::try_into(rhs.x){
                Ok(u32) => u32,
                Err(e) => 0,   
            },
        }
    }
}

impl Add<Coord<i8>> for & Coord<u32>{ //TODO: make generic
    type Output = Coord<u32>;

    fn add(self, rhs: Coord<i8>)-> Self::Output {
        Self::Output{
            x: self.x + match i8::try_into(rhs.x){
                Ok(u32) => u32,
                Err(e) => 0,   
            },
            y: self.y + match i8::try_into(rhs.x){
                Ok(u32) => u32,
                Err(e) => 0,   
            },
        }
    }
}

impl< T, T2> AddAssign<Coord<T2>> for Coord<T> 
    where for<'a> &'a Coord<T>: Add<Coord<T2>, Output = Coord<T>>{
    

    fn add_assign(&mut self, rhs: Coord<T2>){
        *self = &*self + rhs; 
    }
}

impl<T> Coord<T>{

    fn set_polar(&mut self, mag: T, arg: u8){

    }
    //TODO implement more advanced movement
}

struct Player{
    pos: Coord<u32>,
    angle: u8, // on a 0 255 scale
    velocity: Coord<i8>, // a fraction of max speed
    angular_velocity: u8,
    lives: u8,

}

struct Astroid{
    pos: Coord<u32>,
    angle: u8, // on a 0 255 scale
    velocity: Coord<i8>,
    lives: u8 // splits off into multiple 
}

//TODO: struct Saucer{}

trait Entity {
    fn step(&mut self); // called on each entity 
}

impl Entity for Player{ 
    fn step(&mut self){
        
        // update movement
        self.angle = self.angle.wrapping_add(self.angular_velocity);
        self.update_velocity();
        self.pos = self.pos + self.velocity;
    }
}
impl Player{
    fn update_velocity(&self){
        //apply drag
        

        //apply acceleration
    }

}

impl Entity for Astroid{
    fn step(&mut self){
        self.pos += self.velocity;
    }
}

struct GameParams{ // stores game parameters such as tick rate,
    size: Coord<u32>, // height and width of game
    tick_rate: u8, // ticks per second
    speed: u32, // all movement related muls scale linearly with this 

    astroid_speed_mul: u32, // scale astroid speed

    player_accel_mul: u32, // player acceleration and deceleration parameters
    player_accel_exp: f32, 
    player_decay_mul: u32,
    player_decay_exp: f32,
    player_start_lives: u8,

    bullet_speed_mul: u32,

}

struct Game {
    players: Vec<Player>,
    astroids: Vec<Astroid>,
}

impl Game {
    //TODO init params from file!
    //TODO step
    //TODO return state
    //TODO add player
    //TOD player interface
}

fn main() {
    let mut p = Coord{
        x: 10u32,
        y: 10u32,
    };
    let mut p2 = Coord{
        x: 1i8,
        y: 1i8,
    };
    p += p2;
    println!("pos: {:?}", p);
}
