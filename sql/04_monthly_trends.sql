--Query 2== Monthly_trend_analysis

SELECT
    -- 1. Standardize dates to the first of the month
    DATE_TRUNC('month', Dt_Customer)::DATE AS month,

    -- 2. Use the ID directly (it's already an INT in production_marketing)
    ID AS customer_id,

    -- 3. Use the Total_Spend column we already engineered in script 02
    Total_Spend,

    -- 4. Monthly customer count using a Window Function
    COUNT(ID) OVER (
        PARTITION BY DATE_TRUNC('month', Dt_Customer)
    ) AS total_customers_in_month

FROM production_marketing

-- Filters out the empty rows we handled during ELT
WHERE ID IS NOT NULL

ORDER BY month, customer_id;

