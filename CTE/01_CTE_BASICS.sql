WITH AvgSalary AS
(
    SELECT AVG(salary) AS avg_salary
    FROM employee
)

SELECT *
FROM AvgSalary;
