use sql_learning;

-- select * from users;
-- select count(*) from users where gender='Male';
-- select min(salary) as MIN_SALARY, max(salary) as MAX_SALARY from users;

-- select sum(salary) as total_salary from users;
-- select gender,avg(salary) as average_salary from users group by gender;
-- select gender,sum(salary) as total_salary from users group by gender;

-- select id, name, length(name) as length_of_name, gender from users;
-- select * from users;
-- select id, gender,lower(name) as lower, length(name) as name_len from users;
-- select id, gender,lower(name) as lower, concat(lower(name),'1234') as username,length(name) as name_len from users;
-- select id, gender,lower(name) as lower, concat(lower(name),'1234') as username, year(date_of_birth) as time,length(name) as name_len from users;
-- select name, datediff(CURDATE(), date_of_birth) as days from users;

SELECT id,
MOD(id, 2) AS remainder
FROM users;

SELECT name,
gender,
IF(gender = 'Female', 'Yes', 'No')
AS is_female
FROM users;