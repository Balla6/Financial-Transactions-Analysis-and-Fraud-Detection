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
- **Top Risk-Prone Region**: North America leads in scam transactions, while phishing is evenly distributed across regions.
- **Peak Transaction Times**:
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
  - `high_risk_transactions_by_region.png`: Regional high-risk transaction trends.
  - `scam_vs_phishing_proportions.png`: Proportions of scams and phishing.
  - `transaction_trends_by_weekday.png`: Trends by day of the week.
  - `top_sending_addresses.png`: Top contributing users by transaction volume.

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

#### Saved Visualizations:
1. **High-Risk Transactions by Region**:
   - Visualizes scam and phishing proportions across regions.
2. **Scam vs Phishing Proportions**:
   - Shows the relative proportions of high-risk transaction types.
3. **Transaction Trends by Day of the Week**:
   - Highlights peak transaction days and low-activity periods.
4. **Top Sending and Receiving Addresses**:
   - Identifies users contributing to high transaction volumes.

### Python-Generated Visualizations
- Risk Score Correlation: Heatmap visualizing correlations between numerical variables like risk scores and session durations.
- High-Risk Transactions: Scatter plots showing the distribution of scams and phishing across time.
- Anomaly Detection: Visualizations highlighting outliers in transaction amounts and user behaviors.

---

## How to Use
1. **View the Analysis**:
   - Check `report.md` for detailed insights and recommendations.
   - Explore Power BI dashboards using saved screenshots or import the cleaned dataset (`transaction_data.csv`) for interactive exploration.

2. **Run the Python Notebook**:
   - Use `Financial Transactions Tracker.ipynb` to preprocess data, perform statistical analysis, and train machine learning models.

3. **Execute SQL Scripts**:
   - Use `FINANCIAL TRANSACTION TRACKER ANALYSIS.sql` for advanced data validation, high-risk transaction analysis, and trend exploration.

4. **Explore the Visualizations**:
   - Access saved Power BI images in the `Visualizations/` folder.

---

## Conclusion
This project showcases the power of data-driven analysis in uncovering fraud and enhancing operational efficiency. By combining Python, SQL, and Power BI, it provides a comprehensive approach to identifying risks, understanding transaction patterns, and making informed decisions. The insights and recommendations empower organizations to proactively address vulnerabilities and optimize performance.
