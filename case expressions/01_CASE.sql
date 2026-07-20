-- Salary Category

SELECT
    emp_name,
    salary,
    CASE
        WHEN salary >= 80000 THEN 'High Salary'
        WHEN salary >= 60000 THEN 'Medium Salary'
        ELSE 'Low Salary'
    END AS salary_category
FROM employee;


-- Age Category

SELECT
    emp_name,
    age,
    CASE
        WHEN age < 25 THEN 'Young'
        WHEN age BETWEEN 25 AND 35 THEN 'Adult'
        ELSE 'Senior'
    END AS age_category
FROM employee;


-- Employee Status

SELECT
    emp_name,
    experience,
    CASE
        WHEN experience >= 10 THEN 'Senior'
        WHEN experience >= 5 THEN 'Mid Level'
        ELSE 'Fresher'
    END AS employee_status
FROM employee;


-- Bonus Calculation

SELECT
    emp_name,
    salary,
    CASE
        WHEN salary >= 80000 THEN salary * 0.20
        WHEN salary >= 60000 THEN salary * 0.15
        ELSE salary * 0.10
    END AS bonus
FROM employee;


-- Gender Expansion

SELECT
    emp_name,
    gender,
    CASE
        WHEN gender = 'M' THEN 'Male'
        WHEN gender = 'F' THEN 'Female'
        ELSE 'Other'
    END AS gender_name
FROM employee;


-- Department Category

SELECT
    emp_name,
    dept_id,
    CASE
        WHEN dept_id = 101 THEN 'Human Resource'
        WHEN dept_id = 102 THEN 'Information Technology'
        WHEN dept_id = 103 THEN 'Finance'
        ELSE 'Other Department'
    END AS department_name
FROM employee;


-- Performance Rating

SELECT
    emp_name,
    performance_score,
    CASE
        WHEN performance_score >= 90 THEN 'Excellent'
        WHEN performance_score >= 75 THEN 'Good'
        WHEN performance_score >= 60 THEN 'Average'
        ELSE 'Needs Improvement'
    END AS performance_rating
FROM employee;


-- Salary Increment

SELECT
    emp_name,
    salary,
    CASE
        WHEN salary >= 80000 THEN salary + 10000
        WHEN salary >= 60000 THEN salary + 7000
        ELSE salary + 5000
    END AS revised_salary
FROM employee;
