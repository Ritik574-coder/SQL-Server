/* ============================================================
   SQL Server - DDL Commands (Basic to Advanced)
   Author: Ritik574-coder
   Purpose: Definitions + Example Queries
   ============================================================ */

/* 1. CREATE DATABASE
   Definition: Creates a new database container.
   WHY? - To organize data into logical units.
   WHEN? - At the start of a new project.
   HOW? - CREATE DATABASE db_name;
*/
CREATE DATABASE CompanyDB;

/* 2. DROP DATABASE
   Definition: Deletes a database permanently.
   WHY? - To remove obsolete or test databases.
   WHEN? - When no longer needed.
   HOW? - DROP DATABASE db_name;
*/
DROP DATABASE CompanyDB;

/* 3. CREATE TABLE
   Definition: Defines a new table structure.
   WHY? - To store data in organized columns.
   WHEN? - At the start of modeling entities.
   HOW? - CREATE TABLE table_name (...);
*/
CREATE TABLE Employees (
    EmpID INT IDENTITY(1,1) PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Age INT CHECK (Age > 18),
    Salary DECIMAL(10,2) DEFAULT 30000,
    DeptID INT
);

/* 4. ALTER TABLE - Add Column
   Definition: Adds a new column to an existing table.
   WHY? - To extend schema with new attributes.
   WHEN? - When requirements change.
*/
ALTER TABLE Employees ADD Email VARCHAR(100);

/* 5. ALTER TABLE - Modify Column
   Definition: Changes datatype or size of a column.
   WHY? - To adapt schema for new data requirements.
   WHEN? - When column definition is insufficient.
*/
ALTER TABLE Employees ALTER COLUMN Salary DECIMAL(12,2);

/* 6. ALTER TABLE - Drop Column
   Definition: Removes a column from a table.
   WHY? - To simplify schema or remove unused attributes.
   WHEN? - When column is obsolete.
*/
ALTER TABLE Employees DROP COLUMN Email;

/* 7. ADD CONSTRAINT - Foreign Key
   Definition: Links one table to another.
   WHY? - To enforce referential integrity.
   WHEN? - When modeling relationships.
*/
CREATE TABLE Departments (
    DeptID INT PRIMARY KEY,
    DeptName VARCHAR(50) UNIQUE
);

ALTER TABLE Employees
ADD CONSTRAINT FK_Dept FOREIGN KEY (DeptID)
REFERENCES Departments(DeptID);

/* 8. ADD CONSTRAINT - Check Constraint
   Definition: Enforces a condition on column values.
   WHY? - To ensure valid data.
   WHEN? - For rules like positive salary, valid age.
*/
ALTER TABLE Employees
ADD CONSTRAINT CK_Salary CHECK (Salary > 0);

/* 9. DROP CONSTRAINT
   Definition: Removes a constraint from a table.
   WHY? - To relax rules or redesign schema.
   WHEN? - When constraint is no longer needed.
*/
ALTER TABLE Employees DROP CONSTRAINT CK_Salary;

/* 10. CREATE INDEX
   Definition: Improves query performance on columns.
   WHY? - To speed up searches and filtering.
   WHEN? - On frequently queried columns.
*/
CREATE INDEX idx_emp_name ON Employees(Name);

/* 11. DROP INDEX
   Definition: Removes an index.
   WHY? - To reclaim space or remove unused indexes.
   WHEN? - When index is no longer needed.
*/
DROP INDEX idx_emp_name ON Employees;

/* 12. CREATE VIEW
   Definition: Virtual table based on query results.
   WHY? - To simplify complex queries and reuse logic.
   WHEN? - For reporting or restricted data access.
*/
CREATE VIEW ActiveEmployees AS
SELECT EmpID, Name, Salary
FROM Employees
WHERE Salary > 35000;

/* 13. DROP VIEW
   Definition: Removes a view.
   WHY? - To clean up unused views.
   WHEN? - When view is obsolete.
*/
DROP VIEW ActiveEmployees;

/* 14. TRUNCATE TABLE
   Definition: Removes all rows but keeps structure.
   WHY? - Faster than DELETE, resets identity values.
   WHEN? - To clear data without dropping table.
*/
TRUNCATE TABLE Employees;

/* 15. DROP TABLE
   Definition: Deletes a table permanently.
   WHY? - To remove obsolete or test tables.
   WHEN? - When table is no longer needed.
*/
DROP TABLE Employees;

/* 16. CREATE SCHEMA
   Definition: Logical container for database objects.
   WHY? - To organize tables, views, and procedures.
   WHEN? - For large projects with multiple modules.
*/
CREATE SCHEMA HR;

/* 17. CREATE SEQUENCE
   Definition: Generates sequential numeric values.
   WHY? - For custom auto-increment behavior.
   WHEN? - When IDENTITY is not flexible enough.
*/
CREATE SEQUENCE EmpSeq START WITH 1 INCREMENT BY 1;

