-- Average Salary of All Employees

SELECT
    emp_name,
    salary,
    AVG(salary) OVER() AS average_salary
FROM employee;


-- Total Salary of All Employees

SELECT
    emp_name,
    salary,
    SUM(salary) OVER() AS total_salary
FROM employee;


-- Highest Salary

SELECT
    emp_name,
    salary,
    MAX(salary) OVER() AS highest_salary
FROM employee;


-- Lowest Salary

SELECT
    emp_name,
    salary,
    MIN(salary) OVER() AS lowest_salary
FROM employee;


-- Total Employees

SELECT
    emp_name,
    COUNT(*) OVER() AS total_employees
FROM employee;


-- Department Wise Average Salary

SELECT
    emp_name,
    dept_id,
    salary,
    AVG(salary) OVER(PARTITION BY dept_id) AS department_average
FROM employee;


-- Department Wise Total Salary

SELECT
    emp_name,
    dept_id,
    salary,
    SUM(salary) OVER(PARTITION BY dept_id) AS department_total
FROM employee;


-- Department Wise Employee Count

SELECT
    emp_name,
    dept_id,
    COUNT(*) OVER(PARTITION BY dept_id) AS department_employee_count
FROM employee;
