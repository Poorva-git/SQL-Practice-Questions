SELECT emp_name,
       DATE_PART('year',joining_date)
FROM employee;

SELECT DATE_PART('month',CURRENT_DATE);

SELECT DATE_PART('day',CURRENT_DATE);

SELECT DATE_PART('dow',CURRENT_DATE);
