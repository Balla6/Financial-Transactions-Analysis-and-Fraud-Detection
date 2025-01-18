# Financial Transactions Analysis and Fraud Detection Report

## Overview
This report provides an analysis of financial transactions focusing on patterns, high-risk activities, and fraud detection. The project integrates SQL for data extraction and manipulation alongside Power BI and Machine Learning for visualization and prediction, offering insights into user behaviors, transaction trends, and potential fraudulent activities.

---

## 1. Methodology

### SQL Techniques Used
The following SQL techniques were employed to analyze the dataset:

1. **Data Validation and Integrity Checks**
   - Verified the total number of rows and checked for missing values in key columns (`timestamp`, `amount`, `transaction_type`, etc.).

2. **Basic Data Analysis**
   - Calculated total transaction amounts, average transaction values, and identified unique transaction types.
   - Ranked the top 5 sending and receiving addresses by transaction amounts.

3. **High-Risk Transaction Analysis**
   - Segmented transactions into high-risk categories (e.g., scams and phishing).
   - Analyzed regional and behavioral patterns of high-risk transactions.

4. **Behavioral Analysis**
   - Analyzed user activity patterns, including transaction frequency and session duration.
   - Segmented users by total transaction counts and average risk scores.

5. **Transaction Trends**
   - Examined transactions by day, month, and hour to identify activity peaks and troughs.

6. **Fraudulent Activity Indicators**
   - Correlated session durations and risk scores with high-risk transaction types.
   - Investigated regional and user-specific patterns of scam and phishing activities.

7. **Custom Insights and Window Functions**
   - Ranked users by total transaction amounts within regions.
   - Calculated running totals of transaction amounts by type.

8. **Outlier Detection**
   - Identified anomalies using z-scores for high-value transactions.

---

## 2. Power BI Visualizations

### Key Findings from Visualizations

1. **Total Transacted Amount by Day of the Week**
   - **Insight:** Saturday had the highest transaction total ($5.731M), while Tuesday had the lowest ($5.560M).
   - **Recommendation:** Introduce targeted discounts on Tuesdays and leverage high Saturday traffic with promotions.

2. **Total High-Risk Transactions by Day of the Week**
   - **Insight:** Monday shows the highest number of high-risk transactions (1,003), indicating a spike at the start of the week.
   - **Recommendation:** Strengthen fraud detection on Mondays and investigate patterns in high-risk transactions.

3. **Proportion of High-Risk Transactions by Day of the Week**
   - **Insight:** Monday has the highest proportion of high-risk transactions (8.93%).
   - **Recommendation:** Focus fraud prevention efforts on Mondays and dynamically adjust fraud detection rules throughout the week.

4. **Total High-Risk Transactions by Region**
   - **Insight:** North America leads with 1,357 high-risk transactions, followed by Asia and Africa.
   - **Recommendation:** Strengthen fraud detection systems in North America and standardize monitoring across regions.

5. **Proportion of High-Risk Transactions by Region**
   - **Insight:** North America has the highest proportion of high-risk transactions (8.6%), while Europe has the lowest (7.8%).
   - **Recommendation:** Focus on reducing risk in North America while leveraging Europe’s best practices globally.

6. **Average Transaction Amount by Region**
   - **Insight:** Asia has the highest average transaction amount ($504.59), followed by South America ($502.77).
   - **Recommendation:** Target high-value regions with premium offerings and promotions.

7. **Average Session Duration by Risk Level**
   - **Insight:** Low-risk sessions average 73 minutes, while high-risk sessions are shorter at 30 minutes.
   - **Recommendation:** Investigate short session durations for potential fraud and integrate session duration into fraud detection algorithms.

8. **Distribution of Transaction Types**
   - **Insight:** Sales and purchases dominate, while scams and phishing represent smaller but significant risks.
   - **Recommendation:** Enhance detection for scams and phishing and educate users on safe transaction practices.

9. **Top 5 Sending and Receiving Addresses**
   - **Insight:** The top sending address transacted $113K, and the top receiving address transacted $118K.
   - **Recommendation:** Monitor high-value addresses for suspicious activity and ensure compliance with anti-money laundering regulations.

10. **Scam and Phishing Proportions by Region**
    - **Insight:** Scams dominate globally, with Africa having the highest proportion (62.16%), while phishing is more common in South America (40.99%).
    - **Recommendation:** Prioritize scam detection in Africa and phishing prevention in South America.

---

## 3. Machine Learning

### Model Overview
A Random Forest Classifier was implemented to predict high-risk transactions based on features such as transaction type, location region, session duration, risk score, and login frequency.

### Process

1. **Feature Selection**
   - Selected key features: `amount`, `transaction_type`, `location_region`, `session_duration`, `login_frequency`, `risk_score`, `day_of_week`, and `month`.

2. **Data Preprocessing**
   - Applied OneHotEncoding to categorical data and scaled numerical data using StandardScaler.

3. **Model Training**
   - Split the dataset into training (80%) and testing (20%) subsets.
   - Trained a Random Forest Classifier with a test size of 0.2 and a random state of 42.

4. **Evaluation**
   - Classification Report:
     - Precision, Recall, and F1-score of 1.0 for both classes.
   - Confusion Matrix:
     - High accuracy in distinguishing between low-risk and high-risk transactions.
   - ROC-AUC Score: 1.00, indicating perfect model performance.

5. **Feature Importance**
   - `Risk Score`, `Transaction Type (Scam)`, and `Transaction Type (Phishing)` were the most influential features.

### Visualizations
- **Confusion Matrix**
  - Displayed model accuracy for low-risk and high-risk transactions.
- **ROC Curve**
  - Demonstrated the model's ability to classify transactions accurately.
- **Feature Importance Chart**
  - Showed the relative importance of features in determining risk levels.

---

## 4. Recommendations

1. **Fraud Detection**
   - Strengthen fraud detection systems, especially in high-risk regions like North America.
   - Use machine learning to dynamically adapt fraud detection rules based on transaction patterns.

2. **Customer Engagement**
   - Target low-performing days (e.g., Tuesdays) with special discounts and promotions.
   - Leverage high traffic on weekends for strategic campaigns.

3. **Regional Strategies**
   - Tailor marketing and fraud prevention strategies to regional behaviors, focusing on high-risk areas like North America and Asia.

4. **Monitoring and Compliance**
   - Continuously monitor high-value addresses and transactions for potential fraud.
   - Ensure compliance with AML and KYC regulations globally.

---

## 5. Conclusion
This report provides actionable insights to enhance fraud detection and improve customer engagement. By addressing high-risk transactions, tailoring regional strategies, and strengthening monitoring systems, organizations can mitigate risks while maximizing opportunities. Further analyses using advanced techniques, such as machine learning, can supplement these findings and create a more robust fraud prevention framework.
