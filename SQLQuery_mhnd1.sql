-- =====================================
-- SUPERSTORE SQL ANALYSIS PROJECT
-- =====================================

-- View Data
SELECT *
FROM Super_store;

-- Total Rows
SELECT COUNT(*) AS Total_Rows
FROM super_store;

-- Missing Values
SELECT
SUM(CASE WHEN Sales IS NULL THEN 1 ELSE 0 END) AS Missing_Sales,
SUM(CASE WHEN Profit IS NULL THEN 1 ELSE 0 END) AS Missing_Profit
FROM Superstore;

-- Duplicate Order IDs
SELECT
[Order_ID],
COUNT(*) AS Duplicate_Count
FROM super_store
GROUP BY [Order_ID]
HAVING COUNT(*) > 1;

-- Total Sales
SELECT
SUM(Sales) AS Total_Sales
FROM Superstore;

-- Total Profit
SELECT
SUM(Profit) AS Total_Profit
FROM Superstore;

-- Average Sales
SELECT
AVG(Sales) AS Average_Sales
FROM Superstore;

-- Average Profit
SELECT
AVG(Profit) AS Average_Profit
FROM Superstore;

-- Sales by Category
SELECT
Category,
SUM(Sales) AS Total_Sales
FROM Superstore
GROUP BY Category
ORDER BY Total_Sales DESC;

-- Profit by Category
SELECT
Category,
SUM(Profit) AS Total_Profit
FROM Superstore
GROUP BY Category
ORDER BY Total_Profit DESC;

-- Sales by Sub-Category
SELECT
[Sub_Category],
SUM(Sales) AS Total_Sales
FROM Superstore
GROUP BY [Sub_Category]
ORDER BY Total_Sales DESC;

-- Profit by Sub-Category
SELECT
[Sub_Category],
SUM(Profit) AS Total_Profit
FROM Superstore
GROUP BY [Sub_Category]
ORDER BY Total_Profit DESC;

-- Sales by State
SELECT
State,
SUM(Sales) AS Total_Sales
FROM Superstore
GROUP BY State
ORDER BY Total_Sales DESC;

-- Profit by State
SELECT
State,
SUM(Profit) AS Total_Profit
FROM Superstore
GROUP BY State
ORDER BY Total_Profit DESC;

-- Sales by Region
SELECT
Region,
SUM(Sales) AS Total_Sales
FROM Superstore
GROUP BY Region
ORDER BY Total_Sales DESC;

-- Sales by Segment
SELECT
Segment,
SUM(Sales) AS Total_Sales
FROM Superstore
GROUP BY Segment
ORDER BY Total_Sales DESC;

-- Top 10 Customers
SELECT TOP 10
[Customer_Name],
SUM(Sales) AS Total_Sales
FROM Superstore
GROUP BY [Customer_Name]
ORDER BY Total_Sales DESC;

-- Top 10 Products
SELECT TOP 10
[Product_Name],
SUM(Sales) AS Total_Sales
FROM Superstore
GROUP BY [Product_Name]
ORDER BY Total_Sales DESC;

-- Top 10 Cities by Sales
SELECT TOP 10
City,
SUM(Sales) AS Total_Sales
FROM Superstore
GROUP BY City
ORDER BY Total_Sales DESC;

-- Monthly Sales
SELECT
MONTH([Order_Date]) AS Order_Month,
SUM(Sales) AS Total_Sales
FROM Superstore
GROUP BY MONTH([Order_Date])
ORDER BY Order_Month;

-- Monthly Profit
SELECT
MONTH([Order_Date]) AS Order_Month,
SUM(Profit) AS Total_Profit
FROM Superstore
GROUP BY MONTH([Order_Date])
ORDER BY Order_Month;