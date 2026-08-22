SELECT DB_NAME()
USE company
SELECT DB_NAME()
EXEC sp_databases
TRUNCATE TABLE employees
SELECT * FROM employees
INSERT INTO employees

(f_name, l_name, e_mail, job_title, department, salary, hire_date, city)

VALUES

('Aarav', 'Sharma', 'aarav.sharma@example.com', 'Director', 'Management', 180000, '2019-02-10', 'Mumbai'),

('Diya', 'Patel', 'diya.patel@example.com', 'Lead Engineer', 'Tech', 120000, '2020-08-15', 'Bengaluru'),

('Rohan', 'Mehra', 'rohan.mehra@example.com', 'Software Engineer', 'Tech', 85000, '2022-05-20', 'Bengaluru'),

('Priya', 'Singh', 'priya.singh@example.com', 'HR Manager', 'Human Resources', 95000, '2019-11-05', 'Mumbai'),

('Arjun', 'Kumar', 'arjun.kumar@example.com', 'Data Scientist', 'Tech', 110000, '2021-07-12', 'Hyderabad'),

('Ananya', 'Gupta', 'ananya.gupta@example.com', 'Marketing Lead', 'Marketing', 90000, '2020-03-01', 'Delhi'),

('Vikram', 'Reddy', 'vikram.reddy@example.com', 'Sales Executive', 'Sales', 75000, '2023-01-30', 'Mumbai'),

('Sameera', 'Rao', 'sameera.rao@example.com', 'Software Engineer', 'Tech', 88000, '2023-06-25', 'Pune'),

('Ishaan', 'Verma', 'ishaan.verma@example.com', 'Recruiter', 'Human Resources', 65000, '2022-09-01', 'Mumbai'),

('Kavya', 'Joshi', 'kavya.joshi@example.com', 'Product Designer', 'Design', 92000, '2021-04-18', 'Bengaluru'),

('Zain', 'Khan', 'zain.khan@example.com', 'Sales Manager', 'Sales', 115000, '2019-09-14', 'Delhi'),

('Nisha', 'Desai', 'nisha.desai@example.com', 'Jr. Data Analyst', 'Tech', 70000, '2024-02-01', 'Hyderabad'),

('Aditya', 'Nair', 'aditya.nair@example.com', 'Marketing Analyst', 'Marketing', 68000, '2022-10-10', 'Delhi'),

('Fatima', 'Ali', 'fatima.ali@example.com', 'Sales Executive', 'Sales', 78000, '2022-11-22', 'Mumbai'),

('Kabir', 'Shah', 'kabir.shah@example.com', 'DevOps Engineer', 'Tech', 105000, '2020-12-01', 'Pune');

INSERT INTO employees (f_name, l_name, e_mail, job_title, department, salary, hire_date, city) VALUES

( 'Riya', 'Reddy', 'riya.reddy@example.com', 'Director', 'Management', 170000, '2019-03-10', 'Texas');
INSERT INTO employees (f_name, l_name, e_mail, job_title, department, city) VALUES

( 'Atul', 'Reddy', 'atul.reddy@example.com', 'Product Dsigner', 'Design', 'Texas');

SELECT * FROM employees;

--CLAUSE 

--WHERE CLAUSE & ORDER BY CLAUSE

SELECT * FROM employees WHERE employees.department='Tech' ORDER BY employees.salary DESC;

SELECT * FROM employees WHERE employees.department != 'Sales' ORDER BY employees.f_name;

SELECT * FROM employees WHERE employees.hire_date > '2020-12-31' ORDER BY employees.hire_date DESC;

SELECT employees.f_name FROM employees;


--DISTINCT CLAUSE

SELECT DISTINCT employees.f_name FROM employees;


--LIKE  CLAUSE

SELECT * FROM employees WHERE employees.f_name LIKE '%IY%';

SELECT * FROM employees WHERE employees.department LIKE 'T%';

SELECT * FROM employees WHERE employees.f_name LIKE '%n';

SELECT * FROM employees WHERE employees.f_name LIKE '[ABCD]%' ORDER BY employees.f_name;

SELECT employees.f_name FROM employees WHERE employees.f_name LIKE '[^ABCD]%';

SELECT employees.f_name FROM employees WHERE employees.f_name LIKE '[A-H]%';

SELECT employees.f_name FROM employees WHERE employees.f_name LIKE '%[A-L]';

SELECT employees.f_name FROM employees WHERE employees.f_name LIKE 'A%A';

SELECT * FROM employees WHERE employees.f_name LIKE '_a%';

SELECT * FROM employees WHERE employees.f_name LIKE '____';

--TOP CLAUSE

SELECT TOP 5 * FROM employees ORDER BY employees.hire_date;

SELECT TOP 5 * FROM employees ORDER BY employees.salary DESC;