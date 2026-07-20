-- =====================================================
-- QUESTION 1
-- Display all employee details.
-- =====================================================

SELECT *
FROM employee;



-- =====================================================
-- QUESTION 2
-- Display employee name and salary.
-- =====================================================

SELECT emp_name, salary
FROM employee;



-- =====================================================
-- QUESTION 3
-- Display employees whose salary is greater than 60000.
-- =====================================================

SELECT *
FROM employee
WHERE salary > 60000;



-- =====================================================
-- QUESTION 4
-- Display employees working in IT department.
-- =====================================================

SELECT *
FROM employee
WHERE dept_id = 102;



-- =====================================================
-- QUESTION 5
-- Display employees ordered by salary in descending order.
-- =====================================================

SELECT *
FROM employee
ORDER BY salary DESC;



-- =====================================================
-- QUESTION 6
-- Find total number of employees.
-- =====================================================

SELECT COUNT(*) AS total_employees
FROM employee;



-- =====================================================
-- QUESTION 7
-- Find average salary.
-- =====================================================

SELECT AVG(salary) AS average_salary
FROM employee;



-- =====================================================
-- QUESTION 8
-- Find highest salary.
-- =====================================================

SELECT MAX(salary) AS highest_salary
FROM employee;



-- =====================================================
-- QUESTION 9
-- Find lowest salary.
-- =====================================================

SELECT MIN(salary) AS lowest_salary
FROM employee;



-- =====================================================
-- QUESTION 10
-- Find total salary of all employees.
-- =====================================================

SELECT SUM(salary) AS total_salary
FROM employee;



-- =====================================================
-- QUESTION 11
-- Display employee name with department name.
-- =====================================================

SELECT
    e.emp_name,
    d.dept_name
FROM employee e
INNER JOIN department d
ON e.dept_id = d.dept_id;



-- =====================================================
-- QUESTION 12
-- Find number of employees in each department.
-- =====================================================

SELECT
    dept_id,
    COUNT(*) AS total_employees
FROM employee
GROUP BY dept_id;



-- =====================================================
-- QUESTION 13
-- Find average salary department wise.
-- =====================================================

SELECT
    dept_id,
    AVG(salary) AS average_salary
FROM employee
GROUP BY dept_id;



-- =====================================================
-- QUESTION 14
-- Display employees whose salary is above average salary.
-- =====================================================

SELECT *
FROM employee
WHERE salary >
(
    SELECT AVG(salary)
    FROM employee
);



-- =====================================================
-- QUESTION 15
-- Find employees whose name starts with 'A'.
-- =====================================================

SELECT *
FROM employee
WHERE emp_name LIKE 'A%';



-- =====================================================
-- QUESTION 16
-- Find employees who joined after 2023.
-- =====================================================

SELECT *
FROM employee
WHERE joining_date > '2023-12-31';



-- =====================================================
-- QUESTION 17
-- Display employee name in uppercase.
-- =====================================================

SELECT
    UPPER(emp_name)
FROM employee;



-- =====================================================
-- QUESTION 18
-- Find second highest salary.
-- =====================================================

SELECT MAX(salary)
FROM employee
WHERE salary <
(
    SELECT MAX(salary)
    FROM employee
);



-- =====================================================
-- QUESTION 19
-- Display salary category using CASE.
-- =====================================================

SELECT
    emp_name,
    salary,
    CASE
        WHEN salary >= 80000 THEN 'High'
        WHEN salary >= 60000 THEN 'Medium'
        ELSE 'Low'
    END AS salary_category
FROM employee;



-- =====================================================
-- QUESTION 20
-- Display salary rank.
-- =====================================================

SELECT
    emp_name,
    salary,
    DENSE_RANK() OVER(ORDER BY salary DESC) AS salary_rank
FROM employee;
