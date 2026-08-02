SELECT name FROM sys.DATABASES
CREATE DATABASE demo
USE demo
SELECT DB_NAME()
CREATE DATABASE school_db
USE school_db
DROP DATABASE demo
EXEC sp_databases
SELECT DB_NAME()
USE school_db

-- CREATING A TABLE
CREATE TABLE student(
s_id INT,
S_name VARCHAR(100),
grade INT,
age INT
)

--FOR CHECKING EXISTING TABLES
EXEC sp_help 'student'

--INSERTING DATA  INTO TABLE
INSERT INTO student VALUES(1,'Rakku',4,7)
INSERT INTO student VALUES(2,'Jaggu',5,8),(3,'Shyam',5,8)
SELECT * FROM student
SELECT s_id,s_name,grade FROM student

--UPDATING EXISTING VALUES IN TABLE
UPDATE student SET grade=10 WHERE s_id=2

SELECT * FROM student
--DELETION FROM TABLE
DELETE FROM student  where s_id=3
TRUNCATE table student
EXEC sp_databases
SELECT * FROM student where s_id=1