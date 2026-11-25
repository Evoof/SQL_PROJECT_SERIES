DROP TABLE IF exists food_delivery;

--Creating the food_delivery table
CREATE TABLE food_delivery(
order_id            INT PRIMARY KEY,
order_date          DATE,
order_time          TIME,
customer_id         INT,
city                VARCHAR(30),
cuisine             VARCHAR(30),
payment_method      VARCHAR(30),
items_count         INT,
order_value         NUMERIC(10,2),
delivery_fee        NUMERIC(10,2),
delivery_time_mins  INT,
rating              INT
);

--loading data into the table--
COPY food_delivery (order_id,order_date,order_time,customer_id,city,cuisine,payment_method,items_count,order_value,delivery_fee,delivery_time_mins,rating)
FROM '/private/tmp/food_delivery_orders.csv'
WITH (FORMAT csv, HEADER True);

-- confirm the that the data loaded sucessfully
SELECT *
FROM food_delivery;

--Checking for NULL VALUES
SELECT *
FROM food_delivery
WHERE 
	order_id IS NULL OR
	order_date IS NULL OR
	order_time IS NULL OR
	customer_id IS NULL OR
	city IS NULL OR
	cuisine IS NULL OR
	payment_method IS NULL OR
	items_count IS NULL OR
	order_value IS NULL OR
	delivery_fee IS NULL OR
	delivery_time_mins IS NULL OR
	rating IS NULL;

--Deleting null values
DELETE FROM food_delivery
WHERE 
	order_id IS NULL OR so aside from that
	order_date IS NULL OR
	order_time IS NULL OR
	customer_id IS NULL OR
	city IS NULL OR
	cuisine IS NULL OR
	payment_method IS NULL OR
	items_count IS NULL OR
	order_value IS NULL OR
	delivery_fee IS NULL OR 
	delivery_time_mins IS NULL OR
	rating IS NULL;

SELECT COUNT(*)
FROM food_delivery;

-- BUSINESS QUESTIONS

-- Write a query to retrieve all late deliveries (more than 60 minutes), slowest first.
SELECT *
FROM food_delivery
WHERE delivery_time_mins > 60;

-- Write a query to retrieve all orders from Abuja or Kano, paid by Card or Wallet, with an order value between 5,000 and 10,000.
SELECT *
FROM food_delivery
WHERE 
	city IN ('Abuja', 'Kano') AND 
	payment_method IN ('Card', 'Wallet') AND 
	order_value BETWEEN 5000 AND 10000;

-- Write a query to find the highest and lowest order value, and the longest and shortest delivery time.
SELECT
MAX(order_value) AS highest_order_value,
MIN(order_value) AS lowest_order_value,
MAX(delivery_time_mins) AS longest_delivery_time,
MIN(delivery_time_mins) AS shortest_delivery_time
FROM food_delivery

-- Write a query to find, for each city, the total delivery fees collected and the total amount customers paid (order value + delivery fee), highest first.
SELECT city,
SUM(delivery_fee) AS total_delivery_fee,
SUM(order_value + delivery_fee) AS total_cus_paid
FROM food_delivery
GROUP BY city
ORDER BY total_cus_paid DESC;

-- Write a query to find the number of orders for each day of the week, busiest day first.
SELECT 
TO_CHAR(order_date, 'day') AS day_of_week,
COUNT(*) AS total_orders
FROM food_delivery
GROUP BY day_of_week
ORDER BY total_orders DESC;

-- Write a query to find repeat customers: customers who placed more than 8 orders, with their number of orders and total spent.
SELECT customer_id,
COUNT(*) AS total_orders,
SUM(order_value) AS total_spent
FROM food_delivery
GROUP BY customer_id
HAVING COUNT(*) > 8
ORDER BY total_orders;

-- Write a query to find the average order value for each payment method, highest first.
SELECT payment_method,
ROUND(AVG(order_value),2) AS avg_order_val
FROM food_delivery
GROUP BY payment_method
ORDER BY avg_order_val DESC;

-- Write a query to find the number of orders and the average order value for each basket size (items_count).
SELECT items_count,
COUNT(*) AS total_orders,
ROUND(AVG(order_value),2) AS avg_order_val
FROM food_delivery
GROUP BY items_count
ORDER BY total_orders;

-- Write a query to find how many low-rated orders (rating 1 or 2) each cuisine received, most complaints first.
SELECT cuisine,
COUNT(*) AS low_rated_orders
FROM food_delivery
WHERE rating IN (1,2)
GROUP BY cuisine
ORDER BY low_rated_orders DESC;

