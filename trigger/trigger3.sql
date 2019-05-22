/**
*   User id already attributed to a administrator (table inheritance consistency)
*/

DROP TRIGGER IF EXISTS not_enough_money;

CREATE TRIGGER not_enough_money
BEFORE
UPDATE ON users
BEGIN
SELECT RAISE(ABORT, 'Not enought funds.')
    WHERE EXISTS (SELECT 1 FROM privileges WHERE NEW.user_id = user_id AND NEW.community_id = community_id AND is_administrator = true);
END