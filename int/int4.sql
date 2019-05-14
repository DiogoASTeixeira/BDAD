/**
*   Select games from a studio
*/

SELECT * FROM game WHERE game.publisher = :studio OR game.developer = :studioL;