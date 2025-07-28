-- 1. Valid Transactions Only
SELECT * FROM ecommerce_data
WHERE CustomerID IS NOT NULL AND Quantity > 0;

-- 2. Add TotalAmount Column (Quantity * UnitPrice)
SELECT *, (Quantity * UnitPrice) AS TotalAmount
FROM ecommerce_data;

-- 3. Recency - Days Since Last Purchase (use fixed reference date)
SELECT CustomerID, DATEDIFF('2011-12-10', MAX(InvoiceDate)) AS Recency
FROM ecommerce_data
GROUP BY CustomerID;

-- 4. Frequency - Total Number of Invoices
SELECT CustomerID, COUNT(DISTINCT InvoiceNo) AS Frequency
FROM ecommerce_data
GROUP BY CustomerID;

-- 5. Monetary - Total Spend per Customer
SELECT CustomerID, SUM(Quantity * UnitPrice) AS Monetary
FROM ecommerce_data
GROUP BY CustomerID;

-- 6. Final RFM Table
SELECT CustomerID,
       DATEDIFF('2011-12-10', MAX(InvoiceDate)) AS Recency,
       COUNT(DISTINCT InvoiceNo) AS Frequency,
       SUM(Quantity * UnitPrice) AS Monetary
FROM ecommerce_data
WHERE CustomerID IS NOT NULL AND Quantity > 0
GROUP BY CustomerID;

-- 7. Top 10 Customers by Revenue
SELECT CustomerID, SUM(Quantity * UnitPrice) AS TotalRevenue
FROM ecommerce_data
GROUP BY CustomerID
ORDER BY TotalRevenue DESC
LIMIT 10;

-- 8. Top 10 Products by Quantity Sold
SELECT Description, SUM(Quantity) AS TotalSold
FROM ecommerce_data
GROUP BY Description
ORDER BY TotalSold DESC
LIMIT 10;

-- 9. Top 10 Products by Revenue
SELECT Description, SUM(Quantity * UnitPrice) AS ProductRevenue
FROM ecommerce_data
GROUP BY Description
ORDER BY ProductRevenue DESC
LIMIT 10;

-- 10. Revenue by Country
SELECT Country, SUM(Quantity * UnitPrice) AS CountryRevenue
FROM ecommerce_data
GROUP BY Country
ORDER BY CountryRevenue DESC;

-- 11. Monthly Revenue Trend
SELECT DATE_FORMAT(InvoiceDate, '%Y-%m') AS Month,
       SUM(Quantity * UnitPrice) AS MonthlyRevenue
FROM ecommerce_data
GROUP BY Month
ORDER BY Month;

-- 12. Daily Revenue Trend
SELECT DATE(InvoiceDate) AS Day,
       SUM(Quantity * UnitPrice) AS DailyRevenue
FROM ecommerce_data
GROUP BY Day
ORDER BY Day;

-- 13. Total Customers by Country
SELECT Country, COUNT(DISTINCT CustomerID) AS CustomerCount
FROM ecommerce_data
GROUP BY Country
ORDER BY CustomerCount DESC;

-- 14. One-Time Buyers
SELECT CustomerID, COUNT(DISTINCT InvoiceNo) AS NumPurchases
FROM ecommerce_data
GROUP BY CustomerID
HAVING NumPurchases = 1;

-- 15. Repeat Buyers
SELECT CustomerID, COUNT(DISTINCT InvoiceNo) AS NumPurchases
FROM ecommerce_data
GROUP BY CustomerID
HAVING NumPurchases > 1;

-- 16. Most Recent Customers
SELECT CustomerID, MAX(InvoiceDate) AS LastPurchaseDate
FROM ecommerce_data
GROUP BY CustomerID
ORDER BY LastPurchaseDate DESC
LIMIT 10;

-- 17. Inactive Customers (Recency > 90 days)
SELECT CustomerID, DATEDIFF('2011-12-10', MAX(InvoiceDate)) AS Recency
FROM ecommerce_data
GROUP BY CustomerID
HAVING Recency > 90;

-- 18. Average Revenue per Customer
SELECT AVG(Monetary) AS AvgRevenue
FROM (
  SELECT CustomerID, SUM(Quantity * UnitPrice) AS Monetary
  FROM ecommerce_data
  GROUP BY CustomerID
) AS revenue_data;

-- 19. Segment-Wise Revenue (for use with Excel segmenting)
SELECT Segment_Name, SUM(Monetary) AS SegmentRevenue
FROM rfm_segmented_data
GROUP BY Segment_Name;

-- 20. Segment-Wise Customer Count
SELECT Segment_Name, COUNT(CustomerID) AS SegmentCustomers
FROM rfm_segmented_data
GROUP BY Segment_Name;
