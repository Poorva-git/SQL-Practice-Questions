-- ==========================================
-- MULTIPLE ROW SUBQUERY
-- ==========================================

-- 1. Find employees working in HR or IT department

SELECT
    emp_name,
    dept_id
FROM employee
WHERE dept_id IN
(
    SELECT dept_id
    FROM department
    WHERE dept_name IN ('HR', 'IT')
);


-- 2. Find employees whose salary is greater than ANY employee in HR

SELECT
    emp_name,
    salary
FROM employee
WHERE salary > ANY
(
    SELECT salary
    FROM employee
    WHERE dept_id =
    (
        SELECT dept_id
        FROM department
        WHERE dept_name = 'HR'
    )
);


-- 3. Find employees whose salary is greater than ALL employees in HR

SELECT
    emp_name,
    salary
FROM employee
WHERE salary > ALL
(
    SELECT salary
    FROM employee
    WHERE dept_id =
    (
        SELECT dept_id
        FROM department
        WHERE dept_name = 'HR'
    )
);


-- 4. Find employees working in departments that have projects

SELECT
    emp_name
FROM employee
WHERE dept_id IN
(
    SELECT dept_id
    FROM projects
);


-- 5. Find employees who are managers

SELECT
    emp_name
FROM employee
WHERE emp_id IN
(
    SELECT manager_id
    FROM employee
    WHERE manager_id IS NOT NULL
);


-- 6. Find employees who are not managers

SELECT
    emp_name
FROM employee
WHERE emp_id NOT IN
(
    SELECT manager_id
    FROM employee
    WHERE manager_id IS NOT NULL
);


-- 7. Find departments that have employees

SELECT
    dept_name
FROM department
WHERE dept_id IN
(
    SELECT DISTINCT dept_id
    FROM employee
);
