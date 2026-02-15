/* ============================================================
   SQL Server - DML Commands (Basic to Advanced)
   Author: Ritik574-coder
   Purpose: Definitions + Example Queries
   ============================================================ */

/* 1. SELECT
   Definition: Retrieves data from tables.
   WHY? - To query and analyze stored information.
   WHEN? - Anytime you need to read data.
   HOW? - SELECT column_list FROM table_name WHERE condition;
*/
SELECT EmpID, Name, Salary FROM Employees WHERE Salary > 30000;

/* 2. INSERT
   Definition: Adds new rows into a table.
   WHY? - To populate tables with data.
   WHEN? - When new records are created.
   HOW? - INSERT INTO table_name (columns) VALUES (values);
*/
INSERT INTO Employees (Name, Age, Salary, DeptID)
VALUES ('Ritik', 22, 40000, 1);

/* 3. UPDATE
   Definition: Modifies existing rows in a table.
   WHY? - To correct or change stored data.
   WHEN? - When values need to be updated.
   HOW? - UPDATE table_name SET column=value WHERE condition;
*/
UPDATE Employees SET Salary = Salary + 5000 WHERE DeptID = 1;

/* 4. DELETE
   Definition: Removes rows from a table.
   WHY? - To clean up or remove unwanted data.
   WHEN? - When records are no longer needed.
   HOW? - DELETE FROM table_name WHERE condition;
*/
DELETE FROM Employees WHERE Age < 20;

/* 5. MERGE
   Definition: Combines INSERT, UPDATE, DELETE in one statement.
   WHY? - To synchronize two tables.
   WHEN? - When updating a target table based on source table.
   HOW? - MERGE INTO target USING source ON condition ...
*/
MERGE INTO Employees AS target
USING NewEmployees AS source
ON target.EmpID = source.EmpID
WHEN MATCHED THEN UPDATE SET target.Salary = source.Salary
WHEN NOT MATCHED BY TARGET THEN INSERT (Name, Age, Salary, DeptID)
VALUES (source.Name, source.Age, source.Salary, source.DeptID)
WHEN NOT MATCHED BY SOURCE THEN DELETE;

/* 6. SELECT INTO
   Definition: Creates a new table from query results.
   WHY? - To copy data quickly.
   WHEN? - For backups or temporary analysis.
   HOW? - SELECT ... INTO new_table FROM old_table;
*/
SELECT EmpID, Name, Salary
INTO HighSalaryEmployees
FROM Employees
WHERE Salary > 50000;

/* 7. INSERT INTO ... SELECT
   Definition: Inserts data from one table into another.
   WHY? - To transfer or duplicate data.
   WHEN? - For migrations or backups.
   HOW? - INSERT INTO target SELECT ... FROM source;
*/
INSERT INTO EmployeesArchive (EmpID, Name, Salary, DeptID)
SELECT EmpID, Name, Salary, DeptID FROM Employees;

/* 8. OUTPUT Clause
   Definition: Returns affected rows during DML operations.
   WHY? - To log changes or capture inserted IDs.
   WHEN? - During auditing or debugging.
   HOW? - Use OUTPUT with INSERT/UPDATE/DELETE.
*/
INSERT INTO Employees (Name, Age, Salary, DeptID)
OUTPUT inserted.EmpID, inserted.Name
VALUES ('Amit', 25, 35000, 2);

/* 9. BULK INSERT
   Definition: Loads data from a file into a table.
   WHY? - For fast data import.
   WHEN? - When importing large datasets.
   HOW? - BULK INSERT table_name FROM 'file_path';
*/
BULK INSERT Employees
FROM 'C:\Data\employees.csv'
WITH (FIELDTERMINATOR = ',', ROWTERMINATOR = '\n');

/* 10. DELETE vs TRUNCATE (DML vs DDL)
   Definition: DELETE removes rows with conditions; TRUNCATE clears all rows.
   WHY? - DELETE is flexible, TRUNCATE is faster.
   WHEN? - DELETE for selective removal, TRUNCATE for full reset.
*/
DELETE FROM Employees WHERE DeptID = 2;
TRUNCATE TABLE Employees;
