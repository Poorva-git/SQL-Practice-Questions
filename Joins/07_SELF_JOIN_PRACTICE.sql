-- ==========================================
-- SELF JOIN PRACTICE QUESTIONS
-- ==========================================

-- 1. Employee and Manager Name

SELECT
    e.emp_name AS Employee,
    m.emp_name AS Manager
FROM employee e
LEFT JOIN employee m
ON e.manager_id = m.emp_id;


-- 2. Find Employees Without a Manager

SELECT
    emp_name
FROM employee
WHERE manager_id IS NULL;


-- 3. Find Employees Reporting to Priya

SELECT
    e.emp_name
FROM employee e
INNER JOIN employee m
ON e.manager_id = m.emp_id
WHERE m.emp_name = 'Priya';


-- 4. Count Employees Under Each Manager

SELECT
    m.emp_name AS Manager,
    COUNT(e.emp_id) AS Total_Employees
FROM employee e
INNER JOIN employee m
ON e.manager_id = m.emp_id
GROUP BY m.emp_name;


-- 5. Manager With Maximum Employees

SELECT
    m.emp_name AS Manager,
    COUNT(e.emp_id) AS Total_Employees
FROM employee e
INNER JOIN employee m
ON e.manager_id = m.emp_id
GROUP BY m.emp_name
ORDER BY Total_Employees DESC
LIMIT 1;
