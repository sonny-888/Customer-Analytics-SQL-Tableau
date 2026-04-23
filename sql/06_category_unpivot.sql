-- Query 4 -- Unpivoted_spending_data

SELECT 
    ID,
    Marital_Status,
    (CAST(Kidhome AS INT) + CAST(Teenhome AS INT)) as Total_Children,
    'Liquor' as Product_Category, 
    CAST(AmtLiq AS INT) as Spending
FROM production_marketing

UNION ALL

SELECT 
    ID, Marital_Status, (CAST(Kidhome AS INT) + CAST(Teenhome AS INT)),
    'Vegetables', CAST(AmtVege AS INT)
FROM production_marketing

UNION ALL

SELECT 
    ID, Marital_Status, (CAST(Kidhome AS INT) + CAST(Teenhome AS INT)),
    'Meat Products', CAST(AmtNonVeg AS INT)
FROM production_marketing

UNION ALL

SELECT 
    ID, Marital_Status, (CAST(Kidhome AS INT) + CAST(Teenhome AS INT)),
    'Fish', CAST(AmtPes AS INT)
FROM production_marketing

UNION ALL

SELECT 
    ID, Marital_Status, (CAST(Kidhome AS INT) + CAST(Teenhome AS INT)),
    'Sweets', CAST(AmtChocolates AS INT)
FROM production_marketing

UNION ALL

SELECT 
    ID, Marital_Status, (CAST(Kidhome AS INT) + CAST(Teenhome AS INT)),
    'Staple Groceries', CAST(AmtComm AS INT)
FROM production_marketing;