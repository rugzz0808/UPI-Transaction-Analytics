
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
df = pd.read_csv("upi_transactions_2024.csv")

#print(df.head())
#print(df.shape)
#print(df.columns)
#print(df.info())
#print(df.describe())
#print(df.isnull().sum())

print(df.describe())
print(df["fraud_flag"].value_counts())
status_counts = df["transaction_status"].value_counts()

print(status_counts)

status_percentage = df["transaction_status"].value_counts(normalize=True) * 100

print(status_percentage)

total_value = df["amount (INR)"].sum()
average_value = df["amount (INR)"].mean()
median_value = df["amount (INR)"].median()
maximum_value = df["amount (INR)"].max()

print(f"Total Transaction Value: ₹{total_value:,.2f}")
print(f"Average Transaction: ₹{average_value:,.2f}")
print(f"Median Transaction: ₹{median_value:,.2f}")
print(f"Maximum Transaction: ₹{maximum_value:,.2f}")


merchant_analysis = df.groupby("merchant_category").agg(
    transaction_count=("transaction id", "count"),
    total_value=("amount (INR)", "sum"),
    average_amount=("amount (INR)", "mean")
).sort_values("total_value", ascending=False)

print(merchant_analysis)

top_merchants = merchant_analysis.head(5)

print(top_merchants)

hour_analysis=df.groupby('hour_of_day').agg(
    transaction_count=("transaction id", "count"),
    total_value=('amount (INR)',"sum"),
    average_amount=('amount (INR)',"mean")
)

print(hour_analysis)

busy_hour=hour_analysis.sort_values("total_value", ascending=False)

print(busy_hour.head(5))

day_anaylsis=df.groupby("day_of_week").agg(
    transaction_count=("transaction id","count"),
    total_value=("amount (INR)","sum"),
    average_amount=("amount (INR)","mean")
).sort_values('day_of_week')

day_order=['Monday','Tuesday','Wednesday','Thursday','Friday','Saturday','Sunday']
day_anaylsis=day_anaylsis.reindex(day_order)
print(day_anaylsis)

weekend_analysis = df.groupby("is_weekend").agg(
    transaction_count=("transaction id", "count"),
    total_value=("amount (INR)", "sum"),
    average_amount=("amount (INR)", "mean")
)

print(weekend_analysis)

hour_analysis["transaction_count"].plot(kind="bar")

plt.title("UPI Transactions by Hour")
plt.xlabel("Hour of Day")
plt.ylabel("Number of Transactions")
plt.show()
