select * from users;

set autocommit=0;
-- We want to delete the user with id=8 but mistakenly we entered id =9
delete from users where id = 9;
rollback;
select * from users;
-- now, we delete the user with the correct id=8
delete from users where id = 8;
select * from users;
commit;
set autocommit=1;