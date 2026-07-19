SELECT CONCAT(emp_name,' - ',email)
FROM employee;

SELECT CONCAT(emp_name,' works in ',dept_name)
FROM employee
JOIN department
ON employee.dept_id=department.dept_id;

SELECT CONCAT(city,', India')
FROM employee;

SELECT CONCAT(emp_name,' (',salary,')')
FROM employee;
