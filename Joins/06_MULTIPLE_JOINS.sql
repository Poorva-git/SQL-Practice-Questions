-- Employee + Department + Project

SELECT
e.emp_name,
d.dept_name,
p.project_name
FROM employee e
INNER JOIN department d
ON e.dept_id = d.dept_id
INNER JOIN projects p
ON d.dept_id = p.dept_id;
