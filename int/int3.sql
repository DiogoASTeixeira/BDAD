/*
*   Order wishlist by price
*/

SELECT game.title, game.price 
    FROM (game INNER JOIN (SELECT * FROM wishlist WHERE users = :user) on game.id = wishlist.game)
    ORDER BY game.price DESC;