-- Divide Employees into 2 Groups

SELECT
    emp_name,
    salary,
    NTILE(2) OVER(ORDER BY salary DESC) AS group_no
FROM employee;


-- Divide Employees into 3 Groups

SELECT
    emp_name,
    salary,
    NTILE(3) OVER(ORDER BY salary DESC) AS group_no
FROM employee;


-- Divide Employees into 4 Groups

SELECT
    emp_name,
    salary,
    NTILE(4) OVER(ORDER BY salary DESC) AS group_no
FROM employee;


-- First Salary

SELECT
    emp_name,
    salary,
    FIRST_VALUE(salary) OVER(ORDER BY salary DESC) AS highest_salary
FROM employee;


-- Lowest Salary

SELECT
    emp_name,
    salary,
    LAST_VALUE(salary) OVER
    (
        ORDER BY salary DESC
        ROWS BETWEEN UNBOUNDED PRECEDING
        AND UNBOUNDED FOLLOWING
    ) AS lowest_salary
FROM employee;


-- Highest Salary in Every Department

SELECT
    emp_name,
    dept_id,
    salary,
    FIRST_VALUE(salary) OVER
    (
        PARTITION BY dept_id
        ORDER BY salary DESC
    ) AS department_highest_salary
FROM employee;


-- Lowest Salary in Every Department

SELECT
    emp_name,
    dept_id,
    salary,
    LAST_VALUE(salary) OVER
    (
        PARTITION BY dept_id
        ORDER BY salary DESC
        ROWS BETWEEN UNBOUNDED PRECEDING
        AND UNBOUNDED FOLLOWING
    ) AS department_lowest_salary
FROM employee;


-- Highest Paid Employee Name in Each Department

SELECT
    emp_name,
    dept_id,
    salary,
    FIRST_VALUE(emp_name) OVER
    (
        PARTITION BY dept_id
        ORDER BY salary DESC
    ) AS highest_paid_employee
FROM employee;


-- Lowest Paid Employee Name in Each Department

SELECT
    emp_name,
    dept_id,
    salary,
    LAST_VALUE(emp_name) OVER
    (
        PARTITION BY dept_id
        ORDER BY salary DESC
        ROWS BETWEEN UNBOUNDED PRECEDING
        AND UNBOUNDED FOLLOWING
    ) AS lowest_paid_employee
FROM employee;
