/*
=============================================================
Create Database and Schemas
=============================================================
Script Purpose:
    This script creates a new database named 'DataWarehouse'.
    If the database already exists, it will be dropped and recreated.
    The script also creates three schemas:
        - Bronze
        - Silver
        - Gold

WARNING:
    Running this script will DROP the 'DataWarehouse' database.
    All existing data will be permanently deleted.
    Ensure backups exist before execution.

Author : Ritik__
=============================================================
*/

-- Safety check
IF DB_NAME() <> 'master'
BEGIN
    RAISERROR ('Run this script from the master database only.', 16, 1);
    RETURN;
END;
GO

-- Switch to master database
USE master;
GO

-- Drop and recreate the DataWarehouse database
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'DataWarehouse')
BEGIN
    PRINT 'Dropping existing DataWarehouse database...';

    ALTER DATABASE DataWarehouse 
    SET SINGLE_USER WITH ROLLBACK IMMEDIATE;

    DROP DATABASE DataWarehouse;
END;
GO

-- Create DataWarehouse database
PRINT 'Creating DataWarehouse database...';
CREATE DATABASE DataWarehouse;
GO

-- Switch to DataWarehouse
USE DataWarehouse;
GO

-- Create Bronze schema
IF NOT EXISTS (SELECT 1 FROM sys.schemas WHERE name = 'Bronze')
BEGIN
    PRINT 'Creating Bronze schema...';
    EXEC sp_executesql 
        N'CREATE SCHEMA Bronze AUTHORIZATION dbo';
END;
GO

-- Create Silver schema
IF NOT EXISTS (SELECT 1 FROM sys.schemas WHERE name = 'Silver')
BEGIN
    PRINT 'Creating Silver schema...';
    EXEC sp_executesql 
        N'CREATE SCHEMA Silver AUTHORIZATION dbo';
END;
GO

-- Create Gold schema
IF NOT EXISTS (SELECT 1 FROM sys.schemas WHERE name = 'Gold')
BEGIN
    PRINT 'Creating Gold schema...';
    EXEC sp_executesql 
        N'CREATE SCHEMA Gold AUTHORIZATION dbo';
END;
GO
