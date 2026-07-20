SELECT CURRENT_DATE;

SELECT emp_name,
       AGE(joining_date)
FROM employee;

SELECT emp_name,
       EXTRACT(YEAR FROM joining_date)
FROM employee;

SELECT emp_name,
       DATE_PART('month',joining_date)
FROM employee;

SELECT CURRENT_DATE + INTERVAL '30 days';

SELECT CURRENT_DATE - INTERVAL '1 month';

SELECT EXTRACT(DAY FROM CURRENT_DATE);
