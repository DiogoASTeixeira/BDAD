/*
*   Selects achievements of a game from a given user
*/

SELECT achievement.name FROM ((users_achievement
    INNER JOIN achievement on users_achievement.achievement_id = achievement.id)
        INNER JOIN game on game.id = achievement.game_id) 
    WHERE users_achievement.user_id = 2 AND game.id = 1;