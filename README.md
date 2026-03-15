# Project Purchases Analysis 
- Level: Beginner
- Focus: Time-Series Analysis, Aggregation and Trend Identification

### Table of Content
- [Project Overview](#project-overview)
- [Objectives](#objectives)
- [Project Structure](#project-structure)
- [Findings](#findings)
- [Conclusiom](#conclusion)

### Project Overview 
This project demonstrates the use of SQL to analyze consumer buying behavior. By extracting insights from purchase timestamps and product data, the project identifies peak sales periods and tracks the "first to market" dates for various offerings. These techniques are essential for inventory management and marketing strategy.

### Objectives
- Database Administration: Initialize a structured environment for purchase records.
- Trend Identification: Pinpoint the specific days and months with the highest sales volume.
- Product Lifecycle Tracking: Determine the exact launch or "first purchase" date for every course in the catalog.
- Data Formatting: Utilize date-string functions to transform raw timestamps into readable reports.

### Project Structure
1. Database Setup
The environment is initialized to ensure all purchase data is centralized and accessible.
```SQL
CREATE DATABASE Project;
USE Project;
```
2. Temporal Analysis
The project focuses on identifying high-velocity sales periods. This helps stakeholders understand when the platform experiences the most traffic.
- Daily Peak: Finding the single date with the maximum number of transactions.
- Monthly Peak: Identifying seasonal trends by grouping data into months.
```SQL
SELECT STRFTIME('%Y-%m-%d', Purchase_Date) AS Highest_Purchased_Date,
COUNT(*) AS Purchased_Count 
FROM Purchases
GROUP BY Highest_Purchased_Date
ORDER BY Purchased_Count DESC
LIMIT 1;
```
3. Product Insights
The analysis tracks the earliest acquisition of each course to help the business understand product adoption rates.
```SQL
SELECT Course_name AS Course,
MIN(Purchase_date) AS First_Purchase_Date
FROM Purchases
GROUP BY Course
ORDER BY First_Purchase_Date ASC;
```

### Findings
- Sales Volatility: By identifying the Highest_Purchased_Date, the business can investigate what triggered that spike (e.g., a holiday sale or influencer shoutout).
- Seasonal Trends: Monthly aggregation reveals whether the business is growing month-over-month or if certain seasons underperform.
- Inventory/Course Popularity: Sorting by First_Purchase_Date allows the team to see which courses gained immediate traction upon release versus those that had a slower "burn".

### Conclusion
This analysis provides a foundational look at sales performance through the lens of time and product type. The ability to manipulate dates using STRFTIME and aggregate data with MIN and COUNT allows a data analyst to turn raw logs into actionable business intelligence.
