### Transaction Time Analysis

The transaction dataset was divided into eight intervals of six hours each using the Time column.

Key observations:

- Interval 1 recorded the highest number of fraudulent transactions (91).
- Interval 4 recorded the highest fraud rate (0.595%).
- Interval 5 recorded the lowest fraud rate (0.075%).
- Fraud rates varied across different elapsed-time intervals.

**Business observation:** Fraudulent transactions are not distributed uniformly across the dataset's time intervals. Certain intervals show higher fraud rates and may warrant additional investigation.

Note: Time represents elapsed seconds from the first transaction, not actual time of day.

## 3. Transaction Time Analysis

### Objective
Analyze fraudulent transaction patterns across different time intervals to identify periods with higher fraud activity.

### Approach
- Used the `Time` column, which represents elapsed seconds since the first transaction.
- Divided the dataset into eight intervals of six hours each.
- Compared legitimate and fraudulent transaction counts.
- Calculated fraud percentages within each interval.

### Findings

| Time Interval | Total Transactions | Fraud Transactions | Fraud Rate |
|---|---:|---:|---:|
| 0 | 12,340 | 55 | 0.446% |
| 1 | 35,061 | 91 | 0.260% |
| 2 | 46,850 | 71 | 0.152% |
| 3 | 50,535 | 64 | 0.127% |
| 4 | 11,594 | 69 | 0.595% |
| 5 | 35,851 | 27 | 0.075% |
| 6 | 49,585 | 63 | 0.127% |
| 7 | 42,991 | 52 | 0.121% |

### Key Observations

1. Interval 1 recorded the highest number of fraudulent transactions (91).
2. Interval 4 recorded the highest fraud rate (0.595%).
3. Interval 5 recorded the lowest fraud rate (0.075%).
4. Fraud rates varied across the eight intervals.

### Business Insight
Fraudulent transactions are not distributed uniformly across the observed time intervals. Interval 4 showed a higher fraud rate despite having fewer total transactions than most other intervals.

These patterns may warrant further investigation but do not establish a causal relationship between transaction time and fraud.

**Note:** The dataset covers approximately 48 hours. The `Time` column represents elapsed seconds, not actual clock time.


## 4. Transaction Amount Analysis

### Objective
Analyze fraudulent transaction patterns across different transaction amount ranges to identify whether certain amounts have higher fraud rates.

### Approach
- Grouped transactions into five amount ranges.
- Calculated total transactions and fraudulent transactions within each range.
- Compared fraud rates across the amount ranges.

### Findings

| Amount Range | Total Transactions | Fraud Transactions | Fraud Rate |
|---|---:|---:|---:|
| Below $50 | 189,704 | 305 | 0.161% |
| $50–$99 | 37,718 | 57 | 0.151% |
| $100–$499 | 47,893 | 95 | 0.198% |
| $500–$999 | 6,423 | 26 | 0.405% |
| $1,000+ | 3,069 | 9 | 0.293% |

### Key Observations
1. Transactions below $50 recorded the highest number of fraudulent transactions (305).
2. The $500–$999 range recorded the highest fraud rate (0.405%).
3. The $1,000+ range had a lower fraud rate (0.293%) than the $500–$999 range.
4. Fraud rates did not increase consistently with transaction amounts.

### Business Insight
Although lower-value transactions accounted for the largest number of fraud cases, the $500–$999 range had the highest proportion of fraudulent transactions. This suggests that transaction amount may be a useful factor when investigating fraud patterns.

**Note:** These findings show associations within the dataset and do not establish that transaction amount causes fraudulent activity.
