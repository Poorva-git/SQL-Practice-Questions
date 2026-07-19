SELECT UPPER(emp_name)
FROM employee;

SELECT LOWER(email)
FROM employee;

SELECT LENGTH(email)
FROM employee;

SELECT SUBSTRING(emp_name FROM 1 FOR 2)
FROM employee;

SELECT REPLACE(email,'@',' # ')
FROM employee;

SELECT CONCAT(emp_name,' - ',phone)
FROM employee;

SELECT TRIM(emp_name)
FROM employee;
