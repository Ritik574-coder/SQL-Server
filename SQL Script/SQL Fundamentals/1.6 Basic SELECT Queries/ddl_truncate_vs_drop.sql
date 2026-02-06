/*
===========================================================
 SQL DDL COMMANDS: TRUNCATE vs DROP
===========================================================

Author  : Ritik
Purpose : Understanding difference between TRUNCATE and DROP
Level   : Beginner to Intermediate
Database: SQL Server (Compatible syntax)
===========================================================
*/


/* =========================================================
   1. TRUNCATE COMMAND
   =========================================================

   Definition:
   TRUNCATE is a DDL (Data Definition Language) command
   used to remove ALL rows from a table.

   Key Characteristics:
   - Deletes all data permanently
   - Keeps table structure intact
   - Faster than DELETE (minimal logging)
   - Cannot use WHERE clause
   - Resets identity counter (SQL Server)
   - Cannot be rolled back in most cases
========================================================= */


/* Basic TRUNCATE Example */
TRUNCATE TABLE sales.employee;


/* Safe TRUNCATE (Check if table exists first) */
IF OBJECT_ID('sales.employee', 'U') IS NOT NULL
BEGIN
    TRUNCATE TABLE sales.employee;
END;



/* =========================================================
   2. DROP COMMAND
   =========================================================

   Definition:
   DROP is a DDL command used to permanently remove
   database objects from the server.

   What it removes:
   - Table structure
   - Table data
   - Indexes
   - Constraints
   - Metadata

   WARNING:
   This operation is irreversible.
========================================================= */


/* Drop a Database */
DROP DATABASE salesDB;


/* Drop a Table */
DROP TABLE sales.employee;


/* Drop a Schema */
DROP SCHEMA sales;



/* =========================================================
   DIFFERENCE: TRUNCATE vs DROP
   =========================================================

   TRUNCATE:
   - Removes all rows
   - Keeps table structure
   - Faster execution
   - Used for clearing table data

   DROP:
   - Removes entire object
   - Deletes structure + data
   - Cannot recover
   - Used when object is no longer needed
========================================================= */
