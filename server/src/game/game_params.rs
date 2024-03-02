use super::lib::Coord as Coord;

// adjust these default param values:
const SIZE: Coord = Coord{ // for higher precision, set these large and downscale at the renderer
    x: 500,
    y: 300,
};

const TICK_RATE: i64= 20; // 20 default
const SPEED: i64 = 5;
const SIZE_SCALE: i64 = 1; // independant on SIZE above

const ASTROID_SPEED_MUL: i64 = 1; 
const ASTROID_SIZE_MUL: i64 = 1;

const PLAYER_ACCEL_SCALE: i64 = 1; // dont judge my naming scheme
const PLAYER_YAW_SCALE: i64 = 1;
const PLAYER_DECAY_MUL: i64 = -1; // negative because deceleration
const PLAYER_DECAY_EXP: f64 = 2.; // think inverse square law
const PLAYER_SIZE_SCALE: i64 = 10;

const BULLET_SPEED_SCALE: i64 = 5;
const BULLET_LIFETIME_SCALE: f64 = 1.0;

const PLAYER_LIVES: u8 = 3;
// derived:
const ADJUSTED_SPEED: i64 = TICK_RATE / SPEED;
const EXP_SCALE: f64 = 1.0 / TICK_RATE as f64;

pub struct GameParams{ // stores game parameters such as tick rate, // TODO parameterise
    pub size: Coord,
    pub tick_rate: i64, 
    pub speed: i64,

    pub astroid_speed_mul: i64,
    pub astroid_size_mul: i64,

    pub player_accel_scale: i64,
    pub player_yaw_scale: i64,
    pub player_decay_mul: i64, // decelaration
    pub player_decay_exp: f64,
    pub player_size_scale: i64,

    pub bullet_speed_scale: i64,
    pub bullet_lifetime_scale: u8,

    pub player_start_lives: u8,
}

impl GameParams{
    pub fn default_params() -> GameParams{
        GameParams{
            size: SIZE,
        
            tick_rate: TICK_RATE,
            speed: SPEED,
        
            astroid_speed_mul: ADJUSTED_SPEED * ASTROID_SPEED_MUL,
            astroid_size_mul: SIZE_SCALE * ASTROID_SIZE_MUL,

            player_accel_scale: ADJUSTED_SPEED * PLAYER_ACCEL_SCALE,
            player_yaw_scale: ADJUSTED_SPEED * PLAYER_YAW_SCALE,
            player_decay_mul: ADJUSTED_SPEED * PLAYER_DECAY_MUL,
            player_decay_exp: PLAYER_DECAY_EXP * EXP_SCALE,
            player_size_scale: SIZE_SCALE * PLAYER_SIZE_SCALE,
            
            bullet_speed_scale: ADJUSTED_SPEED * BULLET_SPEED_SCALE,
            bullet_lifetime_scale: (ADJUSTED_SPEED / TICK_RATE) as u8,

            player_start_lives: PLAYER_LIVES,

        }
    }
}
