SELECT DB_NAME();
EXEC sp_tables;
USE COMPANY;
SELECT * FROM employees;
--QUERY TO SET DEFAULT CONSTRAINT FOR COLUMN
ALTER TABLE employees
ADD CONSTRAINT default_title DEFAULT 'Trainee'
FOR job_title;

--QUERY TO SET UNIQUE CONSTRAINT
ALTER TABLE employees
ADD UNIQUE(department);--THIS WILL NOT WORK DEPARTMENT ALREADY CONTAINT DUPLICATE VALUES SO THE QUERY  WILL BE TERMINATED

--CHECK CONSTRAINT
ALTER TABLE employees
ADD CONSTRAINT ch_emp_positive_sal CHECK(salary>0)

INSERT INTO employees
VALUES('Reeya','Sharma','reeyasrma420@example.com','HR Manager','Tech',50000, '2023-01-01','California');
SELECT * FROM employees;
INSERT INTO employees
VALUES('Deeya','Sharma','deeyasrma421@example.com','Data Scientist','Tech',-50000, '2023-01-01','California');--This will not work bcz of our chk_positive_salary CHECK CONSTRAINT
--TO DROP THE CONSTRAINT
ALTER TABLE employees
DROP CONSTRAINT ch_emp_positive_sal;
--NOW THIS WILL WORK
INSERT INTO employees
VALUES('Deeya','Sharma','deeyasrma421@example.com','Data Scientist','Tech',-50000, '2023-01-01','California');

ALTER TABLE employees
ADD CONSTRAINT chk_valid_email CHECK(e_mail LIKE '%@%.%') ;

INSERT INTO employees
VALUES('Sheela','Sharma','sheelasrma422@gmail_com','Data Scientist','Tech',-50000, '2023-01-01','California');--THIS WILL NOT WORK BCZ OF INVALID EMAIL