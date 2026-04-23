-- Query 3 -- Customer_behaviour_segmentation

SELECT 
    ID,
    Marital_Status,
    (CAST(Kidhome AS INT) + CAST(Teenhome AS INT)) as Total_Children,
    -- Spending on "Fun" items vs "Staples"
    CAST(AmtChocolates AS INT) as Sweets_Spend,
    CAST(AmtLiq AS INT) as Liquor_Spend,
	CAST(Amtvege AS INT) as Vegetable_Spend,
	CAST(AmtNonVeg AS INT) as Meat_Spend,
	CAST(AmtComm AS INT) as Commodities_Spend,
	CAST(AmtPes AS INT) as Fish_Spend,
    -- Total Revenue for context
    (CAST(AmtLiq AS INT) + CAST(AmtVege AS INT) + CAST(AmtNonVeg AS INT) + 
     CAST(AmtPes AS INT) + CAST(AmtChocolates AS INT) + CAST(AmtComm AS INT)) as Total_Revenue
FROM production_marketing;

