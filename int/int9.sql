/**
* Games that at least one friend has and the user doesn't
*/

/**
* jogos dos amigos
*/
SELECT * FROM
(((SELECT F1.user1 FROM friendship F1 WHERE F1.user2 = :user_id) UNION
(SELECT F2.user2 FROM friendship F2 WHERE F2.user1 = :user_id)) JOIN (ownership on ownership.users = user1 OR ownership on ownership.users = user2))


/*
* jogos em comum
*/
SELECT * FROM
(((SELECT F1.user1 FROM friendship F1 WHERE F1.user2 = :user_id) UNION
(SELECT F2.user2 FROM friendship F2 WHERE F2.user1 = :user_id)) 
JOIN (ownership on ownership.users = user1 OR ownership on ownership.users = user2) AND (SELECT game FROM ownership WHERE users = :user_id))
