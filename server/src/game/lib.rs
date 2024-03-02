#[derive(Debug, Copy, Clone)]
pub struct Coord{
    pub x: i64,
    pub y: i64,
}


impl Coord{

    pub fn mod_add(&mut self,rhs: Self,max: Self){
        self.x = (self.x + rhs.x) % max.x;
        self.y = (self.y + rhs.y) % max.y;
    }

    pub fn mul(&mut self,rhs: i64){
        self.x = self.x * rhs;
        self.y = self.y * rhs;
    }

    fn distance_to(& self, point2: &Coord) -> i64{
        let dx = self.x - point2.x;
        let dy = self.y - point2. y;
        ((dy.pow(2) + dx.pow(2)) as f64).sqrt() as i64
    }

    fn set_polar(&mut self, mag: i64, arg: u8){
        self.x = u8_to_degrees(arg).sin() as i64 * mag;
        self.y = u8_to_degrees(arg).cos() as i64 * mag;
    }
    //TODO implement more advanced movement
}

pub fn u8_to_degrees(denom: u8) -> f64{
    let frac: f64 = 1.0/denom as f64;
    let output: f64 = std::f64::consts::PI * 2.0 * frac;
    output
}
