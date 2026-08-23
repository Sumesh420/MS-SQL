SELECT DB_NAME();

CREATE DATABASE store_db;
USE store_db;

SELECT DB_NAME();

CREATE TABLE Customer(
    customer_id INT IDENTITY(100,1) PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    customer_email VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE Orders(
    order_id INT IDENTITY(5000,1) PRIMARY KEY,
    order_date DATE NOT NULL DEFAULT CONVERT(date,GETDATE()),
    total_amount DECIMAL(10,2) NOT NULL,
    customer_id INT,
    FOREIGN KEY(customer_id) REFERENCES Customer(customer_id)
);

EXEC sp_help 'customer';
EXEC sp_help 'orders';

INSERT INTO Customer (customer_name,customer_email)
Values
    ('Rajkumar','rajk@example.com'),
    ('Rani Kumari','ranik@example.com'),
    ('Raju Sareekha','sareekharaju@example.com');

SELECT * FROM Customer;

INSERT INTO Orders(order_date,total_amount,customer_id)
VALUES
     ('2025-08-15',1500,100),
     ('2025-08-30',800,101),
     ('2025-10-05',2200,100),
     ('2025-10-12',500,102),
     ('2025-10-17',1200,101);

SELECT * FROM Orders;
SELECT * FROM Customer;
TRUNCATE TABLE Orders;

INSERT INTO customer (customer_name,customer_email)
VALUES('Paul','paul@example.com');

SELECT * FROM Customer;

INSERT INTO Orders(order_date,total_amount)
VALUES('2025-08-23',2100);

SELECT * FROM Orders;

-- JOINS 
-- CROSS JOIN

SELECT * FROM Customer CROSS JOIN Orders;

-- INNER JOIN

SELECT * FROM Customer
INNER JOIN Orders ON
Customer.customer_id=Orders.customer_id;

-- USING GROUP BY WITH JOIN 

SELECT c.customer_name,COUNT(order_id) as order_count,SUM(total_amount) as total_amount FROM 
Customer c INNER JOIN Orders o ON
c.customer_id=o.customer_id GROUP BY c.customer_name;

--LEFT JOIN AND GROUP BY

SELECT * FROM 
Customer LEFT JOIN Orders ON
Customer.customer_id=Orders.customer_id;

SELECT c.customer_name,COUNT(order_id) as order_count,SUM(total_amount) as total_amount FROM 
Customer c LEFT JOIN Orders o ON
c.customer_id=o.customer_id GROUP BY c.customer_name;

--RIGHT JOIN AND GROUP BY

SELECT * FROM 
Customer RIGHT JOIN Orders ON
Customer.customer_id=Orders.customer_id;

SELECT c.customer_name,COUNT(order_id) as order_count,SUM(total_amount) as total_amount FROM 
Customer c RIGHT JOIN Orders o ON
c.customer_id=o.customer_id GROUP BY c.customer_name;


SELECT * FROM 
Customer FULL OUTER JOIN Orders ON
Customer.customer_id=Orders.customer_id;


--OUTER APPLY
SELECT c.customer_id,c.customer_name,o.order_id,o.order_date,o.total_amount
FROM Customer as c 
OUTER APPLY(
    SELECT TOP 1 *
    FROM Orders as o
    WHERE o.customer_id=c.customer_id
    ORDER BY o.order_date DESC
) as o;
-- CROSS JOIM
--IT BEHAVES LIKE INNER JOIN
SELECT c.customer_id,c.customer_name,o.order_id,o.order_date,o.total_amount
FROM Customer as c 
CROSS APPLY(
    SELECT TOP 1 *
    FROM Orders as o
    WHERE o.customer_id=c.customer_id
    ORDER BY o.order_date DESC
) as o;

--SELF JOIN

CREATE TABLE CompanyHierarchy(
    emp_id INT PRIMARY KEY,
    Name VARCHAR(80) NOT NULL,
    manager_id INT 
);

INSERT INTO CompanyHierarchy(emp_id,Name,manager_id)
VALUES (1,'Sonia Sharma',NULL),
       (2,'Rohan Gupta',1),
       (3,'Amit Sharma',2),
       (4,'Mitali Sinha',1),
       (5,'Soku Sareekha',1);

SELECT e.Name as Employee_Name,m.Name as Manager_Nmae FROM
CompanyHierarchy as e
LEFT JOIN CompanyHierarchy as m ON
e.manager_id=m.emp_id;