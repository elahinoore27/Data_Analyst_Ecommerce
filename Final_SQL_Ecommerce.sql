-- SQL Practice
use ecommerce;
-- Total Orders
SELECT COUNT(*) FROM orders;

-- Total Sales
SELECT round(SUM(Net_Amount),2)
FROM orders;

-- Top Products
SELECT Product,
round(SUM(Net_Amount),2)
FROM orders
GROUP BY Product
ORDER BY 2 DESC;

-- Top Cities
SELECT City,
round(SUM(Net_Amount),2)
FROM orders
GROUP BY City;

-- Monthly Sales
SELECT Month,
round(SUM(Net_Amount),2)
FROM orders
GROUP BY Month;

-- Highest Profit Product
SELECT Product,
round(SUM(Profit),2)
FROM orders
GROUP BY Product
ORDER BY 2 DESC;

-- Payment Mode
SELECT Payment_Mode,
COUNT(*)
FROM orders
GROUP BY Payment_Mode;

-- Cancelled Orders
SELECT *
FROM orders
WHERE Order_Status='Cancelled';
