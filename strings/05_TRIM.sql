SELECT TRIM('   SQL   ');

SELECT LTRIM('   SQL');

SELECT RTRIM('SQL   ');

SELECT emp_name,
       TRIM(emp_name)
FROM employee;
