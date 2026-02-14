/*==============================================================
  TABLE: Bronze.crm_sales_details → Silver.crm_sales_details
==============================================================*/

-- Leading/Trailing Space
SELECT sls_ord_num
FROM Bronze.crm_sales_details
WHERE sls_ord_num != TRIM(sls_ord_num);

-- Invalid Date Check
SELECT sls_order_dt
FROM Bronze.crm_sales_details
WHERE sls_order_dt <= 0
   OR LEN(sls_order_dt) != 8
   OR sls_order_dt > 20500101
   OR sls_order_dt < 19000101;

-- Sales Consistency Check
SELECT *
FROM Silver.crm_sales_details
WHERE sls_order_dt > sls_ship_dt
   OR sls_order_dt > sls_due_dt;

-- Final Insert
INSERT INTO Silver.crm_sales_details (
    sls_ord_num,
    sls_prd_key,
    sls_cust_id,
    sls_order_dt,
    sls_ship_dt,
    sls_due_dt,
    sls_sales,
    sls_quantity,
    sls_price
)
SELECT
    sls_ord_num,
    sls_prd_key,
    sls_cust_id,
    CASE WHEN sls_order_dt <= 0 OR LEN(sls_order_dt) != 8 THEN NULL
         ELSE CAST(CAST(sls_order_dt AS NVARCHAR) AS DATE)
    END,
    CASE WHEN sls_ship_dt <= 0 OR LEN(sls_ship_dt) != 8 THEN NULL
         ELSE CAST(CAST(sls_ship_dt AS NVARCHAR) AS DATE)
    END,
    CASE WHEN sls_due_dt <= 0 OR LEN(sls_due_dt) != 8 THEN NULL
         ELSE CAST(CAST(sls_due_dt AS NVARCHAR) AS DATE)
    END,
    CASE
        WHEN CAST(sls_sales AS INT) IS NULL
          OR CAST(sls_sales AS INT) <= 0
          OR CAST(sls_sales AS INT) != CAST(sls_quantity AS INT) * ABS(CAST(sls_price AS INT))
        THEN CAST(sls_quantity AS INT) * ABS(CAST(sls_price AS INT))
        ELSE CAST(sls_sales AS INT)
    END,
    sls_quantity,
    CASE
        WHEN CAST(sls_price AS INT) IS NULL
          OR CAST(sls_price AS INT) <= 0
        THEN CAST(sls_sales AS INT) / NULLIF(CAST(sls_quantity AS INT),0)
        ELSE CAST(sls_price AS INT)
    END
FROM Bronze.crm_sales_details;
