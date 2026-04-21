# 📊 Marketing Analytics & Customer Behavior Study
**A Full-Stack Data Analysis Project: From Raw Messy Data to Executive Insights**

## 📝 Project Overview
This project demonstrates an end-to-end data pipeline analyzing **2,240+ customer records**. The goal was to transform a high-entropy, messy dataset into a relational database and eventually into a high-impact Tableau dashboard. This analysis provides actionable insights into customer demographics, regional revenue trends, and family spending habits.

## 🛠️ Tech Stack
* **Excel:** Initial data audit, structural cleanup, and outlier identification.
* **PostgreSQL:** Data warehousing using a "Landing Table" strategy and complex SQL transformations.
* **Tableau:** Visual analytics using the "Noodle" (Relationship) model to link Marketing and Advertising data.
* **Markdown:** Documentation and portfolio presentation.

---

## 🏗️ Data Engineering & SQL Pipeline

### 1. The Landing Table Strategy
To preserve the "Source of Truth," I implemented a landing table strategy in PostgreSQL. I first imported the raw CSV into a staging table using `VARCHAR` types to prevent data loss, then systematically transformed the data:
* **Schema Definition:** Created a structured table with appropriate data types (`INT`, `DATE`, `NUMERIC`).
* **Data Casting:** Converted currency strings (e.g., "$84,000") and age strings into integers to enable mathematical analysis.
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


### 🔁 Retention & Customer Loyalty
* **Churn Analysis:** Using a 60-day recency threshold, I identified a **38.4% Churn Rate**. This high churn suggests a need for automated win-back campaigns at the 45-day mark.
* **The 80/20 Rule:** My segmentation model reveals that **12.3% (Loyal Power Users)** contribute **21.3% of total revenue**, highlighting the importance of the VIP retention strategy.

### 🛒 Behavioral & Product Trends

* **Product Dominance:** **Liquor** is the anchor product of the business, generating **$662,273** nearly double the revenue of any other category.
* **Channel Preference:** There is a distinct behavioral shift based on family size: **Households with 0 kids** prefer **In-Store** shopping, while **households with 1 kid** are the primary **Web** purchasers.

<img width="2877" height="1753" alt="Screenshot 2026-04-19 214555" src="https://github.com/user-attachments/assets/4e2e25f8-d437-43af-b676-dd1f40672400" />


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
