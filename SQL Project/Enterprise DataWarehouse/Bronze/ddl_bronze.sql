/*
===============================================================================
Project      : Enterprise Data Warehouse
Layer        : Bronze (Raw Ingestion Layer)
Author       : Data Engineering Team
Created On   : 2026-02-02
Description  :
    This script creates all Bronze layer tables.
    Bronze layer stores raw source data with minimal transformation.

    Design Principles:
        - Append-only ingestion
        - Full auditability
        - Source traceability
        - Batch tracking
        - Change detection ready
        - Non-destructive deployment

IMPORTANT:
    This script DOES NOT drop existing tables.
    It only creates tables if they do not exist.

===============================================================================
*/

------------------------------------------------------------------------------
-- 1. Safety Check: Ensure Correct Database Context
------------------------------------------------------------------------------
IF DB_NAME() <> 'DataWarehouse'
BEGIN
    THROW 50001, 'This script must be executed in the DataWarehouse database.', 1;
END;
GO

------------------------------------------------------------------------------
-- 2. CRM - Customer Information (Bronze)
------------------------------------------------------------------------------
IF OBJECT_ID('Bronze.crm_cust_info', 'U') IS NULL
BEGIN
    PRINT 'Creating table: Bronze.crm_cust_info';

    CREATE TABLE Bronze.crm_cust_info
    (
        ----------------------------------------------------------------------
        -- Raw Source Columns
        ----------------------------------------------------------------------
        cst_id              INT                 NULL,
        cst_key             NVARCHAR(100)       NULL,
        cst_firstname       NVARCHAR(100)       NULL,
        cst_lastname        NVARCHAR(100)       NULL,
        cst_marital_status  NVARCHAR(20)        NULL,
        cst_gndr            NVARCHAR(10)        NULL,
        cst_create_date     DATETIME2(3)        NULL,

        ----------------------------------------------------------------------
        -- Metadata Columns (Enterprise Standard)
        ----------------------------------------------------------------------
        source_system       NVARCHAR(50)        NOT NULL DEFAULT 'CRM',
        batch_id            BIGINT              NOT NULL,
        ingestion_id        UNIQUEIDENTIFIER    NOT NULL DEFAULT NEWID(),
        row_hash            VARBINARY(32)       NULL,
        is_deleted          BIT                 NOT NULL DEFAULT 0,
        load_datetime       DATETIME2(3)        NOT NULL DEFAULT SYSUTCDATETIME()
    );
END;
GO

------------------------------------------------------------------------------
-- 3. CRM - Product Information (Bronze)
------------------------------------------------------------------------------
IF OBJECT_ID('Bronze.crm_prd_info', 'U') IS NULL
BEGIN
    PRINT 'Creating table: Bronze.crm_prd_info';

    CREATE TABLE Bronze.crm_prd_info
    (
        prd_id          INT                 NULL,
        prd_key         NVARCHAR(100)       NULL,
        prd_nm          NVARCHAR(200)       NULL,
        prd_cost        DECIMAL(18,2)       NULL,
        prd_line        NVARCHAR(50)        NULL,
        prd_start_dt    DATETIME2(3)        NULL,
        prd_end_dt      DATETIME2(3)        NULL,

        source_system   NVARCHAR(50)        NOT NULL DEFAULT 'CRM',
        batch_id        BIGINT              NOT NULL,
        ingestion_id    UNIQUEIDENTIFIER    NOT NULL DEFAULT NEWID(),
        row_hash        VARBINARY(32)       NULL,
        is_deleted      BIT                 NOT NULL DEFAULT 0,
        load_datetime   DATETIME2(3)        NOT NULL DEFAULT SYSUTCDATETIME()
    );
END;
GO

