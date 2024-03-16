@0xcad98f9609310595;

struct Tx {
    angle @0 :Float32;
    propulsion @1 :Bool;
    shoot @2 :Bool;
    commands @3 :List(Text);
}

struct Rx {
    players @0 :List(Player);
    asteroids @1 :List(Asteroid);
    running @2 : Bool;
    messages @3 :List(Text);
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
    invincabilityTimer @8 :UInt32;
    bullets @9 :List(Bullet);
    score @10 :UInt32 = 0;

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
    size @4 :Float32;
    seed @5 :UInt8;
}

struct Bullet {
    x @0 :Float32;
    y @1 :Float32;
    xVel @2: Float32;
    yVel @3: Float32;
    lifetime @4: UInt32;
}
