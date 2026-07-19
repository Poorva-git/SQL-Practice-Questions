-- Row Number for All Employees

SELECT
    emp_name,
    salary,
    ROW_NUMBER() OVER(ORDER BY salary DESC) AS row_num
FROM employee;


-- Row Number Department Wise

SELECT
    emp_name,
    dept_id,
    salary,
    ROW_NUMBER() OVER(PARTITION BY dept_id ORDER BY salary DESC) AS row_num
FROM employee;


-- Highest Paid Employee from Each Department

WITH RankedEmployees AS
(
    SELECT
        emp_name,
        dept_id,
        salary,
        ROW_NUMBER() OVER(PARTITION BY dept_id ORDER BY salary DESC) AS row_num
    FROM employee
)

SELECT
    emp_name,
    dept_id,
    salary
FROM RankedEmployees
WHERE row_num = 1;


-- Lowest Paid Employee from Each Department

WITH RankedEmployees AS
(
    SELECT
        emp_name,
        dept_id,
        salary,
        ROW_NUMBER() OVER(PARTITION BY dept_id ORDER BY salary ASC) AS row_num
    FROM employee
)

SELECT
    emp_name,
    dept_id,
    salary
FROM RankedEmployees
WHERE row_num = 1;


-- Top 2 Highest Paid Employees from Each Department

WITH RankedEmployees AS
(
    SELECT
        emp_name,
        dept_id,
        salary,
        ROW_NUMBER() OVER(PARTITION BY dept_id ORDER BY salary DESC) AS row_num
    FROM employee
)

SELECT
    emp_name,
    dept_id,
    salary
FROM RankedEmployees
WHERE row_num <= 2;


-- Second Highest Paid Employee from Each Department

WITH RankedEmployees AS
(
    SELECT
        emp_name,
        dept_id,
        salary,
        ROW_NUMBER() OVER(PARTITION BY dept_id ORDER BY salary DESC) AS row_num
    FROM employee
)

SELECT
    emp_name,
    dept_id,
    salary
FROM RankedEmployees
WHERE row_num = 2;


-- Employee Number Based on Joining Date

SELECT
    emp_name,
    joining_date,
    ROW_NUMBER() OVER(ORDER BY joining_date) AS joining_order
FROM employee;


-- Employee Number Based on Age

SELECT
    emp_name,
    age,
    ROW_NUMBER() OVER(ORDER BY age DESC) AS age_rank
FROM employee;
