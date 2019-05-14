/*
*   Selects achievements of a game from a given user
*/

SELECT achievement.name FROM ((users_achievement
    INNER JOIN achievement on users_achievement.achievement = achievement.id)
        INNER JOIN game on game.id = achievement.game) 
    WHERE users_achievement.users = :users AND game.id = :game_id;