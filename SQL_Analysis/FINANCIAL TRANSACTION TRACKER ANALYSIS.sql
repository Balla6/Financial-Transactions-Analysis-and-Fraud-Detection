USE transaction_db;

SELECT *
FROM transaction;

## VALIDATE DATA INTEGRITY
-- Total Rows in the Table
SELECT COUNT(*) AS total_rows FROM transaction;

-- Check for Null or Missing Values in Critical Fields
SELECT COUNT(*) AS total_missing_timestamp FROM transaction WHERE timestamp IS NULL;
SELECT COUNT(*) AS total_missing_sending_address FROM transaction WHERE sending_address IS NULL;
SELECT COUNT(*) AS total_missing_receiving_address FROM transaction WHERE receiving_address IS NULL;
SELECT COUNT(*) AS total_missing_amount FROM transaction WHERE amount IS NULL;
SELECT COUNT(*) AS total_missing_transaction_type FROM transaction WHERE transaction_type IS NULL;

## PERFORM BASIC SQL ANALYSIS
-- Check the Number of Unique Transaction Types
SELECT transaction_type, COUNT(*) AS count FROM transaction GROUP BY transaction_type;

-- Find the Total Amount Transacted
SELECT SUM(amount) AS total_transacted_amount FROM transaction;

-- Top 5 Sending Addresses by Total Transaction Amount
SELECT sending_address, SUM(amount) AS total_amount
FROM transaction
GROUP BY sending_address
ORDER BY total_amount DESC
LIMIT 5;

-- Average Transaction Amount by Transaction Type
SELECT transaction_type, AVG(amount) AS average_transaction_amount
FROM transaction
GROUP BY transaction_type;

-- Total Amount Transacted by Region
SELECT location_region, SUM(amount) AS total_amount
FROM transaction
GROUP BY location_region;

-- Average Session Duration by Region
SELECT location_region, AVG(session_duration) AS average_session_duration
FROM transaction
GROUP BY location_region;

## HIGH-RISK TRANSACTION ANALYSIS
-- Count of High-Risk Transactions (Using is_high_risk)
SELECT is_high_risk, COUNT(*) AS count
FROM transaction
GROUP BY is_high_risk;

-- Count of Scam and Phishing Transactions
SELECT transaction_type, COUNT(*) AS count
FROM transaction
WHERE transaction_type IN ('scam', 'phishing')
GROUP BY transaction_type;

-- Regional Scam and Phishing Proportions
SELECT location_region, 
       COUNT(*) AS scam_count, 
       (COUNT(*) * 1.0 / (SELECT COUNT(*) FROM transaction WHERE location_region = t.location_region)) AS scam_proportion
FROM transaction t
WHERE transaction_type = 'scam'
GROUP BY location_region
ORDER BY scam_proportion DESC;

SELECT location_region, 
       COUNT(*) AS phishing_count, 
       (COUNT(*) * 1.0 / (SELECT COUNT(*) FROM transaction WHERE location_region = t.location_region)) AS phishing_proportion
FROM transaction t
WHERE transaction_type = 'phishing'
GROUP BY location_region
ORDER BY phishing_proportion DESC;

-- Compare Average Transaction Amounts and Session Durations 
-- for High-Risk vs. Low-Risk Transactions
SELECT 
    is_high_risk,
    AVG(amount) AS avg_transaction_amount,
    AVG(session_duration) AS avg_session_duration
FROM transaction
GROUP BY is_high_risk;

-- Analyze Transaction Trends for High-Risk and Low-Risk Transactions
SELECT 
    is_high_risk, 
    day_of_week, 
    COUNT(*) AS transaction_count
FROM transaction
GROUP BY is_high_risk, day_of_week
ORDER BY is_high_risk, transaction_count DESC;

## BEHAVIOR ANALYSIS
-- Top 5 Users with High-Risk Transactions
SELECT sending_address, COUNT(*) AS high_risk_count
FROM transaction
WHERE is_high_risk = TRUE
GROUP BY sending_address
ORDER BY high_risk_count DESC
LIMIT 5;

-- Average Transaction Amount Per User
SELECT sending_address, AVG(amount) AS avg_amount
FROM transaction
GROUP BY sending_address;

-- Segment Users by Total Transaction Counts and Risk Scores
SELECT 
    sending_address,
    COUNT(*) AS total_transaction_count,
    AVG(risk_score) AS avg_risk_score
FROM transaction
GROUP BY sending_address
ORDER BY total_transaction_count DESC;

-- Group Users Based on Regions Interacted With
SELECT 
    sending_address,
    location_region,
    COUNT(*) AS total_transactions
FROM transaction
GROUP BY sending_address, location_region
ORDER BY total_transactions DESC;

## TRANSACTION TRENDS
-- Total Transactions by Day of the Week
SELECT day_of_week, COUNT(*) AS transaction_count
FROM transaction
GROUP BY day_of_week
ORDER BY transaction_count DESC;

-- Total Transactions by Month
SELECT month, COUNT(*) AS transaction_count
FROM transaction
GROUP BY month
ORDER BY FIELD(month, 'January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December');

-- Total Transactions by Hour of the Day
SELECT hour_of_day, COUNT(*) AS transaction_count
FROM transaction
GROUP BY hour_of_day
ORDER BY transaction_count DESC;

## FRAUDULENT ACTIVITY INDICATORS
-- Average Transaction Amount for Scam and Phishing by Region
SELECT location_region, transaction_type, AVG(amount) AS avg_transaction
FROM transaction
WHERE transaction_type IN ('scam', 'phishing')
GROUP BY location_region, transaction_type
ORDER BY avg_transaction DESC;

