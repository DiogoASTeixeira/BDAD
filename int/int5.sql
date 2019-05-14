/**
*   Update price tag on game
*/

UPDATE game SET price = :new_price WHERE id = :game_id;