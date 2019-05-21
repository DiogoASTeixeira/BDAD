/**
*   Users who have all games published by a specific studio
*   studio_id = 1
*/

SELECT * FROM game WHERE publisher_id = 1
    INNER JOIN ownership on game.id = ownership.game_id;
