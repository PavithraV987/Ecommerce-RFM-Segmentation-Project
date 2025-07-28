##Customer Segmentation & Revenue Analysis using RFM Model | SQL, Excel

This project applies **RFM (Recency, Frequency, Monetary) analysis** to segment customers and uncover revenue-driving insights using **SQL and Excel**.
It was built on an e-commerce dataset with over 500,000 rows of transactions and 4,300+ unique customers.

## 📌 Problem Statement
The business lacked visibility into which customers were high-value, inactive, or at risk. This resulted in missed revenue opportunities and inefficient marketing efforts.

# 🛠 Tools Used
- Microsoft Excel (PivotTables, SUMIFS, dashboard design)
- SQL (RFM metric calculation and aggregation)

## 📈 Project Workflow

1. **Data Cleaning**
   - Removed duplicates, cancellations, nulls, and invalid rows
   - Created `TotalAmount = Quantity × UnitPrice`

2. **RFM Metrics Calculation**
   - **Recency**: Days since last purchase
   - **Frequency**: Total number of purchases
   - **Monetary**: Total spend per customer

3. **RFM Scoring & Segmentation**
   - Assigned scores (1 to 5) for each metric
   - Combined into customer segments: Loyal, At Risk, Hibernating, etc.

4. **Dashboard Visualization**
   - KPIs: Total Revenue, Avg Spend, % Loyal
   - Charts: Segment distribution, Revenue by segment, Monthly trends, Top 10 customers & products

## 📊 Key Insights
- **50% of customers (Loyal segment)** contributed ~80% of total revenue (₹8.88M)
- **Top 10 customers** generated **58% of revenue**
- **PAPER CRAFT** was the top-selling category
- Business could now target specific segments for retention and upselling

Dashboard:
![Final_RFM_28_07](https://github.com/user-attachments/assets/c5509818-c99c-4aa8-9b64-d369176b1aa2)






