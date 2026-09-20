# UPI Transaction Analytics

An exploratory data analytics project focused on UPI transaction behavior, transaction trends, merchant activity, customer patterns, and fraud patterns using Python, Pandas, SQL, and data visualization.

> **Dataset note:** This project uses a synthetic UPI transaction dataset containing 250,000 transactions. Findings represent patterns in this dataset and should not be interpreted as real-world UPI statistics.

## Objectives

- Analyze transaction volume, value, and average transaction amount.
- Identify peak transaction hours and days.
- Study merchant-category and customer age-group behavior.
- Analyze geographic transaction patterns.
- Measure successful and failed transactions.
- Explore fraud patterns across transaction types, merchants, age groups, devices, hours, and states.
- Perform SQL-based analysis using MySQL.
- Convert analytical results into business-oriented insights.

## Dataset

The dataset contains **250,000 transactions** and **17 columns**:

| Column | Description |
|---|---|
| `transaction id` | Unique transaction identifier |
| `timestamp` | Transaction date and time |
| `transaction type` | Type of UPI transaction |
| `merchant_category` | Merchant category |
| `amount (INR)` | Transaction amount in INR |
| `transaction_status` | SUCCESS or FAILED |
| `sender_age_group` | Sender age group |
| `receiver_age_group` | Receiver age group |
| `sender_state` | Sender state |
| `sender_bank` | Sender bank |
| `receiver_bank` | Receiver bank |
| `device_type` | Device used |
| `network_type` | Network type |
| `fraud_flag` | 0 = non-fraud, 1 = fraud |
| `hour_of_day` | Transaction hour, 0–23 |
| `day_of_week` | Day of the week |
| `is_weekend` | 0 = weekday, 1 = weekend |

## Tools & Technologies

- **Python**
- **Pandas**
- **NumPy**
- **Matplotlib**
- **Seaborn**
- **SQL / MySQL**
- **Jupyter Notebook**
- **PyCharm**
- **Git & GitHub**

## Project Workflow

```text
Dataset
   ↓
Data Understanding
   ↓
Data Cleaning & Validation
   ↓
Exploratory Data Analysis
   ├── Transaction Trends
   ├── Merchant Analysis
   ├── Customer Analysis
   ├── Geographic Analysis
   └── Fraud Analysis
   ↓
Data Visualization
   ↓
SQL Analysis
   ↓
Key Findings & Business Insights
   ↓
Conclusion
```

## Key Findings

Based on the synthetic dataset:

- **250,000** transactions were analyzed.
- Average transaction amount: approximately **₹1,311.76**.
- Median transaction amount: **₹629**.
- **19:00 (7 PM)** was the busiest hour, with **21,232 transactions**.
- **Monday** had the highest transaction count with **36,495 transactions**.
- The **26–35** age group had the highest transaction activity with **87,432 transactions**.
- The **36–45** age group had the highest average transaction amount at approximately **₹1,424**.
- **Grocery** had the highest transaction count with **49,966 transactions**.
- **Education** had the highest average transaction amount at approximately **₹5,094**.
- **Shopping** had the highest total transaction value at approximately **₹76.86 million**.
- **95.05%** of transactions were successful and **4.95%** were failed.
- **480** transactions were flagged as fraudulent, giving a fraud rate of **0.192%**.

## Fraud Analysis

Fraud was analyzed using both **fraud count** and **fraud rate** across:

- Transaction type
- Merchant category
- Sender age group
- Sender state
- Device type
- Hour of day

Using fraud rate alongside fraud count helps distinguish high-volume categories from categories with proportionally higher fraud incidence.

## SQL Analysis

The included MySQL queries cover:

- Transaction counts and transaction amounts
- Transaction status and percentages
- Merchant analysis
- Hour and day analysis
- Age-group analysis
- State-wise analysis
- Overall fraud rate
- Fraud by transaction type, merchant, age, device, hour, and state
- Weekend vs weekday analysis
- High-value transactions
- High-value fraudulent transactions
- Failed transactions by merchant

See [`SQL_ANALYSIS.sql`](SQL_ANALYSIS.sql).

## Repository Structure

```text
UPI-Transaction-Analytics/
│
├── UPI_TRANSACTION_ANAYLYSIS.ipynb   # Main analysis notebook
├── SQL_ANALYSIS.sql                  # MySQL queries
├── upi_analysis.py                   # Python script
├── .gitignore                        # Ignored files
└── README.md                         # Project documentation
```

The original CSV dataset is intentionally excluded from the repository through `.gitignore`.

## How to Run

### 1. Clone the repository

```bash
git clone https://github.com/rugzz0808/UPI-Transaction-Analytics.git
cd UPI-Transaction-Analytics
```

### 2. Install dependencies

```bash
pip install pandas numpy matplotlib seaborn jupyter
```

### 3. Add the dataset

Place `upi_transactions_2024.csv` in the project directory. The dataset itself is not included in this repository.

### 4. Run the notebook

Open `UPI_TRANSACTION_ANAYLYSIS.ipynb` using Jupyter Notebook, JupyterLab, Google Colab, or a compatible IDE.

### 5. Run SQL analysis

Import the dataset into MySQL and execute the queries in `SQL_ANALYSIS.sql`.

## Skills Demonstrated

- Data loading and inspection
- Data cleaning and validation
- Pandas DataFrames
- GroupBy and aggregation
- Sorting and filtering
- Descriptive statistics
- Exploratory Data Analysis (EDA)
- Data visualization
- Fraud-rate analysis
- SQL aggregation and filtering
- MySQL database operations
- Git and GitHub
- Business insight generation

## Future Improvements

- Build a Power BI or Tableau dashboard
- Add deeper time-series analysis
- Build a machine-learning fraud detection model
- Engineer additional fraud-risk features
- Add automated data-quality checks
- Create an interactive Streamlit dashboard

## Author

**rugzz0808**

GitHub: [github.com/rugzz0808](https://github.com/rugzz0808)
