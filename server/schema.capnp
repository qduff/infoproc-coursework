@0xcad98f9609310595;

struct Tx {
    angle @0 :Float32;
    propulsion @1 :Bool;
    shoot @2 :Bool;
}

struct Rx {
    players @0 :List(Player);
    asteroids @1 :List(Asteroid);
}

struct Player {
    x @0 :Float32;
    y @1 :Float32;
    xVel @2 :Float32;
    yVel @3 :Float32;
    rotation @4 :Float32;
    type @5 :PlayerType;
    lives @6 :UInt8 = 0;
    propelling @7 :Bool;

    enum PlayerType {
        player @0;
        myPlayer @1;
    }
}

struct Asteroid {
    x @0 :Float32;
    y @1 :Float32;
    xVel @2 :Float32;
    yVel @3 :Float32;
    rotation @4 :Float32;
    size @5 :UInt8;
}
