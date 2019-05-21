/**
*   Select games from a studio
*/

SELECT * FROM game WHERE
game.publisher_id = 1 OR game.developer_id = 1;