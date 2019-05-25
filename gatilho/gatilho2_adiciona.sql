/**
*   User already has that role (table consistency)
*/
CREATE TRIGGER IF NOT EXISTS new_administrator
BEFORE
UPDATE ON
privileges
BEGIN
    SELECT RAISE(ABORT, 'This user already has that role')
    WHERE EXISTS (SELECT 1
    FROM privileges
    WHERE NEW.user_id = user_id AND NEW.community_id = community_id AND is_administrator = NEW.is_administrator);
END;