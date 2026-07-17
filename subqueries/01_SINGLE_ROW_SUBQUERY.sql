-- ==========================================
-- SINGLE ROW SUBQUERY
-- ==========================================

-- 1. Find employees earning more than the average salary

SELECT emp_name, salary
FROM employee
WHERE salary > (
    SELECT AVG(salary)
    FROM employee
);


-- 2. Find employees earning the highest salary

SELECT emp_name, salary
FROM employee
WHERE salary = (
    SELECT MAX(salary)
    FROM employee
);


-- 3. Find employees earning the lowest salary

SELECT emp_name, salary
FROM employee
WHERE salary = (
    SELECT MIN(salary)
    FROM employee
);


-- 4. Find employees working in the same department as 'Aman'

SELECT emp_name, dept_id
FROM employee
WHERE dept_id = (
    SELECT dept_id
    FROM employee
    WHERE emp_name = 'Aman'
);


-- 5. Find employees earning more than 'Neha'

SELECT emp_name, salary
FROM employee
WHERE salary > (
    SELECT salary
    FROM employee
    WHERE emp_name = 'Neha'
);
