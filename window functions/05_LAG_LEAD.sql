-- Previous Employee Salary

SELECT
    emp_name,
    salary,
    LAG(salary) OVER(ORDER BY salary) AS previous_salary
FROM employee;


-- Next Employee Salary

SELECT
    emp_name,
    salary,
    LEAD(salary) OVER(ORDER BY salary) AS next_salary
FROM employee;


-- Salary Difference with Previous Employee

SELECT
    emp_name,
    salary,
    salary - LAG(salary) OVER(ORDER BY salary) AS salary_difference
FROM employee;


-- Salary Difference with Next Employee

SELECT
    emp_name,
    salary,
    LEAD(salary) OVER(ORDER BY salary) - salary AS next_salary_difference
FROM employee;


-- Previous Employee in Same Department

SELECT
    emp_name,
    dept_id,
    salary,
    LAG(salary) OVER(PARTITION BY dept_id ORDER BY salary) AS previous_salary
FROM employee;


-- Next Employee in Same Department

SELECT
    emp_name,
    dept_id,
    salary,
    LEAD(salary) OVER(PARTITION BY dept_id ORDER BY salary) AS next_salary
FROM employee;


-- Previous Joining Date

SELECT
    emp_name,
    joining_date,
    LAG(joining_date) OVER(ORDER BY joining_date) AS previous_joining_date
FROM employee;


-- Next Joining Date

SELECT
    emp_name,
    joining_date,
    LEAD(joining_date) OVER(ORDER BY joining_date) AS next_joining_date
FROM employee;


-- Salary Growth Compared to Previous Employee

SELECT
    emp_name,
    salary,
    LAG(salary) OVER(ORDER BY salary) AS previous_salary,
    salary - LAG(salary) OVER(ORDER BY salary) AS growth
FROM employee;


-- Previous Employee Name

SELECT
    emp_name,
    LAG(emp_name) OVER(ORDER BY salary) AS previous_employee
FROM employee;


-- Next Employee Name

SELECT
    emp_name,
    LEAD(emp_name) OVER(ORDER BY salary) AS next_employee
FROM employee;
