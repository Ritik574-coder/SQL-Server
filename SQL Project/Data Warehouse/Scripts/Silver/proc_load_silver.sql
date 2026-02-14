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

Author : Ritik___
===============================================================================
*/

