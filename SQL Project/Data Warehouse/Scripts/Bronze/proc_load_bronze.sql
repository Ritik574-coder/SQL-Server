/*
===============================================================================
Stored Procedure: Load Bronze Layer (Source -> Bronze)
===============================================================================
Script Purpose:
    This stored procedure loads data into the 'bronze' schema from external CSV files. 
    It performs the following actions:
    - Truncates the bronze tables before loading data.
    - Uses the `BULK INSERT` command to load data from csv Files to bronze tables.

Parameters:
    None. 
	This stored procedure does not accept any parameters or return any values.

Usage Example:
    EXEC bronze.load_bronze;
===============================================================================
*/

CREATE OR ALTER PROCEDURE bronze.load_bronze AS 
BEGIN
    DECLARE @start_time DATETIME , @end_time DATETIME ,@batch_start_time DATETIME , @batch_end_time DATETIME ; 
    BEGIN TRY 
        SET @batch_start_time = GETDATE() ;
        PRINT '=============================================' ;
        PRINT 'Starting Bronze Layer Load Process...' ;
        PRINT '=============================================' ;

        PRINT '---------------------------------------------' ;
        PRINT 'Loading CRM tables' ;
        PRINT '---------------------------------------------' ;

        SET @start_time = GETDATE() ;
        PRINT '>> Truncate table : bronze.crm_cust_info' ;
        TRUNCATE TABLE bronze.crm_cust_info ; 
        PRINT '>> Inserting data into : bronze.crm_cust_info' ;
        BULK INSERT bronze.crm_cust_info 
        FROM 'C:\Temp\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'
        WITH
        (
            FORMAT = 'CSV' ,
            FIRSTROW = 2 ,
            CODEPAGE = '65001' ,

            FIELDTERMINATOR = ',' ,
            ROWTERMINATOR = '0x0d0a' ,

            TABLOCK ,
            BATCHSIZE = 10000 ,

            ERRORFILE = 'C:\Temp\sql-data-warehouse-project\sql-data-warehouse-project\datasets\log_file_crm\cust_log' ,
            MAXERRORS = 100

        ) ;
        SET @end_time = GETDATE() ;
        PRINT 'Loading Duration : ' + CAST(DATEDIFF(SECOND ,@start_time , @end_time) AS NVARCHAR) + ' seconds ' ;
        PRINT '---------------------' ;

        SET @start_time = GETDATE() ;
        PRINT '>> Truncate table : bronze.crm_prd_info' ;
        TRUNCATE TABLE bronze.crm_prd_info ; 
        PRINT '>> Inserting data into : bronze.crm_prd_info' ;
        BULK INSERT bronze.crm_prd_info 
        FROM 'C:\Temp\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\prd_info.csv'
        WITH
        (
            FORMAT = 'CSV' ,
            FIRSTROW = 2 ,
            CODEPAGE = '65001' ,

            FIELDTERMINATOR = ',' ,
            ROWTERMINATOR = '0x0d0a' ,

            TABLOCK ,
            BATCHSIZE = 10000 ,

            ERRORFILE = 'C:\Temp\sql-data-warehouse-project\sql-data-warehouse-project\datasets\log_file_crm\prd_info' ,
            MAXERRORS = 100

        ) ;
        SET @end_time = GETDATE() ;
        PRINT 'Loading Duration : ' + CAST(DATEDIFF(SECOND ,@start_time , @end_time) AS NVARCHAR) + ' seconds ' ;
        PRINT '---------------------' ;

        SET @start_time = GETDATE() ;
        PRINT '>> Truncate table : bronze.crm_sales_details' ;
        TRUNCATE TABLE bronze.crm_sales_details ; 
        PRINT '>> Inserting data into : bronze.crm_sales_details' ;
        BULK INSERT bronze.crm_sales_details
        FROM 'C:\Temp\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\sales_details.csv'
        WITH
        (
            FORMAT = 'CSV' ,
            FIRSTROW = 2 ,
            CODEPAGE = '65001' ,

            FIELDTERMINATOR = ',' ,
            ROWTERMINATOR = '0x0d0a' ,

            TABLOCK ,
            BATCHSIZE = 10000 ,

            ERRORFILE = 'C:\Temp\sql-data-warehouse-project\sql-data-warehouse-project\datasets\log_file_crm\sales_details' ,
            MAXERRORS = 100

        ) ;
        SET @end_time = GETDATE() ;
        PRINT 'Loading Duration : ' + CAST(DATEDIFF(SECOND ,@start_time , @end_time) AS NVARCHAR) + ' seconds ' ;
        PRINT '---------------------' ;

        PRINT '====================================' ;
        PRINT 'Loading ERP Tables' ;
        PRINT '====================================' ;

        SET @start_time = GETDATE() ;
        PRINT '>> Truncate table : bronze.erp_cust_az12' ;
        TRUNCATE TABLE bronze.erp_cust_az12 ; 
        PRINT '>> Inserting data into : bronze.erp_cust_az12' ;
        BULK INSERT bronze.erp_cust_az12
        FROM 'C:\Temp\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\CUST_AZ12.csv'
        WITH
        (
            FORMAT = 'CSV' ,
            FIRSTROW = 2 ,
            CODEPAGE = '65001' ,

            FIELDTERMINATOR = ',' ,
            ROWTERMINATOR = '0x0d0a' ,

            TABLOCK ,
            BATCHSIZE = 10000 ,

            ERRORFILE = 'C:\Temp\sql-data-warehouse-project\sql-data-warehouse-project\datasets\log_file_erp\cust_az12' ,
            MAXERRORS = 100

        ) ;
        SET @end_time = GETDATE() ;
        PRINT 'Loading Duration : ' + CAST(DATEDIFF(SECOND ,@start_time , @end_time) AS NVARCHAR) + ' seconds ' ;
        PRINT '---------------------' ;

        SET @start_time = GETDATE() ;
        PRINT '>> Truncate table : bronze.erp_loc_a101' ;
        TRUNCATE TABLE bronze.erp_loc_a101 ; 
        PRINT '>> Inserting data into : bronze.erp_loc_a101' ;
        BULK INSERT bronze.erp_loc_a101
        FROM 'C:\Temp\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\LOC_A101.csv'
        WITH
        (
            FORMAT = 'CSV' ,
            FIRSTROW = 2 ,
            CODEPAGE = '65001' ,

            FIELDTERMINATOR = ',' ,
            ROWTERMINATOR = '0x0d0a' ,

            TABLOCK ,
            BATCHSIZE = 10000 ,

            ERRORFILE = 'C:\Temp\sql-data-warehouse-project\sql-data-warehouse-project\datasets\log_file_erp\loc_a101' ,
            MAXERRORS = 100

        ) ;
        SET @end_time = GETDATE() ;
        PRINT 'Loading Duration : ' + CAST(DATEDIFF(SECOND ,@start_time , @end_time) AS NVARCHAR) + ' seconds ' ;
        PRINT '---------------------' ;

        SET @start_time = GETDATE() ;
        PRINT '>> Truncate table : bronze.erp_px_cat_g1v2' ;
        TRUNCATE TABLE bronze.erp_px_cat_g1v2 ; 
        PRINT '>> Inserting data into : bronze.erp_px_cat_g1v2' ;
        BULK INSERT bronze.erp_px_cat_g1v2
        FROM 'C:\Temp\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\PX_CAT_G1V2.csv'
        WITH
        (
            FORMAT = 'CSV' ,
            FIRSTROW = 2 ,
            CODEPAGE = '65001' ,

            FIELDTERMINATOR = ',' ,
            ROWTERMINATOR = '0x0d0a' ,

            TABLOCK ,
            BATCHSIZE = 10000 ,

            ERRORFILE = 'C:\Temp\sql-data-warehouse-project\sql-data-warehouse-project\datasets\log_file_erp\px_cat_g1v2' ,
            MAXERRORS = 100

        ) ;
        SET @end_time = GETDATE() ;
        PRINT 'Loading Duration : ' + CAST(DATEDIFF(SECOND ,@start_time , @end_time) AS NVARCHAR) + ' seconds ' ;
        PRINT '---------------------' ;

        SET @batch_end_time = GETDATE() ;
        PRINT '=====================================' ;
        PRINT 'Loading Bronze Layer is Completed....' ;
        PRINT 'Loading Duration : ' + CAST(DATEDIFF(SECOND ,@batch_start_time , @batch_end_time) AS NVARCHAR) + ' seconds ' ;
        PRINT '=====================================' ;
    END TRY 
    BEGIN CATCH
        PRINT '==========================================' ; 
        PRINT 'Error Massage ' + ERROR_MESSAGE() ;
        PRINT 'Error Number  ' + CAST(ERROR_NUMBER() AS NVARCHAR) ;
        PRINT 'Error State   ' + CAST(ERROR_STATE() AS NVARCHAR) ;
        PRINT '==========================================' ;
    END CATCH 
END ;
