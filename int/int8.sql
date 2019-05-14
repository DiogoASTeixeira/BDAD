/**
*   Selects comments from a post with rating > 33%
*/

SELECT * FROM comment WHERE post = :post_id AND rating > 33;