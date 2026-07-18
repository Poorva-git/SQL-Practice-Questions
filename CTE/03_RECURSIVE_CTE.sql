-- Employee Hierarchy

WITH RECURSIVE EmployeeHierarchy AS
(
    SELECT
        emp_id,
        emp_name,
        manager_id,
        1 AS level
    FROM employee
    WHERE manager_id IS NULL

    UNION ALL

    SELECT
        e.emp_id,
        e.emp_name,
        e.manager_id,
        eh.level + 1
    FROM employee e
    JOIN EmployeeHierarchy eh
    ON e.manager_id = eh.emp_id
)

SELECT *
FROM EmployeeHierarchy;



-- Employee Hierarchy with Manager Name

WITH RECURSIVE EmployeeHierarchy AS
(
    SELECT
        emp_id,
        emp_name,
        manager_id,
        1 AS level
    FROM employee
    WHERE manager_id IS NULL

    UNION ALL

    SELECT
        e.emp_id,
        e.emp_name,
        e.manager_id,
        eh.level + 1
    FROM employee e
    JOIN EmployeeHierarchy eh
    ON e.manager_id = eh.emp_id
)

SELECT
    eh.emp_name,
    m.emp_name AS manager_name,
    eh.level
FROM EmployeeHierarchy eh
LEFT JOIN employee m
ON eh.manager_id = m.emp_id;



-- Total Employees at Each Level

WITH RECURSIVE EmployeeHierarchy AS
(
    SELECT
        emp_id,
        emp_name,
        manager_id,
        1 AS level
    FROM employee
    WHERE manager_id IS NULL

    UNION ALL

    SELECT
        e.emp_id,
        e.emp_name,
        e.manager_id,
        eh.level + 1
    FROM employee e
    JOIN EmployeeHierarchy eh
    ON e.manager_id = eh.emp_id
)

SELECT
    level,
    COUNT(*) AS total_employees
FROM EmployeeHierarchy
GROUP BY level
ORDER BY level;



-- Employees at Level 2

WITH RECURSIVE EmployeeHierarchy AS
(
    SELECT
        emp_id,
        emp_name,
        manager_id,
        1 AS level
    FROM employee
    WHERE manager_id IS NULL

    UNION ALL

    SELECT
        e.emp_id,
        e.emp_name,
        e.manager_id,
        eh.level + 1
    FROM employee e
    JOIN EmployeeHierarchy eh
    ON e.manager_id = eh.emp_id
)

SELECT
    emp_name,
    level
FROM EmployeeHierarchy
WHERE level = 2;



-- Employees at Level 3

WITH RECURSIVE EmployeeHierarchy AS
(
    SELECT
        emp_id,
        emp_name,
        manager_id,
        1 AS level
    FROM employee
    WHERE manager_id IS NULL

    UNION ALL

    SELECT
        e.emp_id,
        e.emp_name,
        e.manager_id,
        eh.level + 1
    FROM employee e
    JOIN EmployeeHierarchy eh
    ON e.manager_id = eh.emp_id
)

SELECT
    emp_name,
    level
FROM EmployeeHierarchy
WHERE level = 3;
