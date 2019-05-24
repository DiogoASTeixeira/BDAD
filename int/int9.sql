/**
* Games that friends have (user_id = 5)
*/

SELECT game.title, users.name
FROM
    ((((
    SELECT F1.user1
        FROM friendship F1
        WHERE F1.user2 = 5
    UNION
        SELECT F2.user2
        FROM friendship F2
        WHERE F2.user1 = 5)
    INNER JOIN ownership on (ownership.user_id = user1))
    INNER JOIN users on (user1 = users.id))
    INNER JOIN game on (game_id = game.id))
ORDER BY game.id DESC;
