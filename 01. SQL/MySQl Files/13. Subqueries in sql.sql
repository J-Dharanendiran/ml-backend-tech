select avg(salary) from users;

select * from users where salary > (select avg(salary) from users);
select * from users where salary < (select avg(salary) from users);

SELECT COUNT(*)
FROM users
WHERE salary < (SELECT AVG(salary) FROM users);

select id, name, referred_by_id
from users 
where referred_by_id (
select id from users where salary < (select avg(salary) from users)
);