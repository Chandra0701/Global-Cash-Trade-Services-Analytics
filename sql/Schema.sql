CREATE TABLE fact_transactions (
    transaction_id SERIAL PRIMARY KEY,
    time_step INT,
    transaction_type VARCHAR(30),
    transaction_amount DECIMAL(18,2),
    origin_account VARCHAR(50),
    destination_account VARCHAR(50),
    old_balance DECIMAL(18,2),
    new_balance DECIMAL(18,2),
    balance_change DECIMAL(18,2),
    is_fraud INT
);
