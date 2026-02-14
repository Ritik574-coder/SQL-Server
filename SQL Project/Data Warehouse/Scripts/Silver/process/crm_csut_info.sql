/*==============================================================
  TABLE: bronze.crm_cust_info
  PURPOSE: Null check, duplicate check, standardization
==============================================================*/

-- -------------------------------------------------------------
-- 1️ Metadata Check (Bronze vs Silver)
-- -------------------------------------------------------------
SELECT COLUMN_NAME, DATA_TYPE, CHARACTER_MAXIMUM_LENGTH, IS_NULLABLE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'bronze'
AND TABLE_NAME = 'crm_cust_info';

SELECT COLUMN_NAME, DATA_TYPE, CHARACTER_MAXIMUM_LENGTH, IS_NULLABLE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'silver'
AND TABLE_NAME = 'crm_cust_info';

-- -------------------------------------------------------------
-- 2️ Duplicate / Null Primary Key Check
-- -------------------------------------------------------------
SELECT cst_id, COUNT(*)
FROM Bronze.crm_cust_info
GROUP BY cst_id
HAVING COUNT(*) > 1 OR cst_id IS NULL;

-- -------------------------------------------------------------
-- 3️ Deduplication Logic Testing
-- -------------------------------------------------------------
SELECT *,
       ROW_NUMBER() OVER(PARTITION BY cst_id ORDER BY cst_create_date DESC) AS flag_last
FROM bronze.crm_cust_info
WHERE cst_id = 29466;

SELECT *
FROM (
    SELECT *,
           ROW_NUMBER() OVER(PARTITION BY cst_id ORDER BY cst_create_date DESC) AS flag_last
    FROM bronze.crm_cust_info
) t
WHERE flag_last != 1;

-- -------------------------------------------------------------
-- 4️ Unwanted Space Check
-- -------------------------------------------------------------
SELECT cst_firstname
FROM Bronze.crm_cust_info
WHERE cst_firstname != TRIM(cst_firstname);

SELECT cst_gndr
FROM Bronze.crm_cust_info
WHERE cst_gndr != TRIM(cst_gndr);

-- -------------------------------------------------------------
-- 5️ Standardization Check
-- -------------------------------------------------------------
SELECT DISTINCT cst_gndr FROM bronze.crm_cust_info;
SELECT DISTINCT cst_marital_status FROM bronze.crm_cust_info;

-- -------------------------------------------------------------
-- 6️ Final Insert (Bronze → Silver)
-- -------------------------------------------------------------
INSERT INTO Silver.crm_cust_info (
    cst_id,
    cst_key,
    cst_firstname,
    cst_lastname,
    cst_marital_status,
    cst_gndr,
    cst_create_date
)
SELECT
    cst_id,
    cst_key,
    TRIM(cst_firstname),
    TRIM(cst_lastname),
    CASE
        WHEN UPPER(TRIM(cst_marital_status)) = 'S' THEN 'Single'
        WHEN UPPER(TRIM(cst_marital_status)) = 'M' THEN 'Married'
        ELSE 'Unknown'
    END,
    CASE
        WHEN UPPER(TRIM(cst_gndr)) = 'M' THEN 'Male'
        WHEN UPPER(TRIM(cst_gndr)) = 'F' THEN 'Female'
        ELSE 'Unknown'
    END,
    cst_create_date
FROM (
    SELECT *,
           ROW_NUMBER() OVER(PARTITION BY cst_id ORDER BY cst_create_date DESC) AS flag_last
    FROM Bronze.crm_cust_info
    WHERE cst_id IS NOT NULL
) t
WHERE flag_last = 1;

-- -------------------------------------------------------------
-- 7️ Post-Load Validation (Silver)
-- -------------------------------------------------------------
SELECT cst_id, COUNT(*)
FROM Silver.crm_cust_info
GROUP BY cst_id
HAVING COUNT(*) > 1 OR cst_id IS NULL;

SELECT DISTINCT cst_gndr FROM Silver.crm_cust_info;
SELECT DISTINCT cst_marital_status FROM Silver.crm_cust_info;
