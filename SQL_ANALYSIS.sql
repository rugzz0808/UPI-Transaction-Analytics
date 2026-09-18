CREATE DATABASE upi_analysis;
USE upi_analysis;

CREATE TABLE transactions (
    transaction_id VARCHAR(50),
    timestamp DATETIME,
    transaction_type VARCHAR(50),
    merchant_category VARCHAR(50),
    amount_inr DECIMAL(10,2),
    transaction_status VARCHAR(20),
    sender_age_group VARCHAR(20),
    receiver_age_group VARCHAR(20),
    sender_state VARCHAR(50),
    sender_bank VARCHAR(50),
    receiver_bank VARCHAR(50),
    device_type VARCHAR(30),
    network_type VARCHAR(30),
    fraud_flag INT,
    hour_of_day INT,
    day_of_week VARCHAR(20),
    is_weekend INT
);

SHOW VARIABLES LIKE 'local_infile';
SET GLOBAL local_infile = 1;

LOAD DATA LOCAL INFILE 'C:/Users/Dell/PycharmProjects/UPI_ANALYSIS/upi_transactions_2024.csv'
INTO TABLE transactions
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(transaction_id, timestamp, transaction_type, merchant_category,
 amount_inr, transaction_status, sender_age_group, receiver_age_group,
 sender_state, sender_bank, receiver_bank, device_type, network_type,
 fraud_flag, hour_of_day, day_of_week, is_weekend);
 TRUNCATE TABLE transactions;
 SELECT COUNT(*) FROM transactions;
 SHOW TABLES;
 SELECT * FROM transactions;
 
 
SELECT AVG(amount_inr) as Average_transaction
FROM transactions;

SELECT MAX(amount_inr)as maximum_amount,
MIN(amount_inr) as minimum_amount
FROM transactions;


SELECT
    transaction_status,
    COUNT(*) AS transaction_count
FROM transactions
GROUP BY transaction_status;

SELECT 
    transaction_status,
    COUNT(*) AS transaction_count,
    ROUND((COUNT(*))/(SELECT COUNT(*) FROM transactions)* 100,2) AS Percentage
FROM transactions
GROUP BY transaction_status;


SELECT
    merchant_category,
    COUNT(*) AS transaction_count,
    SUM(amount_inr) AS total_value,
    AVG(amount_inr) AS average_amount
FROM transactions
GROUP BY merchant_category
ORDER BY total_value DESC;

SELECT hour_of_day,
       COUNT(*) AS transaction_count,
    SUM(amount_inr) AS total_value,
    AVG(amount_inr) AS average_amount
FROM transactions
GROUP BY hour_of_day
ORDER BY transaction_count DESC;
  
SELECT day_of_week,
       COUNT(*) AS transaction_count,
    SUM(amount_inr) AS total_value,
    AVG(amount_inr) AS average_amount
FROM transactions
GROUP BY day_of_week
ORDER BY transaction_count DESC;

SELECT sender_age_group,
       COUNT(*) AS transaction_count,
    SUM(amount_inr) AS total_value,
    AVG(amount_inr) AS average_amount
FROM transactions
GROUP BY sender_age_group
ORDER BY transaction_count DESC;

SELECT sender_state,
       COUNT(*) AS transaction_count,
    SUM(amount_inr) AS total_value,
    AVG(amount_inr) AS average_amount
FROM transactions
GROUP BY sender_state
ORDER BY transaction_count DESC
LIMIT 10;

SELECT fraud_flag,
      COUNT(*) AS Fraud_count
FROM transactions
GROUP BY fraud_flag;

SELECT
    transaction_type,
    SUM(fraud_flag) AS fraud_count,
    COUNT(*) AS total_transactions,
    ROUND(SUM(fraud_flag) * 100.0 / COUNT(*), 3) AS fraud_rate
FROM transactions
GROUP BY transaction_type
ORDER BY fraud_rate DESC;

SELECT fraud_flag,
	   ROUND((COUNT(*))/(SELECT COUNT(*) FROM transactions)*100,2) AS Fraud_rate
       FROM transactions
       GROUP BY fraud_flag;
SELECT
    merchant_category,
    SUM(fraud_flag) AS fraud_count,
    COUNT(*) AS total_transactions,
    ROUND(SUM(fraud_flag) * 100.0 / COUNT(*), 3) AS fraud_rate
FROM transactions
GROUP BY merchant_category
ORDER BY fraud_rate DESC;

SELECT
    sender_age_group,
    SUM(fraud_flag) AS fraud_count,
    COUNT(*) AS total_transactions,
    ROUND(SUM(fraud_flag) * 100.0 / COUNT(*), 3) AS fraud_rate
FROM transactions
GROUP BY sender_age_group
ORDER BY fraud_rate DESC;

SELECT
    device_type,
    SUM(fraud_flag) AS fraud_count,
    COUNT(*) AS total_transactions,
    ROUND(SUM(fraud_flag) * 100.0 / COUNT(*), 3) AS fraud_rate
FROM transactions
GROUP BY device_type
ORDER BY fraud_rate DESC;

SELECT
    hour_of_day,
    SUM(fraud_flag) AS fraud_count,
    COUNT(*) AS total_transactions,
    ROUND(SUM(fraud_flag) * 100.0 / COUNT(*), 3) AS fraud_rate
FROM transactions
GROUP BY hour_of_day
ORDER BY fraud_rate DESC;

SELECT 
    sender_state,
    SUM(fraud_flag) AS fraud_count,
    COUNT(*) AS total_transactions,
    ROUND(SUM(fraud_flag) * 100.0 / COUNT(*), 3) AS fraud_rate
FROM
    transactions
GROUP BY sender_state
ORDER BY fraud_count DESC;

SELECT
    is_weekend,
    COUNT(*) AS transaction_count,
    SUM(amount_inr) AS total_value,
    AVG(amount_inr) AS average_amount
FROM transactions
GROUP BY is_weekend;

SELECT
    merchant_category,
    SUM(amount_inr) AS total_value
FROM transactions
GROUP BY merchant_category
ORDER BY total_value DESC
LIMIT 5;

SELECT
    transaction_id,
    transaction_type,
    merchant_category,
    amount_inr,
    transaction_status,
    fraud_flag
FROM transactions
ORDER BY amount_inr DESC
LIMIT 10;

SELECT
    transaction_id,
    transaction_type,
    merchant_category,
    amount_inr,
    transaction_status,
    fraud_flag
FROM transactions
WHERE fraud_flag = 1
ORDER BY amount_inr DESC
LIMIT 10;

SELECT
    merchant_category,
    COUNT(*) AS failed_transactions
FROM transactions
WHERE transaction_status = 'FAILED'
GROUP BY merchant_category
ORDER BY failed_transactions DESC;


