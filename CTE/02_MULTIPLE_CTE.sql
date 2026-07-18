-- Employees earning above average salary
WITH AvgSalary AS
(
    SELECT AVG(salary) AS avg_salary
    FROM employee
),
HighestSalary AS
(
    SELECT MAX(salary) AS max_salary
    FROM employee
)

SELECT
    (SELECT avg_salary FROM AvgSalary) AS Average_Salary,
    (SELECT max_salary FROM HighestSalary) AS Highest_Salary;


WITH AvgSalary AS
(
    SELECT AVG(salary) AS avg_salary
    FROM employee
)

SELECT
    emp_name,
    salary
FROM employee
WHERE salary >
(
    SELECT avg_salary
    FROM AvgSalary
);


WITH AvgSalary AS
(
    SELECT AVG(salary) AS avg_salary
    FROM employee
)

SELECT
    emp_name,
    salary
FROM employee
WHERE salary <
(
    SELECT avg_salary
    FROM AvgSalary
);

