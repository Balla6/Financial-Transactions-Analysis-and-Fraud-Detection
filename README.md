# Financial Transactions Analysis and Fraud Detection

## Overview
This project analyzes a dataset of financial transactions to uncover patterns, detect fraudulent activities, and provide actionable insights. The dataset includes transaction types, amounts, user activity, and regional details, enabling an in-depth analysis of high-risk transactions, user behavior, and temporal trends. The project employs **Python**, **SQL**, and **Power BI** to demonstrate comprehensive data analysis and visualization workflows.

---

## Goals
- Validate data integrity to ensure a reliable dataset for analysis.
- Explore transaction trends and patterns across time, regions, and users.
- Detect and analyze high-risk transactions such as scams and phishing.
- Segment users based on behavior and risk scores.
- Deliver actionable recommendations to improve fraud prevention strategies.
- Visualize insights using interactive dashboards in Power BI.

---

## Key Findings
- **Total Transactions Analyzed**: 78,600 rows of transaction data.
- **High-Risk Transactions**:
  - Scams account for 60.8% of high-risk transactions.
  - Phishing transactions make up 39.2%.
- **Regions with the Most High-Risk Transactions**: North America leads in scam transactions, while phishing is evenly distributed across regions.
- **Transaction Trends**:
  - Wednesdays and Saturdays have the highest transaction volumes.
  - Sundays and Mondays see the lowest activity.
- **User Insights**:
  - A small group of users accounts for the majority of high-risk transactions.
  - Longer session durations correlate with higher transaction risks.

---

## Files in This Repository
### 1. **README.md**
- Project overview and repository structure.

### 2. **report.md**
- Detailed analysis report with insights and actionable recommendations.

### 3. **data/**
- `metaverse_transactions_dataset.csv`: Raw dataset sourced from Kaggle.
- `transaction_data.csv`: Cleaned and preprocessed dataset used for analysis.

### 4. **Python_Analysis/**
- `Financial Transactions Tracker.ipynb`: Jupyter notebook for data cleaning, exploratory data analysis (EDA), and machine learning-based fraud detection.

### 5. **SQL_Analysis/**
- `FINANCIAL TRANSACTION TRACKER ANALYSIS.sql`: SQL queries for data validation, exploratory analysis, and fraud detection.

### 6. **Visualizations/**
- Saved Power BI dashboard screenshots:
  - `total_transacted_amount_by_day.png`: Total transaction amount by weekday.
  - `total_high_risk_transactions_by_day.png`: High-risk transactions by weekday.
  - `high_risk_transactions_by_region.png`: High-risk transactions by region.
  - `scam_vs_phishing_proportions.png`: Proportions of scams and phishing.
  - `average_transaction_amount_by_region.png`: Average transaction amount by region.
  - `top_sending_addresses.png`: Top contributing users by transaction volume.
  - `top_receiving_addresses.png`: Top receiving users by transaction volume.
  - `scam_vs_phishing_by_region.png`: Scam and phishing transactions by region.
  - `transaction_trends_by_hour.png`: Hourly transaction activity trends.
  - `transaction_trends_by_month.png`: Monthly transaction activity trends.
  - `high_value_transactions_by_region.png`: High-value transactions by region.
  - `proportions_of_transaction_types.png`: Breakdown of transaction types.
  - `cumulative_transactions_by_type.png`: Running total of transactions by type.
  - `user_login_frequency_vs_risk_scores.png`: Correlation between login frequency and risk scores.
  - `high_risk_transactions_by_age_group.png`: High-risk transactions by age group.
  - `session_duration_vs_transaction_amounts.png`: Relationship between session durations and transaction values.

---

## Datasets
### Original Dataset
- **File**: `metaverse_transactions_dataset.csv`
- **Description**: The raw dataset contains detailed records of financial transactions, including timestamps, transaction types, amounts, and regional data. This serves as the foundation for all analysis.

### Cleaned Dataset
- **File**: `transaction_data.csv`
- **Description**: The cleaned dataset, prepared using Python, includes additional features such as risk scores and high-risk indicators. It serves as the input for SQL analysis and Power BI visualizations.

---

## Visualizations
This project includes both Python-generated charts and Power BI dashboards:

### Power BI Dashboard
This dashboard provides interactive insights into transaction trends, fraud detection, and user behavior.

**Access the Power BI dashboard here: [Interactive Power BI Dashboard](https://app.powerbi.com/groups/me/reports/a2bcaf0d-e17e-400f-a45c-3601a2ba9fd0/00d54f939bd431bc9688?experience=power-bi)**

#### Saved Visualizations:
1. **Total Transacted Amount by Day of the Week**
2. **Total High-Risk Transactions by Day of the Week**
3. **High-Risk Transactions by Region**
4. **Scam vs Phishing Proportions**
5. **Average Transaction Amount by Region**
6. **Top Sending Addresses by Transaction Volume**
7. **Top Receiving Addresses by Transaction Volume**
8. **Scam vs Phishing Transactions by Region**
9. **Transaction Trends by Hour of the Day**
10. **Transaction Trends by Month**
11. **High-Value Transactions by Region**
12. **Proportions of Transaction Types**
13. **Cumulative Total Transactions by Type**
14. **User Login Frequency vs Risk Scores**
15. **High-Risk Transactions by Age Group**
16. **Session Duration vs Transaction Amounts**

---

## How to Use
1. **View the Analysis**:
   - Check `report.md` for detailed insights and recommendations.
   - Explore Power BI dashboards using the provided [Interactive Power BI Dashboard link](https://app.powerbi.com/groups/me/reports/a2bcaf0d-e17e-400f-a45c-3601a2ba9fd0/00d54f939bd431bc9688?experience=power-bi).

2. **Run the Python Notebook**:
   - Use `Financial Transactions Tracker.ipynb` to preprocess data, perform statistical analysis, and train machine learning models.

3. **Execute SQL Scripts**:
   - Use `FINANCIAL TRANSACTION TRACKER ANALYSIS.sql` for advanced data validation, high-risk transaction analysis, and trend exploration.

4. **Explore the Visualizations**:
   - Access saved Power BI images in the `Visualizations/` folder.

---

## Conclusion
This project showcases the power of data-driven analysis in uncovering fraud and enhancing operational efficiency. By combining Python, SQL, and Power BI, it provides a comprehensive approach to identifying risks, understanding transaction patterns, and making informed decisions. The insights and recommendations empower organizations to proactively address vulnerabilities and optimize performance.
