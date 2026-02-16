--===========================================================================================================
/*
===========================================
WHERE Clause Filtering – Lesson Overview
===========================================

1. Comparison Operators (=, !=, <, >, <=, >=)
   - Description: Used to compare column values with constants or other columns.
   - Use Case: Find employees with salary > 50000, or products where price != 100.

2. BETWEEN Operator
   - Description: Filters rows within a range (inclusive of boundaries).
   - Use Case: Get students scoring BETWEEN 50 AND 80 marks.

3. IN Operator
   - Description: Matches values against a list of possible options.
   - Use Case: Select employees whose role is IN ('Manager', 'Analyst', 'Developer').

4. NOT IN Operator
   - Description: Excludes rows that match any value in a list.
   - Use Case: Find products NOT IN ('Electronics', 'Furniture').

5. IS NULL / IS NOT NULL
   - Description: Checks for missing (NULL) or existing (NOT NULL) values.
   - Use Case: Show customers WHERE Phone IS NULL (no phone number recorded).

6. LIKE Operator (case-sensitive) / ILIKE Operator (case-insensitive)
   - Description: Pattern matching using wildcards.
   - Use Case: Find names LIKE 'A%' (starting with A), or ILIKE '%son' (ending with 'son').

7. Wildcards (%, _)
   - Description: Used with LIKE/ILIKE for flexible pattern matching.
     - % = matches any sequence of characters
     - _ = matches a single character
   - Use Case: WHERE Name LIKE 'S%' (names starting with S),
               WHERE Code LIKE 'A_1' (A followed by any single character, then 1).

-------------------------------------------
Summary:
The WHERE clause is the filter engine of SQL.
It lets you control which rows are returned by applying conditions.
These operators give you powerful ways to narrow down results:
- Exact matches
- Ranges
- Lists
- Exclusions
- Null checks
- Pattern searches
-------------------------------------------
Author : Ritik__
*/ 
--====================================================================================================================

----------------------------------------------------------------
-- where clause & Comparison Operators (=, !=, <, >, <=, >=)
----------------------------------------------------------------

-- Employees Table  
-- Write a query to select all employees whose department is 'Finance'.
  SELECT * FROM dbo.Employees 
  WHERE department = 'Finance' ; 

-- Products Table  
-- Find all products with a price greater than 500.
  SELECT * FROM dbo.products 
  WHERE price > 500 ; 

-- Students Table  
-- Show students who scored less than or equal to  40 marks.
  SELECT * FROM dbo.students 
  WHERE scored >= 40 ; 

-- Customers Table  
-- List customers who live in 'Delhi'.
  SELECT * FROM dbo.csutomer 
  WHERE city = 'Delhi' ;

-- Orders Table  
-- Retrieve all orders where the status is 'Pending'.
  SELECT * FROM dbo.orders 
  WHERE status = 'Pending' ; 

---------------------------------------------------------------------
-- in , not in use case with where clause 
---------------------------------------------------------------------

-- Employees Table  
-- Select employees whose role is IN ('Manager', 'Analyst', 'Developer').
  SELECT 
      emp_firstname ,
      emp_lastname ,
      emp_salary ,
      emp_department ,
      emp_role 
  FROM dbo.employee
  WHERE role IN ('Manager', 'Analyst', 'Developer') ;

-- Products Table  
-- Find products whose category is IN ('Electronics', 'Furniture', 'Clothing').
  SELECT 
      prd_id ,
      prd_key ,
      prd_cat ,
      prd_name ,
      prd_cost ,
      prd_quentity 
  FROM dbo.prodcuts 
  WHERE prd_cat IN ('Manager', 'Analyst', 'Developer') ; 

-- Students Table  
-- Show students whose grade is NOT IN ('A', 'B').
  SELECT
      std_it ,
      std_firstname ,
      std_lastname ,
      std_score ,
      std_grage ,
      std_marks
  FROM dbo.students
  WHERE grede NOT IN ('A' , 'B') ; 

