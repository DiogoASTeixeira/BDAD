/**
*   Check if 2 users are already friends
*/

CREATE TRIGGER inviteFriend
BEFORE
INSERT ON friendship
BEGIN
	SELECT RAISE(ABORT ,'Duplicate Friendship Tuple')
	WHERE EXISTS
		(SELECT 1
			FROM "friendship"
			WHERE 	("friendship".user1 = NEW.user1 AND "friendship".user2 = NEW.user2) OR
					("friendship".user1 = NEW.user2 AND "friendship".user2 = NEW.user1));
END