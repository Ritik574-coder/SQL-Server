/* ============================================================
   SQL Server - Creating Tables (DDL) + Basic SELECT Queries (DQL)
   Author: Ritik574-coder
   Purpose: Definitions + Example Queries
   ============================================================ */

/* -----------------------------
   1. Creating Tables (DDL)
   ----------------------------- */

/* CREATE TABLE Syntax
   Definition: Defines a new table structure.
   WHY? - To store data in organized columns.
   WHEN? - At the start of modeling entities.
*/
CREATE TABLE Students (
    StudentID INT IDENTITY(1,1) PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    Age INT,
    Email VARCHAR(100) UNIQUE,
    EnrollmentDate DATE DEFAULT GETDATE(),
    DeptID INT
);

/* Column Definitions
   Definition: Specify name, datatype, and constraints.
   WHY? - To control how data is stored.
   WHEN? - During table creation or modification.
*/

/* Constraints (NOT NULL, UNIQUE, CHECK)
   Definition: Rules to enforce data integrity.
   WHY? - To ensure valid and consistent data.
   WHEN? - At table creation or alteration.
*/
CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    Title VARCHAR(100) NOT NULL,
    Credits INT CHECK (Credits > 0)
);

/* Primary Keys
   Definition: Uniquely identifies each row.
   WHY? - To enforce uniqueness and relationships.
   WHEN? - Always needed for entity tables.
*/
CREATE TABLE Departments (
    DeptID INT PRIMARY KEY,
    DeptName VARCHAR(50) NOT NULL
);

/* Foreign Keys
   Definition: Links one table to another.
   WHY? - To enforce referential integrity.
   WHEN? - When modeling relationships.
*/
ALTER TABLE Students
ADD CONSTRAINT FK_Dept FOREIGN KEY (DeptID)
REFERENCES Departments(DeptID);

/* Default Values
   Definition: Assigns a value automatically if none is provided.
   WHY? - To simplify inserts and ensure consistency.
   WHEN? - For common default values.
*/
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    OrderDate DATE DEFAULT GETDATE(),
    Status VARCHAR(20) DEFAULT 'Pending'
);

/* AUTO_INCREMENT / SERIAL → SQL Server uses IDENTITY
   Definition: Automatically generates sequential values.
   WHY? - For unique IDs without manual input.
   WHEN? - For primary keys or identifiers.
*/
CREATE TABLE Products (
    ProductID INT IDENTITY(1,1) PRIMARY KEY,
    Name VARCHAR(100),
    Price DECIMAL(10,2)
);

/* ALTER TABLE (add, modify, drop columns)
   Definition: Modify existing table structure.
   WHY? - To adapt schema as requirements change.
   WHEN? - When adding new attributes or changing constraints.
*/
ALTER TABLE Students ADD Phone VARCHAR(15);
ALTER TABLE Students ALTER COLUMN Age SMALLINT;
ALTER TABLE Students DROP COLUMN Phone;

/* DROP TABLE
   Definition: Deletes a table permanently.
   WHY? - To remove obsolete or test tables.
   WHEN? - When table is no longer needed.
*/
DROP TABLE Courses;

/* TRUNCATE TABLE
   Definition: Removes all rows but keeps structure.
   WHY? - Faster than DELETE, resets identity values.
   WHEN? - To clear data without dropping table.
*/
TRUNCATE TABLE Students;


/* -----------------------------
   2. Basic SELECT Queries (DQL)
   ----------------------------- */

/* SELECT Statement Syntax
   Definition: Retrieves data from tables.
   WHY? - To query and analyze stored information.
   WHEN? - Anytime you need to read data.
*/
SELECT * FROM Students;

/* Selecting All Columns (*) */
SELECT * FROM Departments;

/* Selecting Specific Columns
   Definition: Choose only required columns.
   WHY? - To reduce output and focus on relevant data.
*/
SELECT Name, Age FROM Students;

/* Column Aliases (AS)
   Definition: Rename columns in output.
   WHY? - For readability or reporting.
*/
SELECT Name AS StudentName, Age AS StudentAge FROM Students;

/* DISTINCT Keyword
   Definition: Returns unique values only.
   WHY? - To eliminate duplicates.
*/
SELECT DISTINCT DeptID FROM Students;

/* LIMIT / TOP / FETCH FIRST (SQL Server uses TOP)
   Definition: Restricts number of rows returned.
   WHY? - For sampling or pagination.
*/
SELECT TOP 5 Name, Age FROM Students ORDER BY Age DESC;

/* ORDER BY (ASC, DESC)
   Definition: Sorts query results.
   WHY? - To organize data in ascending/descending order.
*/
SELECT Name, Age FROM Students ORDER BY Age ASC;

/* Ordering by Multiple Columns
   Definition: Sorts results by more than one column.
   WHY? - For complex sorting needs.
*/
SELECT Name, DeptID, Age FROM Students ORDER BY DeptID ASC, Age DESC;
