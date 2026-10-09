-- select * from users;
-- select * from addresses;

-- INNER JOIN 
-- select users.name, users.gender, addresses.city, addresses.state, addresses.id as address_id
-- from users
-- inner join addresses on users.id = addresses.user_id

-- LEFT JOIN 
-- select users.name, users.gender, addresses.city, addresses.state, addresses.id as address_id
-- from users
-- left join addresses on users.id = addresses.user_id

-- RIGHT JOIN 
select users.name, users.gender, addresses.city, addresses.state, addresses.id as address_id
from users
left join addresses on users.id = addresses.user_id