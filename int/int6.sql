/**
*   Sets a user as an administrator of a community
*/

UPDATE privileges SET is_administrator = true WHERE users = :user_id AND community = :community_id;