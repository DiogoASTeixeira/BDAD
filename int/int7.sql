/**
*   Delete review of a game from a user
*/

DELETE FROM review WHERE users = :user_id AND game = :game_id;