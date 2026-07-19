-- Rank All Employees by Salary

SELECT
    emp_name,
    salary,
    RANK() OVER(ORDER BY salary DESC) AS emp_rank
FROM employee;


-- Department Wise Rank

SELECT
    emp_name,
    dept_id,
    salary,
    RANK() OVER(PARTITION BY dept_id ORDER BY salary DESC) AS emp_rank
FROM employee;


-- Highest Paid Employee from Each Department

WITH EmployeeRank AS
(
    SELECT
        emp_name,
        dept_id,
        salary,
        RANK() OVER(PARTITION BY dept_id ORDER BY salary DESC) AS emp_rank
    FROM employee
)

SELECT
    emp_name,
    dept_id,
    salary
FROM EmployeeRank
WHERE emp_rank = 1;


-- Top 3 Highest Paid Employees

WITH EmployeeRank AS
(
    SELECT
        emp_name,
        salary,
        RANK() OVER(ORDER BY salary DESC) AS emp_rank
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
        RANK() OVER(ORDER BY salary DESC) AS emp_rank
    FROM employee
)

SELECT
    emp_name,
    salary
FROM EmployeeRank
WHERE emp_rank = 2;


-- Lowest Salary Rank

SELECT
    emp_name,
    salary,
    RANK() OVER(ORDER BY salary ASC) AS salary_rank
FROM employee;


-- Rank by Age

SELECT
    emp_name,
    age,
    RANK() OVER(ORDER BY age DESC) AS age_rank
FROM employee;


-- Rank by Joining Date

SELECT
    emp_name,
    joining_date,
    RANK() OVER(ORDER BY joining_date) AS joining_rank
FROM employee;
