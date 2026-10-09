-- UPDATING THE DATE 
-- update users set salary ='45000' where id=1;
-- update users set name ='Aisha Khan' where email = 'aisha@example.com';
-- update users set salary =salary + 10000 where salary <60000;
-- select * from users;
set sql_safe_updates =0;
-- DELETING THE DATA
DELETE FROM users WHERE salary < 65000;
select * from users; 

-- Delete command is more like the update command where you just replace the KEYWORD 'UPDATE /  DELETE'