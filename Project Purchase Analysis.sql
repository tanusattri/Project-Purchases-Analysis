CREATE DATABASE Project;

USE Project;

SELECT STRFTIME('%Y-%m-%d',Purchase_Date)
as Highest_Purchased_Date 
COUNT(*)
AS Purchased_Count 
FROM Purchases
GROUP BY Highest_Purchased_Date
ORDER BY Purchased_Count DESC
LIMIT 1;

SELECT STRFTIME('%Y-%m',Purchase_Date) 
AS purchase_month,
COUNT(*) 
AS purchase_count 
FROM Purchases
GROUP BY purchase_month,
ORDER BY purchase_count DESC
LIMIT 1;

SELECT 
Course_name AS Course,
MIN(Purchase_date) AS First_Purchase_Date
FROM Purchases
GROUP BY Course
ORDER BY First_Purchase_Date ASC;