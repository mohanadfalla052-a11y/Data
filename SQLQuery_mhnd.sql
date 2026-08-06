

-- View Data
SELECT *
FROM [dbo].[archive (1)];

-- Total Rows
SELECT COUNT(*) AS Total_Rows
FROM [dbo].[archive (1)];

-- Missing Values
SELECT
SUM(CASE WHEN Age IS NULL THEN 1 ELSE 0 END) AS Missing_Age,
SUM(CASE WHEN Experience IS NULL THEN 1 ELSE 0 END) AS Missing_Experience,
SUM(CASE WHEN Income IS NULL THEN 1 ELSE 0 END) AS Missing_Income,
SUM(CASE WHEN ZIP_Code IS NULL THEN 1 ELSE 0 END) AS Missing_ZIP_Code,
SUM(CASE WHEN Family IS NULL THEN 1 ELSE 0 END) AS Missing_Family,
SUM(CASE WHEN CCAvg IS NULL THEN 1 ELSE 0 END) AS Missing_CCAvg,
SUM(CASE WHEN Education IS NULL THEN 1 ELSE 0 END) AS Missing_Education,
SUM(CASE WHEN Mortgage IS NULL THEN 1 ELSE 0 END) AS Missing_Mortgage,
SUM(CASE WHEN Personal_Loan IS NULL THEN 1 ELSE 0 END) AS Missing_Personal_Loan,
SUM(CASE WHEN Securities_Account IS NULL THEN 1 ELSE 0 END) AS Missing_Securities_Account,
SUM(CASE WHEN CD_Account IS NULL THEN 1 ELSE 0 END) AS Missing_CD_Account,
SUM(CASE WHEN Online IS NULL THEN 1 ELSE 0 END) AS Missing_Online,
SUM(CASE WHEN CreditCard IS NULL THEN 1 ELSE 0 END) AS Missing_CreditCard
FROM [dbo].[archive (1)];

-- Duplicate IDs
SELECT ID, COUNT(*) AS Duplicate_Count
FROM [dbo].[archive (1)]
GROUP BY ID
HAVING COUNT(*) > 1;

-- Average Income
SELECT AVG(Income) AS Avg_Income
FROM [dbo].[archive (1)];

-- Maximum Income
SELECT MAX(Income) AS Max_Income
FROM [dbo].[archive (1)];

-- Minimum Income
SELECT MIN(Income) AS Min_Income
FROM [dbo].[archive (1)];

-- Customers with Personal Loan
SELECT COUNT(*) AS Customers_With_Loan
FROM [dbo].[archive (1)]
WHERE Personal_Loan = 1;

-- Customers without Personal Loan
SELECT COUNT(*) AS Customers_Without_Loan
FROM [dbo].[archive (1)]
WHERE Personal_Loan = 0;

-- Loan by Education
SELECT
Education,
COUNT(*) AS Customers,
SUM(Personal_Loan) AS Loan_Customers
FROM [dbo].[archive (1)]
GROUP BY Education;

-- Average Income by Education
SELECT
Education,
AVG(Income) AS Avg_Income
FROM [dbo].[archive (1)]
GROUP BY Education;

-- Loan Rate by Online Banking
SELECT
Online,
COUNT(*) AS Customers,
SUM(Personal_Loan) AS Loan_Customers
FROM [dbo].[archive (1)]
GROUP BY Online;

-- Loan Rate by Credit Card
SELECT
CreditCard,
COUNT(*) AS Customers,
SUM(Personal_Loan) AS Loan_Customers
FROM [dbo].[archive (1)]
GROUP BY CreditCard;

-- Top 10 Highest Income
SELECT TOP 10 *
FROM [dbo].[archive (1)]
ORDER BY Income DESC;

-- Income Categories
SELECT
CASE
    WHEN Income < 50 THEN 'Low'
    WHEN Income BETWEEN 50 AND 100 THEN 'Medium'
    ELSE 'High'
END AS Income_Category,
COUNT(*) AS Customers
FROM [dbo].[archive (1)]
GROUP BY
CASE
    WHEN Income < 50 THEN 'Low'
    WHEN Income BETWEEN 50 AND 100 THEN 'Medium'
    ELSE 'High'
END;

-- Average Mortgage
SELECT AVG(Mortgage) AS Avg_Mortgage
FROM [dbo].[archive (1)];

-- Customers by Family Size
SELECT
Family,
COUNT(*) AS Customers
FROM [dbo].[archive (1)]
GROUP BY Family
ORDER BY Family;