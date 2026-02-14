/*==============================================================
  TABLE: Bronze.crm_prd_info → Silver.crm_prd_info
==============================================================*/

-- Duplicate Primary Key Check
SELECT prd_id, COUNT(*)
FROM Silver.crm_prd_info
GROUP BY prd_id
HAVING COUNT(*) > 1 OR prd_id IS NULL;

-- Negative / Null Cost
SELECT prd_cost
FROM Silver.crm_prd_info
WHERE prd_cost < 0 OR prd_cost IS NULL;

-- Trim Check
SELECT prd_nm
FROM Silver.crm_prd_info
WHERE prd_nm != TRIM(prd_nm);

-- Standardization Check
SELECT DISTINCT prd_line FROM Silver.crm_prd_info;

-- Final Insert
INSERT INTO Silver.crm_prd_info (
    prd_id,
    cat_id,
    prd_key,
    prd_nm,
    prd_cost,
    prd_line,
    prd_start_dt,
    prd_end_dt
)
SELECT
    prd_id,
    REPLACE(SUBSTRING(prd_key,1,5),'-','_'),
    SUBSTRING(prd_key,7,LEN(prd_key)),
    prd_nm,
    ISNULL(prd_cost,0),
    CASE UPPER(TRIM(prd_line))
        WHEN 'M' THEN 'Mountain'
        WHEN 'R' THEN 'Road'
        WHEN 'S' THEN 'Other Sales'
        WHEN 'T' THEN 'Turing'
        ELSE 'Unknown'
    END,
    CAST(prd_start_dt AS DATE),
    CAST(DATEADD(DAY,-1,
        LEAD(prd_start_dt) OVER(PARTITION BY prd_key ORDER BY prd_start_dt)
    ) AS DATE)
FROM Bronze.crm_prd_info;
