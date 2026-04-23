/* Project: Marketing Analytics
Script: 02_Data_Transformation
Description: Cleans raw data from landing_marketing, performs type casting, 
             and calculates derived business metrics like Total_Spend.
*/

-- Drop the table if it exists to allow for script re-runs
DROP TABLE IF EXISTS production_marketing;

CREATE TABLE production_marketing AS
SELECT 
    ID::INT,
    Year_Birth::INT,
    Education,
    Marital_Status,
    Income::NUMERIC(10,2), 
    Kidhome::INT,
    Teenhome::INT,
    -- Using TO_DATE to standardize mixed date formats into PostgreSQL date type
    TO_DATE(Dt_Customer, 'DD/MM/YYYY') AS Dt_Customer, 
    Recency::INT,
	AmtLiq,
    AmtVege,
    AmtNonVeg,
    AmtPes,
    AmtChocolates,
    AmtComm,
    NumDeals,
    NumWebBuy,
    NumWalkinPur,
    NumVisits,
    Response,
    Complain,
    -- Feature Engineering: Aggregating product spends into a single metric
    (COALESCE(AmtLiq::INT, 0) + 
     COALESCE(AmtVege::INT, 0) + 
     COALESCE(AmtNonVeg::INT, 0) + 
     COALESCE(AmtPes::INT, 0) + 
     COALESCE(AmtChocolates::INT, 0) + 
     COALESCE(AmtComm::INT, 0)) AS Total_Spend,
    Country,
    Age::INT
FROM marketing_analytics
-- Data Quality Check: Filter out rows without a valid ID
WHERE ID IS NOT NULL;

-- Verify the transformation
SELECT * FROM production_marketing LIMIT 10;

--PART 2: Transform Advertising Data

CREATE TABLE production_ads AS
SELECT 
    ID::INT,
    Bulkmail_ad::INT,
    Twitter_ad::INT,
    Instagram_ad::INT,
    Facebook_ad::INT,
    Brochure_ad::INT
FROM ads_data
WHERE ID IS NOT NULL;

-- Verification
SELECT * FROM production_ads LIMIT 5;