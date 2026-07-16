-- =========================
-- Department Table
-- =========================
CREATE TABLE department (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50),
    location VARCHAR(50)
);

-- =========================
-- Employee Table
-- =========================
CREATE TABLE employee (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    dept_id INT,
    salary INT,
    manager_id INT,
    FOREIGN KEY (dept_id) REFERENCES department(dept_id)
);

-- =========================
-- Projects Table
-- =========================
CREATE TABLE projects (
    project_id INT PRIMARY KEY,
    project_name VARCHAR(100),
    dept_id INT,
    budget INT,
    FOREIGN KEY (dept_id) REFERENCES department(dept_id)
);

-- =========================
-- Attendance Table
-- =========================
CREATE TABLE attendance (
    attendance_id INT PRIMARY KEY,
    emp_id INT,
    attendance_date DATE,
    status VARCHAR(20),
    FOREIGN KEY (emp_id) REFERENCES employee(emp_id)
);

-- =========================
-- Salary History Table
-- =========================
CREATE TABLE salary_history (
    salary_id INT PRIMARY KEY,
    emp_id INT,
    old_salary INT,
    new_salary INT,
    effective_date DATE,
    FOREIGN KEY (emp_id) REFERENCES employee(emp_id)
);
