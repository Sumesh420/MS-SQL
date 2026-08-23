--TOPIC IS ALTERING TABLE
SELECT DB_NAME();
USE company;
-- Command to check tables in database
SELECT name from sys.tables;

EXEC sp_tables;
-- To Alter table column NAME
EXEC sp_rename
'employees.f_name','firstname','COLUMN';
-- Altering table name
EXEC sp_rename
'employees','staff';
EXEC sp_rename
'staff','employees';

ExEC sp_help 'employees';

ALTER TABLE employees
ADD phone VARCHAR(12);

SELECT * FROM employees;

ALTER TABLE employees
DROP COLUMN phone;

EXEC sp_help 'employees';

--QUERY TO ALTER COLUMN DATATYPE OR CONSTRAINT OF COLUMN


--TO ALTER DATTYPE OR DATATYPE LENGTH
ALTER TABLE employees
ALTER COLUMN e_mail VARCHAR(100) NOT NULL;

--HERE IS A QUERY TO CHANGE CONSTRAINT BUT WHILE CHANGING CONSTRAINT E.G CHANGING TO NOT NULL THEN ALL VALUES IN COLUMN SHOULD nNOT CONTAIN NULL VALUE
ALTER TABLE employees
ALTER COLUMN job_title VARCHAR(50) NOT NULL;
