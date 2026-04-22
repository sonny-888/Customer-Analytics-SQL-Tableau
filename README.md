# 📊 Marketing Analytics & Customer Behavior Study
**A Full-Stack Data Analysis Project: From Raw Messy Data to Executive Insights**

## 📝 Project Overview
This project demonstrates an end-to-end data pipeline analyzing **2,240+ customer records**. The goal was to transform a high-entropy, messy dataset into a relational database and eventually into a high-impact Tableau dashboard. This analysis provides actionable insights into customer demographics, regional revenue trends, and family spending habits.

## 🛠️ Tech Stack
* **Excel:** Initial data audit, structural cleanup, and outlier identification.
* **PostgreSQL:** Data warehousing using a "Landing Table" strategy and complex SQL transformations.
* **Tableau:** Leveraged Tableau’s Logical Layer (Relationships) to join transaction and campaign data while maintaining correct levels of aggregation.
* **Markdown:** Documentation and portfolio presentation.

---

## 🏗️ Data Engineering & SQL Pipeline

### 1. The Landing Table Strategy
To preserve the "Source of Truth," I implemented a landing table strategy in PostgreSQL. I first imported the raw CSV into a staging table using `VARCHAR` types to prevent data loss, then systematically transformed the data:
* **Schema Definition:** Created a structured table with appropriate data types (`INT`, `DATE`, `NUMERIC`).
* **Data Casting:** Implemented Regex-based ETL transformations to sanitize currency and date strings into analysis-ready formats.
* **Primary Key Assignment:** Designated the `ID` column as the unique identifier to enable seamless table relationships.

### 2. Advanced SQL Techniques
I utilized several advanced SQL methods to prepare data for Tableau:
* **Unpivoting Data:** Used `UNION ALL` to transform multiple product columns into a "Long Format," allowing for a single-chart comparison of all categories.
* **Feature Engineering:** Calculated "Total Revenue" and "Total Children" (Kidhome + Teenhome) at the row level to drive deeper segmentation.
* **Filtering:** Removed extreme outliers (e.g., birth years before 1900 and incomes over $200k) to ensure statistical accuracy.

---

## 🧼 Data Cleaning: The "Before & After"
A critical part of this project was handling the **`marketing_data_EXTREME_MESSY.csv`** file, which simulated real-world data corruption:
* **Date Chaos:** Resolved mixed formats including `DMY`, `MDY`, `YMD`, and text-based dates (e.g., "June 16, 2014").
* **Case Sensitivity:** Unified `Education` and `Marital_Status` fields which contained mixed UPPER, lower, and Proper casing.
* **Null Values:** Identified and managed a 10% null-rate in the `Income` and `Country` columns using strategic imputation.

---

## 📈 Key Business Insights

### 🎯 Advertising Attribution & ROI (The Conversion Leaderboard)
By joining the transaction database with campaign logs, I calculated the efficiency and average profitability of every marketing touchpoint:

<img width="2879" height="1750" alt="Screenshot 2026-04-19 160937" src="https://github.com/user-attachments/assets/02e56a48-1132-4b2b-b129-dc6c56948d64" />

Fig 5.1 — Marketing Channel Leaders: Revenue vs Conversion Efficiency 

| Ad Channel | Conversion Rate (SQL) | Avg. Total Spend | Status |
| :--- | :---: | :---: | :--- |
| **Brochure_ad** | **69.0%** | **$1,312** | **Efficiency Leader** |
| **Instagram_ad** | **56.3%** | **$1,616** | **High-Value "Whales"** |
| **Facebook_ad** | **55.7%** | **$1,485** | **Stable Performer** |
| **Twitter_ad** | **38.3%** | **$1,131** | **Underperforming** |

* **Top Performer:** **Instagram** is the most valuable digital channel; while its conversion rate is similar to Facebook, it attracts "Power Spenders" who spend **$131 more** on average.
* **The Growth Opportunity:** **Brochures** have a massive **69% conversion rate**. Scaling this traditionally "low-volume" channel could yield high returns.
* **Optimization:** **Twitter** is currently a value-sink with the lowest conversion/spend ratio, identifying a clear opportunity for budget reallocation.

### 🌍 Regional Market Efficiency

* **The Volume Leader:** **Spain (SP)** dominates the portfolio with **$636,151** in total revenue.
* **The Premium Markets:** While Spain has the volume, **Canada ($635.27)** and **Germany ($631.02)** lead in **Average Spend per Customer**, indicating higher purchasing power in these regions.
* **The Montenegro Outlier:** Montenegro (ME) exhibits the highest AOV ($1,040), though results are considered exploratory due to a limited sample size compared to primary markets.

<img width="1998" height="1623" alt="Screenshot 2026-04-22 115758" src="https://github.com/user-attachments/assets/3a09baec-de23-4632-88c2-b7baedf8c0bc" />

Fig 5.2 — Spain leads in total revenue, while the Montenegro shows the highest average spend per customer.


### 🔁 Retention & Customer Loyalty

<img width="2090" height="1647" alt="Screenshot 2026-04-23 005415" src="https://github.com/user-attachments/assets/588c683d-19ff-4558-bac2-251d1aaffe73" />


Fig 5.3 — Customer Performance Overview Dashboard


* **Churn Analysis:** Using a 60-day recency threshold, I identified a **38.4% Churn Rate**. This high churn suggests a need for automated win-back campaigns at the 45-day mark.
* **The 80/20 Rule:** My segmentation model reveals that **12.7% (Loyal Power Users)** contribute **21.3% of total revenue**, highlighting the importance of the VIP retention strategy.

### 📉 Monthly Revenue & Customer Trend Analysis
This line chart visualizes total monthly revenue (orange line) alongside monthly active customers (blue area).
Both metrics show a clear downward trend from 2012 to 2014.

<img width="2095" height="1661" alt="Screenshot 2026-04-22 131732" src="https://github.com/user-attachments/assets/06e20a95-460d-435b-9479-4b70d6c9175c" />

Fig 5.4 — Monthly Revenue & Customer Activity (2012–2014)

* **Key Insight:**  
Revenue decline is strongly correlated with a drop in active customers.
This suggests that the business is losing customers over time, and the revenue drop is primarily driven by reduced customer engagement rather than lower spending per customer.

### 🛒 Behavioral & Product Trends

* **Product Dominance:** **Liquor** is the anchor product of the business, generating **$662,273** nearly double the revenue of any other category.
* **Channel Preference:** There is a distinct behavioral shift based on family size: **Households with 0 kids** prefer **In-Store** shopping, while **households with 1 kid** are the primary **Web** purchasers.

<img width="2194" height="1667" alt="Screenshot 2026-04-22 130928" src="https://github.com/user-attachments/assets/6de79c73-5db1-4c01-b37b-7962b0f7f13a" />
Fig 5.5 — Product Revenue Mix: Liquor and Non‑Veg Dominate Overall Sales
  
---

## 📂 Repository Structure
* **/data:** Contains `RAW_MESSY.csv` and the final cleaned datasets.
* **/sql:** `schema_setup.sql` and `analysis_queries.sql` containing the SQL logic.
* **/presentation:** Executive Summary in PDF format.
* **README.md:** Project documentation.

## 🚀 How to Reproduce
1. Load the data from `/data` into your PostgreSQL instance using the `schema_setup.sql` script.
2. Run `analysis_queries.sql` to generate the row-level views.
3. Connect Tableau to your PostgreSQL server and relate the tables on the `ID` field.

---
**Contact:** Sharath Sista | https://www.linkedin.com/in/sharath-chandra-2bb604377/ 
