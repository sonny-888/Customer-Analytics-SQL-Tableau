# 📊 Marketing Analytics & Customer Behavior Study
**A Full-Stack Data Analysis Project: From Raw Messy Data to Executive Insights**

## 1. Project Overview
This project demonstrates an end-to-end data pipeline analyzing **2,240+ customer records**. The goal was to transform a high-entropy, messy dataset into a relational database and eventually into a high-impact Tableau dashboard. This analysis provides actionable insights into customer demographics, regional revenue trends, and family spending habits.

## 2. Tech Stack 
* **Excel:** Initial data audit, structural cleanup, and outlier identification.
* **PostgreSQL:** Data warehousing using a "Landing Table" strategy and complex SQL transformations.
* **Tableau:** Leveraged Tableau’s Logical Layer (Relationships) to join transaction and campaign data while maintaining correct levels of aggregation.
* **Markdown:** Documentation and portfolio presentation.

---

## 3. Data Engineering & SQL Pipeline

### 1. The Landing Table StrategyArchitecture:  ELT Pipeline
I implemented an **ELT (Extract-Load-Transform)** workflow to ensure 100% data integrity during ingestion:

* **Extract & Load:** Sourced raw CSV data and ingested it into PostgreSQL **Landing Tables**. By using `VARCHAR` types for the initial load, I preserved a "Source of Truth" and prevented data loss from the inconsistent date and currency formats found in the source files.
* **Transform:** Executed SQL-based transformations to convert staging data into a structured production schema:
    * **Type Casting & Sanitization:** Converted raw strings into `INT`, `DATE`, and `NUMERIC` formats using robust SQL casting.
    * **Feature Engineering:** Calculated aggregate metrics, such as `Total_Spend` and `Age`, at the database level to optimize downstream analytics.
    * **Relational Integrity:** Defined `Primary Keys` and filtered "ghost rows" to enable seamless joins between marketing and advertising datasets.
[View SQL Implementation Scripts here](./sql)

### 2. Advanced SQL Techniques
I utilized several advanced SQL methods to prepare data for Tableau:
* **Unpivoting Data:** Used `UNION ALL` to transform multiple product columns into a "Long Format," allowing for a single-chart comparison of all categories.
* **Feature Engineering:** Calculated "Total Revenue" and "Total Children" (Kidhome + Teenhome) at the row level to drive deeper segmentation.
* **Filtering:** Removed extreme outliers (e.g., birth years before 1900 and incomes over $200k) to ensure statistical accuracy.

---

## 4. Data Cleaning: The "Before & After"
A critical part of this project was handling the **`marketing_data_EXTREME_MESSY.csv`** file, which simulated real-world data corruption:
* **Date Chaos:** Resolved mixed formats including `DMY`, `MDY`, `YMD`, and text-based dates (e.g., "June 16, 2014").
* **Case Sensitivity:** Unified `Education` and `Marital_Status` fields which contained mixed UPPER, lower, and Proper casing.
* **Null Values:** Identified and managed a 10% null-rate in the `Income` and `Country` columns using strategic imputation.

---

## 5. Key Business Insights 

###  5.1. Advertising Attribution & ROI (The Conversion Leaderboard)
By joining the transaction database with campaign logs, I calculated the efficiency and average profitability of every marketing touchpoint:

<img width="2879" height="1750" alt="Screenshot 2026-04-19 160937" src="https://github.com/user-attachments/assets/02e56a48-1132-4b2b-b129-dc6c56948d64" />

Fig 5.1 — Marketing Channel Leaders: Revenue vs Conversion Efficiency, Bar height represents total revenue, while variations in color intensity denote differences in conversion efficiency across channels.
| Ad Channel | Conversion Rate (SQL) | Avg. Total Spend | Status |
| :--- | :---: | :---: | :--- |
| **Brochure_ad** | **69.0%** | **$1,312** | **Efficiency Leader(But Low Volume)** |
| **Instagram_ad** | **56.3%** | **$1,616** | **High-Value "Whales"** |
| **Facebook_ad** | **55.7%** | **$1,485** | **Stable Performer** |
| **Twitter_ad** | **38.3%** | **$1,131** | **Underperforming** |

* **Top Performer:** **Instagram** is the most valuable digital channel; while its conversion rate is similar to Facebook, it attracts "Power Spenders" who spend **$131 more** on average.
* **The Growth Opportunity:** **Brochures** have a massive **69% conversion rate**. Scaling this traditionally "low-volume" channel could yield high returns.
* **Optimization:** **Twitter** is currently a value-sink with the lowest conversion/spend ratio, identifying a clear opportunity for budget reallocation.
  
### 5.1.1. Geographic Channel Supremacy: Platform Mapping

#### **Visual Strategy: Icon-Based Mapping**
To provide an "at-a-glance" executive summary, I utilized a **Shape Map** in Tableau. By assigning brand-specific icons to the top-performing channel in each region, stakeholder clarity is maximized without the need for dense data tables.

