# 📦 Supply Chain & Inventory Optimization System – SQL Module

## 🧠 Project Overview

This SQL-driven analysis is part of a larger supply chain optimization system for a global logistics company. The objective is to derive actionable insights from structured data to improve **inventory management**, **restocking efficiency**, and **delivery performance**.

---

## 🛠 Tools & Technologies

- **MySQL** – Core database engine for querying and analysis  
- **Python** – Used for preprocessing and data preparation  
- **Power BI** – For downstream visualizations 

---
## 🎯 Business Goals

- Identify **fast- and slow-moving products** using sales patterns  
- Detect **late shipments** by product, supplier, and region  
- Forecast **stock-out risks** and estimate inventory turnover  
- Rank products and suppliers based on **fulfillment efficiency**  
- Generate **restocking recommendations** dynamically  

---

## 📌 Dataset

- Source: [Kaggle – Customer Analytics Dataset](https://www.kaggle.com/datasets/prachi13/customer-analytics)  
- Type: Modified into **relational schema** with normalized tables including:
  - `orders`, `products`, `customers`, `suppliers`, `inventory`, `shipments`

---

## 🧮 Key SQL Concepts Used

- ✅ **Window Functions** (`ROW_NUMBER()`, `RANK()`, `LAG()`, `LEAD()`, `SUM() OVER`)
- ✅ **CTEs** (including recursive for supplier hierarchies and date generation)
- ✅ **Correlated and Non-Correlated Subqueries**
- ✅ **Nested Aggregations**
- ✅ **Date-Time Functions** for shipping and delay metrics

---

## 📊 Key Business Queries Implemented

1. 🕒 Identify suppliers with low on-time delivery performance (% on-time shipments)
2. 🐌 List top 5 **slowest-moving SKUs** per category (last 90 days)
3. 🔁 Monthly **inventory turnover ratio** per warehouse using `SUM() OVER`
4. 🚨 Detect products at **stock-out risk** in the next 7 days (based on sales trends)
5. 📉 30-day **rolling sales & returns report** per product
6. 🔄 Segment customers who **frequently cancel or return** products
7. 📦 **Restocking recommendation engine** 






