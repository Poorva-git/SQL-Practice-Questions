SELECT emp_name,
       EXTRACT(YEAR FROM joining_date)
FROM employee;

SELECT emp_name,
       EXTRACT(MONTH FROM joining_date)
FROM employee;

SELECT emp_name,
       EXTRACT(DAY FROM joining_date)
FROM employee;

SELECT EXTRACT(YEAR FROM CURRENT_DATE);
