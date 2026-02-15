/* ============================================================
   SQL Server - DQL Commands
   Author: Ritik574-coder
   Purpose: Definitions + Example Queries
   ============================================================ */

/* 1. SELECT
   Definition: Retrieves data from one or more tables.
   WHY? - To query and analyze stored information.
   WHEN? - Anytime you need to read data.
   HOW? - SELECT column_list FROM table_name WHERE condition;
*/
SELECT EmpID, Name, Salary FROM Employees;

/* 2. SELECT with WHERE
   Definition: Filters rows based on conditions.
   WHY? - To retrieve only relevant data.
   WHEN? - When you need specific subsets of data.
*/
SELECT Name, Age FROM Employees WHERE Age > 25;

/* 3. SELECT with ORDER BY
   Definition: Sorts query results.
   WHY? - To organize data in ascending/descending order.
   WHEN? - For reporting or analysis.
*/
SELECT Name, Salary FROM Employees ORDER BY Salary DESC;

/* 4. SELECT with GROUP BY
   Definition: Groups rows sharing values into summary rows.
   WHY? - To perform aggregate calculations.
   WHEN? - For totals, averages, counts by category.
*/
SELECT DeptID, AVG(Salary) AS AvgSalary
FROM Employees
GROUP BY DeptID;

/* 5. SELECT with HAVING
   Definition: Filters groups after aggregation.
   WHY? - To apply conditions on grouped results.
   WHEN? - For advanced reporting.
*/
SELECT DeptID, COUNT(*) AS EmpCount
FROM Employees
GROUP BY DeptID
HAVING COUNT(*) > 5;

/* 6. SELECT with DISTINCT
   Definition: Returns unique values only.
   WHY? - To eliminate duplicates.
   WHEN? - For lists of unique attributes.
*/
SELECT DISTINCT DeptID FROM Employees;

/* 7. SELECT with JOIN
   Definition: Combines rows from multiple tables.
   WHY? - To query related data together.
   WHEN? - For relationships between entities.
*/
SELECT e.Name, d.DeptName
FROM Employees e
JOIN Departments d ON e.DeptID = d.DeptID;

/* 8. SELECT with Subquery
   Definition: Uses a query inside another query.
   WHY? - To filter or calculate based on nested results.
   WHEN? - For complex conditions.
*/
SELECT Name, Salary
FROM Employees
WHERE Salary > (SELECT AVG(Salary) FROM Employees);

/* 9. SELECT TOP
   Definition: Limits number of rows returned.
   WHY? - To preview or restrict results.
   WHEN? - For sampling or pagination.
*/
SELECT TOP 5 Name, Salary FROM Employees ORDER BY Salary DESC;

/* 10. SELECT with CASE
   Definition: Adds conditional logic in queries.
   WHY? - To categorize or transform data.
   WHEN? - For custom labels or computed columns.
*/
SELECT Name,
       Salary,
       CASE 
           WHEN Salary >= 50000 THEN 'High'
           WHEN Salary >= 30000 THEN 'Medium'
           ELSE 'Low'
       END AS SalaryCategory
FROM Employees;
