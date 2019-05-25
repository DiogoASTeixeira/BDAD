/**
*   Selects comments from a post with rating > 33%
*/

SELECT *
FROM comment
WHERE post_id = 1 AND rating > 33
ORDER BY rating ASC;