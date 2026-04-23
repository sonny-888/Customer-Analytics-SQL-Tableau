/* Project: Marketing Analytics & Customer Behavior
Script: 01_Schema_Setup
Description: Creates the initial landing tables using TEXT types 
             to facilitate bulk import from CSV.
*/

CREATE TABLE Marketing_Analytics (
    ID TEXT,
    Year_Birth TEXT,
    Education TEXT,
    Marital_Status TEXT,
    Income TEXT,
    Kidhome TEXT,
    Teenhome TEXT,
    Dt_Customer TEXT,
    Recency TEXT,
    AmtLiq TEXT,
    AmtVege TEXT,
    AmtNonVeg TEXT,
    AmtPes TEXT,
    AmtChocolates TEXT,
    AmtComm TEXT,
    NumDeals TEXT,
    NumWebBuy TEXT,
    NumWalkinPur TEXT,
    NumVisits TEXT,
    Response TEXT,
    Complain TEXT,
    Country TEXT,
    Count_success TEXT,
    Age TEXT
);

CREATE TABLE Ads_Data (
    ID TEXT,
    Bulkmail_ad TEXT,
    Twitter_ad TEXT,
    Instagram_ad TEXT,
    Facebook_ad TEXT,
    Brochure_ad TEXT
);