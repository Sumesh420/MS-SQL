
SELECT DB_NAME()
CREATE DATABASE company
USE company
SELECT DB_NAME()
EXEC sp_databases
USE company
SELECT DB_NAME()
CREATE TABLE employees(
    emp_id INT PRIMARY KEY IDENTITY(1,2),
    f_name VARCHAR(50) NOT NULL,
    l_name VARCHAR(50) NOT NULL,
    e_mail VARCHAR(70) NOT NULL UNIQUE,
    job_title VARCHAR(50) NOT NULL,
    department VARCHAR(50) NOT NULL,
    salary DECIMAL(10,2) DEFAULT 30000.00,
    
    hire_date DATE NOT NULL DEFAULT CONVERT(date,GETDATE()),
    city VARCHAR(50) NOT NULL
)
EXEC sp_help "employees"
SELECT * FROM employees
SELECT emp_id,f_name FROM employees
DROP TABLE employees
INSERT INTO employees
VALUES (
    'Nikhl',
    'Sharma',
    'nikhAL@gmail.com',
    'Software Engineer',
    'Tech',
    50000,
    '2023-01-01',
    'Mandi'
);
SELECT * FROM employees
EXEC sp_help "employees"

