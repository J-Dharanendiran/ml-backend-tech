SELECT gender, AVG(salary) AS 'Average salary', count(*) AS count
FROM users
GROUP BY gender;

SELECT 
    gender,
    AVG(salary) AS 'Average Salary'
FROM users
GROUP BY gender
HAVING AVG(salary) > 61000;

SELECT gender as "Gender", AVG(salary) AS 'Average Salary', COUNT(*) AS 'Count'
FROM users WHERE id<5000 GROUP BY gender
HAVING AVG(salary) > 63000;

SELECT 
    referred_by_id,
    COUNT(*) AS total_referred
FROM users
WHERE referred_by_id IS NOT NULL
GROUP BY referred_by_id
HAVING COUNT(*) > 1;

SELECT 
    gender,
    AVG(salary) AS avg_salary,
    COUNT(*) AS user_count
FROM users
GROUP BY gender WITH ROLLUP;

-- ONE COMPLETE EXAMPLE
SELECT
    gender,
    AVG(salary) AS avg_salary,
    COUNT(*) AS user_count
FROM users
WHERE referred_by_id IS NOT NULL
GROUP BY gender with rollup
HAVING AVG(salary) > 61000;