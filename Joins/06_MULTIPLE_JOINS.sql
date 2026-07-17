-- ==========================================
-- MULTIPLE JOINS
-- ==========================================

-- Employee Name, Department Name and Project Name

SELECT
    e.emp_name,
    d.dept_name,
    p.project_name
FROM employee e
INNER JOIN department d
ON e.dept_id = d.dept_id
INNER JOIN projects p
ON d.dept_id = p.dept_id;


-- Employee Name, Department Name and Budget

SELECT
    e.emp_name,
    d.dept_name,
    p.budget
FROM employee e
INNER JOIN department d
ON e.dept_id = d.dept_id
INNER JOIN projects p
ON d.dept_id = p.dept_id;


-- Employee Name, Department Name, Project Name and Salary

SELECT
    e.emp_name,
    d.dept_name,
    p.project_name,
    e.salary
FROM employee e
INNER JOIN department d
ON e.dept_id = d.dept_id
INNER JOIN projects p
ON d.dept_id = p.dept_id;


-- Employee Name, Department Name, Project Name, Budget and Salary

SELECT
    e.emp_name,
    d.dept_name,
    p.project_name,
    p.budget,
    e.salary
FROM employee e
INNER JOIN department d
ON e.dept_id = d.dept_id
INNER JOIN projects p
ON d.dept_id = p.dept_id;


-- Employee Name, Department Name, Attendance Date and Status

SELECT
    e.emp_name,
    d.dept_name,
    a.attendance_date,
    a.status
FROM employee e
INNER JOIN department d
ON e.dept_id = d.dept_id
INNER JOIN attendance a
ON e.emp_id = a.emp_id;


-- Employee Name, Department Name, Old Salary and New Salary

SELECT
    e.emp_name,
    d.dept_name,
    s.old_salary,
    s.new_salary
FROM employee e
INNER JOIN department d
ON e.dept_id = d.dept_id
INNER JOIN salary_history s
ON e.emp_id = s.emp_id;
