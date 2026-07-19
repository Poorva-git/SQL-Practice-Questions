SELECT emp_name,
       SUBSTRING(emp_name FROM 1 FOR 3) AS first_three
FROM employee;

SELECT emp_name,
       SUBSTRING(emp_name FROM 2 FOR 4) AS middle_part
FROM employee;

SELECT email,
       SUBSTRING(email FROM 1 FOR 5)
FROM employee;

SELECT emp_name,
       SUBSTRING(emp_name FROM LENGTH(emp_name)-2 FOR 3)
FROM employee;
