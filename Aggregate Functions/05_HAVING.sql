SELECT dept_id, COUNT(*) AS total_employees
FROM employee
GROUP BY dept_id
HAVING COUNT(*) > 1;
