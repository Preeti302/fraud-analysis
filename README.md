# Credit Card Fraud Analytics

## Project Overview

This project focuses on analyzing credit card transaction data to identify patterns associated with fraudulent activity using SQL and DuckDB.

The analysis explores transaction behaviour, fraud distribution, transaction amounts, and potential indicators that may help support fraud monitoring and investigation.

## Business Objectives

- Understand the distribution of fraudulent and legitimate transactions.
- Identify patterns across transaction amounts and time intervals.
- Investigate repeated transaction patterns.
- Analyze consecutive transactions using SQL window functions.
- Translate analytical findings into meaningful business insights.

## Technologies Used

- **SQL** – Data exploration and fraud analysis
- **DuckDB** – SQL query execution and data analysis
- **DBeaver** – SQL development environment
- **Git & GitHub** – Version control and project documentation

## Dataset

Credit Card Fraud Detection dataset from Kaggle.

[Dataset – Credit Card Fraud Detection](https://www.kaggle.com/datasets/mlg-ulb/creditcardfraud)

**Dataset characteristics:**
- Total transactions: 284,807
- Legitimate transactions: 284,315
- Fraudulent transactions: 492
- Fraud rate: 0.173%

The dataset contains anonymized transaction features (`V1`–`V28`), transaction amount, elapsed transaction time, and a classification column (`Class`).

## Analysis Performed

- Data exploration and profiling
- Fraud distribution analysis
- Transaction amount analysis
- Fraud rate comparison across transaction amount ranges
- Transaction time interval analysis
- Repeated transaction investigation
- Sequential transaction analysis using `LAG()`
- Transaction time gap analysis using window functions
- High-value transaction ranking using `RANK()`

## Key Findings

- **Fraud distribution:** Fraudulent transactions account for approximately 0.173% of all transactions, demonstrating significant class imbalance.
- **Transaction timing:** Fraud rates varied across eight six-hour intervals. Interval 4 recorded the highest fraud rate at 0.595%.
- **Transaction amounts:** The $500–$999 range recorded the highest fraud rate at 0.405%.
- **Repeated patterns:** Multiple records shared identical transaction times, amounts, and fraud classifications.
- **Sequential analysis:** Consecutive transaction amounts varied, demonstrating how SQL window functions can be used to examine transaction sequences.
- **High-value transactions:** All 20 highest-value transactions examined were classified as legitimate.

## Business Insights

- Fraud monitoring should consider multiple transaction characteristics rather than relying solely on transaction value.
- Lower-value transactions should not automatically be considered low risk.
- Variations in fraud rates across time intervals may warrant further investigation.
- Repeated transaction patterns can provide useful investigation indicators, although additional customer-level information is needed for validation.
- High transaction values alone are not sufficient indicators of fraudulent activity.

## Limitations

- The dataset does not contain customer IDs or unique transaction IDs.
- Transaction time represents elapsed seconds rather than actual clock time.
- Anonymized features limit direct interpretation of individual transaction characteristics.
- Consecutive records may belong to different customers.
- Observed patterns do not establish causation.

## Future Improvements

- Develop SQL-based fraud detection rules.
- Evaluate fraud detection performance using precision, recall, and F1-score.
- Investigate additional transaction patterns.
- Build visualizations to communicate fraud trends and analytical findings.
