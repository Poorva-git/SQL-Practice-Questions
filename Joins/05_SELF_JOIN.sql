SELECT e.emp_name AS Employee,
       m.emp_name AS Manager
FROM employee e
LEFT JOIN employee m
ON e.manager_id = m.emp_id;
