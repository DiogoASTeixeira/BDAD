/**
*   Users who have all games published by a specific studio
*   studio_id = 1
*/

/**
*   R = Games people have  SELECT * FROM ownership where
    S =  Games from publisher
*/

SELECT id FROM game WHERE publisher_id = 1 EXCEPT
SELECT game_id FROM ownership WHERE user_id = 5;


/*

(SELECT user_id, game_id FROM game INNER JOIN ownership on game.id = ownership.game_id
    WHERE publisher_id = 1) CROSS JOIN ;
    

*/