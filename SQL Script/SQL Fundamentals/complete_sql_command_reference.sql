--It covers:
--DDL  , DML  , DQL  , DCL ,  TCL , Major SQL Clauses
--====================================================================================================================

/*
=====================================================================
 COMPLETE SQL REFERENCE GUIDE
 Covers: DDL, DML, DQL, DCL, TCL and Important SQL Clauses
 Author : Ritik
 Level  : Beginner → Advanced
=====================================================================
*/


/* ================================================================
   1️⃣ DDL – Data Definition Language
   Used to define and modify database structure
================================================================ */

/*
CREATE
Used to create database objects (Database, Table, Schema, Index)
*/
CREATE DATABASE salesDB;

CREATE TABLE sales.employee (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(100),
    salary DECIMAL(10,2),
    department VARCHAR(50)
);


/*
ALTER
Used to modify existing database objects
*/
ALTER TABLE sales.employee
ADD email VARCHAR(100);

ALTER TABLE sales.employee
DROP COLUMN email;


/*
TRUNCATE
Removes all rows from a table but keeps structure
*/
TRUNCATE TABLE sales.employee;


/*
DROP
Deletes database objects permanently
*/
DROP TABLE sales.employee;
DROP DATABASE salesDB;


/*
RENAME (Syntax varies by DB)
*/
EXEC sp_rename 'sales.employee', 'employee_new';



/* ================================================================
   2️⃣ DML – Data Manipulation Language
   Used to manipulate data inside tables
================================================================ */

/*
INSERT
Adds new records
*/
INSERT INTO sales.employee (emp_id, emp_name, salary, department)
VALUES (1, 'Ritik', 50000, 'IT');


/*
UPDATE
Modifies existing records
*/
UPDATE sales.employee
SET salary = 60000
WHERE emp_id = 1;


/*
DELETE
Removes specific records
*/
DELETE FROM sales.employee
WHERE emp_id = 1;


/*
MERGE (SQL Server)
Synchronizes two tables
*/
MERGE target_table AS T
USING source_table AS S
ON T.id = S.id
WHEN MATCHED THEN
    UPDATE SET T.name = S.name
WHEN NOT MATCHED THEN
    INSERT (id, name) VALUES (S.id, S.name);



/* ================================================================
   3️⃣ DQL – Data Query Language
   Used to retrieve data
================================================================ */

/*
SELECT
Retrieves data from table
*/
SELECT * FROM sales.employee;

SELECT emp_name, salary
FROM sales.employee
WHERE salary > 40000
ORDER BY salary DESC;



/* ================================================================
   4️⃣ DCL – Data Control Language
   Used for permissions and access control
================================================================ */

/*
GRANT
Gives permissions to users
*/
GRANT SELECT, INSERT ON sales.employee TO user_name;


/*
REVOKE
Removes permissions
*/
REVOKE INSERT ON sales.employee FROM user_name;



/* ================================================================
   5️⃣ TCL – Transaction Control Language
   Manages transactions
================================================================ */

/*
BEGIN TRANSACTION
*/
BEGIN TRANSACTION;


/*
COMMIT
Saves changes permanently
*/
COMMIT;


/*
ROLLBACK
Reverts changes
*/
ROLLBACK;


/*
SAVEPOINT (SQL Server uses SAVE TRAN)
*/
SAVE TRANSACTION savepoint_name;



/* ================================================================
   IMPORTANT SQL CLAUSES
================================================================ */

/*
WHERE
Filters rows
*/
SELECT * FROM sales.employee
WHERE department = 'IT';


/*
ORDER BY
Sorts results
*/
SELECT * FROM sales.employee
ORDER BY salary DESC;


/*
GROUP BY
Groups rows for aggregation
*/
SELECT department, COUNT(*) AS total_employees
FROM sales.employee
GROUP BY department;


/*
HAVING
Filters grouped results
*/
SELECT department, COUNT(*) AS total
FROM sales.employee
GROUP BY department
HAVING COUNT(*) > 5;


/*
DISTINCT
Removes duplicate values
*/
SELECT DISTINCT department
FROM sales.employee;


/*
JOIN
Combines multiple tables
*/
SELECT e.emp_name, d.department_name
FROM employee e
INNER JOIN department d
ON e.department_id = d.department_id;


/*
LEFT JOIN
Returns all rows from left table
*/
SELECT *
FROM employee e
LEFT JOIN department d
ON e.department_id = d.department_id;


/*
RIGHT JOIN
Returns all rows from right table
*/
SELECT *
FROM employee e
RIGHT JOIN department d
ON e.department_id = d.department_id;


/*
FULL JOIN
Returns all matching and non-matching rows
*/
SELECT *
FROM employee e
FULL JOIN department d
ON e.department_id = d.department_id;


/*
BETWEEN
Range filtering
*/
SELECT * FROM sales.employee
WHERE salary BETWEEN 30000 AND 70000;


/*
IN
Multiple value filtering
*/
SELECT * FROM sales.employee
WHERE department IN ('IT', 'HR');


/*
LIKE
Pattern matching
*/
SELECT * FROM sales.employee
WHERE emp_name LIKE 'R%';


/*
LIMIT / TOP (SQL Server uses TOP)
*/
SELECT TOP 5 *
FROM sales.employee;


/*
CASE
Conditional logic
*/
SELECT emp_name,
       CASE
           WHEN salary > 60000 THEN 'High'
           WHEN salary BETWEEN 40000 AND 60000 THEN 'Medium'
           ELSE 'Low'
       END AS salary_level
FROM sales.employee;



/* ================================================================
   END OF COMPLETE SQL GUIDE
================================================================ */
