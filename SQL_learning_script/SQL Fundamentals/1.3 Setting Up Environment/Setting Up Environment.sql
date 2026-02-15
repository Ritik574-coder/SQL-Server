/* ============================================================
   SQL Environment Setup - PostgreSQL, MySQL, SQL Server
   Author: Ritik574-coder
   Purpose: Definitions with WHY, WHEN, HOW explanations
   ============================================================ */

/* 1. Installing PostgreSQL
   ------------------------------------------------------------
   Definition: PostgreSQL is an advanced open-source relational database.
   WHY? - For enterprise-level features, complex queries, and reliability.
   WHEN? - Use when you need scalability and advanced SQL support.
   HOW? - Download installer, run setup, configure service, connect via psql/pgAdmin.
*/

/* 2. Installing MySQL
   ------------------------------------------------------------
   Definition: MySQL is a widely used open-source relational database.
   WHY? - Lightweight, fast, and popular for web applications.
   WHEN? - Use for websites, small/medium apps, or learning SQL basics.
   HOW? - Install via MySQL installer or package manager, start server, connect via mysql/MySQL Workbench.
*/

/* 3. Installing SQL Server
   ------------------------------------------------------------
   Definition: SQL Server is Microsoft’s enterprise-grade relational database system.
   WHY? - For large-scale applications, integration with Microsoft ecosystem, and advanced security.
   WHEN? - Use in corporate environments, enterprise apps, or when working with .NET/Windows stack.
   HOW? - 
        - Download SQL Server installer (Express or Developer edition for free learning).
        - Run setup wizard, choose default or named instance.
        - Configure authentication (Windows or Mixed Mode).
        - Install SQL Server Management Studio (SSMS) for GUI access.
        - Connect using server name, authentication method, and credentials.
*/

/* 4. SQL Clients (pgAdmin, DBeaver, MySQL Workbench, SSMS)
   ------------------------------------------------------------
   Definition: GUI tools to interact with databases visually.
   WHY? - Simplify query writing, design, and management.
   WHEN? - Use when you prefer graphical interface over CLI.
   HOW? - Connect client to database server with host, port, username, password.
*/

/* 5. Command-line Tools (psql, mysql, sqlcmd)
   ------------------------------------------------------------
   Definition: CLI programs to interact directly with databases.
   WHY? - Faster, lightweight, and script-friendly for developers.
   WHEN? - Use for automation, server-side work, or when GUI is unavailable.
   HOW? - 
        - PostgreSQL: psql -U username -d dbname
        - MySQL: mysql -u root -p
        - SQL Server: sqlcmd -S server_name -U username -P password
*/

/* 6. Creating Your First Database
   ------------------------------------------------------------
   Definition: A database is a structured collection of data.
   WHY? - To store and organize information for applications.
   WHEN? - At the beginning of any project requiring persistent data.
   HOW? - Examples:
          PostgreSQL: CREATE DATABASE my_first_db;
          MySQL:     CREATE DATABASE my_first_db;
          SQL Server: CREATE DATABASE my_first_db;
*/
