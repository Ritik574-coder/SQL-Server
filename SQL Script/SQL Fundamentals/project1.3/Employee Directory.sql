/*=============================================================================================
Project 1.3: Employee Directory
Description: Create an employee management database

Schema Design:

employees (employee_id, first_name, last_name, email, hire_date, salary, department)
Write basic queries to explore the data

Author : Ritik__
=============================================================================================*/
-- swith database to master 
USE master ; 
GO 

-- safty check 
IF DB_NAME() NOT IN ('master')
BEGIN
    THROW 50000, 'Run these scripts for master only.', 1;
    RETURN;
END;
GO

--- creating database EmployeeDirectory 
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'EmployeeDirectory')
BEGIN 
    PRINT 'Dropping database EmployeeDirectory';
    ALTER DATABASE EmployeeDirectory SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE EmployeeDirectory;
END;
GO
  
-- creting database 
CREATE DATABASE EmployeeDirectory ;
GO 

-- switch database to EmployeeDirectory 
USE EmployeeDirectory ;
GO 
  
-- creating schema employees 
IF NOT EXISTS(SELECT 1 FROM sys.schemas WHERE name = 'employees')
BEGIN
    PRINT 'creating employees schema' ;
    EXEC sys.sp_executesql N'CREATE SCHEMA employees AUTHORIZATION dbo' ;
END ;
GO 

--=====================================================================
-- creating table employee | SOURCE - CSV
--=====================================================================
IF OBJECT_NAME('employee' , 'U') IS NOT NULL 
BEGIN
    PRINT 'Dropping table employee' ;
    DROP TABLE employee ;
END ;
GO 

-- creating table employee ;
CREATE TABLE employee 
(  
    employee_id INT IDENTITY(1,1) PRIMARY KEY,
    first_name  NVARCHAR(100) NOT NULL,
    last_name   NVARCHAR(100) NOT NULL,
    email       NVARCHAR(100) UNIQUE NOT NULL,
    hire_date   DATE,
    salary      DECIMAL(10,2),
    department  NVARCHAR(151) NOT NULL
);
GO

-- insert data into employee table 
INSERT INTO employee (first_name, last_name, email, hire_date, salary, department) VALUES
('Amit', 'Sharma', 'amit.sharma@example.com', '2020-01-15', 55000.00, 'HR'),
('Priya', 'Verma', 'priya.verma@example.com', '2019-03-22', 62000.00, 'Finance'),
('Rohan', 'Singh', 'rohan.singh@example.com', '2021-07-10', 48000.00, 'IT'),
('Sneha', 'Patel', 'sneha.patel@example.com', '2018-11-05', 75000.00, 'Marketing'),
('Vikas', 'Gupta', 'vikas.gupta@example.com', '2022-02-18', 51000.00, 'Sales'),
('Anjali', 'Mehta', 'anjali.mehta@example.com', '2020-09-30', 67000.00, 'Finance'),
('Karan', 'Yadav', 'karan.yadav@example.com', '2017-06-12', 80000.00, 'Operations'),
('Neha', 'Rao', 'neha.rao@example.com', '2021-12-01', 45000.00, 'HR'),
('Arjun', 'Kapoor', 'arjun.kapoor@example.com', '2019-08-25', 72000.00, 'IT'),
('Meera', 'Joshi', 'meera.joshi@example.com', '2020-04-14', 53000.00, 'Sales'),
('Rahul', 'Nair', 'rahul.nair@example.com', '2018-10-20', 69000.00, 'Finance'),
('Divya', 'Chauhan', 'divya.chauhan@example.com', '2022-05-09', 47000.00, 'HR'),
('Sahil', 'Malhotra', 'sahil.malhotra@example.com', '2019-01-03', 81000.00, 'Operations'),
('Pooja', 'Bhatia', 'pooja.bhatia@example.com', '2021-03-27', 56000.00, 'Marketing'),
('Manish', 'Kumar', 'manish.kumar@example.com', '2020-07-19', 60000.00, 'IT'),
('Ritika', 'Shah', 'ritika.shah@example.com', '2018-12-11', 74000.00, 'Finance'),
('Deepak', 'Reddy', 'deepak.reddy@example.com', '2022-08-16', 52000.00, 'Sales'),
('Komal', 'Desai', 'komal.desai@example.com', '2019-05-28', 68000.00, 'HR'),
('Suresh', 'Iyer', 'suresh.iyer@example.com', '2021-09-07', 49000.00, 'Operations'),
('Alok', 'Mishra', 'alok.mishra@example.com', '2020-02-23', 77000.00, 'Marketing');
GO








    
