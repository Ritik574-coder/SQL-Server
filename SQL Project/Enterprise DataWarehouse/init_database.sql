/*
=============================================================
Enterprise DataWarehouse Initialization Script
Author: Data Engineering Team
Purpose: Create DataWarehouse database and schemas safely
=============================================================
*/

-------------------------------------------------------------
-- 1. Safety Check
-------------------------------------------------------------
IF DB_NAME() <> 'master'
BEGIN
    THROW 50001, 'Execute this script from the master database only.', 1;
END
GO

-------------------------------------------------------------
-- 2. Create Database (Only if NOT exists)
-------------------------------------------------------------
IF NOT EXISTS (SELECT 1 FROM sys.databases WHERE name = 'DataWarehouse')
BEGIN
    PRINT 'Creating DataWarehouse database...';

    CREATE DATABASE DataWarehouse
    ON PRIMARY 
    (
        NAME = DataWarehouse_Data,
        FILENAME = 'C:\SQLData\DataWarehouse_Data.mdf',
        SIZE = 512MB,
        FILEGROWTH = 128MB
    )
    LOG ON
    (
        NAME = DataWarehouse_Log,
        FILENAME = 'C:\SQLData\DataWarehouse_Log.ldf',
        SIZE = 256MB,
        FILEGROWTH = 64MB
    );

    ALTER DATABASE DataWarehouse SET RECOVERY SIMPLE;
END
ELSE
BEGIN
    PRINT 'DataWarehouse database already exists. Skipping creation.';
END
GO

-------------------------------------------------------------
-- 3. Switch Context
-------------------------------------------------------------
USE DataWarehouse;
GO

-------------------------------------------------------------
-- 4. Create Schemas (Idempotent)
-------------------------------------------------------------
IF NOT EXISTS (SELECT 1 FROM sys.schemas WHERE name = 'Bronze')
    EXEC ('CREATE SCHEMA Bronze AUTHORIZATION dbo');

IF NOT EXISTS (SELECT 1 FROM sys.schemas WHERE name = 'Silver')
    EXEC ('CREATE SCHEMA Silver AUTHORIZATION dbo');

IF NOT EXISTS (SELECT 1 FROM sys.schemas WHERE name = 'Gold')
    EXEC ('CREATE SCHEMA Gold AUTHORIZATION dbo');
GO

-------------------------------------------------------------
-- 5. Create ETL Role (Enterprise Practice)
-------------------------------------------------------------
IF NOT EXISTS (SELECT 1 FROM sys.database_principals WHERE name = 'etl_role')
BEGIN
    CREATE ROLE etl_role;
    GRANT INSERT, UPDATE, DELETE, SELECT ON SCHEMA::Bronze TO etl_role;
    GRANT SELECT ON SCHEMA::Silver TO etl_role;
    GRANT SELECT ON SCHEMA::Gold TO etl_role;
END
GO

PRINT 'Enterprise setup completed successfully.';
