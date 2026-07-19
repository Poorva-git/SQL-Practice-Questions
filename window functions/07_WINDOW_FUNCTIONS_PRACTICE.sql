-- 1. Highest Paid Employee from Each Department

WITH RankedEmployees AS
(
    SELECT
        emp_name,
        dept_id,
        salary,
        ROW_NUMBER() OVER(PARTITION BY dept_id ORDER BY salary DESC) AS rn
    FROM employee
)
SELECT *
FROM RankedEmployees
WHERE rn = 1;


-- 2. Top 3 Highest Paid Employees from Each Department

WITH RankedEmployees AS
(
    SELECT
        emp_name,
        dept_id,
        salary,
        ROW_NUMBER() OVER(PARTITION BY dept_id ORDER BY salary DESC) AS rn
    FROM employee
)
SELECT *
FROM RankedEmployees
WHERE rn <= 3;


-- 3. Second Highest Salary

WITH SalaryRank AS
(
    SELECT
        emp_name,
        salary,
        DENSE_RANK() OVER(ORDER BY salary DESC) AS rnk
    FROM employee
)
SELECT *
FROM SalaryRank
WHERE rnk = 2;


-- 4. Third Highest Salary

WITH SalaryRank AS
(
    SELECT
        emp_name,
        salary,
        DENSE_RANK() OVER(ORDER BY salary DESC) AS rnk
    FROM employee
)
SELECT *
FROM SalaryRank
WHERE rnk = 3;


-- 5. Lowest Paid Employee from Each Department

WITH SalaryRank AS
(
    SELECT
        emp_name,
        dept_id,
        salary,
        ROW_NUMBER() OVER(PARTITION BY dept_id ORDER BY salary) AS rn
    FROM employee
)
SELECT *
FROM SalaryRank
WHERE rn = 1;


-- 6. Salary Difference with Previous Employee

SELECT
    emp_name,
    salary,
    salary - LAG(salary) OVER(ORDER BY salary) AS difference
FROM employee;


-- 7. Salary Difference with Next Employee

SELECT
    emp_name,
    salary,
    LEAD(salary) OVER(ORDER BY salary) - salary AS difference
FROM employee;


-- 8. Department Wise Average Salary

SELECT
    emp_name,
    dept_id,
    salary,
    AVG(salary) OVER(PARTITION BY dept_id) AS dept_avg
FROM employee;


-- 9. Department Wise Highest Salary

SELECT
    emp_name,
    dept_id,
    salary,
    MAX(salary) OVER(PARTITION BY dept_id) AS highest_salary
FROM employee;


-- 10. Department Wise Total Salary

SELECT
    emp_name,
    dept_id,
    salary,
    SUM(salary) OVER(PARTITION BY dept_id) AS total_salary
FROM employee;


-- 11. Employee Count Department Wise

SELECT
    emp_name,
    dept_id,
    COUNT(*) OVER(PARTITION BY dept_id) AS total_employees
FROM employee;


-- 12. Running Total Salary

SELECT
    emp_name,
    salary,
    SUM(salary) OVER(ORDER BY salary) AS running_total
FROM employee;


-- 13. Running Average Salary

SELECT
    emp_name,
    salary,
    AVG(salary) OVER(ORDER BY salary) AS running_average
FROM employee;


-- 14. Highest Salary in Company

SELECT
    emp_name,
    salary,
    FIRST_VALUE(salary) OVER(ORDER BY salary DESC) AS highest_salary
FROM employee;


-- 15. Lowest Salary in Company

SELECT
    emp_name,
    salary,
    LAST_VALUE(salary) OVER
    (
        ORDER BY salary DESC
        ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
    ) AS lowest_salary
FROM employee;


-- 16. Divide Employees into 4 Salary Groups

SELECT
    emp_name,
    salary,
    NTILE(4) OVER(ORDER BY salary DESC) AS salary_group
FROM employee;


-- 17. Previous Employee Salary

SELECT
    emp_name,
    salary,
    LAG(salary) OVER(ORDER BY salary) AS previous_salary
FROM employee;


-- 18. Next Employee Salary

SELECT
    emp_name,
    salary,
    LEAD(salary) OVER(ORDER BY salary) AS next_salary
FROM employee;


-- 19. Salary Rank in Company

SELECT
    emp_name,
    salary,
    RANK() OVER(ORDER BY salary DESC) AS salary_rank
FROM employee;


-- 20. Dense Salary Rank

SELECT
    emp_name,
    salary,
    DENSE_RANK() OVER(ORDER BY salary DESC) AS salary_rank
FROM employee;
