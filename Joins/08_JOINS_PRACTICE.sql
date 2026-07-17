-- ==========================================
-- JOINS PRACTICE QUESTIONS
-- ==========================================

-- 1. Display Employee Name and Department Name

SELECT
    e.emp_name,
    d.dept_name
FROM employee e
INNER JOIN department d
ON e.dept_id = d.dept_id;


-- 2. Display Employee Name, Department Name and Salary

SELECT
    e.emp_name,
    d.dept_name,
    e.salary
FROM employee e
INNER JOIN department d
ON e.dept_id = d.dept_id;


-- 3. Display Employee Name, Department Name and Project Name

SELECT
    e.emp_name,
    d.dept_name,
    p.project_name
FROM employee e
INNER JOIN department d
ON e.dept_id = d.dept_id
INNER JOIN projects p
ON d.dept_id = p.dept_id;


-- 4. Display Employee Name, Department Name and Project Budget

SELECT
    e.emp_name,
    d.dept_name,
    p.budget
FROM employee e
INNER JOIN department d
ON e.dept_id = d.dept_id
INNER JOIN projects p
ON d.dept_id = p.dept_id;


-- 5. Display Employee Name, Project Name and Salary

SELECT
    e.emp_name,
    p.project_name,
    e.salary
FROM employee e
INNER JOIN projects p
ON e.dept_id = p.dept_id;


-- 6. Display Employee Name, Attendance Date and Status

SELECT
    e.emp_name,
    a.attendance_date,
    a.status
FROM employee e
INNER JOIN attendance a
ON e.emp_id = a.emp_id;


-- 7. Display Employee Name, Old Salary and New Salary

SELECT
    e.emp_name,
    s.old_salary,
    s.new_salary
FROM employee e
INNER JOIN salary_history s
ON e.emp_id = s.emp_id;


-- 8. Display Employee Name, Department Name, Attendance Status

SELECT
    e.emp_name,
    d.dept_name,
    a.status
FROM employee e
INNER JOIN department d
ON e.dept_id = d.dept_id
INNER JOIN attendance a
ON e.emp_id = a.emp_id;


-- 9. Display Employee Name, Department Name, Salary and Attendance

SELECT
    e.emp_name,
    d.dept_name,
    e.salary,
    a.status
FROM employee e
INNER JOIN department d
ON e.dept_id = d.dept_id
INNER JOIN attendance a
ON e.emp_id = a.emp_id;


-- 10. Display Employee Name, Department Name, Old Salary and New Salary

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


-- 11. Display Employee Name, Department Name, Project Name, Salary

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


-- 12. Display Employee Name, Department Name, Project Name, Budget and Salary

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


-- ==========================================
-- SELF JOIN QUESTIONS
-- ==========================================

-- 13. Employee and Manager Name

SELECT
    e.emp_name AS Employee,
    m.emp_name AS Manager
FROM employee e
LEFT JOIN employee m
ON e.manager_id = m.emp_id;


-- 14. Employees Without a Manager

SELECT
    emp_name
FROM employee
WHERE manager_id IS NULL;


-- 15. Employees Reporting to Priya

SELECT
    e.emp_name
FROM employee e
INNER JOIN employee m
ON e.manager_id = m.emp_id
WHERE m.emp_name = 'Priya';


-- 16. Count Employees Under Each Manager

SELECT
    m.emp_name AS Manager,
    COUNT(e.emp_id) AS Total_Employees
FROM employee e
INNER JOIN employee m
ON e.manager_id = m.emp_id
GROUP BY m.emp_name;


-- 17. Manager With Maximum Employees

SELECT
    m.emp_name AS Manager,
    COUNT(e.emp_id) AS Total_Employees
FROM employee e
INNER JOIN employee m
ON e.manager_id = m.emp_id
GROUP BY m.emp_name
ORDER BY Total_Employees DESC
LIMIT 1;
