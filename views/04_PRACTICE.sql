-- Employees with Salary Greater Than 60000

CREATE VIEW salary_view AS
SELECT
    emp_name,
    salary
FROM employee
WHERE salary > 60000;


SELECT *
FROM salary_view;


-- HR Employees

CREATE VIEW hr_view AS
SELECT
    emp_name,
    dept_id
FROM employee
WHERE dept_id = 101;


SELECT *
FROM hr_view;


-- Employee and Department

CREATE VIEW employee_department AS
SELECT
    e.emp_name,
    d.dept_name
FROM employee e
JOIN department d
ON e.dept_id = d.dept_id;


SELECT *
FROM employee_department;
