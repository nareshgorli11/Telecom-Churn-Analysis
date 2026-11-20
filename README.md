# Telecom Customer Churn Analysis

## Objective
Find out why customers leave a telecom company and what the business can do to retain them.

## Dataset
Telco Customer Churn dataset (7,043 customers, 21 columns), from Kaggle:
https://www.kaggle.com/datasets/blastchar/telco-customer-churn

## Tools Used
Python (pandas), MySQL, Excel (coming soon), Power BI (coming soon)

## Data Cleaning (Python)
- Converted `TotalCharges` from text to numbers (11 blank values, all new customers with 0 tenure, set to 0)
- Created `TenureGroup` and `ChurnFlag` columns
- Checked for nulls and duplicates (none found)

## Key Findings (SQL)
- **Overall churn rate is 26.54%** (1,869 of 7,043 customers).
- **Contract type matters most:** month-to-month customers churn at 42.71%, two-year customers at only 2.83%.
- **New customers leave the most:** 47.44% churn in the first 12 months, falling to 9.51% after 4 years.
- **Electronic check users churn at 45.29%**, compared with 15-17% for automatic payment methods.
- **Fiber optic customers churn at 41.89%**, compared with 18.96% for DSL.
- **Churned customers paid more:** about 74.44 per month vs. 61.27 for retained customers.
- **Highest-risk segment:** month-to-month + electronic check, with 53.73% churn (1,850 customers).
- **Monthly revenue lost to churn: about 139,131.**

## Recommendations
1. Offer discounts or benefits to move month-to-month customers onto 1-year or 2-year contracts.
2. Run onboarding and retention offers during the first 12 months.
3. Encourage customers to switch from electronic check to automatic payment.
4. Review fiber optic pricing and service quality.

## Project Files
- `churn_cleaning.ipynb`: Python data cleaning
- `churn_clean.csv`: cleaned dataset
- `churn_queries.sql`: MySQL queries
- `images/`: query result screenshots

## SQL Results
![Churn by contract](images/Q2_contract.png)
![Churn by tenure](images/Q3_tenure.png)
