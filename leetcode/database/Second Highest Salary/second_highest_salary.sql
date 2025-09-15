SELECT ( SELECT DISTINCT salary FROM Employee ORDER BY salary DESC OFFSET 1 LIMIT 1 ) AS SecondHighestSalary;


-- SELECT MAX(salary) AS SecondHighestSalary
-- FROM (
--     SELECT salary, DENSE_RANK() OVER (ORDER BY salary DESC) AS rnk
--     FROM Employee
-- ) ranked
-- WHERE rnk = 2;
-- - 319 ms of runtime

-- -- Write your PostgreSQL query statement below
-- SELECT 
--     (
--         SELECT DISTINCT salary
--         FROM Employee
--         ORDER BY salary DESC
--         OFFSET 1 LIMIT 1
--     ) AS SecondHighestSalary;
-- - 265 ms of runtime


-- SELECT
--   (ARRAY(
--      SELECT DISTINCT salary
--      FROM Employee
--      ORDER BY salary DESC
--      LIMIT 2
--   ))[2] AS "SecondHighestSalary";
-- - 248 ms of runtime


-- SELECT 
--   CASE WHEN COUNT(*) = 2 THEN MIN(salary) END AS "SecondHighestSalary"
-- FROM (
--   SELECT DISTINCT salary
--   FROM Employee
--   ORDER BY salary DESC
--   LIMIT 2
-- ) t;
-- - 227 ms

-- SELECT MAX(salary) AS "SecondHighestSalary"
-- FROM Employee
-- WHERE salary < (SELECT MAX(salary) FROM Employee);
-- - 210 ms

-- SELECT MAX(salary) AS "SecondHighestSalary"
-- FROM Employee
-- WHERE salary < (SELECT MAX(salary) FROM Employee);
-- - 205 ms

-- Select Coalesce((Select distinct e.salary from Employee e order by e.salary desc limit 1 offset 1), NULL) as SecondHighestSalary;
-- - 200ms


-- SELECT COALESCE((
--     SELECT salary
--     FROM Employee
--     GROUP BY salary
--     ORDER BY salary DESC
--     LIMIT 1 OFFSET 1
-- ), NULL) AS "SecondHighestSalary";
-- - 190ms