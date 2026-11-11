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