-- Customers Table  
-- Retrieve customers whose city is IN ('Delhi', 'Mumbai', 'Kolkata').
  SELECT 
      cst_id , 
      cst_firstname ,
      cst_lastname ,
      cst_phome , 
      cst_email ,
      cst_city ,
      cst_country 
  FROM dbo.csutomer 
  WHERE city IN ('Delhi', 'Mumbai', 'Kolkata') ;

-- Orders Table  
-- Get orders whose status is NOT IN ('Shipped', 'Delivered').
  SELECT 
      order_id ,
      customer_id ,
      product_id ,
      prodcut_name ,
      prodcut_cat
  FROM dbo.orders 
  WHERE status NOT IN ('Shipped', 'Delivered') ;

---------------------------------------------------------------------
-- (null , is not null) in use case with where clause 
---------------------------------------------------------------------

-- Employees Table  
-- Select employees whose ManagerID IS NULL (no manager assigned).
    SELECT 
        emp_firstname ,
        emp_lastname ,
        emp_salary ,
        emp_department ,
        emp_role 
    FROM dbo.employee
    WHERE ManagerID IS NULL ;

-- Products Table  
-- Find products where SupplierID IS NOT NULL (supplier is assigned).
    SELECT 
        order_id ,
        customer_id ,
        product_id ,
        prodcut_name ,
        prodcut_cat
    FROM dbo.orders 
    WHERE SupplierID IS NOT NULL ;

---------------------------------------------------------------------
-- bwtween use case with where clause 
---------------------------------------------------------------------

-- Employees Table  
-- Select employees whose salary is BETWEEN 30000 AND 50000.
    SELECT 
        emp_firstname ,
        emp_lastname ,
        emp_salary ,
        emp_department ,
        emp_role 
    FROM dbo.employee
    WHERE emp_salary BETWEEN 30000 AND 50000 ;

-- Products Table  
-- Find products with a prd_coust BETWEEN 100 AND 500.
    SELECT 
        prd_id ,
        prd_key ,
        prd_cat ,
        prd_name ,
        prd_cost ,
        prd_quentity 
    FROM dbo.prodcuts 
    WHERE  prd_cost BETWEEN 100 AND 500 ; 

-- Students Table  
-- Show students whose marks are BETWEEN 50 AND 80.
    SELECT
        std_it ,
        std_firstname ,
        std_lastname ,
        std_score ,
        std_grage ,
        std_marks
    FROM dbo.students
    WHERE  std_marks BETWEEN 50 AND 80 ; 

-- Customers Table  
-- Retrieve cst_age whose age is BETWEEN 25 AND 35.
  SELECT 
      cst_id , 
      cst_firstname ,
      cst_lastname ,
      cst_age ,
      cst_phome , 
      cst_email ,
      cst_city ,
      cst_country 
  FROM dbo.csutomer 
  WHERE cst_age BETWEEN 25 AND 35 ;

---------------------------------------------------------------------
-- like use case with where clause 
---------------------------------------------------------------------
-- Employees Table  
-- Select employees whose names start with 'A' (use LIKE with %).
  SELECT * 
  FROM Employees
  WHERE Name LIKE 'A%';

-- Products Table  
-- Find products whose category ends with 'ics' (use LIKE with %).
  SELECT * 
  FROM Products
  WHERE Category LIKE '%ics';

-- Students Table  
-- Show students whose email contains 'gmail' (use LIKE with %).
  SELECT * 
  FROM Students
  WHERE Email LIKE '%gmail%';

-- Customers Table  
-- Retrieve customers whose phone number starts with '98' (use LIKE with %).
  SELECT * 
  FROM Customers
  WHERE PhoneNumber LIKE '98%';

-- Orders Table  
-- Get orders where OrderID has exactly 5 characters (use LIKE with _).
  SELECT * 
  FROM Orders
  WHERE OrderID LIKE '_____';
