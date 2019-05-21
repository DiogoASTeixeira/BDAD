/**
*   User id already attributed to a administrator (table inheritance consistency)
*/

CREATE FUNCTION new_administrator() RETURNS TRIGGER AS $BODY$
BEGIN
    IF EXISTS (SELECT * FROM privileges WHERE NEW.user_id = users AND NEW.community_id = community AND is_administrator = true) THEN
        RAISE EXCEPTION 'This user id is already the administrator';
    END IF;
    RETURN NEW;
END
$BODY$ LANGUAGE sqlite;


CREATE TRIGGER new_administrator
BEFORE
INSERT ON privileges
FOR EACH ROW EXECUTE PROCEDURE new_administrator();



