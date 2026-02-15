/* ============================================================
   SQL Server - TCL Commands
   Author: Ritik574-coder
   Purpose: Definitions + Example Queries
   ============================================================ */

/* 1. BEGIN TRANSACTION
   Definition: Starts a new transaction block.
   WHY? - To group multiple operations into a single unit of work.
   WHEN? - Before executing operations that must succeed or fail together.
   HOW? - BEGIN TRANSACTION;
*/
BEGIN TRANSACTION;
INSERT INTO Employees (Name, Age, Salary, DeptID)
VALUES ('Ritik', 22, 40000, 1);

/* 2. COMMIT
   Definition: Saves all changes made in the current transaction.
   WHY? - To make operations permanent.
   WHEN? - After successful execution of all statements.
   HOW? - COMMIT;
*/
COMMIT;

/* 3. ROLLBACK
   Definition: Undoes all changes made in the current transaction.
   WHY? - To revert operations if errors occur.
   WHEN? - When validation fails or unexpected issues arise.
   HOW? - ROLLBACK;
*/
BEGIN TRANSACTION;
UPDATE Employees SET Salary = Salary * 2 WHERE DeptID = 1;
ROLLBACK;

/* 4. SAVEPOINT
   Definition: Marks a point within a transaction to roll back to.
   WHY? - To partially undo changes without discarding the entire transaction.
   WHEN? - In complex transactions with multiple steps.
   HOW? - SAVE TRANSACTION savepoint_name;
*/
BEGIN TRANSACTION;
INSERT INTO Employees (Name, Age, Salary, DeptID)
VALUES ('Amit', 25, 35000, 2);

SAVE TRANSACTION SavePoint1;

INSERT INTO Employees (Name, Age, Salary, DeptID)
VALUES ('Neha', 28, 45000, 3);

-- Rollback only to SavePoint1, keeping Amit’s insert
ROLLBACK TRANSACTION SavePoint1;
COMMIT;

/* 5. IMPLICIT TRANSACTIONS
   Definition: SQL Server can automatically start transactions.
   WHY? - To ensure each statement runs inside a transaction.
   WHEN? - When AUTO_COMMIT mode is disabled.
   HOW? - SET IMPLICIT_TRANSACTIONS ON;
*/
SET IMPLICIT_TRANSACTIONS ON;
INSERT INTO Employees (Name, Age, Salary, DeptID)
VALUES ('Raj', 30, 50000, 2);
COMMIT;

/* 6. CHECKPOINT
   Definition: Writes all dirty pages (modified data) to disk.
   WHY? - To ensure durability and reduce recovery time.
   WHEN? - During long-running transactions or before backups.
   HOW? - CHECKPOINT;
*/
CHECKPOINT;