<img width="1406" height="1125" alt="image" src="https://github.com/user-attachments/assets/3ba50dd5-165c-4b2e-912b-2aee5613e8ec" />
Fig 5.1.1 - Leading Advertising Channels by Territory

#### **Strategic Insights**
#### **Key Data Observations (based on Fig 5.1.1)**
*   **Instagram Dominance (SP):** Instagram is the primary driver in Spain, representing the highest single-channel success volume in the entire dataset.
*   **Twitter Hubs (CA, GER):** Twitter shows its strongest ROI in the Canadian and German markets, outperforming all other platforms in those regions.
*   **The Bulkmail Surprise (IND, US, ME):** Traditional Bulkmail remains the #1 conversion tool for India, the United States, and the Middle East, suggesting a demographic that prefers direct-to-inbox or physical outreach.
*   **Multi-Channel Synergy (SA):** Saudi Arabia demonstrates the most balanced mix, where Instagram and Bulkmail work together to drive conversions.

> **Technical Note**: This visualization was built by joining `production_marketing` and `production_ads` on the `ID` field and utilizing the `UNNEST` function to rank campaign responses.

---

### 5.2. Regional Market Efficiency

* **The Volume Leader:** **Spain (SP)** dominates the portfolio with **$636,151** in total revenue.
* **The Premium Markets:** While Spain has the volume, **Canada ($635.27)** and **Germany ($631.02)** lead in **Average Spend per Customer**, indicating higher purchasing power in these regions.
* **The Montenegro Outlier:** Montenegro (ME) exhibits the highest AOV ($1,040), though results are considered exploratory due to a limited sample size compared to primary markets.

<img width="2060" height="1630" alt="Screenshot 2026-04-24 011043" src="https://github.com/user-attachments/assets/6e7d28f2-79fa-48a4-9fcc-ede86403c79b" />


Fig 5.2 — Spain leads in total revenue, while Montenegro (ME) shows the highest average spend per customer but is excluded as an outlier due to low overall revenue. Canada (CA), the US, and Germany (GER) lead among the remaining markets in average spend.

---

### 5.3. Retention & Customer Loyalty

* **Churn Analysis:** Using a 60-day recency threshold, I identified a **38.4% Churn Rate**. This high churn suggests a need for automated win-back campaigns at the 45-day mark.

<img width="1406" height="1125" alt="image" src="https://github.com/user-attachments/assets/1a62fdbd-0b7c-40ac-a695-fc80cbc227fb" />
Fig 5.3.1 — This scatter plot analyzes the relationship between Recency (average days since last purchase) and Total Campaign Acceptances, segmented by age cohorts. The grey trend line illustrates the negative correlation between time-elapsed and marketing receptivity.

**Key Insight: The "Critical Engagement Window"**
My analysis identifies a sharp drop-off in marketing receptivity as customers approach the 60-day mark. While the **30–50 age cohorts** maintain high engagement (60–95+ acceptances) near the 50-day threshold, responsiveness collapses shortly thereafter.

#### Strategy: The 45-Day Win-Back Trigger
* **The Problem:** Traditional "at-risk" status is often defined at 60 or 90 days, but this data shows that by Day 60, the customer has already "checked out" emotionally.
* **The Solution:** This trendline validates a **Day 45 automated intervention**. By triggering a high-value offer 15 days *before* the 60-day cliff, we capitalize on the high receptivity of the 30–50 age "Power Spenders" before they churn.

* **The 80/20 Rule:** My segmentation model reveals that **12.7% (Loyal Power Users)** contribute **21.3% of total revenue**, highlighting the importance of the VIP retention strategy.

<img width="2090" height="1647" alt="Screenshot 2026-04-23 005415" src="https://github.com/user-attachments/assets/588c683d-19ff-4558-bac2-251d1aaffe73" />
Fig 5.3.2 — Customer Performance Overview Dashboard

---

### 5.4. Monthly Revenue & Customer Trend Analysis
This line chart visualizes total monthly revenue (orange line) alongside monthly active customers (blue area).
Both metrics show a clear downward trend from 2012 to 2014.

<img width="2095" height="1661" alt="Screenshot 2026-04-22 131732" src="https://github.com/user-attachments/assets/06e20a95-460d-435b-9479-4b70d6c9175c" />

Fig 5.4 — Monthly Revenue & Customer Activity (2012–2014)

* **Key Insight:**  
Revenue decline is strongly correlated with a drop in active customers.
This suggests that the business is losing customers over time, and the revenue drop is primarily driven by reduced customer engagement rather than lower spending per customer.

---

### 5.5. Behavioral & Product Trends

* **Product Dominance:** **Liquor** is the anchor product of the business, generating **$662,273** nearly double the revenue of any other category.
* **Channel Preference:** There is a distinct behavioral shift based on family size: **Households with 0 kids** prefer **In-Store** shopping, while **households with 1 kid** are the primary **Web** purchasers.

