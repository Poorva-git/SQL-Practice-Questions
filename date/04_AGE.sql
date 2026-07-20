SELECT emp_name,
       AGE(joining_date)
FROM employee;

SELECT AGE(CURRENT_DATE,joining_date)
FROM employee;

SELECT AGE(CURRENT_DATE,'2000-01-01');

SELECT emp_name,
       AGE(CURRENT_DATE,joining_date)
FROM employee;
