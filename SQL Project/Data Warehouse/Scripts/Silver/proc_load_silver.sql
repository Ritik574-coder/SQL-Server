/*
===============================================================================
Stored Procedure: Load Silver Layer (Bronze -> Silver)
===============================================================================
Script Purpose:
    This stored procedure loads and transforms data from the 'bronze' schema 
    into the 'silver' schema as part of the medallion architecture.

    It performs the following actions:
    - Truncates existing Silver tables before loading fresh data.
    - Cleans and standardizes textual fields (TRIM, UPPER, formatting).
    - Deduplicates records using ROW_NUMBER() logic.
    - Applies data transformations and business rules.
    - Handles null values, invalid dates, and negative numeric values.
    - Performs data consistency checks (e.g., sales = quantity × price).
    - Logs execution progress and load duration.

Business Logic Applied:
    - Customer deduplication based on latest creation date.
    - Gender and marital status standardization.
    - Product category extraction and line standardization.
    - Sales data validation and recalculation when inconsistent.
    - ERP data normalization (country names, gender mapping, ID cleanup).

Data Flow:
    Bronze Tables  →  Transformation & Cleansing  →  Silver Tables

Parameters:
    None.
    This stored procedure does not accept any parameters 
    and does not return any values.

Error Handling:
    - Uses TRY...CATCH block.
    - Prints error message, error number, and error state if failure occurs.

Usage Example:
    EXEC silver.load_silver;

Dependencies:
    - Bronze.crm_cust_info
    - Bronze.crm_prd_info
    - Bronze.crm_sales_details
    - Bronze.erp_cust_az12
    - Bronze.erp_loc_a101
    - Bronze.erp_px_cat_g1v2

    Target Tables:
    - Silver.crm_cust_info
    - Silver.crm_prd_info
    - Silver.crm_sales_details
    - Silver.erp_cust_az12
    - Silver.erp_loc_a101
    - Silver.erp_px_cat_g1v2

Author : Ritik__
===============================================================================
*/

