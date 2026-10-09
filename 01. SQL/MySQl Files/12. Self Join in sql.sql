alter table users
add column referred_by_id int;

update users set referred_by_id = 1 where id in (2,3,13,14,15,16,18,20); -- user 1 referred users 2 & 3
update users set referred_by_id = 2 where id =4; -- user 2 referred user 4

select * from users;

select 
a.id,
a.name as user_name,
b.name as referred_by_name
from users as a
inner join users as b on a.referred_by_id = b.id;