/**
*   Delete child comments when parent post is deleted
*/
CREATE TRIGGER IF NOT EXISTS delete_child_comment
BEFORE
DELETE ON post
BEGIN
    DELETE FROM comment WHERE post_id = OLD.id;
END