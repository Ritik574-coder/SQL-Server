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









    
