-- Dense Rank All Employees by Salary

SELECT
    emp_name,
    salary,
    DENSE_RANK() OVER(ORDER BY salary DESC) AS emp_rank
FROM employee;


-- Department Wise Dense Rank

SELECT
    emp_name,
    dept_id,
    salary,
    DENSE_RANK() OVER(PARTITION BY dept_id ORDER BY salary DESC) AS emp_rank
FROM employee;


-- Highest Paid Employee from Each Department

WITH EmployeeRank AS
(
    SELECT
        emp_name,
        dept_id,
        salary,
        DENSE_RANK() OVER(PARTITION BY dept_id ORDER BY salary DESC) AS emp_rank
    FROM employee
)

SELECT
    emp_name,
    dept_id,
    salary
FROM EmployeeRank
WHERE emp_rank = 1;


-- Top 3 Highest Salary Groups

WITH EmployeeRank AS
(
    SELECT
        emp_name,
        salary,
        DENSE_RANK() OVER(ORDER BY salary DESC) AS emp_rank
    FROM employee
)

SELECT
    emp_name,
    salary
FROM EmployeeRank
WHERE emp_rank <= 3;


-- Second Highest Salary

WITH EmployeeRank AS
(
    SELECT
        emp_name,
        salary,
        DENSE_RANK() OVER(ORDER BY salary DESC) AS emp_rank
    FROM employee
)

SELECT
    emp_name,
    salary
FROM EmployeeRank
WHERE emp_rank = 2;


-- Dense Rank by Age

SELECT
    emp_name,
    age,
    DENSE_RANK() OVER(ORDER BY age DESC) AS age_rank
FROM employee;


-- Dense Rank by Joining Date

SELECT
    emp_name,
    joining_date,
    DENSE_RANK() OVER(ORDER BY joining_date) AS joining_rank
FROM employee;


-- Department Wise Salary Ranking

SELECT
    emp_name,
    dept_id,
    salary,
    DENSE_RANK() OVER(PARTITION BY dept_id ORDER BY salary DESC) AS salary_rank
FROM employee;
