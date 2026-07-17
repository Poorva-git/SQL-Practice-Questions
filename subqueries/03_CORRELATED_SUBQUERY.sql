-- ==========================================
-- CORRELATED SUBQUERY
-- ==========================================

-- 1. Find employees earning more than the average salary of their own department

SELECT
    e1.emp_name,
    e1.salary,
    e1.dept_id
FROM employee e1
WHERE salary >
(
    SELECT AVG(e2.salary)
    FROM employee e2
    WHERE e1.dept_id = e2.dept_id
);


-- 2. Find employees having the highest salary in their department

SELECT
    e1.emp_name,
    e1.salary,
    e1.dept_id
FROM employee e1
WHERE salary =
(
    SELECT MAX(e2.salary)
    FROM employee e2
    WHERE e1.dept_id = e2.dept_id
);


-- 3. Find employees having the lowest salary in their department

SELECT
    e1.emp_name,
    e1.salary,
    e1.dept_id
FROM employee e1
WHERE salary =
(
    SELECT MIN(e2.salary)
    FROM employee e2
    WHERE e1.dept_id = e2.dept_id
);


-- 4. Find employees whose salary is greater than every other employee in the same department

SELECT
    e1.emp_name,
    e1.salary,
    e1.dept_id
FROM employee e1
WHERE salary >= ALL
(
    SELECT e2.salary
    FROM employee e2
    WHERE e1.dept_id = e2.dept_id
);


-- 5. Find employees whose salary is less than every other employee in the same department

SELECT
    e1.emp_name,
    e1.salary,
    e1.dept_id
FROM employee e1
WHERE salary <= ALL
(
    SELECT e2.salary
    FROM employee e2
    WHERE e1.dept_id = e2.dept_id
);