CREATE OR ALTER PROCEDURE silver.load_silver AS 
BEGIN
    DECLARE @batch_start_time DATETIME , @batch_end_time DATETIME , @start_time DATETIME , @end_time DATETIME 
    BEGIN TRY
        SET @batch_start_time = GETDATE() ;
        PRINT '=============================================' ;
        PRINT 'starting silver layer load procecss....' ;
        PRINT '=============================================' ;

        PRINT '---------------------------------------------' ;
        PRINT 'Loading CRM Tables'  ;
        PRINT '---------------------------------------------' ;

        SET @start_time = GETDATE() ;
        PRINT '>> Truncate table : Silver.crm_cust_info' ;
        TRUNCATE TABLE Silver.crm_cust_info ;
        PRINT '>> Inserting data into : Silver.crm_cust_info' ;
        INSERT INTO Silver.crm_cust_info(
            cst_id ,
            cst_key ,
            cst_firstname ,
            cst_lastname ,
            cst_marital_status ,
            cst_gndr,
            cst_create_date)
        SELECT
            cst_id ,
            cst_key ,
            TRIM(cst_firstname) AS cst_firstname,
            TRIM(cst_lastname) AS cst_lastname,

                CASE
                WHEN UPPER(TRIM(cst_marital_status)) = 'S' THEN 'Single' 
                WHEN UPPER(TRIM(cst_marital_status)) = 'M' THEN 'Married'
                ELSE 'Unknown'
            END cst_marital_status  ,

            CASE
                WHEN UPPER(TRIM(cst_gndr)) = 'M' THEN 'Male' 
                WHEN UPPER(TRIM(cst_gndr)) = 'F' THEN 'Female'
                ELSE 'Unknown'
            END cst_gndr  ,

            cst_create_date
        FROM(
            SELECT *,
            ROW_NUMBER() OVER(PARTITION BY cst_id ORDER BY cst_create_date DESC) AS flag_last
            FROM Bronze.crm_cust_info
            WHERE cst_id IS NOT NULL 
        )t  WHERE flag_last = 1 
        SET @end_time = GETDATE() ;
        PRINT 'Loading Duration : ' + CAST(DATEDIFF(SECOND ,@start_time , @end_time) AS NVARCHAR) + ' seconds ' ;
        PRINT '---------------------' ;
        
        SET @start_time = GETDATE() ; 
        PRINT '>> Truncate table : Silver.crm_prd_info' ;
        TRUNCATE TABLE Silver.crm_prd_info ;
        PRINT '>> Insertion data into : Silver.crm_prd_info' ;
        INSERT INTO Silver.crm_prd_info(
            prd_id ,
            cat_id ,
            prd_key ,
            prd_nm ,
            prd_cost ,
            prd_line ,
            prd_start_dt ,
            prd_end_dt 
        )
        SELECT 
            prd_id ,
            REPLACE(SUBSTRING(prd_key , 1 , 5),'-','_') AS cat_id ,
            SUBSTRING(prd_key , 7 ,LEN(prd_key)) AS prd_key ,
            prd_nm ,
            ISNULL(prd_cost,0) prd_cost,
            CASE UPPER(TRIM(prd_line))
                WHEN 'M' THEN 'Mountain'
                WHEN 'R' THEN 'Road'
                WHEN 'S' THEN 'Other Sales'
                WHEN 'T' THEN 'Turing'
                ELSE 'Unknown'
            END AS prd_line ,
            CAST(prd_start_dt AS DATE) AS prd_start_dt ,
            CAST(DATEADD(DAY, -1, LEAD(prd_start_dt) OVER(PARTITION BY prd_key ORDER BY prd_start_dt)) AS DATE) AS prd_end_dt
        FROM Bronze.crm_prd_info ;
        SET @end_time = GETDATE() ;
        PRINT 'Loading Duration : ' + CAST(DATEDIFF(SECOND ,@start_time , @end_time) AS NVARCHAR) + ' seconds ' ;
        PRINT '---------------------' ;

        SET @start_time = GETDATE() ;
        PRINT '>> Truncate table : Silver.crm_sales_details' ;
        TRUNCATE TABLE Silver.crm_sales_details ;
        PRINT '>> Inserting data into : Silver.crm_sales_details' ;
        INSERT INTO Silver.crm_sales_details(
            sls_ord_num ,
            sls_prd_key ,
            sls_cust_id ,
            sls_order_dt ,
            sls_ship_dt ,
            sls_due_dt ,
            sls_sales ,
            sls_quantity ,
            sls_price
        )
        SELECT  
            sls_ord_num ,
            sls_prd_key ,
            sls_cust_id ,

            CASE WHEN sls_order_dt <= 0 OR LEN(sls_order_dt) != 8 THEN NULL
            ELSE CAST(CAST(sls_order_dt AS NVARCHAR) AS DATE)
            END AS sls_order_dt ,

            CASE WHEN sls_ship_dt <= 0 OR LEN(sls_ship_dt) != 8 THEN NULL
            ELSE CAST(CAST(sls_ship_dt AS NVARCHAR) AS DATE)
            END AS sls_ship_dt,

            CASE WHEN sls_due_dt <= 0 OR LEN(sls_due_dt) != 8 THEN NULL
            ELSE CAST(CAST(sls_due_dt AS NVARCHAR) AS DATE)
            END AS sls_due_dt ,

            CASE WHEN CAST(sls_sales AS INT) IS NULL OR CAST(sls_sales AS INT) <= 0 OR  CAST(sls_sales AS INT) != CAST(sls_quantity AS INT) * ABS(CAST(sls_price AS INT))
                THEN CAST(sls_quantity AS INT) * ABS(CAST(sls_price AS INT)) 
                ELSE CAST(sls_sales AS INT)
            END as sls_sales ,

            sls_quantity ,
            CASE WHEN  CAST(sls_price AS INT) IS NULL OR CAST(sls_price AS INT) <= 0
                THEN CAST(sls_sales AS INT) / NULLIF(CAST(sls_quantity AS INT) , 0)
                ELSE CAST(sls_price AS INT)
            END sls_price 
        FROM Bronze.crm_sales_details ;
        SET @end_time = GETDATE() ;
        PRINT 'Loading Duration : ' + CAST(DATEDIFF(SECOND ,@start_time , @end_time) AS NVARCHAR) + ' seconds ' ;
        PRINT '---------------------' ;

        PRINT '---------------------------------------------' ;
        PRINT 'Loading ERP Tables'  ;
        PRINT '---------------------------------------------' ;

        SET @start_time = GETDATE() ; 
        PRINT '>> Truncate table : Silver.erp_cust_az12' ;
        TRUNCATE TABLE Silver.erp_cust_az12 ;
        PRINT '>> Inserting data into : Silver.erp_cust_az12' ;
        INSERT INTO Silver.erp_cust_az12
        (
            cid ,
            bdate ,
            gen
        )
        SELECT 
            CASE WHEN cid LIKE 'NAS%' THEN SUBSTRING(cid , 4 , LEN(cid))
                ELSE cid 
            END cid,

            CASE 
                WHEN bdate < '1930-01-01' OR bdate > GETDATE()  THEN NULL
                ELSE bdate
            END bdate,

            CASE TRIM(UPPER(gen))
                WHEN 'MALE' THEN 'Male'
                WHEN 'FEMALE' THEN 'Female'
                WHEN 'F' THEN 'Female'
                WHEN 'M' THEN 'Male'
                ELSE 'Unknown'
                END gen
        FROM Bronze.erp_cust_az12  ;
        SET @end_time = GETDATE() ;
        PRINT 'Loading Duration : ' + CAST(DATEDIFF(SECOND ,@start_time , @end_time) AS NVARCHAR) + ' seconds ' ;
        PRINT '---------------------' ;

        SET @start_time = GETDATE() ;
        PRINT '>> Truncate table : Silver.erp_loc_a101' ;
        TRUNCATE TABLE Silver.erp_loc_a101 ;
        PRINT '>> Inserting data into : Silver.erp_loc_a101' ;
        INSERT INTO Silver.erp_loc_a101
        (
            cid ,
            cntry
        )
        SELECT
            REPLACE(cid , '-' , '') cid ,
            CASE
                WHEN TRIM(UPPER(cntry)) = '' THEN 'Unknown'
                WHEN TRIM(UPPER(cntry)) IS NULL THEN 'Unknown'
                WHEN TRIM(UPPER(cntry)) IN ('DE' , 'GERMANY') THEN 'Germany'
                WHEN TRIM(UPPER(cntry)) IN ( 'US' ,'USA' , 'UNITED STATES') THEN 'United States'
                WHEN TRIM(UPPER(cntry)) IN ('UK' , 'UNITED KINGDOM') THEN 'United Kingdom'
                ELSE cntry
            END cntry
        FROM Bronze.erp_loc_a101 ;
        SET @end_time = GETDATE() ;
        PRINT 'Loading Duration : ' + CAST(DATEDIFF(SECOND ,@start_time , @end_time) AS NVARCHAR) + ' seconds ' ;
        PRINT '---------------------' ;

        SET @start_time = GETDATE() ;
        PRINT '>> Truncate table : Silver.erp_px_cat_g1v2' ;
        TRUNCATE TABLE Silver.erp_px_cat_g1v2 ;
        PRINT '>> Inserting data into : Silver.erp_px_cat_g1v2' ;
        INSERT INTO Silver.erp_px_cat_g1v2
        (
            id ,
            cat ,
            subcat ,
            maintenance
        )
        SELECT 
            id ,
            cat ,
            subcat ,
            maintenance  
        FROM Bronze.erp_px_cat_g1v2 ;
        SET @end_time = GETDATE() ;
        PRINT 'Loading Duration : ' + CAST(DATEDIFF(SECOND ,@start_time , @end_time) AS NVARCHAR) + ' seconds ' ;
        PRINT '---------------------' ;

        SET @batch_end_time = GETDATE() ; 
        PRINT '=============================================' ;
        PRINT 'Loading Silver Layer is Completed....' ;
        PRINT 'Loadign Duration : ' + CAST(DATEDIFF(SECOND , @batch_start_time , @batch_end_time)AS NVARCHAR) + ' second ' ;
        PRINT '=============================================' ;
    END TRY
    BEGIN CATCH
        PRINT '====================================================' ;
        PRINT 'ERROR OCCURED DURING LOADING BRONZE LAYER' ;
        PRINT 'Error Massage : ' + ERROR_MESSAGE() ;
        PRINT 'Error Number :  ' + CAST(ERROR_NUMBER() AS NVARCHAR) ;
        PRINT 'Error Stage :   ' + CAST(ERROR_STATE() AS NVARCHAR) ;
        PRINT '====================================================' ;
    END CATCH
END  ;
