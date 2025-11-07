
-- Project 8 SQL Script
-- Database: Project8

CREATE DATABASE IF NOT EXISTS Project8;
USE Project8;

-- Step 1: Create Tables

CREATE TABLE Customer (
    CustID INT PRIMARY KEY,
    CustName VARCHAR(50) NOT NULL,
    City VARCHAR(30),
    Age INT,
    Phone VARCHAR(15)
);

CREATE TABLE Employee (
    EmpID INT PRIMARY KEY,
    EmpName VARCHAR(50) NOT NULL,
    Department VARCHAR(30),
    Salary DECIMAL(10,2),
    City VARCHAR(30)
);

-- Step 2: Modify Tables

ALTER TABLE Employee ADD Email VARCHAR(50);
ALTER TABLE Customer RENAME COLUMN CustName TO CustomerName;
ALTER TABLE Customer DROP COLUMN Age;
ALTER TABLE Employee ADD CONSTRAINT chk_salary CHECK (Salary > 0);

-- Step 3: Insert Data

INSERT INTO Customer (CustID, CustomerName, City, Phone)
VALUES
(1, 'Ravi', 'Mumbai', '9998887776'),
(2, 'Alice', 'Delhi', '9991112223'),
(3, 'Kiran', 'Mumbai', '8887776665'),
(4, 'Rahul', 'Chennai', '7776665554'),
(5, 'Sneha', 'Bangalore', '6665554443');

INSERT INTO Employee (EmpID, EmpName, Department, Salary, City, Email)
VALUES
(101, 'John', 'HR', 60000, 'Delhi', 'john@gmail.com'),
(102, 'Amit', 'IT', 55000, 'Mumbai', 'amit@gmail.com'),
(103, 'Priya', 'Finance', 75000, 'Bangalore', 'priya@gmail.com'),
(104, 'Meena', 'Admin', 45000, 'Chennai', 'meena@gmail.com'),
(105, 'Suresh', 'IT', 65000, 'Hyderabad', 'suresh@gmail.com');

-- Step 4: Update and Delete Operations

UPDATE Customer SET Phone = '9990001112' WHERE CustID = 1;
UPDATE Employee SET Department = 'Sales' WHERE EmpName = 'John';
DELETE FROM Customer WHERE CustomerName = 'Alice';

-- Step 5: Display Queries

SELECT * FROM Customer;
SELECT * FROM Employee;

SELECT CustomerName, City FROM Customer WHERE City = 'Mumbai';
SELECT * FROM Employee WHERE Salary > 50000;

-- Step 6: Join Operations

-- INNER JOIN
SELECT C.CustomerName, C.City, E.EmpName, E.Department
FROM Customer C
INNER JOIN Employee E ON C.City = E.City;

-- LEFT JOIN
SELECT C.CustomerName, C.City, E.EmpName, E.Department
FROM Customer C
LEFT JOIN Employee E ON C.City = E.City;

-- RIGHT JOIN
SELECT C.CustomerName, C.City, E.EmpName, E.Department
FROM Customer C
RIGHT JOIN Employee E ON C.City = E.City;

-- FULL OUTER JOIN (using UNION for MySQL)
SELECT C.CustomerName, C.City, E.EmpName, E.Department
FROM Customer C
LEFT JOIN Employee E ON C.City = E.City
UNION
SELECT C.CustomerName, C.City, E.EmpName, E.Department
FROM Customer C
RIGHT JOIN Employee E ON C.City = E.City;

-- CROSS JOIN
SELECT * FROM Customer CROSS JOIN Employee;
