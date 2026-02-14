/*==============================================================
  TABLE: Bronze.erp_cust_az12 → Silver.erp_cust_az12
==============================================================*/

-- -------------------------------------------------------------
-- 1️ Raw Gender Distribution (Data Profiling)
-- -------------------------------------------------------------
SELECT DISTINCT
    '[' + gen + ']' AS RawGender,
    COUNT(*) AS Cnt
FROM Bronze.erp_cust_az12
GROUP BY gen
ORDER BY Cnt DESC;

-- -------------------------------------------------------------
-- 2️ Invalid Customer ID Check (Not Matching CRM)
-- -------------------------------------------------------------
SELECT DISTINCT
    cid
FROM Bronze.erp_cust_az12
WHERE CASE 
        WHEN cid LIKE 'NAS%' THEN SUBSTRING(cid , 4 , LEN(cid))
        ELSE cid 
      END NOT IN (
        SELECT DISTINCT cst_key 
        FROM Silver.crm_cust_info
      );

-- -------------------------------------------------------------
-- 3️ Invalid Birthdate Check
-- -------------------------------------------------------------
SELECT DISTINCT
    bdate
FROM Bronze.erp_cust_az12
WHERE bdate < '1930-01-01'
   OR bdate > GETDATE();

-- -------------------------------------------------------------
-- 4️ Gender Standardization Preview
-- -------------------------------------------------------------
SELECT DISTINCT
    CASE TRIM(UPPER(gen))
        WHEN 'MALE' THEN 'Male'
        WHEN 'FEMALE' THEN 'Female'
        WHEN 'F' THEN 'Female'
        WHEN 'M' THEN 'Male'
        ELSE 'Unknown'
    END AS CleanGender
FROM Bronze.erp_cust_az12;

-- -------------------------------------------------------------
-- 5️ Final Insert (Bronze → Silver)
-- -------------------------------------------------------------
INSERT INTO Silver.erp_cust_az12
(
    cid,
    bdate,
    gen
)
SELECT 
    CASE 
        WHEN cid LIKE 'NAS%' THEN SUBSTRING(cid , 4 , LEN(cid))
        ELSE cid 
    END,
    CASE 
        WHEN bdate < '1930-01-01'
          OR bdate > GETDATE()
        THEN NULL
        ELSE bdate
    END,
    CASE TRIM(UPPER(gen))
        WHEN 'MALE' THEN 'Male'
        WHEN 'FEMALE' THEN 'Female'
        WHEN 'F' THEN 'Female'
        WHEN 'M' THEN 'Male'
        ELSE 'Unknown'
    END
FROM Bronze.erp_cust_az12;
