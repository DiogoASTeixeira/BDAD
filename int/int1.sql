/**
*   Select reviews from a specific game
*/

SELECT * FROM review WHERE game = :game ORDER BY rating DESC;