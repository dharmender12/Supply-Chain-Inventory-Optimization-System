# 📦 Supply Chain & Inventory Optimization System

## 🧠 Project Overview

This project analyzes a global supply chain dataset to identify inefficiencies in **delivery performance**, **inventory management**, and **customer experience**.

The solution is built as an **end-to-end data analytics pipeline**, combining:

* 🐍 Python for data preprocessing
* 🧮 SQL for advanced analytical queries
* 📊 Power BI for interactive dashboard visualization

---

## 🛠 Tools & Technologies

* **Python (Pandas, NumPy)** – Data cleaning, preprocessing & EDA
* **MySQL** – Advanced querying (CTEs, Window Functions, Subqueries)
* **Power BI** – KPI dashboards & business visualization

---

## 📊 Dashboard Preview

![Dashboard](dashboard.png)

---

## 🎯 Business Problems Solved

* 🚚 Why are deliveries getting delayed?
* 🏭 Which warehouses are underperforming?
* 📞 Are customer complaints linked to delays?
* 💰 Do discounts affect delivery efficiency?
* 📦 How to optimize inventory and reduce stockouts?

---

## 📁 Project Structure

```
supply-chain-analytics-dashboard/
│
├── data/
├── notebooks/
│   └── supply_chain_analysis.ipynb
│
├── sql/
│   └── queries.sql
│
├── dashboard/
│   └── dashboard.png
│
├── README.md
```

---

## 🐍 Data Processing (Python)

* Cleaned and preprocessed raw dataset using Pandas
* Handled missing values and inconsistent formats
* Performed Exploratory Data Analysis (EDA)
* Prepared structured dataset for SQL and Power BI

📌 Notebook: `notebooks/supply_chain_analysis.ipynb`

---

## 🧮 SQL Analysis

### Key Concepts Used:

* Window Functions (`RANK()`, `LAG()`, `LEAD()`, `SUM() OVER`)
* CTEs (including recursive queries)
* Subqueries & Nested Aggregations
* Date-time functions for delay analysis

### Key Queries Implemented:

1. Supplier on-time delivery performance
2. Slow-moving product detection
3. Inventory turnover calculation
4. Stock-out risk prediction
5. Rolling sales analysis
6. Customer behavior segmentation
7. Restocking recommendation system

📌 SQL File: `sql/queries.sql`

---

## 📈 Key KPIs

* On-Time Delivery Rate
* Average Customer Rating
* Average Customer Care Calls

---

## 📊 Key Insights

### 🚚 Shipment Analysis

* Flight shipments show higher delay rates compared to road transport

### 🏭 Warehouse Performance

* Certain warehouses consistently underperform in delivery timelines

### 📞 Customer Behavior

* Higher customer care calls are strongly linked with delayed deliveries

### 💰 Discount Impact

* High discount orders tend to have increased delivery delays

---

## 💡 Business Recommendations

* Optimize logistics for high-discount orders
* Improve efficiency in underperforming warehouses
* Reduce dependency on slower shipment modes
* Strengthen customer support for high-risk deliveries

---

## 🚀 Conclusion

This project demonstrates how **data-driven decision-making** can improve supply chain efficiency, reduce delivery delays, and enhance customer satisfaction.

It highlights the ability to build a complete analytics pipeline from **data processing → SQL modeling → business visualization**.
