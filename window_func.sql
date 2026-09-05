SELECT DB_NAME();
USE Company;
SELECT * FROM employees;
SELECT firstname,department,salary,SUM(salary) OVER(),CAST(salary*100/SUM(salary) OVER() AS DECIMAL(5,2)) as per_over_total_salary
FROM employees 

SELECT firstname,department,salary,SUM(salary) OVER(PARTITION BY department) as total_dept_salary
FROM employees;

--RANK()
SELECT firstname,department, salary,RANK() OVER(ORDER BY salary DESC) as rank from employees;

UPDATE employees SET salary=180000
WHERE firstname='Reeya';
--DENSE_RANK
SELECT firstname,department, salary,DENSE_RANK() OVER(ORDER BY salary DESC) as rank from employees;

--LAG & LEAD
SELECT firstname,department, salary,LAG(salary) OVER(ORDER BY salary DESC) as prev_person_salary from employees;


SELECT firstname,department, salary,LEAD(salary) OVER(ORDER BY salary DESC) as next_person_salary from employees;

-- WINDOW FUNCTION ROW BETWEEN

SELECT firstname,department,salary,SUM(salary) OVER(ORDER BY salary DESC ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) as running_total FROM employees;

SELECT firstname,hire_date,salary,CAST(AVG(salary) OVER(ORDER BY hire_date ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING) AS DECIMAL(10,2))as three_moving_avg FROM employees;

--FIRST VALUE,LAST VALUE

SELECT firstname,department, FIRST_VALUE(firstname) OVER(PARTITION BY department ORDER BY firstname) as first_employee FROM employees;

SELECT firstname,department, LAST_VALUE(firstname) OVER(PARTITION BY department ORDER BY firstname ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED following) as first_employee FROM employees;

--NTILE

SELECT firstname,salary,NTILE(4) OVER(ORDER BY salary DESC) as salary_quartile FROM employees;