------------------------------------------------------------------------------
-- 4. CRM - Sales Details (Bronze)
------------------------------------------------------------------------------
IF OBJECT_ID('Bronze.crm_sales_details', 'U') IS NULL
BEGIN
    PRINT 'Creating table: Bronze.crm_sales_details';

    CREATE TABLE Bronze.crm_sales_details
    (
        sls_ord_num     NVARCHAR(100)       NULL,
        sls_prd_key     NVARCHAR(100)       NULL,
        sls_cust_id     INT                 NULL,

        sls_order_dt    DATETIME2(3)        NULL,
        sls_ship_dt     DATETIME2(3)        NULL,
        sls_due_dt      DATETIME2(3)        NULL,

        sls_sales       DECIMAL(18,2)       NULL,
        sls_quantity    INT                 NULL,
        sls_price       DECIMAL(18,2)       NULL,

        source_system   NVARCHAR(50)        NOT NULL DEFAULT 'CRM',
        batch_id        BIGINT              NOT NULL,
        ingestion_id    UNIQUEIDENTIFIER    NOT NULL DEFAULT NEWID(),
        row_hash        VARBINARY(32)       NULL,
        is_deleted      BIT                 NOT NULL DEFAULT 0,
        load_datetime   DATETIME2(3)        NOT NULL DEFAULT SYSUTCDATETIME()
    );
END;
GO

------------------------------------------------------------------------------
-- 5. ERP - Location Data (Bronze)
------------------------------------------------------------------------------
IF OBJECT_ID('Bronze.erp_location', 'U') IS NULL
BEGIN
    PRINT 'Creating table: Bronze.erp_location';

    CREATE TABLE Bronze.erp_location
    (
        cid             NVARCHAR(100)       NULL,
        country         NVARCHAR(100)       NULL,

        source_system   NVARCHAR(50)        NOT NULL DEFAULT 'ERP',
        batch_id        BIGINT              NOT NULL,
        ingestion_id    UNIQUEIDENTIFIER    NOT NULL DEFAULT NEWID(),
        row_hash        VARBINARY(32)       NULL,
        is_deleted      BIT                 NOT NULL DEFAULT 0,
        load_datetime   DATETIME2(3)        NOT NULL DEFAULT SYSUTCDATETIME()
    );
END;
GO

------------------------------------------------------------------------------
-- 6. ERP - Customer Attributes (Bronze)
------------------------------------------------------------------------------
IF OBJECT_ID('Bronze.erp_customer_attr', 'U') IS NULL
BEGIN
    PRINT 'Creating table: Bronze.erp_customer_attr';

    CREATE TABLE Bronze.erp_customer_attr
    (
        cid             NVARCHAR(100)       NULL,
        birth_date      DATE                NULL,
        gender          NVARCHAR(20)        NULL,

        source_system   NVARCHAR(50)        NOT NULL DEFAULT 'ERP',
        batch_id        BIGINT              NOT NULL,
        ingestion_id    UNIQUEIDENTIFIER    NOT NULL DEFAULT NEWID(),
        row_hash        VARBINARY(32)       NULL,
        is_deleted      BIT                 NOT NULL DEFAULT 0,
        load_datetime   DATETIME2(3)        NOT NULL DEFAULT SYSUTCDATETIME()
    );
END;
GO

------------------------------------------------------------------------------
-- 7. ERP - Product Category Mapping (Bronze)
------------------------------------------------------------------------------
IF OBJECT_ID('Bronze.erp_product_category', 'U') IS NULL
BEGIN
    PRINT 'Creating table: Bronze.erp_product_category';

    CREATE TABLE Bronze.erp_product_category
    (
        product_id      NVARCHAR(100)       NULL,
        category        NVARCHAR(100)       NULL,
        subcategory     NVARCHAR(100)       NULL,
        maintenance     NVARCHAR(100)       NULL,

        source_system   NVARCHAR(50)        NOT NULL DEFAULT 'ERP',
        batch_id        BIGINT              NOT NULL,
        ingestion_id    UNIQUEIDENTIFIER    NOT NULL DEFAULT NEWID(),
        row_hash        VARBINARY(32)       NULL,
        is_deleted      BIT                 NOT NULL DEFAULT 0,
        load_datetime   DATETIME2(3)        NOT NULL DEFAULT SYSUTCDATETIME()
    );
END;
GO

------------------------------------------------------------------------------
PRINT 'Bronze layer table creation completed successfully.';
------------------------------------------------------------------------------
