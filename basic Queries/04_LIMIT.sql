-- Question:
-- Display the top 3 highest-paid employees.

SELECT *
FROM employee
ORDER BY salary DESC
LIMIT 3;
