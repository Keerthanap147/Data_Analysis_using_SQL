# Sales Data Analysis Using SQL

## 📌 Project Overview
This project presents an end-to-end sales data analysis using **SQL Server** to answer key business questions related to revenue, product performance, geographic trends, and managerial contribution.

The project demonstrates practical SQL Server skills required for Data Analyst roles, including data exploration, data cleaning, feature engineering, KPI calculation, and advanced analytical queries using window functions.

---

## 🗂 Dataset Description
The dataset (`Sales_data`) contains transactional sales records with the following attributes:
- Order ID  
- Order Date  
- Product  
- Price  
- Quantity  
- Purchase Type  
- Payment Method  
- Manager  
- City  

---

## 🛠 Tools & Technologies
- **SQL Server**  
- SQL Server Management Studio (SSMS)  
- Common Table Expressions (CTEs)  
- Window Functions  

---

## 🔍 Data Exploration
- Counted the total number of records in the dataset  
- Reviewed sample records to understand data structure and value distributions  

---

## 🧹 Data Validation & Cleaning
- Checked for NULL values in critical columns  
- Identified invalid price and quantity values (≤ 0)  
- Cleaned and standardized manager names for consistent analysis  

---

## 🧠 Feature Engineering
The following derived columns were created to support analysis:
- **Sales_Year** – Extracted from order date  
- **Sales_Month** – Numeric month extracted from order date  
- **Month_Name** – Month name for better readability  
- **Revenue** – Calculated as `Price × Quantity`  

---

## 📊 Key Performance Indicators (KPIs)
- **Total Revenue**  
- **Total Orders**  
- **Total Quantity Sold**  
- **Average Order Value (AOV)**  

---

## 📈 Business Questions Answered
1. Which product generates the highest revenue?  
2. Which product performs best on each day?  
3. Which day had the highest revenue?  
4. Is there month-over-month revenue growth?  
5. What percentage of total revenue does each product contribute?  
6. Which cities generate the most revenue?  
7. What are the top 3 cities by revenue?  
8. How does revenue accumulate over time?  
9. Which managers contribute the most revenue?  
10. Which months performed above average?  

---

## 🧮 SQL Server Techniques Used
- Aggregation functions (`SUM`, `COUNT`, `AVG`)  
- `GROUP BY` and `ORDER BY` clauses  
- Common Table Expressions (CTEs)  
- Window Functions (`ROW_NUMBER`, `DENSE_RANK`, `LAG`, Running Total)  
- Date functions (`YEAR`, `MONTH`, `DATENAME`)  

---

## 📌 Key Insights
- Identified top-performing products and cities by revenue  
- Analyzed monthly and daily revenue trends  
- Evaluated month-over-month revenue growth  
- Assessed managerial contribution to overall sales performance  

---

## 🎯 Conclusion
This project demonstrates a complete SQL Server–based analytical workflow, transforming raw sales data into actionable business insights. It highlights strong SQL fundamentals and analytical thinking aligned with real-world Data Analyst responsibilities.

---

## 📁 Repository Structure
