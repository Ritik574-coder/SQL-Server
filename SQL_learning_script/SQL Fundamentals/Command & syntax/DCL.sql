/* ============================================================
   SQL Server - DCL Commands
   Author: Ritik574-coder
   Purpose: Definitions + Example Queries
   ============================================================ */

/* 1. GRANT
   Definition: Provides specific permissions to users or roles.
   WHY? - To allow controlled access to database objects.
   WHEN? - When a user needs rights to perform certain actions.
   HOW? - GRANT permission ON object TO user;
*/
GRANT SELECT, INSERT ON Employees TO User1;
GRANT UPDATE ON Employees TO User2;

/* 2. REVOKE
   Definition: Removes previously granted permissions.
   WHY? - To restrict or withdraw access.
   WHEN? - When a user should no longer have rights.
   HOW? - REVOKE permission ON object FROM user;
*/
REVOKE INSERT ON Employees FROM User1;

/* 3. DENY
   Definition: Explicitly prevents a user from having certain permissions.
   WHY? - To block access even if granted through roles.
   WHEN? - When you want to enforce strict restrictions.
   HOW? - DENY permission ON object TO user;
*/
DENY DELETE ON Employees TO User2;

/* 4. GRANT CONTROL (Advanced)
   Definition: Gives full control over an object.
   WHY? - To delegate ownership-like rights.
   WHEN? - For administrators or trusted users.
*/
GRANT CONTROL ON Employees TO AdminUser;

/* 5. GRANT EXECUTE (Stored Procedures)
   Definition: Allows execution of stored procedures.
   WHY? - To let users run procedures without full table access.
   WHEN? - For application users needing controlled operations.
*/
GRANT EXECUTE ON usp_UpdateSalary TO User3;

/* 6. REVOKE EXECUTE
   Definition: Removes procedure execution rights.
   WHY? - To restrict procedure usage.
   WHEN? - When procedure should no longer be accessible.
*/
REVOKE EXECUTE ON usp_UpdateSalary FROM User3;

/* 7. DENY VIEW DEFINITION
   Definition: Prevents user from seeing object metadata.
   WHY? - To hide schema details for security.
   WHEN? - For restricted users.
*/
DENY VIEW DEFINITION ON Employees TO User4;

/* 8. GRANT REFERENCES
   Definition: Allows creating foreign keys referencing a table.
   WHY? - To enable schema relationships.
   WHEN? - For developers designing related tables.
*/
GRANT REFERENCES ON Departments TO User5;
