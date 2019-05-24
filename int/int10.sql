/**
*   Users who have all games published by a specific studio
*   studio_id = 1
*   user_id = 5
*/

SELECT DISTINCT id
FROM
    (((        
    SELECT F1.user1
        FROM friendship F1
        WHERE F1.user2 = 5
    UNION
        SELECT F2.user2
        FROM friendship F2
        WHERE F2.user1 = 5)
    INNER JOIN ownership on (ownership.user_id = user1))
    INNER JOIN (
    SELECT GAME.id
        FROM game GAME
        WHERE publisher_id = 1
    EXCEPT
        SELECT game_id
        FROM ownership
        WHERE user_id = 5) on ownership.game_id = id);