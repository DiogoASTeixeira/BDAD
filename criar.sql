DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS studio;
DROP TABLE IF EXISTS game;
DROP TABLE IF EXISTS achievement;
DROP TABLE IF EXISTS users_achievement;
DROP TABLE IF EXISTS review;
DROP TABLE IF EXISTS ownership;
DROP TABLE IF EXISTS wishlist;
DROP TABLE IF EXISTS follow_studio;
DROP TABLE IF EXISTS friendship;
DROP TABLE IF EXISTS communities;
DROP TABLE IF EXISTS post;
DROP TABLE IF EXISTS comment;
DROP TABLE IF EXISTS priviliges;

CREATE TABLE users (
    id INTEGER PRIMARY KEY,
    name VARCHAR NOT NULL,
    email VARCHAR NOT NULL UNIQUE,
    wallet REAL DEFAULT 0.0,
    country VARCHAR
);

CREATE TABLE studio (
    id INTEGER PRIMARY KEY,
    name VARCHAR NOT NULL UNIQUE,
    description TEXT
);

CREATE TABLE game (
    id INTEGER PRIMARY KEY,
    title VARCHAR NOT NULL,
    price REAL NOT NULL,
    rating REAL CHECK(rating >= 0 AND rating =< 100)
);