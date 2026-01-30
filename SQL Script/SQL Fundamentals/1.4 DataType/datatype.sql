
/*
============================================================
4. DATA TYPES IN SQL
============================================================
This file explains important SQL data types with examples.
The examples use SQL Server syntax where applicable.
============================================================
*/


/* ============================================================
1. NUMERIC TYPES
============================================================ */

/* INTEGER - whole numbers */
DECLARE @age INT = 25;

/* BIGINT - very large whole numbers */
DECLARE @population BIGINT = 8000000000;

/* DECIMAL(p,s) - exact precision numbers (used for money) */
DECLARE @salary DECIMAL(10,2) = 75000.50;
/*
p = precision (total digits)
s = scale (digits after decimal)
DECIMAL(10,2) → 8 digits before decimal, 2 after
*/

/* FLOAT - approximate decimal numbers (scientific data) */
DECLARE @pi FLOAT = 3.1415926535;


/* ============================================================
2. CHARACTER TYPES
============================================================ */

/* CHAR(n) - fixed length string */
DECLARE @code CHAR(5) = 'A12';

/* VARCHAR(n) - variable length string */
DECLARE @name VARCHAR(100) = 'Ritik';

/* TEXT - large text data (deprecated in SQL Server, use VARCHAR(MAX)) */
DECLARE @description VARCHAR(MAX) = 'This is a long description text...';


/* ============================================================
3. DATE AND TIME TYPES
============================================================ */

/* DATE - only date */
DECLARE @today DATE = '2026-01-30';

/* TIME - only time */
DECLARE @currentTime TIME = '14:30:00';

/* TIMESTAMP (SQL Server uses DATETIME or DATETIME2) */
DECLARE @createdAt DATETIME2 = '2026-01-30 14:30:00';


/* ============================================================
4. BOOLEAN TYPE
============================================================ */

/*
SQL Server does not have a true BOOLEAN type.
It uses BIT (0 = False, 1 = True)
*/

DECLARE @isActive BIT = 1;


/* ============================================================
5. JSON (SQL Server)
============================================================ */

/*
SQL Server stores JSON as NVARCHAR.
JSON functions are used to parse it.
*/

DECLARE @jsonData NVARCHAR(MAX) = 
'{ "name": "Ritik", "age": 19, "skills": ["SQL", "Python"] }';

/* Extract value from JSON */
SELECT JSON_VALUE(@jsonData, '$.name') AS ExtractedName;


/* ============================================================
6. ARRAYS (SQL Server)
============================================================ */

/*
SQL Server does NOT support true array types like PostgreSQL.
Instead, use:
1. Table variables
2. Temporary tables
3. JSON arrays
*/

DECLARE @numbers TABLE (num INT);

INSERT INTO @numbers VALUES (10), (20), (30);

SELECT * FROM @numbers;


/* ============================================================
7. NULL VALUES
============================================================ */

/*
NULL means "unknown" or "missing value".
It is NOT zero and NOT empty string.
*/

DECLARE @middleName VARCHAR(50) = NULL;

/* Checking NULL */
IF @middleName IS NULL
    PRINT 'Value is NULL';

/*
Important:
Use IS NULL or IS NOT NULL
Never use = NULL
*/


/* ============================================================
BEST PRACTICES
============================================================ */

/*
1. Use INT for normal numbers, BIGINT for very large values.
2. Use DECIMAL for financial calculations (never FLOAT).
3. Use VARCHAR instead of CHAR unless fixed size required.
4. Use DATETIME2 instead of old DATETIME.
5. Avoid TEXT type, use VARCHAR(MAX).
6. Handle NULL carefully in WHERE conditions.
*/

/* END OF FILE */
