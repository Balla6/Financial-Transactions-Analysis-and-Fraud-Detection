# Financial Transactions Analysis and Fraud Detection

## Overview
This project analyzes financial transactions to identify fraudulent activities, uncover patterns, and provide actionable insights. The analysis utilizes Python, SQL, and Power BI to detect anomalies, generate visualizations, and present findings that aim to enhance fraud detection and improve decision-making for financial institutions.

---

## Goals
1. Detect high-risk transactions (e.g., scams, phishing) using SQL queries and Python models.
2. Understand transaction patterns across regions, days, and users.
3. Highlight high-value sending and receiving addresses for enhanced monitoring.
4. Provide actionable recommendations to mitigate fraud and optimize business strategies.
5. Demonstrate data cleaning, analysis, and visualization skills using Python and Power BI.

---

## Key Findings
- **Total Transacted Amount:** USD 45,687,312.50 (example placeholder).
- **Most Fraud-Prone Day:** Monday shows the highest number of high-risk transactions.
- **Top Fraud Types:** Scams (60.8%) and phishing (39.2%) dominate high-risk activities.
- **Top Region by Transactions:** North America leads in transaction volume and fraud risk.
- **High-Value Transactions:** A few sending and receiving addresses dominate transactions, requiring further scrutiny.

---

## Files in This Repository

### 1. **README.md**
- Provides an overview of the project and repository structure.

### 2. **report.md**
- Detailed analysis report with insights, visualizations, and actionable recommendations.

### 3. **data/**
- `transactions_dataset.csv`: The raw dataset containing financial transaction records.

### 4. **Python_Analysis/**
- `data_processing.py`: Script for data cleaning and preparation.
- `fraud_detection.py`: Fraud detection logic and implementation of machine learning models.

### 5. **SQL_Analysis/**
- `data_validation.sql`: SQL queries for data integrity checks.
- `fraud_queries.sql`: SQL queries for detecting fraud, including high-risk transactions.

### 6. **Visualizations/**
- Saved Power BI dashboard screenshots:
  - `total_transacted_amount_by_day.png`
  - `total_high_risk_transactions_by_day.png`
  - `high_risk_transactions_by_region.png`
  - `scam_vs_phishing_transactions.png`

---

## Datasets

### **Original Dataset**
- **File:** `transactions_datas.csv`
- **Description:** The raw dataset containing transaction details such as timestamp, sending/receiving addresses, transaction amounts, and risk categories. This dataset serves as the foundation for analysis.

---

## Visualizations

This project features Power BI dashboards and Python-generated visualizations to provide in-depth insights:

### Power BI Dashboard
Interactive Power BI dashboards are included to explore transaction trends, fraud patterns, and regional performance.

#### Saved Visualizations:
1. **Total Transacted Amount by Day of the Week:** Highlights transaction activity trends across weekdays.
2. **High-Risk Transactions by Region:** Regional distribution of high-risk transactions.
3. **Scam vs Phishing Transactions:** Breakdown of scam and phishing transaction proportions.
4. **Top Sending and Receiving Addresses:** Top contributing addresses by transaction volume.
5. **Proportion of High-Risk Transactions by Transaction Type:** Analysis of fraud types.

### Python-Generated Visualizations
- Fraud Detection Heatmap: Correlation between transaction features and risk levels.
- Quantity Ordered Distribution: Histogram showing transaction patterns by volume.
- Risk Categories Distribution: Bar chart depicting low, medium, and high-risk transactions.

---

## How to Use

### View the Analysis:
1. Read the **report.md** for detailed insights and findings.
2. Explore the saved Power BI dashboard images in the `Visualizations/` folder.

### Run the Code:
1. Clone this repository:
   ```bash
   git clone https://github.com/Balla6/Financial-Transactions-Analysis-and-Fraud-Detection.git

### Conclusion
This project demonstrates how advanced data analysis techniques, combined with visualization tools, can effectively uncover fraud and improve financial decision-making. By leveraging Python, SQL, and Power BI, the analysis provides actionable recommendations to minimize risks and enhance operational efficiency.
