SELECT email,
       REPLACE(email,'gmail.com','company.com')
FROM employee;

SELECT emp_name,
       REPLACE(emp_name,'a','@')
FROM employee;

SELECT phone,
       REPLACE(phone,'9','X')
FROM employee;

SELECT dept_name,
       REPLACE(dept_name,'IT','Technology')
FROM department;
