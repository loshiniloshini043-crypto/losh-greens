create database company_db;
use company_db;
CREATE TABLE skills (
    skill_id INT IDENTITY(1,1) PRIMARY KEY,
    skill_name VARCHAR(100) NOT NULL,
    category VARCHAR(100)
);
select*from skills;
EXEC sp_rename 'employee', 'staff';
CREATE TABLE department (
    dept_id INT IDENTITY(1,1) PRIMARY KEY,
    dept_name VARCHAR(100),
    location VARCHAR(100)
);
CREATE TABLE employee (
    emp_id INT IDENTITY(1,1) PRIMARY KEY,
    first_name VARCHAR(100),
    email VARCHAR(100),
    hire_date DATE,
    salary DECIMAL(10,2),
    dept_id INT,
    gender VARCHAR(10)
);
CREATE TABLE project (
    project_id INT IDENTITY(1,1) PRIMARY KEY,
    project_name VARCHAR(100),
    budget DECIMAL(10,2),
    dept_id INT
);
INSERT INTO employee (first_name, email, hire_date, salary, dept_id, gender)
VALUES ('Alice Green', 'alice.green@company.com', '2024-01-10', 62000.00, 4, 'Female');
INSERT INTO project (project_name, budget, dept_id)
VALUES 
('Mobile App', 60000.00, 2),
('Training Program', 25000.00, 1);
INSERT INTO department (dept_name, location)
VALUES ('Sales', 'Boston');
INSERT INTO employee (first_name, email)
VALUES ('Tom', 'tom@company.com');
select*from employee;
select*from project;
select*from department;
SELECT 
    emp_id AS "Employee ID",
    first_name AS "Name",
    email AS "Email Address"
FROM employee;
SELECT *
FROM employee
WHERE hire_date > '2023-01-01';
SELECT *
FROM project
WHERE budget > 40000.00
ORDER BY budget DESC;
SELECT DISTINCT location
FROM department;
SELECT * 
FROM employee;

SELECT 
    emp_id AS "Employee ID",
    first_name AS "Name",
    email AS "Email Address"
FROM employee;

SELECT *
FROM employee
WHERE hire_date > '2023-01-01';

SELECT *
FROM project
WHERE budget > 40000.00
ORDER BY budget DESC;

SELECT DISTINCT location
FROM department;

ALTER TABLE employee
ADD phone_number VARCHAR(15);

UPDATE employee
SET salary = 65000.00
WHERE first_name = 'John' AND last_name = 'Doe';

UPDATE employee
SET gender = 'Other'
WHERE dept_id = 2;

ALTER TABLE employee
DROP COLUMN phone_number;


-- 20
SELECT *
FROM employee
WHERE salary BETWEEN 60000 AND 80000;

-- 21
SELECT *
FROM employee
WHERE first_name LIKE 'J%';

-- 22
SELECT *
FROM project
WHERE dept_id IN (1,2);

-- 23
SELECT *
FROM employee
WHERE email IS NOT NULL;

-- 24
SELECT *
FROM department
WHERE location NOT IN ('New York','Chicago');

-- 25
SELECT *
FROM employee
WHERE YEAR(hire_date) = 2023;

-- 26
SELECT SUM(salary)
FROM employee;

-- 27
SELECT AVG(budget)
FROM project;

-- 28
SELECT MAX(salary)
FROM employee;

-- 29
SELECT COUNT(*)
FROM employee
WHERE dept_id = 2;

-- 30
SELECT MIN(budget)
FROM project;

-- 31
SELECT e.first_name, d.dept_name
FROM employee e
JOIN department d
ON e.dept_id = d.dept_id;

-- 32
SELECT d.dept_name, COUNT(e.emp_id)
FROM department d
LEFT JOIN employee e
ON d.dept_id = e.dept_id
GROUP BY d.dept_name;

-- 33
SELECT p.project_name, d.dept_name
FROM project p
JOIN department d
ON p.dept_id = d.dept_id;

-- 34
SELECT e.first_name
FROM employee e
JOIN department d
ON e.dept_id = d.dept_id
WHERE d.location = 'San Francisco';

-- 35
SELECT d.dept_name
FROM department d
LEFT JOIN project p
ON d.dept_id = p.dept_id
WHERE p.project_id IS NULL;

-- 36
SELECT CONCAT(first_name,' ',last_name) AS "Full Name"
FROM employee;

-- 37
SELECT UPPER(dept_name)
FROM department;

-- 38
SELECT LEFT(email,3)
FROM employee;

-- 39
SELECT ABS(-50000);

-- 40
SELECT ROUND(AVG(salary),2)
FROM employee;

-- 41
SELECT *
FROM employee
ORDER BY hire_date DESC
LIMIT 3;

-- 42
SELECT *
FROM employee
ORDER BY emp_id
LIMIT 3 OFFSET 3;

-- 43
SELECT first_name,
IF(salary >= 70000,'High','Low') AS Salary_Level
FROM employee;

-- 44
SELECT project_name,
CASE
WHEN budget >= 60000 THEN 'Large'
WHEN budget >= 40000 THEN 'Medium'
ELSE 'Small'
END AS Budget_Category
FROM project;

-- 45
SELECT dept_id, SUM(budget)
FROM project
GROUP BY dept_id;

-- 46
SELECT first_name
FROM employee
ORDER BY LENGTH(first_name) DESC
LIMIT 1;

-- 47
SELECT *
FROM employee
WHERE hire_date >= DATE_SUB('2025-03-22', INTERVAL 90 DAY);

-- 48
DELETE FROM employee
WHERE salary < 60000;

-- 49
DROP TABLE project;

-- 50
SOURCE backup_file.sql;
SHOW DATABASES;
DROP DATABASE company_db;