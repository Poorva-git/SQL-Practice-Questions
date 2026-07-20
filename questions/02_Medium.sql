-- =====================================================
-- QUESTION 1
-- Find the highest paid employee from each department.
-- =====================================================

SELECT *
FROM
(
    SELECT
        emp_name,
        dept_id,
        salary,
        ROW_NUMBER() OVER(PARTITION BY dept_id ORDER BY salary DESC) AS rn
    FROM employee
) t
WHERE rn = 1;



-- =====================================================
-- QUESTION 2
-- Find the second highest salary.
-- =====================================================

SELECT *
FROM
(
    SELECT
        emp_name,
        salary,
        DENSE_RANK() OVER(ORDER BY salary DESC) AS rnk
    FROM employee
) t
WHERE rnk = 2;



-- =====================================================
-- QUESTION 3
-- Find employees earning more than their department average salary.
-- =====================================================

SELECT
    emp_name,
    dept_id,
    salary
FROM employee e
WHERE salary >
(
    SELECT AVG(salary)
    FROM employee
    WHERE dept_id = e.dept_id
);



-- =====================================================
-- QUESTION 4
-- Find departments having more than 2 employees.
-- =====================================================

SELECT
    dept_id,
    COUNT(*) AS total_employees
FROM employee
GROUP BY dept_id
HAVING COUNT(*) > 2;



-- =====================================================
-- QUESTION 5
-- Find employees who don't have a manager.
-- =====================================================

SELECT *
FROM employee
WHERE manager_id IS NULL;



-- =====================================================
-- QUESTION 6
-- Find employees who joined in the current year.
-- =====================================================

SELECT *
FROM employee
WHERE EXTRACT(YEAR FROM joining_date) =
EXTRACT(YEAR FROM CURRENT_DATE);



-- =====================================================
-- QUESTION 7
-- Find duplicate salaries.
-- =====================================================

SELECT
    salary,
    COUNT(*)
FROM employee
GROUP BY salary
HAVING COUNT(*) > 1;



-- =====================================================
-- QUESTION 8
-- Display running total of salaries.
-- =====================================================

SELECT
    emp_name,
    salary,
    SUM(salary) OVER(ORDER BY salary) AS running_total
FROM employee;



-- =====================================================
-- QUESTION 9
-- Find employee with longest name.
-- =====================================================

SELECT *
FROM employee
ORDER BY LENGTH(emp_name) DESC
LIMIT 1;



-- =====================================================
-- QUESTION 10
-- Display previous employee salary.
-- =====================================================

SELECT
    emp_name,
    salary,
    LAG(salary) OVER(ORDER BY salary) AS previous_salary
FROM employee;



-- =====================================================
-- QUESTION 11
-- Find top 3 highest salaries.
-- =====================================================

SELECT *
FROM
(
    SELECT
        emp_name,
        salary,
        DENSE_RANK() OVER(ORDER BY salary DESC) AS rnk
    FROM employee
) t
WHERE rnk <= 3;



-- =====================================================
-- QUESTION 12
-- Find employees whose salary is equal to maximum salary.
-- =====================================================

SELECT *
FROM employee
WHERE salary =
(
    SELECT MAX(salary)
    FROM employee
);



-- =====================================================
-- QUESTION 13
-- Display employee count department wise.
-- =====================================================

SELECT
    dept_id,
    COUNT(*)
FROM employee
GROUP BY dept_id;



-- =====================================================
-- QUESTION 14
-- Find employees whose name contains 'a'.
-- =====================================================

SELECT *
FROM employee
WHERE emp_name ILIKE '%a%';



-- =====================================================
-- QUESTION 15
-- Find employee and department name.
-- =====================================================

SELECT
    e.emp_name,
    d.dept_name
FROM employee e
JOIN department d
ON e.dept_id = d.dept_id;



-- =====================================================
-- QUESTION 16
-- Find department having highest average salary.
-- =====================================================

SELECT
    dept_id,
    AVG(salary) AS avg_salary
FROM employee
GROUP BY dept_id
ORDER BY avg_salary DESC
LIMIT 1;



-- =====================================================
-- QUESTION 17
-- Display salary category using CASE.
-- =====================================================

SELECT
    emp_name,
    salary,
    CASE
        WHEN salary>=80000 THEN 'High'
        WHEN salary>=60000 THEN 'Medium'
        ELSE 'Low'
    END
FROM employee;



-- =====================================================
-- QUESTION 18
-- Find latest joined employee.
-- =====================================================

SELECT *
FROM employee
ORDER BY joining_date DESC
LIMIT 1;



-- =====================================================
-- QUESTION 19
-- Find employees not working in HR.
-- =====================================================

SELECT *
FROM employee
WHERE dept_id <>
(
    SELECT dept_id
    FROM department
    WHERE dept_name='HR'
);



-- =====================================================
-- QUESTION 20
-- Find average salary of company using Window Function.
-- =====================================================

SELECT
    emp_name,
    salary,
    AVG(salary) OVER() AS average_salary
FROM employee;



-- =====================================================
-- QUESTION 21
-- Find employees whose salary is greater than 70000.
-- =====================================================

SELECT *
FROM employee
WHERE salary>70000;



-- =====================================================
-- QUESTION 22
-- Find number of employees joined each year.
-- =====================================================

SELECT
    EXTRACT(YEAR FROM joining_date) AS joining_year,
    COUNT(*)
FROM employee
GROUP BY joining_year
ORDER BY joining_year;



-- =====================================================
-- QUESTION 23
-- Find employees without attendance record.
-- =====================================================

SELECT *
FROM employee e
WHERE NOT EXISTS
(
    SELECT 1
    FROM attendance a
    WHERE a.emp_id=e.emp_id
);



-- =====================================================
-- QUESTION 24
-- Find total salary department wise.
-- =====================================================

SELECT
    dept_id,
    SUM(salary)
FROM employee
GROUP BY dept_id;



-- =====================================================
-- QUESTION 25
-- Find highest salary department wise.
-- =====================================================

SELECT
    dept_id,
    MAX(salary)
FROM employee
GROUP BY dept_id;



-- =====================================================
-- QUESTION 26
-- Find lowest salary department wise.
-- =====================================================

SELECT
    dept_id,
    MIN(salary)
FROM employee
GROUP BY dept_id;



-- =====================================================
-- QUESTION 27
-- Find employee name length.
-- =====================================================

SELECT
    emp_name,
    LENGTH(emp_name)
FROM employee;



-- =====================================================
-- QUESTION 28
-- Find employees whose email ends with gmail.com.
-- =====================================================

SELECT *
FROM employee
WHERE email LIKE '%gmail.com';



-- =====================================================
-- QUESTION 29
-- Display employee hierarchy.
-- =====================================================

SELECT
    e.emp_name,
    m.emp_name AS manager_name
FROM employee e
LEFT JOIN employee m
ON e.manager_id=m.emp_id;



-- =====================================================
-- QUESTION 30
-- Find department-wise salary ranking.
-- =====================================================

SELECT
    emp_name,
    dept_id,
    salary,
    DENSE_RANK() OVER
    (
        PARTITION BY dept_id
        ORDER BY salary DESC
    ) AS salary_rank
FROM employee;
