-- Update Through View

UPDATE high_salary_employees
SET salary = salary + 5000
WHERE emp_id = 1;


SELECT *
FROM high_salary_employees;


-- Insert Through View

INSERT INTO it_employees
(emp_id, emp_name, dept_id)
VALUES
(11, 'Rohit', 102);


SELECT *
FROM it_employees;
