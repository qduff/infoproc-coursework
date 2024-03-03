@0xcad98f9609310595;

struct Tx {
    angle @0 :Float32;
    propulsion @1 :Bool;
    shoot @2 :Bool;
}

struct Rx {
    entities @0 :List(Entity);
}

struct Entity {
    x @0 :Float32;
    y @1 :Float32;
    xVel @2 :Float32;
    yVel @3 :Float32;
    rotation @4 :Float32;
    type @5 :EntityType;
    lives @6 :UInt8 = 0;

    enum EntityType {
        player @0;
        myPlayer @1;
        asteroid @2;
        bullet @3;
    }
}
