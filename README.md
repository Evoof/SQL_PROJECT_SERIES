# SQL_PROJECT_SERIES
10 hands-on SQL projects, from Beginner to Advanced.


# Project 01: Sales Analysis
**Level:** Beginner

## Overview
This project demonstrates essential SQL skills for exploring, cleaning, and analyzing sales data, performing EDA, and answering real-world business questions. Perfect for beginners building a strong foundation in SQL and data analytics.

## Objectives
1. Database Setup: Create and populate a retail sales database using the provided dataset.
2. Data Cleaning: Identify and handle missing, null, or inconsistent records.
3. Exploratory Data Analysis (EDA): Explore the dataset to uncover patterns and trends.
4. Business Analysis: Use SQL queries to answer business questions and generate actionable insights.

## Business Questions
1. Write a SQL query to retrieve all columns for sales made on '2022-11-04:
2. Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 4 in the month of Nov-2022.
3. Write a SQL query to find the top 5 customers based on the highest total sales
4. Write a SQL query to find all transactions where the total_sale is greater than 1000.
5. Write a SQL query to calculate the total sales (total_sale) for each category.
6. Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.
7. Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.
8. Write a SQL query to find the number of unique customers who purchased items from each category.:
9. Write a SQL query to create each shift and number of orders (Example Morning <12, Afternoon Between 12 & 17, Evening >17)

## How to Participate
1. Download the dataset
2. Create the database and import the CSV into PostgreSQL / MySQL
3. Write your queries
4. Share your solution link or screenshots

## ANSWERS

```sql
-- Confirming if table exists before creating
DROP TABLE if exists cravings_retail;

-- Creating the  TABLE
CREATE TABLE cravings_retail(
transaction_id INT PRIMARY KEY,
sale_date DATE,
sale_time TIME,
customer_id INT,
gender VARCHAR(20),
age INT,
category VARCHAR(20),
quantity INT,
price_per_unit FLOAT,
cogs FLOAT,
otal_sale FLOAT
);

-- Renaming otal_sale to total_sale
ALTER TABLE cravings_retail
RENAME COLUMN otal_sale TO total_sale;

-- loading dataset into table
COPY cravings_retail(transaction_id,sale_date,sale_time,customer_id,gender,age,category,quantity,price_per_unit,cogs,total_sale)
FROM '/private/tmp/SQL - Sales Analysis_utf.csv'
WITH (FORMAT csv, HEADER true);

-- DATA EXPLORATION AND CLEANING

-- total number of record in the dataset
SELECT COUNT(*)
FROM cravings_retail;

-- Customer count
SELECT COUNT(DISTINCT customer_id)
FROM cravings_retail;

-- Idenifying unique products category
SELECT DISTINCT category
FROM cravings_retail;

-- Cleaning the data and removing all NULL values
SELECT *
FROM cravings_retail
WHERE 
	sale_date IS NULL OR
	sale_time IS NULL OR
	customer_id IS NULL OR
	gender IS NULL OR
	age IS NULL OR
	category IS NULL OR
	quantity IS NULL OR
	price_per_unit IS NULL OR
	cogs IS NULL OR
	total_sale IS NULL;

-- Deleting all the NULL
DELETE FROM cravings_retail
WHERE
	sale_date IS NULL OR
	sale_time IS NULL OR
	customer_id IS NULL OR
	gender IS NULL OR
	age IS NULL OR
	category IS NULL OR
	quantity IS NULL OR
	price_per_unit IS NULL OR
	cogs IS NULL OR
	total_sale IS NULL;

-- Confirming new and actual record in dataset after removing the NULL VALUES
SELECT COUNT(*)
FROM cravings_retail;

-- BUSINESS QUESTIONS

-- Write a SQL query to retrieve all columns for sales made on '2022-11-04':
SELECT *
FROM cravings_retail
WHERE sale_date = '2022-11-04';

-- Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 4 in the month of Nov-2022.
SELECT *
FROM cravings_retail
WHERE category ='Clothing'
AND quantity >4
AND TO_CHAR(sale_date, 'YYYY-MM') = '2022-11';

-- Write a SQL query to find the top 5 customers based on the highest total sales
SELECT DISTINCT customer_id,
SUM(total_sale) AS highest_total_sale
FROM cravings_retail
GROUP BY customer_id
ORDER BY highest_total_sale DESC
LIMIT 5;

-- Write a SQL query to find all transactions where the total_sale is greater than 1000.
SELECT *
FROM cravings_retail
WHERE total_sale > 1000;

-- Write a SQL query to calculate the total sales (total_sale) for each category.
SELECT category,
SUM(total_sale) AS total_net_sales,
COUNT(*) AS total_count
FROM cravings_retail
GROUP BY category
ORDER BY total_net_sales DESC;

-- Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.
SELECT gender, category,
COUNT(transaction_id) AS total_number_transactions
FROM cravings_retail
GROUP BY category, gender
ORDER BY total_number_transactions;

-- Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.
SELECT 
ROUND(AVG(age),2) AS average_age
FROM cravings_retail
WHERE category = 'Beauty';

-- Write a SQL query to find the number of unique customers who purchased items from each category.
SELECT category,
COUNT(DISTINCT(customer_id)) AS unique_customers
FROM cravings_retail
GROUP BY category;

-- Write a SQL query to create each shift and number of orders (Example Morning <12, Afternoon Between 12 & 17, Evening >17)
SELECT
	CASE
		WHEN EXTRACT(HOUR FROM sale_time) < 12 THEN 'Morning'
		WHEN EXTRACT(HOUR FROM sale_time) BETWEEN 12 AND 17 THEN 'Afternoon'
		ELSE 'Evening'
	END AS shift,
	COUNT(*) AS total_num_orders
FROM cravings_retail
GROUP BY shift;
```
## Findings
- *Sales Performance:* Analysed sales across product categories and identified high-value transactions.
- *Customer Behaviour:* Examined customer demographics, spending patterns, and category preferences.
- *Transaction Patterns:* Identified transaction volumes across different genders and purchasing shifts.
- *Data Quality:* Identified and removed records with missing values.

## Reports
- *Sales Report:* Summary of sales by category and high-value purchases.
- *Customer Report:* Overview of customer demographics and spending patterns.
- *Transaction Report:* Breakdown of orders by gender, category, and time of purchase.

## Conclusion
This project strengthened my practical SQL skills in data cleaning, exploration, and analysis. It demonstrated how SQL can be used to examine retail transactions, understand customer behaviour, and uncover useful business insights.

