SELECT e.emp_name,
       d.dept_name
FROM employee e
FULL OUTER JOIN department d
ON e.dept_id = d.dept_id;
