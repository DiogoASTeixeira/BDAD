SELECT * FROM privileges;

UPDATE privileges SET is_administrator = 1 WHERE user_id = 1 and community_id = 1;

SELECT * FROM privileges;

UPDATE privileges SET is_administrator = 1 WHERE user_id = 1 and community_id = 1;