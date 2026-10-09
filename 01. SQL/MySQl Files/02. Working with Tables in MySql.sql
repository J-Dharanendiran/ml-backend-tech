-- RENAME TABLE customers TO users;
-- ALTER TABLE users ADD COLUMN is_active BOOLEAN DEFAULT TRUE;
-- SELECT * FROM users;
-- ALTER TABLE users DROP COLUMN is_active;
-- ALTER TABLE users MODIFY COLUMN email VARCHAR(150) AFTER id;
-- select * from users;
ALTER TABLE users MODIFY COLUMN date_of_birth DATETIME FIRST;
SELECT * FROM users;