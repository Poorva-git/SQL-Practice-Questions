-- Question:
-- Display employee name and department name.

SELECT emp_name, dept_name
FROM employee
INNER JOIN department
ON employee.dept_id = department.dept_id;
