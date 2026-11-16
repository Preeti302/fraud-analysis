## Key Findings

### Transaction Time
- Fraud rates varied across the eight six-hour intervals.
- Interval 4 recorded the highest fraud rate (0.595%), while Interval 5 recorded the lowest (0.075%).
- This suggests fraud activity was not evenly distributed across the observed period.

### Transaction Amount
- The $500–$999 range recorded the highest fraud rate (0.405%).
- Transactions below $50 accounted for the highest number of fraud cases (305), largely because this range contained the most transactions.
- Fraud rates did not consistently increase with transaction amounts.

### Repeated Transaction Patterns
- Multiple records shared identical transaction times, amounts and fraud classifications.
- One fraudulent combination involving a $1.00 transaction appeared six times.
- These repeated records may warrant further investigation, but cannot be confirmed as duplicate payments.

### Sequential Transaction Analysis
- Used the SQL `LAG()` window function to compare consecutive transaction amounts.
- Transaction amounts varied between consecutive records.
- This demonstrates how window functions can help investigate transaction sequences.

### Transaction Time Gaps
- Used the `LAG()` window function to calculate elapsed seconds between consecutive transaction records.
- Several consecutive records occurred within 1–3 seconds of each other.
- Short time gaps alone cannot establish suspicious activity because the dataset does not contain customer IDs.

### High-Value Transaction Analysis
- Used the `RANK()` window function to rank transactions by amount in descending order.
- Examined the 20 highest-value transactions.
- All 20 transactions were classified as legitimate.
- The highest transaction amount was $25,691.16.

**Business Insight:** High transaction amounts do not necessarily indicate fraudulent activity. Transaction value should be evaluated alongside other behavioural and transaction-level indicators.

## SQL Techniques Used

- Aggregations: `COUNT()`, `SUM()`, `AVG()`
- Conditional logic: `CASE WHEN`
- Grouping and filtering: `GROUP BY`, `HAVING`
- Window functions: `LAG()`, `RANK()`
- Sorting and ranking: `ORDER BY`

## Limitations

- The dataset does not contain customer IDs or unique transaction IDs.
- The `Time` column represents elapsed seconds from the first transaction, not actual clock time.
- Consecutive transactions may belong to different customers.
- Repeated transaction combinations cannot be confirmed as duplicate payments.

## Business Takeaways

- Fraud rates can vary across transaction time and amount ranges.
- Lower-value transactions should not automatically be considered low risk.
- Repeated transaction patterns may deserve further investigation.
- Transaction amount and timing can contribute to fraud analysis, but should be evaluated alongside additional customer and transaction-level information.
