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

