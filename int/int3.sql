/*
*   Order wishlist by price
*/

SELECT game.title, game.price 
    FROM game INNER JOIN wishlist on game.id = wishlist.game_id 
    WHERE user_id = 6
    ORDER BY game.price DESC;