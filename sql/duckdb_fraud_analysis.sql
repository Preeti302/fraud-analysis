
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
