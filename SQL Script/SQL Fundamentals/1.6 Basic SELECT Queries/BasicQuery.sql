/* ============================================================
   BASIC SELECT STATEMENTS – Bronze.crm_employee_info
   ============================================================ */

---------------------------------------------------------------
-- 1. Select specific columns
---------------------------------------------------------------
SELECT 
    first_name,
    last_name,
    country,
    city,
    email
FROM Bronze.crm_employee_info;


---------------------------------------------------------------
-- 2. Select all columns (*)
--    Use carefully in production (performance + readability)
---------------------------------------------------------------
SELECT *
FROM Bronze.crm_employee_info;


---------------------------------------------------------------
-- 3. Select only required columns
---------------------------------------------------------------
SELECT 
    first_name,
    last_name
FROM Bronze.crm_employee_info;


---------------------------------------------------------------
-- 4. Column Aliases (AS)
--    Improves readability in result set
---------------------------------------------------------------
SELECT 
    first_name AS FirstName,
    last_name  AS LastName,
    country    AS EmployeeCountry,
    city       AS EmployeeCity,
    email      AS EmployeeEmailID
FROM Bronze.crm_employee_info;


---------------------------------------------------------------
-- 5. DISTINCT
--    Returns unique values only
---------------------------------------------------------------
SELECT DISTINCT
    email AS Employee_Email
FROM Bronze.crm_employee_info;


---------------------------------------------------------------
-- 6. TOP
--    Returns limited number of rows (SQL Server syntax)
---------------------------------------------------------------
SELECT TOP (5) *
FROM Bronze.crm_employee_info;


---------------------------------------------------------------
-- 7. ORDER BY (Descending)
--    Highest salary first
---------------------------------------------------------------
SELECT TOP (5)
    first_name AS FirstName,
    last_name  AS LastName,
    country    AS EmployeeCountry,
    city       AS EmployeeCity,
    email      AS EmployeeEmailID,
    salary
FROM Bronze.crm_employee_info
ORDER BY salary DESC;


---------------------------------------------------------------
-- 8. ORDER BY (Ascending)
--    Lowest salary first
---------------------------------------------------------------
SELECT TOP (5)
    first_name AS FirstName,
    last_name  AS LastName,
    country    AS EmployeeCountry,
    city       AS EmployeeCity,
    email      AS EmployeeEmailID,
    salary
FROM Bronze.crm_employee_info
ORDER BY salary ASC;


---------------------------------------------------------------
-- 9. ORDER BY multiple columns
--    Priority:
--      1. salary (DESC)
--      2. first_name (ASC)
--      3. country (ASC)
---------------------------------------------------------------
SELECT TOP (5)
    first_name AS FirstName,
    last_name  AS LastName,
    country    AS EmployeeCountry,
    city       AS EmployeeCity,
    email      AS EmployeeEmailID,
    salary
FROM Bronze.crm_employee_info
ORDER BY 
    salary DESC,
    first_name ASC,
    country ASC;



