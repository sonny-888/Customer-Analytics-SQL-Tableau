/* Project: Marketing Analytics
   Script: 03_Analysis_Queries
   Description: Creates the analytical View. 
   Note: Uses explicit casting to ensure math works regardless of 
   the underlying table's data types.
*/

CREATE OR REPLACE VIEW v_customer_performance AS
SELECT
    id,
    year_birth,
    education,
    marital_status,
    income,
    dt_customer,
    recency,
    
    -- Total Spend: We cast to INT here just in case the table kept them as TEXT
    (
        COALESCE(amtliq::int, 0) + 
        COALESCE(amtvege::int, 0) + 
        COALESCE(amtnonveg::int, 0) + 
        COALESCE(amtpes::int, 0) + 
        COALESCE(amtchocolates::int, 0) + 
        COALESCE(amtcomm::int, 0)
    ) AS total_spend,

    -- Total Transactions
    (
        COALESCE(numwebbuy::int, 0) + 
        COALESCE(numwalkinpur::int, 0) + 
        COALESCE(numdeals::int, 0)
    ) AS total_transactions,

    -- Loyalty Segmentation
    CASE
        WHEN (COALESCE(numwebbuy::int, 0) + COALESCE(numwalkinpur::int, 0) + COALESCE(numdeals::int, 0)) >= 20 THEN '1. Loyal Power User'
        WHEN (COALESCE(numwebbuy::int, 0) + COALESCE(numwalkinpur::int, 0) + COALESCE(numdeals::int, 0)) BETWEEN 10 AND 19 THEN '2. Frequent Buyer'
        ELSE '3. Occasional'
    END AS loyalty_segment,

    -- Churn Logic
    CASE
        WHEN recency::int > 60 THEN 'Churned'
        ELSE 'Active'
    END AS churn_status,

    country,
    age

FROM production_marketing
WHERE id IS NOT NULL;

-- Simple test to verify the View is active
SELECT * FROM v_customer_performance LIMIT 10;






