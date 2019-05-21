DROP TABLE IF EXISTS privileges;
DROP TABLE IF EXISTS comment;
DROP TABLE IF EXISTS post;
DROP TABLE IF EXISTS communities;
DROP TABLE IF EXISTS friendship;
DROP TABLE IF EXISTS follow_studio;
DROP TABLE IF EXISTS user_achievement;
DROP TABLE IF EXISTS achievement;
DROP TABLE IF EXISTS review;
DROP TABLE IF EXISTS wishlist;
DROP TABLE IF EXISTS ownership;
DROP TABLE IF EXISTS game;
DROP TABLE IF EXISTS studio;
DROP TABLE IF EXISTS users;

CREATE TABLE users (
    id INTEGER PRIMARY KEY,
    name VARCHAR(64) NOT NULL,
    email VARCHAR(64) NOT NULL UNIQUE,
    wallet REAL DEFAULT 0.0,
    country VARCHAR(64),
	CHECK (wallet >= 0.0)
);

CREATE TABLE studio (
    id INTEGER PRIMARY KEY,
    name VARCHAR(64) NOT NULL UNIQUE,
    description TEXT
);

CREATE TABLE game (
    id INTEGER PRIMARY KEY,
    title VARCHAR(128) NOT NULL,
    price REAL NOT NULL,
    rating REAL CHECK(rating >= 0 AND rating <= 100),
    developer_id INTEGER REFERENCES studio,
	publisher_id INTEGER REFERENCES studio
);

CREATE TABLE ownership (
	user_id INTEGER REFERENCES users,
    game_id INTEGER REFERENCES game,
    CONSTRAINT pk_own PRIMARY KEY (user_id, game_id)
);

CREATE TABLE wishlist (
	user_id INTEGER  REFERENCES users,
    game_id INTEGER  REFERENCES game,
    CONSTRAINT pk_wish PRIMARY KEY (user_id, game_id)
);

CREATE TABLE review (
	user_id INTEGER REFERENCES users,
    game_id INTEGER REFERENCES game,
    body TEXT,
    rating BOOLEAN NOT NULL,
    CONSTRAINT pk_review PRIMARY KEY (user_id, game_id)
);

CREATE TABLE achievement (
    id INTEGER PRIMARY KEY,
    name VARCHAR(64) NOT NULL,
    description TEXT NOT NULL,
    game_id INTEGER REFERENCES game
);

CREATE TABLE users_achievement (
	user_id INTEGER REFERENCES users,
    achievement_id INTEGER REFERENCES achievement,
    CONSTRAINT pk_achiev PRIMARY KEY (user_id, achievement_id)
);

CREATE TABLE follow_studio (
	user_id INTEGER  REFERENCES users,
    studio_id INTEGER  REFERENCES studio,
    CONSTRAINT pk_follow PRIMARY KEY (user_id, studio_id)
);

CREATE TABLE friendship(
	user1 INTEGER  REFERENCES users,
    user2 INTEGER  REFERENCES users,
    CHECK (user1 < user2),
    CONSTRAINT pk_friend PRIMARY KEY (user1, user2)
);

CREATE TABLE communities (
	id INTEGER PRIMARY KEY,
    name VARCHAR(32) NOT NULL
);

CREATE TABLE post (
	id INTEGER PRIMARY KEY,
    title VARCHAR(32) NOT NULL,
    body TEXT NOT NULL,
    rating REAL DEFAULT 50,
    author_id INTEGER  REFERENCES users,
    community_id INTEGER  REFERENCES communities
);

CREATE TABLE comment (
	id INTEGER PRIMARY KEY,
    body TEXT NOT NULL,
    rating REAL DEFAULT 50,
    author_id INTEGER  REFERENCES users,
    post_id INTEGER  REFERENCES post
);

CREATE TABLE privileges (
    user_id INTEGER  REFERENCES users,
    community_id INTEGER  REFERENCES communities,
    is_administrator BOOLEAN DEFAULT false,
    CONSTRAINT pk_privilege PRIMARY KEY (user_id, community_id)
);

