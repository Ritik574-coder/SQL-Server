/*
===============================================================================
Gold Layer - Dimension and Fact Views
===============================================================================
Script Purpose:
    This script creates the Gold layer views for the data warehouse using
    the Medallion Architecture (Bronze -> Silver -> Gold).

    The Gold layer represents the business-level curated data model
    organized into Dimensions and Facts using a Star Schema design.

Objects Created:
    - Gold.dim_customers
    - Gold.dim_products
    - Gold.fact_sales

Data Sources:
    Silver Layer Tables

Author : Ritik__
===============================================================================
*/

--==============================================================================
-- Create Dimension: Customers
--==============================================================================

CREATE VIEW Gold.dim_customers AS
SELECT
    ROW_NUMBER() OVER(ORDER BY cst_id) AS customer_key ,
    ci.cst_id AS customer_id,
    ci.cst_key AS customer_number,
    ci.cst_firstname AS first_name,
    ci.cst_lastname AS last_name,
    la.cntry AS country,
    ci.cst_marital_status AS marital_status,
    CASE
        WHEN ci.cst_gndr IN ('Male','Female')
            THEN ci.cst_gndr
        WHEN ca.gen IN ('Male','Female')
            THEN ca.gen
        ELSE 'Unknown'
    END AS gender,
    ca.bdate AS birth_date,
    ci.cst_create_date AS created_date
FROM Silver.crm_cust_info AS ci 
LEFT JOIN Silver.erp_cust_az12 AS ca
        ON ci.cst_key = ca.cid 
LEFT JOIN Silver.erp_loc_a101 AS la
        ON ci.cst_key = la.cid ;


--==============================================================================
-- Create Dimension: Products
--==============================================================================

CREATE VIEW Gold.dim_products AS
SELECT
    ROW_NUMBER() OVER(ORDER BY pn.prd_start_dt , pn.prd_end_dt) AS product_key ,
    pn.prd_id AS product_id,
    pn.prd_key AS product_number,
    pn.prd_nm AS product_name,
    pn.cat_id AS category_id,
    epn.cat AS category,
    epn.subcat AS subcategory,
    pn.prd_line AS product_line,
    pn.prd_cost AS cost,
    epn.maintenance maintenance,
    pn.prd_start_dt start_date
FROM Silver.crm_prd_info AS pn
LEFT JOIN Silver.erp_px_cat_g1v2 AS epn
    ON pn.cat_id = epn.id
WHERE prd_end_dt IS NULL ;


--==============================================================================
-- Create Fact: Sales
--==============================================================================

CREATE VIEW Gold.fact_sales AS 
SELECT
    csd.sls_ord_num AS order_number,
    pd.product_key ,
    cd.customer_key ,
    csd.sls_prd_key AS product_number,
    csd.sls_cust_id AS customer_id,
    csd.sls_order_dt AS order_date,
    csd.sls_ship_dt AS shipping_date,
    csd.sls_due_dt AS due_date,
    csd.sls_sales AS sales_amount,
    csd.sls_quantity AS quantity,
    csd.sls_price AS price
FROM Silver.crm_sales_details AS csd 
LEFT JOIN Gold.dim_products AS pd
    ON csd.sls_prd_key = pd.product_number
LEFT JOIN Gold.dim_customers AS cd
    ON csd.sls_cust_id = cd.customer_id ;
