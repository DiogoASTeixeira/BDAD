/**
*   Delete child comments when parent post is deleted
*/

DROP TRIGGER IF EXISTS delete_child_comment;

CREATE TRIGGER delete_child_comment
BEFORE
DELETE ON post
BEGIN
    DELETE FROM comment WHERE post_id = OLD.id;
END