SELECT 
    ID,
    Country,
	'Liquor' AS Best_Product,
    SUM(AmtLiq::INT) AS Revenue
FROM production_marketing
GROUP BY Country,ID
ORDER BY Revenue DESC;
