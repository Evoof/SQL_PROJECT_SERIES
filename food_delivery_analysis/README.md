# Project 02: Food Delivery Orders Analysis

**Level:** Beginner
**Database:** `p2_food_delivery_db`

## Overview
You have just joined a food delivery startup as a junior data analyst. The team wants to understand which cuisines earn the most, which cities deliver fastest, how customers pay, and when orders come in. In this project you will set up a PostgreSQL database, clean the data, explore it, and answer 10 business questions using SQL. It is ideal for anyone starting their SQL journey.

## Skills Covered
`WHERE` · `IN` · `BETWEEN` · `MIN` / `MAX` · `SUM` · `AVG` · `GROUP BY` · `HAVING` · `ORDER BY` · `CASE WHEN` · `TO_CHAR` · `DELETE`

## Dataset
600 orders placed between January and June 2024. All amounts are in Naira (₦).

| Column | Description |
|--------|-------------|
| order_id | Unique ID for each order |
| order_date | Date the order was placed |
| order_time | Time the order was placed |
| customer_id | Customer identifier |
| city | City where the order was delivered |
| cuisine | Type of food ordered |
| payment_method | How the customer paid |
| items_count | Number of items in the order |
| order_value | Total value of the food ordered |
| delivery_fee | Delivery fee charged |
| delivery_time_mins | Minutes taken to deliver the order |
| rating | Customer rating from 1 to 5 |

## Objectives
1. **Set up the database:** Create `p2_food_delivery_db`, create a table called `food_orders`, and import the CSV.
2. **Data exploration:** Find the total records, the date range, and the unique cities, cuisines and payment methods.
3. **Data cleaning:** Find and delete any records with missing values.
4. **Business analysis:** Use SQL to answer the business questions below.

## Business Questions
1. Write a query to retrieve all late deliveries (more than 60 minutes), slowest first.
2. Write a query to retrieve all orders from `Abuja` or `Kano`, paid by `Card` or `Wallet`, with an order value between 5,000 and 10,000.
3. Write a query to find the highest and lowest order value, and the longest and shortest delivery time.
4. Write a query to find, for each city, the total delivery fees collected and the total amount customers paid (order value + delivery fee), highest first.
5. Write a query to find the number of orders for each day of the week, busiest day first.
6. Write a query to find repeat customers: customers who placed more than 8 orders, with their number of orders and total spent.
7. Write a query to find the average order value for each payment method, highest first.
8. Write a query to find the number of orders and the average order value for each basket size (`items_count`).
9. Write a query to find how many low-rated orders (rating 1 or 2) each cuisine received, most complaints first.

## How to Participate
1. Download the dataset
2. Create the database and the table in PostgreSQL, then import the CSV
3. Clean the data and write your queries for the business questions
4. Share your solution link or screenshots with me

## Solution
Coming soon.
