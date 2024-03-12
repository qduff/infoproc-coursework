-- Add migration script here

CREATE TABLE IF NOT EXISTS players
(
    id          INTEGER PRIMARY KEY NOT NULL,
    name        TEXT   NOT NULL,
    secret      TEXT   NOT NULL -- should really be hashed
);


CREATE TABLE IF NOT EXISTS lobbies
(
    id          INTEGER PRIMARY KEY NOT NULL,
    name        TEXT    NOT NULL,
    maxPlayers  INT     NOT NULL DEFAULT 4,
    inGame      BOOLEAN NOT NULL DEFAULT FALSE
);
CREATE TABLE IF NOT EXISTS in_lobby
(
    lobbyId     INTEGER NOT NULL,
    playerId    INTEGER KEY NOT NULL,
    admin       BOOLEAN NOT NULL DEFAULT FALSE,
    FOREIGN KEY (lobbyId) REFERENCES lobbies(id),
    FOREIGN KEY (playerId) REFERENCES players(id),
    PRIMARY KEY (playerId) -- one player cant be in multiple lobbies
);

CREATE TABLE IF NOT EXISTS finished_games
(
    id          INTEGER PRIMARY KEY NOT NULL
);
CREATE TABLE IF NOT EXISTS played_in
(
    gameId      INTEGER NOT NULL,
    playerId    INTEGER KEY NOT NULL,
    score       INT UNSIGNED NOT NULL,

    FOREIGN KEY (gameId) REFERENCES finished_games(id),
    FOREIGN KEY (playerId) REFERENCES players(id),
    PRIMARY KEY (gameId, playerId)
);