<img width="2194" height="1667" alt="Screenshot 2026-04-22 130928" src="https://github.com/user-attachments/assets/6de79c73-5db1-4c01-b37b-7962b0f7f13a" />
Fig 5.5 — Product Revenue Mix: Liquor and Non‑Veg Dominate Overall Sales

### Executive Business Insight: Global Product Dominance

#### **Core Finding: Product-Market Fit Uniformity**
Our cross-territory analysis reveals that **Liquor** is the primary revenue driver in every geographic market analyzed. Despite significant differences in customer demographics, education levels, and regional income, the preference for this category remains a universal constant across the dataset.

#### **Strategic Implications**
*   **Global Campaign Scalability:** Since the lead product is consistent across all eight countries, the marketing department can utilize a **standardized "Hero Product" strategy**. This reduces the overhead costs associated with creating unique, product-specific creative assets for different regions.
*   **Revenue Concentration:** In our largest market, **Spain (SP)**, Liquor sales alone exceeded **$324,299**, representing the highest concentration of category capital. This identifies Spain as the ideal "test-bed" for new sub-category launches or premium tiering.
*   **Inventory Optimization:** With a predictable top performer globally, supply chain logistics can prioritize liquor inventory levels across all distribution centers with high confidence in turnover rates.
<img width="1606" height="1125" alt="image" src="https://github.com/user-attachments/assets/18ee7404-c70e-4bb0-b626-439389d58419" />


Fig 5.5.1 — Global Market Dominance: Liquor as the Primary Revenue Driver

> **Technical Note:** This insight was derived by joining demographic data with product-specific campaign performance via PostgreSQL and visualized in Tableau to identify regional outliers.

---

### 5.6 Demographic Deep Dive: The "Ideal Customer Profile" (ICP)

To maximize marketing efficiency, I segmented the dataset by **Academic Attainment** and **Social Architecture**. This allowed me to move beyond broad targeting and define a "Premium Engagement" persona.

<img width="752" height="452" alt="image" src="https://github.com/user-attachments/assets/1b709699-3ad5-4da1-ae6c-633e4f5fbf53" />

Fig 5.6.1 — The Education-Spending Correlation 

**Key Insight: The "Premium Tier"**
There is a direct linear relationship between education levels and purchasing power. **PhD and Graduate-level** customers represent the company's highest value segment, with an average spend of **$673**=nearly **8x higher** than the "Basic" education segment ($82).

* **Strategic Action:** Prioritize premium product lines and high-ticket bundles specifically for the Master/PhD segments to maximize **Average Order Value (AOV)**.

<img width="752" height="452" alt="image" src="https://github.com/user-attachments/assets/d06af954-c13c-472a-81f0-848be2e797bc" />

Fig 5.6.2 — The Marital Status Engagement Gap


**Key Insight: The "Responsiveness Paradox"**
While "Married" and "Together" cohorts provide the highest raw volume, they are the least responsive to marketing (10–12% response rate). In contrast, **Single and Widow households** are the engagement leaders, showing a **25% response rate**=double that of partnered households.

* **Strategic Action:** Reallocate aggressive promotional spend toward **Single-person households**. This group demonstrates a significantly higher "Propensity to Convert," ensuring a lower Cost Per Acquisition (CPA).

### The "North Star" Customer Persona
By synthesizing these data points, we can define the business's **High-Value Target**:
* **Segment:** Highly Educated (Post-Grad) + Single Household.
* **Behavior:** High AOV ($600+) + High Campaign Sensitivity (25% Conversion).
* **Marketing Focus:** Premium, lifestyle-focused messaging delivered within the 45-day "Critical Engagement Window."
  
---

## 5.7. Channel Attribution: Retail vs. Digital Density
After defining who our high-value customers are, I analyzed where they prefer to transact. By cross-referencing Purchase Density across Education and Age bins, a clear "Phygital" divide emerged.

<img width="1224" height="936" alt="Customer Purchase Velocity In-Store vs  Digital Channels" src="https://github.com/user-attachments/assets/f93080f2-42a0-4c6c-86e1-6f0ae834b63f" />

Fig 5.7 —Omni-channel Purchase Density: Physical vs. Digital Channels

**Key Insight: The "High-Value" Retail Anchor**
**Retail Dominance:** Physical store purchases are the primary revenue driver across all demographics. Most notably, the 60+ PhD segment shows the highest density of walk-in purchases, suggesting a preference for personalized service or tactile shopping experiences.

**The Digital Gap:** There is a significant underutilization of Web channels among younger, highly-educated cohorts (Ages 20–40). While they are tech-literate, their purchase density remains higher in-store, indicating our current digital experience may lack the "premium" feel of the retail environment.

**Strategic Recommendation:** The Omnichannel Bridge
To maximize the "Executive Scholar" persona’s value, the business should implement a BOPIS (Buy Online, Pick Up In-Store) strategy.

**The Goal:** Use digital channels for the initial transaction (Instagram/Web) but leverage the physical store for fulfillment to maintain the high-touch relationship our Master/PhD customers prefer.

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
