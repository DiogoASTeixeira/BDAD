/**
*   Remove from wishlist after purchase
*/

CREATE TRIGGER IF NOT EXISTS remove_from_wishlist
AFTER INSERT ON ownership
BEGIN
	DELETE FROM wishlist 
	WHERE game_id = NEW.game_id
	AND user_id = NEW.user_id;
END;
