-- Create Employee Details View

CREATE VIEW employee_details AS
SELECT
    e.emp_id,
    e.emp_name,
    d.dept_name,
    e.salary
FROM employee e
JOIN department d
ON e.dept_id = d.dept_id;


-- Display View

SELECT *
FROM employee_details;


-- Create High Salary Employees View

CREATE VIEW high_salary_employees AS
SELECT
    emp_id,
    emp_name,
    salary
FROM employee
WHERE salary >= 70000;


SELECT *
FROM high_salary_employees;


-- Create IT Employees View

CREATE VIEW it_employees AS
SELECT
    emp_id,
    emp_name,
    dept_id
FROM employee
WHERE dept_id = 102;


SELECT *
FROM it_employees;
