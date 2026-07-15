-- Question:
-- Count the number of employees in each department.

SELECT department, COUNT(*)
FROM employee
GROUP BY department;
