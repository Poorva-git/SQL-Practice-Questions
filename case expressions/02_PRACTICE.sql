-- Pass / Fail

SELECT
    emp_name,
    performance_score,
    CASE
        WHEN performance_score >= 40 THEN 'Pass'
        ELSE 'Fail'
    END AS result
FROM employee;


-- Experience Level

SELECT
    emp_name,
    experience,
    CASE
        WHEN experience < 2 THEN 'Beginner'
        WHEN experience < 5 THEN 'Intermediate'
        ELSE 'Expert'
    END AS level
FROM employee;


-- Salary Grade

SELECT
    emp_name,
    salary,
    CASE
        WHEN salary >= 90000 THEN 'A'
        WHEN salary >= 70000 THEN 'B'
        WHEN salary >= 50000 THEN 'C'
        ELSE 'D'
    END AS grade
FROM employee;


-- Joining Year Category

SELECT
    emp_name,
    joining_date,
    CASE
        WHEN EXTRACT(YEAR FROM joining_date) >= 2025 THEN 'New Employee'
        ELSE 'Old Employee'
    END AS joining_category
FROM employee;


-- Even / Odd Employee ID

SELECT
    emp_name,
    emp_id,
    CASE
        WHEN emp_id % 2 = 0 THEN 'Even'
        ELSE 'Odd'
    END AS id_type
FROM employee;


-- Tax Calculation

SELECT
    emp_name,
    salary,
    CASE
        WHEN salary >= 80000 THEN salary * 0.30
        WHEN salary >= 60000 THEN salary * 0.20
        ELSE salary * 0.10
    END AS tax
FROM employee;


-- Work Shift

SELECT
    emp_name,
    shift,
    CASE
        WHEN shift = 'M' THEN 'Morning'
        WHEN shift = 'E' THEN 'Evening'
        WHEN shift = 'N' THEN 'Night'
        ELSE 'General'
    END AS shift_name
FROM employee;
