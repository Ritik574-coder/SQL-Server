/* ============================================================
   SQL Server Data Types - Full Coverage
   Author: Ritik574-coder
   Purpose: Definitions with WHY, WHEN, HOW explanations
   ============================================================ */

/* 1. Numeric Types
   ------------------------------------------------------------
   INT
   Definition: Whole numbers (-2,147,483,648 to 2,147,483,647).
   WHY? - For IDs, counters, and general integers.
   WHEN? - Use when values fit within INT range.
   HOW? - Example: CREATE TABLE demo (id INT);

   BIGINT
   Definition: Very large whole numbers (-9 quintillion to +9 quintillion).
   WHY? - For very large IDs or financial data.
   WHEN? - Use when INT is not enough.
   HOW? - Example: CREATE TABLE demo (big_num BIGINT);

   DECIMAL(p,s) / NUMERIC(p,s)
   Definition: Fixed precision numbers (exact).
   WHY? - For money, scientific values where precision matters.
   WHEN? - Use when rounding errors must be avoided.
   HOW? - Example: CREATE TABLE demo (price DECIMAL(10,2));

   FLOAT / REAL
   Definition: Approximate precision numbers.
   WHY? - For scientific calculations where small errors are acceptable.
   WHEN? - Use for averages, ratios, measurements.
   HOW? - Example: CREATE TABLE demo (ratio FLOAT);
*/

/* 2. Character Types
   ------------------------------------------------------------
   CHAR(n)
   Definition: Fixed-length string (n characters).
   WHY? - For uniform-length data (e.g., codes).
   WHEN? - Use when all values have same length.
   HOW? - Example: CREATE TABLE demo (code CHAR(3));

   VARCHAR(n)
   Definition: Variable-length string (up to n characters).
   WHY? - Saves space for varying text lengths.
   WHEN? - Use for names, descriptions.
   HOW? - Example: CREATE TABLE demo (name VARCHAR(50));

   VARCHAR(MAX)
   Definition: Very large variable-length text (up to 2GB).
   WHY? - For long documents or notes.
   WHEN? - Use when size exceeds normal VARCHAR.
   HOW? - Example: CREATE TABLE demo (notes VARCHAR(MAX));

   TEXT (Deprecated)
   Definition: Legacy large text type.
   WHY? - Replaced by VARCHAR(MAX).
   WHEN? - Avoid in new projects.
*/

/* 3. Date/Time Types
   ------------------------------------------------------------
   DATE
   Definition: Calendar date (YYYY-MM-DD).
   WHY? - For birthdays, events.
   WHEN? - Use when only date is needed.
   HOW? - Example: CREATE TABLE demo (dob DATE);

   TIME
   Definition: Time of day (HH:MM:SS).
   WHY? - For schedules, logs.
   WHEN? - Use when only time is needed.
   HOW? - Example: CREATE TABLE demo (start_time TIME);

   DATETIME
   Definition: Date + time (accuracy ~3ms).
   WHY? - For general timestamping.
   WHEN? - Use for logging, transactions.
   HOW? - Example: CREATE TABLE demo (created_at DATETIME);

   DATETIME2
   Definition: Date + time with higher precision.
   WHY? - For precise event tracking.
   WHEN? - Use when accuracy beyond DATETIME is needed.
   HOW? - Example: CREATE TABLE demo (updated_at DATETIME2);

   SMALLDATETIME
   Definition: Date + time with minute precision.
   WHY? - Lightweight alternative.
   WHEN? - Use when second-level precision is not required.
*/

/* 4. Boolean Type
   ------------------------------------------------------------
   BIT
   Definition: 0 (FALSE) or 1 (TRUE).
   WHY? - For flags, status indicators.
   WHEN? - Use when only two states exist.
   HOW? - Example: CREATE TABLE demo (is_active BIT);
*/

/* 5. JSON
   ------------------------------------------------------------
   Definition: SQL Server does not have a native JSON type.
   WHY? - JSON is stored as NVARCHAR(MAX).
   WHEN? - Use when storing semi-structured data.
   HOW? - Example: CREATE TABLE demo (data NVARCHAR(MAX));
   Note: SQL Server provides JSON functions (OPENJSON, JSON_VALUE).
*/

/* 6. Arrays
   ------------------------------------------------------------
   Definition: SQL Server does not support arrays directly.
   WHY? - Use normalized tables instead.
   WHEN? - For multi-valued attributes, create child tables.
   HOW? - Example: CREATE TABLE tags (id INT, tag VARCHAR(50));
*/

/* 7. NULL Values
   ------------------------------------------------------------
   Definition: Represents missing or unknown data.
   WHY? - To distinguish between "no value" and "zero/empty".
   WHEN? - Use when data may be optional.
   HOW? - Example: CREATE TABLE demo (middle_name VARCHAR(50) NULL);
*/
