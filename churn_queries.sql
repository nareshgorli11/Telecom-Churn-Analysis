CREATE DATABASE churn_project;
USE churn_project;

CREATE TABLE churn (
    customerID        VARCHAR(20),
    gender            VARCHAR(10),
    SeniorCitizen     VARCHAR(5),
    Partner           VARCHAR(5),
    Dependents        VARCHAR(5),
    tenure            INT,
    PhoneService      VARCHAR(5),
    MultipleLines     VARCHAR(30),
    InternetService   VARCHAR(20),
    OnlineSecurity    VARCHAR(30),
    OnlineBackup      VARCHAR(30),
    DeviceProtection  VARCHAR(30),
    TechSupport       VARCHAR(30),
    StreamingTV       VARCHAR(30),
    StreamingMovies   VARCHAR(30),
    Contract          VARCHAR(20),
    PaperlessBilling  VARCHAR(5),
    PaymentMethod     VARCHAR(40),
    MonthlyCharges    DECIMAL(8,2),
    TotalCharges      DECIMAL(10,2),
    Churn             VARCHAR(5),
    TenureGroup       VARCHAR(20),
    ChurnFlag         TINYINT
);

select count(*) from churn_clean;

USE churn_project;

-- Q1: Overall churn rate
SELECT COUNT(*) AS total_customers,
       SUM(ChurnFlag) AS churned,
       ROUND(100.0 * SUM(ChurnFlag) / COUNT(*), 2) AS churn_rate_pct
FROM churn_clean;



-- Q2: Churn rate by contract type
SELECT Contract, COUNT(*) AS customers,
       ROUND(100.0 * SUM(ChurnFlag) / COUNT(*), 2) AS churn_rate_pct
FROM churn_clean GROUP BY Contract ORDER BY churn_rate_pct DESC;



-- Q3: Churn rate by tenure group
SELECT TenureGroup, COUNT(*) AS customers,
       ROUND(100.0 * SUM(ChurnFlag) / COUNT(*), 2) AS churn_rate_pct
FROM churn_clean GROUP BY TenureGroup ORDER BY churn_rate_pct DESC;


-- Q4: Churn rate by payment method
SELECT PaymentMethod, COUNT(*) AS customers,
       ROUND(100.0 * SUM(ChurnFlag) / COUNT(*), 2) AS churn_rate_pct
FROM churn_clean GROUP BY PaymentMethod ORDER BY churn_rate_pct DESC;


-- Q5: Churn rate by internet service
SELECT InternetService, COUNT(*) AS customers,
       ROUND(100.0 * SUM(ChurnFlag) / COUNT(*), 2) AS churn_rate_pct
FROM churn_clean GROUP BY InternetService ORDER BY churn_rate_pct DESC;


-- Q6: Average monthly charges, churned vs retained
SELECT Churn, ROUND(AVG(MonthlyCharges), 2) AS avg_monthly_charges
FROM churn_clean GROUP BY Churn;


-- Q7: Highest-risk segment (contract + payment method)
SELECT Contract, PaymentMethod, COUNT(*) AS customers,
       ROUND(100.0 * SUM(ChurnFlag) / COUNT(*), 2) AS churn_rate_pct
FROM churn_clean GROUP BY Contract, PaymentMethod
ORDER BY churn_rate_pct DESC LIMIT 3;

-- Q8: Monthly revenue lost to churned customers
SELECT ROUND(SUM(MonthlyCharges), 0) AS monthly_revenue_lost
FROM churn_clean WHERE ChurnFlag = 1;
