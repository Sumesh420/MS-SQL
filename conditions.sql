SELECT
    *
FROM
    employees
SELECT
    f_name,
    l_name,
    department,
    CASE
        WHEN salary > 100000 THEN 'High Earner'
        WHEN salary BETWEEN 70000
        AND 100000 THEN 'Medium Earner'
        ELSE 'Standard Earner'
    END as salary_category
FROM
    employees
SELECT
    SUM(salary) AS TOTAL
FROM
    employees;

SELECT
    department,
    COUNT(emp_id) AS count
FROM
    employees
GROUP BY
    department;

EXEC sp_databases USE company;

SELECT
    DB_NAME();

EXEC sp_help "employees"
SELECT
    name
FROM
    sys.tables;

EXEC sp_tables;

SELECT
    *
FROM
    employees
WHERE
    employees.department = 'Human Resources'
ORDER BY
    employees.salary DESC;

--IN BETWEEN AND NOT IN used for writing conditions----
SELECT
    f_name
FROM
    employees
WHERE
    employees.department IN ('Tech', 'Sales');

SELECT
    f_name
FROM
    employees
WHERE
    employees.salary BETWEEN 75000
    AND 115000;

SELECT
    *
FROM
    employees
WHERE
    employees.salary NOT BETWEEN 75000
    AND 87000
ORDER BY
    employees.salary ASC;

SELECT
    *
FROM
    employees
WHERE
    employees.department NOT IN ('Tech')
ORDER BY
    employees.salary ASC;

---CASE WHEN used with writing conditions----
SELECT f_name,salary,department,
    CASE
        WHEN employees.salary >= 100000 THEN 'High Earner'
        WHEN employees.salary BETWEEN 75000 AND 99000 THEN 'Medium Earner'
        ELSE 'Standard Earner'
    END AS salary_band
FROM
    employees ORDER BY f_name;


USE company;
--Aggregate functions for performing a calculation on a set of values and returning a single value----

SELECT COUNT(emp_id) from employees;

SELECT SUM(salary) as Total_Salary FROM employees;

SELECT AVG(salary) as Average_Salary FROM employees;

SELECT MIN(salary) as Lowest_Salary FROM employees;

SELECT department,city,SUM(salary) as Total_Salary FROM employees GROUP BY department,city;

SELECT department,SUM(salary) as Total_Salary FROM employees GROUP BY department;
SELECT department,city,COUNT(emp_id) as Employee_Count FROM employees GROUP BY department,city;

SELECT department,city,salary,COUNT(emp_id) as Employee_count FROM employees GROUP BY department,city,salary HAVING AVG(salary)>90000;

USE company;
SELECT DB_NAME()
EXEC sp_databases

SELECT job_title,AVG(salary) as Average_Salary from employees GROUP BY job_title HAVING AVG(salary)>90000;

SELECT * FROM employees;
SELECT department,SUM(salary) as Total_Salary from employees GROUP BY department HAVING SUM(salary)>300000; 

SELECT department,COUNT(emp_id) as EMPLOYEE_COUNT FROM employees GROUP BY ROLLUP(department);

SELECT department,COALESCE(city,'Total'),COUNT(emp_id) FROM employees GROUP BY ROLLUP(department,city);