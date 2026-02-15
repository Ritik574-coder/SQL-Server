/* ============================================================
   SQL Server - Typical Commands & Syntax
   Author: Ritik574-coder
   Purpose: Definitions, WHY, WHEN, HOW + Example Queries
   ============================================================ */

/* 1. SELECT
   Definition: Retrieves data from one or more tables.
   WHY? - To query and analyze stored information.
   WHEN? - Anytime you need to read data.
   HOW? - SELECT column_list FROM table_name WHERE condition;
*/
SELECT Name, Age FROM Students WHERE Age > 18;

/* 2. INSERT
   Definition: Adds new rows into a table.
   WHY? - To populate tables with data.
   WHEN? - When new records are created.
   HOW? - INSERT INTO table_name (columns) VALUES (values);
*/
INSERT INTO Students (Name, Age, EnrollmentDate)
VALUES ('Ritik', 20, GETDATE());

/* 3. UPDATE
   Definition: Modifies existing rows in a table.
   WHY? - To correct or change stored data.
   WHEN? - When values need to be updated.
   HOW? - UPDATE table_name SET column=value WHERE condition;
*/
UPDATE Students SET Age = 21 WHERE Name = 'Ritik';

/* 4. DELETE
   Definition: Removes rows from a table.
   WHY? - To clean up or remove unwanted data.
   WHEN? - When records are no longer needed.
   HOW? - DELETE FROM table_name WHERE condition;
*/
DELETE FROM Students WHERE Age < 18;

/* 5. CREATE DATABASE
   Definition: Creates a new database.
   WHY? - To organize data into separate logical containers.
   WHEN? - At the start of a new project.
   HOW? - CREATE DATABASE db_name;
*/
CREATE DATABASE SchoolDB;

/* 6. USE
   Definition: Switches context to a specific database.
   WHY? - To run commands inside the chosen database.
   WHEN? - Before creating tables or running queries.
   HOW? - USE db_name;
*/
USE SchoolDB;

/* 7. CREATE TABLE
   Definition: Defines a new table structure.
   WHY? - To store data in organized columns.
   WHEN? - At the start of modeling entities.
   HOW? - CREATE TABLE table_name (columns...);
*/
CREATE TABLE Students (
    StudentID INT IDENTITY(1,1) PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    Age INT,
    EnrollmentDate DATE DEFAULT GETDATE()
);

/* 8. ALTER TABLE
   Definition: Modifies table structure.
   WHY? - To adapt schema as requirements change.
   WHEN? - Adding, changing, or removing columns.
   HOW? - ALTER TABLE table_name ADD/MODIFY/DROP column;
*/
ALTER TABLE Students ADD Email VARCHAR(100);
ALTER TABLE Students ALTER COLUMN Age SMALLINT;
ALTER TABLE Students DROP COLUMN Email;

/* 9. DROP TABLE
   Definition: Deletes a table permanently.
   WHY? - To remove obsolete or test tables.
   WHEN? - When table is no longer needed.
   HOW? - DROP TABLE table_name;
*/
DROP TABLE Students;

/* 10. TRUNCATE TABLE
   Definition: Removes all rows but keeps structure.
   WHY? - Faster than DELETE, resets identity values.
   WHEN? - To clear data without dropping table.
   HOW? - TRUNCATE TABLE table_name;
*/
TRUNCATE TABLE Students;

/* 11. CREATE INDEX
   Definition: Improves query performance on columns.
   WHY? - To speed up searches and filtering.
   WHEN? - On frequently queried columns.
   HOW? - CREATE INDEX index_name ON table_name(column);
*/
CREATE INDEX idx_students_name ON Students(Name);

/* 12. DROP INDEX
   Definition: Removes an index.
   WHY? - To reclaim space or remove unused indexes.
   WHEN? - When index is no longer needed.
   HOW? - DROP INDEX index_name ON table_name;
*/
DROP INDEX idx_students_name ON Students;
