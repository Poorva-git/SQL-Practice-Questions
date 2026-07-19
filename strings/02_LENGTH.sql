SELECT emp_name,
       LENGTH(emp_name) AS name_length
FROM employee;

SELECT dept_name,
       LENGTH(dept_name) AS dept_length
FROM department;

SELECT emp_name
FROM employee
WHERE LENGTH(emp_name) > 5;

SELECT emp_name
FROM employee
ORDER BY LENGTH(emp_name) DESC;
