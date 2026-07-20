-- =====================================================
-- QUESTION 1
-- Find the 3rd Highest Salary.
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
WHERE rnk = 3;



-- =====================================================
-- QUESTION 2
-- Find Top 3 Highest Paid Employees from Each Department.
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
WHERE rn <= 3;



-- =====================================================
-- QUESTION 3
-- Find Departments where Average Salary is Greater than Company Average.
-- =====================================================

SELECT
    dept_id,
    AVG(salary) AS avg_salary
FROM employee
GROUP BY dept_id
HAVING AVG(salary) >
(
    SELECT AVG(salary)
    FROM employee
);



-- =====================================================
-- QUESTION 4
-- Find Employees earning Maximum Salary in their Department.
-- =====================================================

SELECT *
FROM employee e
WHERE salary =
(
    SELECT MAX(salary)
    FROM employee
    WHERE dept_id = e.dept_id
);



-- =====================================================
-- QUESTION 5
-- Find Employees whose Salary is Higher than their Manager.
-- =====================================================

SELECT
    e.emp_name,
    e.salary,
    m.emp_name AS manager_name,
    m.salary AS manager_salary
FROM employee e
JOIN employee m
ON e.manager_id = m.emp_id
WHERE e.salary > m.salary;



-- =====================================================
-- QUESTION 6
-- Find Duplicate Employee Names.
-- =====================================================

SELECT
    emp_name,
    COUNT(*)
FROM employee
GROUP BY emp_name
HAVING COUNT(*) > 1;



-- =====================================================
-- QUESTION 7
-- Find Department with Maximum Employees.
-- =====================================================

SELECT
    dept_id,
    COUNT(*) AS total_employees
FROM employee
GROUP BY dept_id
ORDER BY total_employees DESC
LIMIT 1;



-- =====================================================
-- QUESTION 8
-- Find Employees who have never taken Attendance.
-- =====================================================

SELECT *
FROM employee e
WHERE NOT EXISTS
(
    SELECT 1
    FROM attendance a
    WHERE a.emp_id = e.emp_id
);



-- =====================================================
-- QUESTION 9
-- Find Salary Difference from Department Average.
-- =====================================================

SELECT
    emp_name,
    dept_id,
    salary,
    salary -
    AVG(salary) OVER(PARTITION BY dept_id) AS difference
FROM employee;



-- =====================================================
-- QUESTION 10
-- Find Running Total Department Wise.
-- =====================================================

SELECT
    emp_name,
    dept_id,
    salary,
    SUM(salary)
    OVER(PARTITION BY dept_id ORDER BY salary) AS running_total
FROM employee;



-- =====================================================
-- QUESTION 11
-- Find Latest Employee from Each Department.
-- =====================================================

SELECT *
FROM
(
    SELECT
        *,
        ROW_NUMBER() OVER
        (
            PARTITION BY dept_id
            ORDER BY joining_date DESC
        ) AS rn
    FROM employee
) t
WHERE rn = 1;



-- =====================================================
-- QUESTION 12
-- Find Employees whose Salary is Above Department Average.
-- =====================================================

SELECT *
FROM employee e
WHERE salary >
(
    SELECT AVG(salary)
    FROM employee
    WHERE dept_id = e.dept_id
);



-- =====================================================
-- QUESTION 13
-- Find Employees sharing the same Salary.
-- =====================================================

SELECT *
FROM employee
WHERE salary IN
(
    SELECT salary
    FROM employee
    GROUP BY salary
    HAVING COUNT(*) > 1
);



-- =====================================================
-- QUESTION 14
-- Find Highest Salary using CTE.
-- =====================================================

WITH SalaryRank AS
(
    SELECT
        emp_name,
        salary,
        DENSE_RANK() OVER(ORDER BY salary DESC) AS rnk
    FROM employee
)

SELECT *
FROM SalaryRank
WHERE rnk = 1;



-- =====================================================
-- QUESTION 15
-- Find Employees joined in the Last 1 Year.
-- =====================================================

SELECT *
FROM employee
WHERE joining_date >= CURRENT_DATE - INTERVAL '1 year';



-- =====================================================
-- QUESTION 16
-- Find Monthly Joining Count.
-- =====================================================

SELECT
    DATE_PART('month', joining_date) AS joining_month,
    COUNT(*)
FROM employee
GROUP BY joining_month
ORDER BY joining_month;



-- =====================================================
-- QUESTION 17
-- Find Highest Paid Employee Overall.
-- =====================================================

SELECT *
FROM employee
ORDER BY salary DESC
LIMIT 1;



-- =====================================================
-- QUESTION 18
-- Find Employees whose Salary lies in Top 25%.
-- =====================================================

SELECT *
FROM
(
    SELECT
        *,
        NTILE(4) OVER(ORDER BY salary DESC) AS grp
    FROM employee
) t
WHERE grp = 1;



-- =====================================================
-- QUESTION 19
-- Find Employees with Consecutive Joining Dates.
-- =====================================================

SELECT
    emp_name,
    joining_date,
    LAG(joining_date)
    OVER(ORDER BY joining_date) AS previous_joining
FROM employee;



-- =====================================================
-- QUESTION 20
-- Find Employee and Department Details using View.
-- =====================================================

SELECT *
FROM employee_details;
