-- ==========================================
-- SUBQUERY PRACTICE QUESTIONS
-- ==========================================

-- 1. Find employees earning more than the average salary

SELECT emp_name, salary
FROM employee
WHERE salary >
(
    SELECT AVG(salary)
    FROM employee
);


-- 2. Find employees earning less than the average salary

SELECT emp_name, salary
FROM employee
WHERE salary <
(
    SELECT AVG(salary)
    FROM employee
);


-- 3. Find employee(s) with the highest salary

SELECT emp_name, salary
FROM employee
WHERE salary =
(
    SELECT MAX(salary)
    FROM employee
);


-- 4. Find employee(s) with the lowest salary

SELECT emp_name, salary
FROM employee
WHERE salary =
(
    SELECT MIN(salary)
    FROM employee
);


-- 5. Find employees working in the same department as Aman

SELECT emp_name
FROM employee
WHERE dept_id =
(
    SELECT dept_id
    FROM employee
    WHERE emp_name = 'Aman'
);


-- 6. Find employees earning more than Neha

SELECT emp_name, salary
FROM employee
WHERE salary >
(
    SELECT salary
    FROM employee
    WHERE emp_name = 'Neha'
);


-- 7. Find employees working in HR department

SELECT emp_name
FROM employee
WHERE dept_id =
(
    SELECT dept_id
    FROM department
    WHERE dept_name = 'HR'
);


-- 8. Find employees who are managers

SELECT emp_name
FROM employee
WHERE emp_id IN
(
    SELECT manager_id
    FROM employee
    WHERE manager_id IS NOT NULL
);


-- 9. Find employees who are not managers

SELECT emp_name
FROM employee
WHERE emp_id NOT IN
(
    SELECT manager_id
    FROM employee
    WHERE manager_id IS NOT NULL
);


-- 10. Find employees working in departments that have projects

SELECT emp_name
FROM employee
WHERE dept_id IN
(
    SELECT dept_id
    FROM projects
);


-- 11. Find departments having at least one employee

SELECT dept_name
FROM department d
WHERE EXISTS
(
    SELECT 1
    FROM employee e
    WHERE e.dept_id = d.dept_id
);


-- 12. Find departments having no employees

SELECT dept_name
FROM department d
WHERE NOT EXISTS
(
    SELECT 1
    FROM employee e
    WHERE e.dept_id = d.dept_id
);


-- 13. Find employees having attendance records

SELECT emp_name
FROM employee e
WHERE EXISTS
(
    SELECT 1
    FROM attendance a
    WHERE a.emp_id = e.emp_id
);


-- 14. Find employees without attendance records

SELECT emp_name
FROM employee e
WHERE NOT EXISTS
(
    SELECT 1
    FROM attendance a
    WHERE a.emp_id = e.emp_id
);


-- 15. Find employees earning more than the average salary of their department

SELECT e1.emp_name,
       e1.salary,
       e1.dept_id
FROM employee e1
WHERE salary >
(
    SELECT AVG(e2.salary)
    FROM employee e2
    WHERE e1.dept_id = e2.dept_id
);


-- 16. Find highest paid employee in each department

SELECT e1.emp_name,
       e1.salary,
       e1.dept_id
FROM employee e1
WHERE salary =
(
    SELECT MAX(e2.salary)
    FROM employee e2
    WHERE e1.dept_id = e2.dept_id
);


-- 17. Find lowest paid employee in each department

SELECT e1.emp_name,
       e1.salary,
       e1.dept_id
FROM employee e1
WHERE salary =
(
    SELECT MIN(e2.salary)
    FROM employee e2
    WHERE e1.dept_id = e2.dept_id
);


-- 18. Find managers having more than one employee

SELECT m.emp_name,
       COUNT(*) AS total_employees
FROM employee e
JOIN employee m
ON e.manager_id = m.emp_id
GROUP BY m.emp_name
HAVING COUNT(*) > 1;


-- 19. Find employee(s) earning more than all HR employees

SELECT emp_name,
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


-- 20. Find employee(s) earning more than any HR employee

SELECT emp_name,
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
