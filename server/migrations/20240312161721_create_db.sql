-- Add migration script here
CREATE TABLE IF NOT EXISTS players
(
    id          BIGINT UNSIGNED PRIMARY KEY NOT NULL ,
    name        TEXT   NOT NULL
);


CREATE TABLE IF NOT EXISTS lobbies
(
    id          BIGINT UNSIGNED PRIMARY KEY NOT NULL ,    
    name        TEXT    NOT NULL,
    maxPlayers  INT     NOT NULL DEFAULT FALSE,
    inGame      BOOLEAN NOT NULL DEFAULT FALSE
);
CREATE TABLE IF NOT EXISTS in_lobby
(
    lobbyId     BIGINT UNSIGNED NOT NULL,
    playerId    BIGINT UNSIGNED KEY NOT NULL,
    FOREIGN KEY (lobbyId) REFERENCES lobbies(id),
    FOREIGN KEY (playerId) REFERENCES players(id),
    PRIMARY KEY (lobbyId, playerId)
);

CREATE TABLE IF NOT EXISTS finished_games
(
    id          BIGINT UNSIGNED PRIMARY KEY NOT NULL
);
CREATE TABLE IF NOT EXISTS played_in
(
    gameId      BIGINT UNSIGNED NOT NULL,
    playerId    BIGINT UNSIGNED KEY NOT NULL,
    score       INT UNSIGNED NOT NULL,

    FOREIGN KEY (gameId) REFERENCES finished_games(id),
    FOREIGN KEY (playerId) REFERENCES players(id),
    PRIMARY KEY (gameId, playerId)
);