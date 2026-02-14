/*==============================================================
  TABLE: Bronze.erp_px_cat_g1v2 → Silver.erp_px_cat_g1v2
==============================================================*/

-- -------------------------------------------------------------
-- 1️ Category ID Mapping Validation
-- -------------------------------------------------------------
SELECT id
FROM Bronze.erp_px_cat_g1v2
WHERE id NOT IN (
    SELECT cat_id
    FROM Silver.crm_prd_info
);

-- -------------------------------------------------------------
-- 2️ Trim / Space Check
-- -------------------------------------------------------------
SELECT *
FROM Bronze.erp_px_cat_g1v2
WHERE cat != TRIM(cat)
   OR subcat != TRIM(subcat)
   OR maintenance != TRIM(maintenance);

-- -------------------------------------------------------------
-- 3️ Raw Distinct Values
-- -------------------------------------------------------------
SELECT DISTINCT cat FROM Bronze.erp_px_cat_g1v2;
SELECT DISTINCT subcat FROM Bronze.erp_px_cat_g1v2;
SELECT DISTINCT maintenance FROM Bronze.erp_px_cat_g1v2;

-- -------------------------------------------------------------
-- 4️ Final Insert (Bronze → Silver)
-- -------------------------------------------------------------
INSERT INTO Silver.erp_px_cat_g1v2
(
    id,
    cat,
    subcat,
    maintenance
)
SELECT
    id,
    cat,
    subcat,
    maintenance
FROM Bronze.erp_px_cat_g1v2;
