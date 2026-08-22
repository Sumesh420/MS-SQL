SELECT DB_NAME();
USE company;
--String Function--

--CONCAT--
SELECT CONCAT(f_name,' ',l_name) FROM employees;



--CONCAT_WS--
SELECT CONCAT_WS(',',emp_id,f_name,l_name,department,salary) FROM employees;

--SUBSTRING--
SELECT SUBSTRING('Hey buddy',1,5) FROM employees;  --LAST INDEX INCLUSIVE

--REPLACE--
SELECT REPLACE(department,'Human Resources','HR') FROM employees;

--REVERSE--
SELECT REVERSE('Hello');

--LENGTH--

SELECT LEN(e_mail) as email_length FROM employees;

--UPPER & LOWER--

SELECT UPPER(f_name) as Name_uppercase FROM employees;
SELECT LOWER(f_name) as Name_lowercase FROM employees;

--RIGHT & left---

SELECT LEFT(f_name,4) FROM employees; 
SELECT RIGHT(l_name,4) FROM employees; 

-- TRIM & CHARINDEX--

SELECT TRIM('   Alright   ');
SELECT LEN(TRIM('   Alright   '));

SELECT CHARINDEX('OM','THOMAS');