/**
*   Check if 2 users are already friends
*/

DROP TRIGGER IF EXISTS inviteFriend ON friendship;


DROP FUNCTION IF EXISTS checkDuplicateFriend();


CREATE OR REPLACE FUNCTION checkDuplicateFriend() RETURNS TRIGGER AS $BODY$
BEGIN
	IF EXISTS
		(SELECT *
			FROM "friendship"
			WHERE 	("friendship".user1 = NEW.user1 AND "friendship".user2 = NEW.user2) OR
					("friendship".user1 = NEW.user2 AND "friendship".user2 = NEW.user1))
		THEN RAISE EXCEPTION 'Duplicate Friendship Tuple';
	END IF;
	RETURN NEW;
END
$BODY$ LANGUAGE sqlite;


CREATE TRIGGER inviteFriend
BEFORE
INSERT ON "friendship"
FOR EACH ROW EXECUTE PROCEDURE checkDuplicateFriend();