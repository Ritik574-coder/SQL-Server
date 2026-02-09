/*
===============================================================================
DDL Script: Create Silver Tables
===============================================================================
Script Purpose:
    This script creates tables in the 'silver' schema.

    The Silver layer contains cleansed, standardized, and 
    deduplicated data derived from the Bronze layer.

    Run this script to define the DDL structure of 'silver' tables.
===============================================================================
*/

-- swith Database to DataWarehouse
USE DataWarehouse ;
GO 

-- safty check
IF DB_NAME() NOT IN('DataWarehouse') 
BEGIN
    RAISERROR('Execute this script from the DataWarehouse database only.',16,1) ;
    RETURN ;
END ;
GO

/*===============================================================
Schema : silver | Source : CRM | Table : silver.crm_cust_info
--=============================================================*/

-- Dropping table silver.crm_cust_info if exists
IF OBJECT_ID('silver.crm_cust_info' , 'U') IS NOT NULL 
BEGIN
    PRINT 'Dropping Table silver.crm_cust_info......' ;
    DROP TABLE silver.crm_cust_info ;
END ;
GO 

-- Creating table silver.crm_cust_info 
PRINT 'Creating table silver.crm_cust_info.......' ;
CREATE TABLE silver.crm_cust_info
(
    cst_id              INT         ,
    cst_key             NVARCHAR(30),

    cst_firstname       NVARCHAR(50),
    cst_lastname        NVARCHAR(50),
    cst_marital_status  NVARCHAR(10),
    cst_gndr            NVARCHAR(10),
    cst_create_date     DATE,
    dwh_create_date     DATETIME2 DEFAULT GETDATE()        
)
GO

/*===============================================================
Schema : silver | Source : CRM | Table : silver.crm_prd_info
--=============================================================*/

IF OBJECT_ID('silver.crm_prd_info', 'U') IS NOT NULL
BEGIN
    PRINT 'Dropping Table silver.crm_prd_info.........' ;
    DROP TABLE silver.crm_prd_info;
END ;
GO

PRINT 'Creating table silver.crm_prd_info...........' ;
CREATE TABLE silver.crm_prd_info (
    prd_id          INT,
    prd_key         NVARCHAR(50),

    prd_nm          NVARCHAR(50),
    prd_cost        DECIMAL(10,2),
    prd_line        NVARCHAR(20),
    prd_start_dt    DATE,
    prd_end_dt      DATE,
    dwh_create_date DATETIME2 DEFAULT GETDATE()
);
GO

/*===============================================================
Schema : silver | Source : CRM | Table : silver.crm_sales_details
--=============================================================*/

IF OBJECT_ID('silver.crm_sales_details', 'U') IS NOT NULL
BEGIN
    PRINT 'Dropping table silver.crm_sales_details........' ;
    DROP TABLE silver.crm_sales_details ;
END ;
GO

PRINT 'Creating table silver.crm_sales_details........' ;
CREATE TABLE silver.crm_sales_details (
    sls_ord_num    NVARCHAR(20),
    sls_prd_key    NVARCHAR(20),
    sls_cust_id    INT,

    sls_order_dt   DATE,
    sls_ship_dt    DATE,
    sls_due_dt     DATE,
    sls_sales      DECIMAL(10,2),
    sls_quantity   INT,
    sls_price      DECIMAL(10,2),
    dwh_create_date DATETIME2 DEFAULT GETDATE()
);
GO

/*===============================================================
Schema : silver | Source : ERP | Table : silver.erp_loc_a101
--=============================================================*/

IF OBJECT_ID('silver.erp_loc_a101', 'U') IS NOT NULL
BEGIN
    PRINT 'Dropping table silver.erp_loc_a101..........' ;
    DROP TABLE silver.erp_loc_a101 ;
END ;
GO

PRINT 'Creating table silver.erp_loc_a101........' ;
CREATE TABLE silver.erp_loc_a101 (
    cid            NVARCHAR(30),
    cntry          NVARCHAR(50),
    dwh_create_date DATETIME2 DEFAULT GETDATE()
);
GO

/*===============================================================
Schema : silver | Source : ERP | Table : silver.erp_cust_az12
--=============================================================*/

IF OBJECT_ID('silver.erp_cust_az12', 'U') IS NOT NULL
BEGIN
    PRINT 'Dropping table silver.erp_cust_az12......';
    DROP TABLE silver.erp_cust_az12;
END ;
GO

PRINT 'Creating table silver.erp_cust_az12......' ;
CREATE TABLE silver.erp_cust_az12 (
    cid           NVARCHAR(30),
    bdate         DATE,
    gen           NVARCHAR(10),
    dwh_create_date DATETIME2 DEFAULT GETDATE()
);
GO

/*===============================================================
Schema : silver | Source : ERP | Table : silver.erp_px_cat_g1v2
--=============================================================*/

IF OBJECT_ID('silver.erp_px_cat_g1v2', 'U') IS NOT NULL
BEGIN
    PRINT 'Dropping table silver.erp_px_cat_g1v2.......' ;
    DROP TABLE silver.erp_px_cat_g1v2;
END ;
GO

PRINT 'Creating table silver.erp_px_cat_g1v2.......'
CREATE TABLE silver.erp_px_cat_g1v2 (
    id            NVARCHAR(30),
    cat           NVARCHAR(50),
    subcat        NVARCHAR(50),
    maintenance   NVARCHAR(10),
    dwh_create_date DATETIME2 DEFAULT GETDATE()
);
GO
--==============================================================

