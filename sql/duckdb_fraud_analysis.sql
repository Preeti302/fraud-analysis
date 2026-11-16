
-- =====================================================
-- Project: Credit Card Fraud Analysis
-- Tool: DuckDB + DBeaver
-- Dataset: creditcard.csv
-- Purpose: SQL-based fraud pattern investigation
-- =====================================================

-- SECTION 1: DATA EXPLORATION

-- 1.1 Total number of transactions
SELECT COUNT(*) AS total_transactions
FROM credit_card_transactions;

-- 1.2 Fraud vs legitimate transactions
SELECT
    Class,
    COUNT(*) AS transaction_count
FROM credit_card_transactions
GROUP BY Class;

-- 1.3 Transaction amount statistics
SELECT
    Class,
    COUNT(*) AS transaction_count,
    ROUND(AVG(Amount), 2) AS avg_amount,
    MIN(Amount) AS min_amount,
    MAX(Amount) AS max_amount
FROM credit_card_transactions
GROUP BY Class;

-- 1.4 Fraud percentage
SELECT
    COUNT(*) AS total_transactions,
    SUM(CASE WHEN Class = 1 THEN 1 ELSE 0 END)
        AS fraud_transactions,
    ROUND(
        100.0 * SUM(CASE WHEN Class = 1 THEN 1 ELSE 0 END)
        / COUNT(*), 3
    ) AS fraud_percentage
FROM credit_card_transactions;



-- =====================================================
-- SECTION 2: FRAUD PATTERN ANALYSIS
-- =====================================================

-- 2.1 Fraud distribution by transaction amount range

SELECT
    CASE
        WHEN Amount < 50 THEN 'Below $50'
        WHEN Amount < 100 THEN '$50-$99'
        WHEN Amount < 500 THEN '$100-$499'
        WHEN Amount < 1000 THEN '$500-$999'
        ELSE '$1000+'
    END AS amount_range,
    Class,
    COUNT(*) AS transaction_count
FROM credit_card_transactions
GROUP BY amount_range, Class
    ORDER BY MIN(Amount), Class;


-- 2.2 Fraud rate by transaction amount range

SELECT
    CASE
        WHEN Amount < 50 THEN 'Below $50'
        WHEN Amount < 100 THEN '$50-$99'
        WHEN Amount < 500 THEN '$100-$499'
        WHEN Amount < 1000 THEN '$500-$999'
        ELSE '$1000+'
    END AS amount_range,
    COUNT(*) AS total_transactions,
    SUM(CASE WHEN Class = 1 THEN 1 ELSE 0 END) AS fraud_count,
    ROUND(
        100.0 * SUM(CASE WHEN Class = 1 THEN 1 ELSE 0 END)
        / COUNT(*), 3
    ) AS fraud_rate
FROM credit_card_transactions
GROUP BY amount_range
ORDER BY MIN(Amount);


-- 2.3 Fraud analysis by transaction hour

SELECT
    FLOOR(Time / 3600) AS transaction_hour,
    COUNT(*) AS total_transactions,
    SUM(CASE WHEN Class = 1 THEN 1 ELSE 0 END) AS fraud_count,
    ROUND(
        100.0 * SUM(CASE WHEN Class = 1 THEN 1 ELSE 0 END)
        / COUNT(*), 3
    ) AS fraud_rate
FROM credit_card_transactions
GROUP BY transaction_hour
ORDER BY transaction_hour;


-- 2.4 Compare legitimate and fraudulent transactions

SELECT
    Class,
    COUNT(*) AS total_transactions,
    ROUND(AVG(Amount), 2) AS avg_amount,
    ROUND(AVG(Time), 2) AS avg_transaction_time,
    MIN(Time) AS first_transaction_time,
    MAX(Time) AS last_transaction_time
FROM credit_card_transactions
GROUP BY Class
ORDER BY Class;


-- =====================================================
-- SECTION 3: INTERMEDIATE SQL ANALYSIS
-- =====================================================

-- 3.1 Investigate identical transaction records

SELECT
    Time,
    Amount,
    Class,
    COUNT(*) AS transaction_count
FROM credit_card_transactions
GROUP BY Time, Amount, Class
HAVING COUNT(*) > 1
ORDER BY transaction_count DESC;


-- 3.2 Sequential transaction analysis using LAG()

SELECT
    Time,
    Amount,
    Class,
    LAG(Amount) OVER (ORDER BY Time) AS previous_amount,
    Amount - LAG(Amount) OVER (ORDER BY Time) AS amount_difference
FROM credit_card_transactions
ORDER BY Time
LIMIT 20;


-- 3.3 Calculate time difference between consecutive transactions

SELECT
    Time AS current_time,
    Amount,
    Class,
    LAG(Time) OVER (
        ORDER BY Time
    ) AS previous_time,
    Time - LAG(Time) OVER (
        ORDER BY Time
    ) AS time_difference_seconds
FROM credit_card_transactions
ORDER BY Time
LIMIT 20;


-- 3.4 Rank transactions by transaction amount

SELECT
    Time,
    Amount,
    Class,
    RANK() OVER (
        ORDER BY Amount DESC
    ) AS transaction_rank
FROM credit_card_transactions
ORDER BY Amount DESC
LIMIT 20;
