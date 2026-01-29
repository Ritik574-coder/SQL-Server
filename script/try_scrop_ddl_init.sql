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


/*
===============================================================================
DDL Script: Create Bronze Tables
===============================================================================
Purpose:
    Creates Bronze-layer tables used for raw data ingestion from source systems.
    Existing tables will be dropped and recreated.

WARNING:
    Running this script will DROP existing Bronze tables.
    All existing data will be permanently deleted.
    Ensure backups exist before execution.

Data Source:
    CRM and ERP source systems

Author : Ritik__
===============================================================================
*/

-- Safety check
IF DB_NAME() <> 'DataWarehouse'
BEGIN
    RAISERROR ('Run this script in the DataWarehouse database only.', 16, 1);
    RETURN;
END;
GO

-- Switch to DataWarehouse
USE DataWarehouse;
GO

/*=============================================================
Bronze : CRM | Table  : Bronze.crm_cust_info
=============================================================*/

-- Drop table if exists
IF OBJECT_ID('Bronze.crm_cust_info', 'U') IS NOT NULL
BEGIN
    PRINT '>> Dropping table Bronze.crm_cust_info.....';
    DROP TABLE Bronze.crm_cust_info;
END;
GO

-- Create table
PRINT '>> Creating table Bronze.crm_cust_info....';
CREATE TABLE Bronze.crm_cust_info
(
    cst_id               NVARCHAR(30)  NULL,
    cst_key              NVARCHAR(50)  NULL,

    cst_firstname        NVARCHAR(50)  NULL,
    cst_lastname         NVARCHAR(50)  NULL,
    cst_marital_status   NVARCHAR(20)  NULL,
    cst_gndr             NVARCHAR(10)  NULL,
    cst_create_date      NVARCHAR(30)  NULL,

    load_datetime        DATETIME2(3)  NOT NULL DEFAULT SYSUTCDATETIME()
) ;
GO

/*=============================================================
Bronze : CRM | Table  : Bronze.crm_prd_info
=============================================================*/
-- Drop table if exists
IF OBJECT_ID('Bronze.crm_prd_info' , 'U') IS NOT NULL 
BEGIN
	PRINT '>> Dropping Table Bronze.crm_prd_info.....' ;
	DROP TABLE Bronze.crm_prd_info ;
END ;
GO
-- Create table 
PRINT '>> Creating table Bronze.crm_prd_info....';
CREATE TABLE Bronze.crm_prd_info
(
	prd_id			NVARCHAR(30)  NULL,
	prd_key			NVARCHAR(30)  NULL,

	prd_nm			NVARCHAR(155) NULL,
	prd_cost		NVARCHAR(20)  NULL,
	prd_line		NVARCHAR(30)  NULL,
	prd_start_dt	NVARCHAR(30)  NULL,
	prd_end_dt		NVARCHAR(30)  NULL,

	load_datetime	DATETIME2(3) NOT NULL DEFAULT SYSUTCDATETIME()
) ;
GO

/*=============================================================
Bronze : CRM | Table  : Bronze.crm_sales_details
=============================================================*/
-- Drop table if exists
IF OBJECT_ID('Bronze.crm_sales_details' , 'U') IS NOT NULL 
BEGIN
	PRINT '>> Dropping Table Bronze.crm_sales_details....' ;
	DROP TABLE Bronze.crm_sales_details ;
END ;
GO 

-- Creating table Bronze.crm_sales_details
PRINT '>> Creating table Bronze.crm_sales_details.....' ;
CREATE TABLE Bronze.crm_sales_details
(
	sls_ord_num    NVARCHAR(20) NULL ,
	sls_prd_key    NVARCHAR(50) NULL ,
	sls_cust_id    NVARCHAR(20) NULL ,

	sls_order_dt  NVARCHAR(8)   NULL ,
	sls_ship_dt   NVARCHAR(8)   NULL ,
	sls_due_dt    NVARCHAR(8)   NULL ,
							    
	sls_sales     NVARCHAR(20)  NULL ,
	sls_quantity  NVARCHAR(10)  NULL ,
	sls_price     NVARCHAR(20)  NULL , 

	load_datetime DATETIME2(3)  NOT NULL DEFAULT SYSUTCDATETIME()
) ;
GO

/*=============================================================
Bronze : ERP | Table  : Bronze.erp_cust_az12
=============================================================*/
-- Drop table if exists
IF OBJECT_ID('Bronze.erp_cust_az12' , 'U') IS NOT NULL 
BEGIN 
	PRINT '>> Dropping table Bronze.erp_cust_az12...' ;
	DROP TABLE Bronze.erp_cust_az12 ;
END 
GO 

-- Creating Table Bronze.erp_cust_az12
PRINT '>> Creating table Bronze.erp_cust_az12....' ;
CREATE TABLE Bronze.erp_cust_az12
(
	cid				NVARCHAR(30) NULL ,

	bdate			NVARCHAR(30) NULL ,
	gen				NVARCHAR(20) NULL ,

	load_datetime	DATETIME2(3) NOT NULL DEFAULT SYSUTCDATETIME()
) ;
GO

/*=============================================================
Bronze : ERP | Table : Bronze.erp_loc_a101
=============================================================*/
-- Drop table if exists
IF OBJECT_ID('Bronze.erp_loc_a101' , 'U') IS NOT NULL
BEGIN 
	PRINT '>> Dropping table Bronze.erp_loc_a101.....' ;
	DROP TABLE Bronze.erp_loc_a101 ;
END ;
GO

-- Creating table Bronze.erp_loc_a101
PRINT '>> Creating Table Bronze.erp_loc_a101......' ;
CREATE TABLE Bronze.erp_loc_a101
(
	cid				NVARCHAR(30) NULL ,

	cntry			NVARCHAR(155) NULL ,

	load_datetime	DATETIME2(3) NOT NULL DEFAULT SYSUTCDATETIME()
) ;
GO

/*=============================================================
Bronze : ERP | Table : Bronze.erp_px_cat_g1v2
=============================================================*/
-- Drop table if exists
IF OBJECT_ID('Bronze.erp_px_cat_g1v2' , 'U') IS NOT NULL 
BEGIN 
	PRINT '>> Dropping table Bronze.erp_px_cat_g1v2......' ;
	DROP TABLE Bronze.erp_px_cat_g1v2 ;
END ;
GO

-- Creating table 
PRINT '>> Creating Table Bronze.erp_px_cat_g1v2......' ;
CREATE TABLE Bronze.erp_px_cat_g1v2 
(
	id            NVARCHAR(20)  NULL ,
			  
	cat           NVARCHAR(50)  NULL ,
	subcat        NVARCHAR(100) NULL ,
	maintenance   NVARCHAR(10)  NULL ,
	load_datetime DATETIME2(3)  NOT NULL DEFAULT SYSUTCDATETIME()
)  ;
GO

--==========================================================
