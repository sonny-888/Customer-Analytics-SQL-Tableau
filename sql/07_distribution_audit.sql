-- Query 5 __Income_age_distribution
 
SELECT
    ID,
    CAST(Age AS INT) AS Age,
    CAST(Income AS NUMERIC) AS Income
FROM production_marketing
WHERE Income IS NOT NULL
  AND CAST(Income AS NUMERIC) < 200000
  order by CAST(Income AS NUMERIC) < 200000 desc;