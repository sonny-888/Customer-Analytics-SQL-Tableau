# 📊 Marketing Analytics & Customer Behaviour Study  
**A Full-Stack Data Analysis Project: From Raw Messy Data to Executive Insights**]

![PostgreSQL](https://img.shields.io/badge/SQL-PostgreSQL-blue)
![Tableau](https://img.shields.io/badge/Tableau-Dashboard-orange)
![Excel](https://img.shields.io/badge/Excel-Data%20Cleaning-green)
---

## 🏗️ Project Architecture


```text
┌──────────────────────────────┐
│        Raw Data Sources      │
│        (CSV Files)           │
└─────────────┬────────────────┘
              │
              ▼
┌──────────────────────────────┐
│        Data Audit Layer      │
│            Excel             │
│  - Data quality checks       │
│  - Outlier detection         │
│  - Initial cleanup           │
└─────────────┬────────────────┘
              │
              ▼
┌──────────────────────────────┐
│     Data Ingestion Layer     │
│     PostgreSQL (Landing)     │
│  - Raw data ingestion        │
│  - Stored as VARCHAR         │
│  - Source-of-truth storage   │
└─────────────┬────────────────┘
              │
              ▼
┌──────────────────────────────┐
│   Transformation Layer       │
│ PostgreSQL (Production DB)   │
│  - Type casting              │
│  - Data cleaning             │
│  - Feature engineering       │
│  - Relational modeling       │
└─────────────┬────────────────┘
              │
              ▼
┌──────────────────────────────┐
│     Analytics & BI Layer     │
│           Tableau            │
│  - Interactive dashboards    │
│  - Business insights         │
│  - KPI tracking              │
└──────────────────────────────┘
```
## Key Results (What This Project Achieved)

- Identified a **38.4% churn rate** and a **45-day critical intervention window**
- Uncovered a high-value segment driving **21.3% of revenue from just 12.7% of customers**
- Detected **major marketing inefficiencies**, including underperforming channels draining budget
- Revealed a direct link between **revenue decline and falling customer engagement**
- Defined a clear **Ideal Customer Profile (ICP)** to improve targeting and ROI

## Executive Summary
This project transforms 2,240+ raw customer records into a fully‑engineered analytics pipeline using Excel → PostgreSQL → Tableau.
The outcome is a set of high‑impact business insights that reveal churn risk, channel inefficiencies, revenue trends, and a clear Ideal Customer Profile (ICP).

## Business Impact

This analysis highlights that the business is **not demand-constrained, but execution-constrained**.

### Key Opportunities:
- Improve **marketing ROI** through better channel allocation  
- Reduce **customer churn** with earlier intervention  
- Increase **revenue efficiency** through precision targeting  

---

## Core Insights

### 1. Marketing Performance is Misallocated
- High-spend customers are concentrated in specific digital channels  
- Traditional channels show **highest conversion efficiency but low scale**  
- One channel consistently underperforms across both conversion and spend  

**Opportunity:** Reallocate budget toward high-value and high-efficiency channels 
<img width="2879" height="1750" alt="Screenshot 2026-04-19 160937" src="https://github.com/user-attachments/assets/02e56a48-1132-4b2b-b129-dc6c56948d64" />
Fig 1.1 — Marketing Channel Leaders: Revenue vs Conversion Efficiency, Bar height represents total revenue, while variations in color intensity denote differences in conversion efficiency across channels.
<img width="1406" height="1125" alt="image" src="https://github.com/user-attachments/assets/3ba50dd5-165c-4b2e-912b-2aee5613e8ec" />
Fig 1.2 - Leading Advertising Channels by Territory

---

### 2. Customer Retention is the Biggest Risk
- **38.4% churn rate** indicates significant customer leakage  
- Engagement drops sharply before 60 days  
- A small loyal segment drives disproportionate revenue

<img width="2090" height="1647" alt="Screenshot 2026-04-23 005415" src="https://github.com/user-attachments/assets/588c683d-19ff-4558-bac2-251d1aaffe73" />
Fig 2.1 — Customer Performance Overview Dashboard

**Opportunity:** Introduce a **45-day win-back strategy** before disengagement peaks  
<img width="1406" height="1125" alt="image" src="https://github.com/user-attachments/assets/1a62fdbd-0b7c-40ac-a695-fc80cbc227fb" />
Fig 2.2 — This scatter plot analyzes the relationship between Recency (average days since last purchase) and Total Campaign Acceptances, segmented by age cohorts. The grey trend line illustrates the negative correlation between time-elapsed and marketing receptivity.


---

### 3. Revenue Decline is Engagement-Driven
- Revenue trends closely mirror declining active customers  
- No evidence of reduced spend per customer  

**Conclusion:** Growth decline is caused by **loss of customers, not weaker purchasing behaviour** 

<img width="2095" height="1661" alt="Screenshot 2026-04-22 131732" src="https://github.com/user-attachments/assets/06e20a95-460d-435b-9479-4b70d6c9175c" />

Fig 3.1 — Monthly Revenue & Customer Activity (2012–2014)

---

### 4. High-Value Customers are Clearly Defined (ICP)

**Ideal Customer Profile:**
- Highly educated (Postgraduate level)  
- Single households  
- High responsiveness (~25%)  
- High average spend (~$600+)  

**Opportunity:** Shift from broad targeting to **precision marketing for high-return segments**  
<img width="752" height="452" alt="image" src="https://github.com/user-attachments/assets/1b709699-3ad5-4da1-ae6c-633e4f5fbf53" />

Fig 4.1 — The Education-Spending Correlation 
<img width="752" height="452" alt="image" src="https://github.com/user-attachments/assets/d06af954-c13c-472a-81f0-848be2e797bc" />

Fig 4.2 — The Marital Status Engagement Gap



---

### 5. Product Strategy is Strong but Concentrated

- **Liquor is the dominant product category**, generating the highest revenue across all regions  
- This demand pattern is consistent globally, indicating strong and reliable customer preference  

👉 **Implication:** While Liquor acts as the primary revenue driver, the business is highly dependent on a single category, increasing risk and limiting diversification
<img width="2194" height="1667" alt="Screenshot 2026-04-22 130928" src="https://github.com/user-attachments/assets/6de79c73-5db1-4c01-b37b-7962b0f7f13a" />
Fig 5.1 — Product Revenue Mix: Liquor and Non‑Veg Dominate Overall Sales
<img width="1606" height="1125" alt="image" src="https://github.com/user-attachments/assets/18ee7404-c70e-4bb0-b626-439389d58419" />
Fig 5.2 — Global Market Dominance: Liquor as the Primary Revenue Driver

---

### 6. Channel Behaviour Gap (Retail vs Digital)
- Physical stores drive the majority of revenue  
- Digital channels underperform among high-value customers  

**Opportunity:** Strengthen digital experience or adopt **hybrid (online-to-offline) strategies**  

<img width="1224" height="936" alt="Customer Purchase Velocity In-Store vs  Digital Channels" src="https://github.com/user-attachments/assets/f93080f2-42a0-4c6c-86e1-6f0ae834b63f" />

Fig 6 —Omni-channel Purchase Density: Physical vs. Digital Channels

---

## Market Insights

- **Spain** → Highest total revenue (volume leader)  
- **Canada & Germany** → Highest spend per customer (premium markets)  
- Clear divide between **high-volume vs high-value regions**  

**Implication:** Markets require **differentiated strategies**, not a one-size-fits-all approach  

<img width="2060" height="1630" alt="Screenshot 2026-04-24 011043" src="https://github.com/user-attachments/assets/6e7d28f2-79fa-48a4-9fcc-ede86403c79b" />

Fig 5.2 — Spain leads in total revenue, while Montenegro (ME) shows the highest average spend per customer but is excluded as an outlier due to low overall revenue. Canada (CA), the US, and Germany (GER) lead among the remaining markets in average spend.

---

## Strategic Recommendations

- Reallocate marketing spend toward **high-performing and high-efficiency channels**  
- Implement a **45-day automated retention strategy**  
- Focus on **high-value ICP segments** instead of broad demographics  
- Leverage top-performing product category while exploring **adjacent opportunities**  
- Strengthen **digital channel experience** to match retail performance  

---

## Project Summary

This project demonstrates how structured analysis can transform fragmented customer data into **clear, actionable business strategy**.

> **Growth is not limited by demand — but by how effectively the business targets, engages, and retains its customers.**

---

##  Tech Stack 
* **Excel:** Initial data audit, structural cleanup, and outlier identification.
* **PostgreSQL:** Data warehousing using a "Landing Table" strategy and complex SQL transformations.
* **Tableau:** Leveraged Tableau’s Logical Layer (Relationships) to join transaction and campaign data while maintaining correct levels of aggregation.
* **Markdown:** Documentation and portfolio presentation.

---

## Data Engineering & SQL Pipeline

### 1. The Landing Table StrategyArchitecture:  ELT Pipeline
I implemented an **ELT (Extract-Load-Transform)** workflow to ensure 100% data integrity during ingestion:

* **Extract & Load:** Sourced raw CSV data and ingested it into PostgreSQL **Landing Tables**. By using `VARCHAR` types for the initial load, I preserved a "Source of Truth" and prevented data loss from the inconsistent date and currency formats found in the source files.
* **Transform:** Executed SQL-based transformations to convert staging data into a structured production schema:
    * **Type Casting & Sanitization:** Converted raw strings into `INT`, `DATE`, and `NUMERIC` formats using robust SQL casting.
    * **Feature Engineering:** Calculated aggregate metrics, such as `Total_Spend` and `Age`, at the database level to optimize downstream analytics.
    * **Relational Integrity:** Defined `Primary Keys` and filtered "ghost rows" to enable seamless joins between marketing and advertising datasets.
[View SQL Implementation Scripts here](./sql)

### Advanced SQL Techniques
I utilized several advanced SQL methods to prepare data for Tableau:
* **Unpivoting Data:** Used `UNION ALL` to transform multiple product columns into a "Long Format," allowing for a single-chart comparison of all categories.
* **Feature Engineering:** Calculated "Total Revenue" and "Total Children" (Kidhome + Teenhome) at the row level to drive deeper segmentation.
* **Filtering:** Removed extreme outliers (e.g., birth years before 1900 and incomes over $200k) to ensure statistical accuracy.

---

## Data Cleaning: The "Before & After"
A critical part of this project was handling the **`marketing_data_EXTREME_MESSY.csv`** file, which simulated real-world data corruption:
* **Date Chaos:** Resolved mixed formats including `DMY`, `MDY`, `YMD`, and text-based dates (e.g., "June 16, 2014").
* **Case Sensitivity:** Unified `Education` and `Marital_Status` fields which contained mixed UPPER, lower, and Proper casing.
* **Null Values:** Identified and managed a 10% null-rate in the `Income` and `Country` columns using strategic imputation.

---

## 📂 Repository Structure
* **/data:** Contains `RAW_MESSY.csv` and the final cleaned datasets.
* **/sql:** `schema_setup.sql`, `data_transformation.sql` and `analysis_queries.sql` containing the SQL logic.
* **/presentation:** Executive Summary and Power-point Presentation in PDF Format.
* **README.md:** Project documentation.

##  How to Reproduce
1. Load the data from `/data` into your PostgreSQL instance using the `schema_setup.sql` script.
2. Run `analysis_queries.sql` to generate the row-level views.
3. Connect Tableau to your PostgreSQL server and relate the tables on the `ID` field.

---

## About Me

I am a business-minded analyst with a Masters degree in Management, dedicated to bridging the gap between complex data engineering and executive decision-making. My work focuses on:

* **Growth & Revenue:** Driving sustainable revenue growth through data-backed strategies.
* **Marketing Intelligence:** Optimizing campaign ROI and attribution modeling.
* **Customer Behavior:** Analyzing churn, retention, and lifecycle segments to increase CLV.
* **Business Intelligence:** Transforming raw, messy datasets into streamlined, automated reporting pipelines.
* **Data Analytics**
* **Strategy**
  
**Contact:** Sharath Sista | https://www.linkedin.com/in/sharath-chandra-2bb604377/ 
