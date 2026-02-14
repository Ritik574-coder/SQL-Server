/*==============================================================
  TABLE: Bronze.erp_loc_a101 → Silver.erp_loc_a101
==============================================================*/

-- -------------------------------------------------------------
-- 1️ Invalid Customer Mapping Check
-- -------------------------------------------------------------
SELECT
    REPLACE(cid , '-' , '') AS CleanCID
FROM Bronze.erp_loc_a101
WHERE REPLACE(cid , '-' , '') NOT IN (
    SELECT cst_key
    FROM Silver.crm_cust_info
);

-- -------------------------------------------------------------
-- 2️ Raw Country Distribution
-- -------------------------------------------------------------
SELECT DISTINCT cntry
FROM Bronze.erp_loc_a101;

-- -------------------------------------------------------------
-- 3️ Country Standardization Preview
-- -------------------------------------------------------------
SELECT DISTINCT
    CASE
        WHEN TRIM(UPPER(cntry)) = '' THEN 'Unknown'
        WHEN TRIM(UPPER(cntry)) IS NULL THEN 'Unknown'
        WHEN TRIM(UPPER(cntry)) IN ('DE','GERMANY') THEN 'Germany'
        WHEN TRIM(UPPER(cntry)) IN ('US','USA','UNITED STATES') THEN 'United States'
        WHEN TRIM(UPPER(cntry)) IN ('UK','UNITED KINGDOM') THEN 'United Kingdom'
        ELSE cntry
    END AS CleanCountry
FROM Bronze.erp_loc_a101;

-- -------------------------------------------------------------
-- 4️ Final Insert (Bronze → Silver)
-- -------------------------------------------------------------
INSERT INTO Silver.erp_loc_a101
(
    cid,
    cntry
)
SELECT
    REPLACE(cid , '-' , ''),
    CASE
        WHEN TRIM(UPPER(cntry)) = '' THEN 'Unknown'
        WHEN TRIM(UPPER(cntry)) IS NULL THEN 'Unknown'
        WHEN TRIM(UPPER(cntry)) IN ('DE','GERMANY') THEN 'Germany'
        WHEN TRIM(UPPER(cntry)) IN ('US','USA','UNITED STATES') THEN 'United States'
        WHEN TRIM(UPPER(cntry)) IN ('UK','UNITED KINGDOM') THEN 'United Kingdom'
        ELSE cntry
    END
FROM Bronze.erp_loc_a101;
