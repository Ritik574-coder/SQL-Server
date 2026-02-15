/* ============================================================
   SQL Fundamentals - Core Concepts
   Author: Ritik574-coder
   Purpose: Definitions with WHY, WHEN, HOW explanations
   ============================================================ */

/* 1. SQL Syntax Rules
   ------------------------------------------------------------
   Definition: SQL follows a structured set of rules for writing queries.
   WHY? - To ensure consistency and readability across databases.
   WHEN? - Every time you write queries, commands, or scripts.
   HOW? - Follow proper keywords, clauses, and order (SELECT → FROM → WHERE).
*/

/* 2. Case Sensitivity
   ------------------------------------------------------------
   Definition: SQL keywords are generally case-insensitive, 
   but identifiers (like table/column names) may be case-sensitive 
   depending on the database system.
   WHY? - To avoid errors when referencing objects.
   WHEN? - While naming tables, columns, or writing queries.
   HOW? - Use consistent naming conventions (e.g., snake_case or PascalCase).
*/

/* 3. Comments (Single-line and Multi-line)
   ------------------------------------------------------------
   Definition: Comments explain code without affecting execution.
   WHY? - To improve readability and maintainability of scripts.
   WHEN? - While documenting queries or leaving notes for future reference.
   HOW? - Use -- for single-line, and /* ... */ for multi-line comments.
*/

/* 4. SQL Statement Types
   ------------------------------------------------------------
   Definition: SQL is divided into categories:
      - DDL (Data Definition Language): CREATE, ALTER, DROP
      - DML (Data Manipulation Language): SELECT, INSERT, UPDATE, DELETE
      - DCL (Data Control Language): GRANT, REVOKE
      - TCL (Transaction Control Language): COMMIT, ROLLBACK, SAVEPOINT
   WHY? - To organize commands by their purpose.
   WHEN? - Depending on whether you define structure, manipulate data, 
           control permissions, or manage transactions.
   HOW? - Choose the right category of statement for the task at hand.
*/

/* 5. Semicolons and Statement Terminators
   ------------------------------------------------------------
   Definition: Semicolons mark the end of a SQL statement.
   WHY? - To separate multiple statements in a script.
   WHEN? - Required in some databases (like PostgreSQL, Oracle), optional in others.
   HOW? - Place ; at the end of each statement for clarity and portability.
*/
