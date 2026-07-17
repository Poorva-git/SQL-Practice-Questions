-- ==========================================
-- EXISTS
-- ==========================================

-- 1. Find departments that have employees

SELECT
    dept_name
FROM department d
WHERE EXISTS
(
    SELECT 1
    FROM employee e
    WHERE e.dept_id = d.dept_id
);


-- 2. Find employees who have attendance records

SELECT
    emp_name
FROM employee e
WHERE EXISTS
(
    SELECT 1
    FROM attendance a
    WHERE a.emp_id = e.emp_id
);


-- 3. Find departments that have projects

SELECT
    dept_name
FROM department d
WHERE EXISTS
(
    SELECT 1
    FROM projects p
    WHERE p.dept_id = d.dept_id
);


-- 4. Find employees whose salary history exists

SELECT
    emp_name
FROM employee e
WHERE EXISTS
(
    SELECT 1
    FROM salary_history s
    WHERE s.emp_id = e.emp_id
);
