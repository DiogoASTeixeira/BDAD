/**
*   User id already attributed to a administrator (table inheritance consistency)
*/
CREATE TRIGGER IF NOT EXISTS new_administrator
BEFORE
INSERT ON
privileges
BEGIN
    SELECT RAISE(ABORT, 'This user is already the administrator')
    WHERE EXISTS (SELECT 1
    FROM privileges
    WHERE NEW.user_id = user_id AND NEW.community_id = community_id AND is_administrator = true);
END


