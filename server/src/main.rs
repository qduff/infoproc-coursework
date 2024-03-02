mod game;

//TODO: graphical interface, controll interface
fn main() { // example main to eat up unused warnings
    let mut game = game::Game::new();

    game.add_player();
    game.set_player_inputs(0, true, 0.0,true);
    game.step();
    game.get_serialized();

}
