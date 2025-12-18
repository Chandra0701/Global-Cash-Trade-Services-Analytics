import pandas as pd

# Load raw data
df = pd.read_csv("data/raw/transactions.csv")

# Rename columns for clarity
df.rename(columns={
    "step": "time_step",
    "type": "transaction_type",
    "amount": "transaction_amount",
    "nameOrig": "origin_account",
    "nameDest": "destination_account",
    "oldbalanceOrg": "old_balance",
    "newbalanceOrig": "new_balance",
    "isFraud": "is_fraud"
}, inplace=True)

# Remove irrelevant columns
df = df[[
    "time_step",
    "transaction_type",
    "transaction_amount",
    "origin_account",
    "destination_account",
    "old_balance",
    "new_balance",
    "is_fraud"
]]

# Create derived features
df["balance_change"] = df["new_balance"] - df["old_balance"]

# Save cleaned data
df.to_csv("data/cleaned/fact_transactions.csv", index=False)

print("✅ Data cleaned and saved.")
