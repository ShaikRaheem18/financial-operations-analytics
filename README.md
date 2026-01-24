# Financial Operations Analytics & Dashboard System

## Overview
An end-to-end financial analytics project built to simulate real-world banking operations.
The system ingests raw transaction data, performs data cleaning and validation, models structured tables in SQL Server, runs analytical queries, and visualizes key business KPIs using Power BI.

The project focuses on revenue monitoring, customer behavior analysis, fraud risk tracking, and operational insights using a dataset of 1.29 million transactions.

---

## Business Problem
Financial institutions process millions of transactions daily, but raw transactional data is often:
- Messy and inconsistent
- Hard to analyze directly
- Not decision-ready

Operations and analytics teams need answers such as:
- How much revenue is being generated?
- Who are the most valuable customers?
- When do transaction volumes peak?
- Where are fraud and failures concentrated?

This project addresses those questions through a structured analytics pipeline and executive-ready dashboards.

---

## Architecture & Data Pipeline

Raw CSV Data  
↓  
Python Data Cleaning & Validation  
↓  
SQL Server Staging Tables  
↓  
Fact & Dimension Tables  
↓  
SQL Analytics Queries  
↓  
Power BI Dashboards & Insights  

---

## Tech Stack
- SQL Server – Database, ETL, schema design, analytics
- Power BI – Interactive dashboards and DAX measures
- Python – Data cleaning and preprocessing
- Git & GitHub – Version control and portfolio hosting

---

## Database Design

Core Tables:
- customers – Unique customer profiles with risk classification
- transactions – 1.29M transaction records (fact table)
- branches – Operational branch mapping

The schema follows a fact-dimension model, enabling scalable analytics and clean joins.

---

## Power BI Dashboard

The dashboard is designed for executive and operational users and consists of three pages:

1. Executive Overview
- Total Revenue
- Total Transactions
- Active Customers
- Fraud Rate
- Monthly revenue and volume trends
- Success vs Failed transaction split

2. Customer Insights
- Top 10 customers by total spend
- Revenue distribution by customer risk profile
- Average spend per customer

3. Operations & Time Analysis
- Transactions by hour of day
- Fraud trends over time
- Revenue by transaction category

The dashboard supports interactive filtering by date, status, and risk profile.

---

## Screenshots

Executive Overview  
screenshots/executive_overview.png  

Customer Insights  
screenshots/customer_insights.png  

Operations & Time Analysis  
screenshots/operations_time.png  

---

## Key Business Insights
- A small group of customers contributes a disproportionately large share of total revenue.
- Transaction volumes peak during evening hours, indicating user behavior patterns.
- Fraud and failed transactions are concentrated among high-value customers.
- Revenue distribution across categories highlights dominant spending segments.

---

## Repository Structure

financial-operations-analytics/
├── data/                  # Sample dataset (small subset)
├── sql/                   # Schema and analytics SQL queries
├── sql_data/              # Cleaned CSV data
├── notebooks/             # Python data cleaning and EDA
├── dashboard/             # Power BI (.pbix) file
├── reports/               # Business insights
├── screenshots/           # Dashboard screenshots
└── README.md

---

## How to Run the Project
1. Clone the repository:
   git clone https://github.com/ShaikRaheem18/financial-operations-analytics.git

2. Execute SQL scripts in the sql folder to create tables.

3. (Optional) Review Python notebooks for data cleaning logic.

4. Open the Power BI dashboard file:
   dashboard/financial_operations_dashboard.pbix

---

## What This Project Demonstrates
- End-to-end analytics pipeline design
- Strong SQL fundamentals (ETL, joins, aggregations)
- Real-world data cleaning and modeling challenges
- Business-focused data visualization
- Ability to extract and communicate actionable insights

---

## Author
Raheem Shaik  
Aspiring Data Analyst / Analytics Engineer  

GitHub: https://github.com/ShaikRaheem18