-- Average Risk Score for High-Risk Transactions
SELECT AVG(risk_score) AS avg_risk_score
FROM transaction
WHERE is_high_risk = TRUE;

-- Correlate Session Duration and Risk Score
SELECT 
    AVG(session_duration) AS avg_session_duration,
    AVG(risk_score) AS avg_risk_score
FROM transaction
WHERE is_high_risk = TRUE;

-- Correlate Session Duration with Transaction Amounts for Scam and Phishing
SELECT 
    transaction_type,
    AVG(session_duration) AS avg_session_duration,
    AVG(amount) AS avg_transaction_amount
FROM transaction
WHERE transaction_type IN ('scam', 'phishing')
GROUP BY transaction_type;

## CUSTOM INSIGHTS
-- Compare Average Session Duration and Amount for Scam Transactions in Asia
SELECT location_region, transaction_type, 
       AVG(session_duration) AS avg_session_duration, 
       AVG(amount) AS avg_amount
FROM transaction
WHERE transaction_type = 'scam' AND location_region = 'Asia'
GROUP BY location_region, transaction_type;

-- Identify Users Involved in Scam/Phishing with High Amounts or Durations
SELECT sending_address, transaction_type, COUNT(*) AS transaction_count,
       AVG(amount) AS avg_transaction_amount, AVG(session_duration) AS avg_session_duration
FROM transaction
WHERE transaction_type IN ('scam', 'phishing') AND (amount > 500 OR session_duration > 60)
GROUP BY sending_address, transaction_type
ORDER BY avg_transaction_amount DESC, avg_session_duration DESC;

## WINDOW FUNCTIONS
-- Rank Users by Total Transaction Amounts Within Each Region
SELECT sending_address, location_region, SUM(amount) AS total_transaction,
       RANK() OVER(PARTITION BY location_region ORDER BY SUM(amount) DESC) AS rank_column
FROM transaction
GROUP BY sending_address, location_region;

-- Cumulative Totals by Transaction Type
SELECT transaction_type, timestamp, amount,
       SUM(amount) OVER (PARTITION BY transaction_type ORDER BY timestamp) AS running_total
FROM transaction
ORDER BY transaction_type, timestamp;

-- Find Highest and Lowest Transactions Per User
SELECT sending_address, 
       MAX(amount) AS highest_transaction, 
       MIN(amount) AS lowest_transaction
FROM transaction
GROUP BY sending_address;

## AGE GROUP ANALYSIS
-- Total Transactions by Age Group
SELECT age_group, COUNT(*) AS total_transactions
FROM transaction
GROUP BY age_group;

-- Average Transaction Amount by Age Group
SELECT age_group, AVG(amount) AS avg_transaction_amount
FROM transaction
GROUP BY age_group;

-- High-Risk Transactions by Age Group
SELECT age_group, transaction_type, COUNT(*) AS transaction_count
FROM transaction
WHERE transaction_type IN ('scam', 'phishing')
GROUP BY age_group, transaction_type
ORDER BY transaction_count DESC;

## COMBINED METRICS
-- Risk Score and Login Frequency Correlation
SELECT sending_address, 
       AVG(risk_score) AS avg_risk_score,
       AVG(login_frequency) AS avg_login_frequency
FROM transaction
GROUP BY sending_address;

-- Group Users by Login Frequency and Calculate Average Risk Scores
SELECT CASE 
           WHEN login_frequency < 5 THEN 'Low Login Frequency'
           WHEN login_frequency BETWEEN 5 AND 15 THEN 'Medium Login Frequency'
           ELSE 'High Login Frequency'
       END AS login_frequency_range,
       AVG(risk_score) AS avg_risk_score
FROM transaction
GROUP BY login_frequency_range;

-- Analyze High-Risk Users by Region and Risk Score
SELECT 
    location_region,
    sending_address,
    COUNT(*) AS high_risk_transaction_count,
    AVG(risk_score) AS avg_risk_score
FROM transaction
WHERE is_high_risk = TRUE
GROUP BY location_region, sending_address
ORDER BY high_risk_transaction_count DESC;

## OUTLIER DETECTION
-- High-Value Transactions
WITH stats AS (
    SELECT AVG(amount) AS mean_amount, STDDEV(amount) AS stddev_amount
    FROM transaction
)
SELECT t.sending_address, t.amount, 
       (t.amount - s.mean_amount) / s.stddev_amount AS z_score
FROM transaction t
CROSS JOIN stats s
WHERE (t.amount - s.mean_amount) / s.stddev_amount > 3
ORDER BY z_score DESC;

-- Unusual Patterns by User
WITH user_stats AS (
    SELECT sending_address, COUNT(*) AS transaction_count, AVG(amount) AS avg_transaction_amount
    FROM transaction
    GROUP BY sending_address
),
overall_stats AS (
    SELECT AVG(transaction_count) AS mean_count, STDDEV(transaction_count) AS stddev_count,
           AVG(avg_transaction_amount) AS mean_amount, STDDEV(avg_transaction_amount) AS stddev_amount
    FROM user_stats
)
SELECT u.sending_address, u.transaction_count, u.avg_transaction_amount,
       (u.transaction_count - o.mean_count) / o.stddev_count AS transaction_count_z_score,
       (u.avg_transaction_amount - o.mean_amount) / o.stddev_amount AS transaction_amount_z_score
FROM user_stats u
CROSS JOIN overall_stats o
WHERE (u.transaction_count - o.mean_count) / o.stddev_count > 2
   OR (u.avg_transaction_amount - o.mean_amount) / o.stddev_amount > 2
ORDER BY transaction_amount_z_score DESC, transaction_count_z_score DESC;
