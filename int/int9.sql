/**
* Games that at least one friend has and the user doesn't
*/
SELECT ... FROM
((SELECT F1.user1 FROM friendship F1 WHERE F1.user2 = :user_id) UNION
(SELECT F2.user2 FROM friendship F2 WHERE F2.user1 = :user_id))

JOIN ownership on ownership.users = achievement.id)