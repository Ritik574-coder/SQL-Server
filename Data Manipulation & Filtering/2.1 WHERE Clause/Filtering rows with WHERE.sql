/*======================================================================================================================
WHAT IS WHERE CLAUSE ? 
The WHERE clause in SQL is used to filter records from a table based on specific conditions.
It tells the database which rows to return when you run a query. Without it, a SELECT statement
will return all rows from the table.
------------------------------------------------------------------------------------------------------------------------
You use the WHERE clause whenever you want to:

     - Filter specific rows (e.g., only employees in the Finance department).
     - Exclude unwanted data (e.g., products not in stock).
     - Apply conditions (e.g., customers older than 30).
     - Work with patterns (e.g., names starting with "A").
     - Check for null values (e.g., missing supplier IDs).

Author : Ritik__ 
======================================================================================================================*/
--WHERE Clause Practice Questions

-- Employees Table  
-- Write a query to select all employees whose department is 'Finance'.
  SELECT 
      emp_firstname ,
      emp_lastname ,
      emp_salary ,
      emp_email ,
      emp_department
    FROM dbo.Employees 
  WHERE department = 'Finance' . 
  
-- Products Table  
-- Find all products with a price greater than 500.
  SELECT 
      prd_id ,
      prd_key ,
      prd_name ,
      prd_price , 
      prd_quantity 
  FROM dbo.products
  WHERE dbo.price > 500 ; 

-- Students Table  
-- Show students who scored less than 40 marks.
  SELECT * FROM student
  WHERE scored < 40 ; 

-- Customers Table  
-- List customers who live in 'Delhi'.
  SELECT * FROM dbo.csutomer
  WHERE city = 'Delhi' ;

-- Orders Table  
-- Retrieve all orders where the status is 'Pending'.
  SELECT * FROM dbo.orders 
  WHERE status = 'Pending' ;

-- Employees Table  
-- Get employees whose role is either 'Manager' or 'Analyst'.
-- Employees Table  
-- Get employees whose role is either 'Manager' or 'Analyst'.
  SELECT * 
  FROM Employees
  WHERE Role IN ('Manager', 'Analyst');

-- Products Table  
-- Find products that are not in the category 'Electronics'.
  SELECT * 
  FROM Products
  WHERE Category <> 'Electronics';

-- Students Table  
-- Show students whose names start with 'A'.
  SELECT * 
  FROM Students
  WHERE Name LIKE 'A%';

-- Orders Table  
-- Retrieve all orders placed before '2025-01-01'.
  SELECT * 
  FROM Orders
  WHERE OrderDate < '2025-01-01';

