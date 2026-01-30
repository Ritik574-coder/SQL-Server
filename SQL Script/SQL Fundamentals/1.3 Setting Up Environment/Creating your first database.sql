-- SWITCH DATABASE TO MASTER 
USE Master ;
GO

-- Drop and recreate the DataWarehouse database
IF EXISTS(SELECT 1 FROM sys.databases WHERE name = 'DataWarehouse')
BEGIN
    PRINT '>> Dropping Database DataWarehouse......' ;
    ALTER DATABASE DataWarehouse
    SET SINGLE_USER WITH ROLLBACK IMMEDIATE ;
    DROP DATABASE DataWarehouse ;
END ;
GO 

-- Creating DataBase DataWarehouse 
CREATE DATABASE DataWarehouse
