/**
*   User id already attributed to a administrator (table inheritance consistency)
*/

CREATE FUNCTION buy_game() RETURNS TRIGGER AS $BODY$
BEGIN
    IF EXISTS (SELECT * FROM (SELECT wallet FROM users WHERE NEW.user_id = users.id UNION SELECT price FROM game WHERE NEW.game_id = game.id) WHERE wallet < price) THEN
        RAISE EXCEPTION 'You don''t have enought money to buy the game' ;
    END IF;
    RETURN NEW;
END
$BODY$ LANGUAGE sqlite;


CREATE TRIGGER buy_game
BEFORE
INSERT ON ownership
FOR EACH ROW EXECUTE PROCEDURE buy_game();
