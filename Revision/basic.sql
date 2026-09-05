SELECT DB_NAME();
DROP DATABASE company;
EXEC sp_databases;
USE school_db;

CREATE DATABASE company;
USE company;

EXEC sp_help "employees";

CREATE TABLE employees (
   id INT IDENTITY(1,1),
   first_name VARCHAR(50) NOT NULL,
   country VARCHAR(100) NOT NULL,
   score INT NOT NULL,
   CONSTRAINT pk_employees PRIMARY KEY(id)
);
--DROP TABLE employees;

INSERT INTO employees VALUES('Maria','UZBEKISTAN',590),
                      ('Atul','INDIA',900),
                      ('Anshika','INDIA',990),
                      ('John','USA',780),
                      ('Martin','USA',890),
                      ('Georg','UZBEKISTAN',0),
                      ('Rahim','Iran',321);

SELECT * FROM employees where country <> 'INDIA';

SELECT first_name, country FROM employees;

SELECT first_name, score FROM employees WHERE country='INDIA' ORDER BY score DESC;

SELECT * FROM employees ORDER BY score DESC;