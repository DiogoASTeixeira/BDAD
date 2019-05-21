/**
*   Sets a user as an administrator of a community
*/

UPDATE privileges SET is_administrator = true
    WHERE user_id = 4 AND community_id = 1;