1️⃣ Liquidity Movement (Cash In vs Cash Out)
SELECT
    transaction_type,
    SUM(transaction_amount) AS total_amount
FROM fact_transactions
GROUP BY transaction_type;


2️⃣ Net Cash Impact by Account
SELECT
    origin_account,
    SUM(balance_change) AS net_cash_change
FROM fact_transactions
GROUP BY origin_account
ORDER BY net_cash_change DESC
LIMIT 10;


3️⃣ High-Value Clients (Transaction Concentration)
SELECT
    origin_account,
    SUM(transaction_amount) AS total_transaction_value
FROM fact_transactions
GROUP BY origin_account
ORDER BY total_transaction_value DESC
LIMIT 10;


4️⃣ Operational Risk – Fraud Concentration
SELECT
    transaction_type,
    COUNT(*) AS fraud_count,
    SUM(transaction_amount) AS fraud_value
FROM fact_transactions
WHERE is_fraud = 1
GROUP BY transaction_type;


5️⃣ Abnormal Balance Movement (Operational Risk)
SELECT
    origin_account,
    transaction_amount,
    balance_change
FROM fact_transactions
WHERE ABS(balance_change) > 500000;



6️⃣ Transaction Workload (Process Optimization)
SELECT
    transaction_type,
    COUNT(*) AS transaction_volume,
    AVG(transaction_amount) AS avg_amount
FROM fact_transactions
GROUP BY transaction_type;


