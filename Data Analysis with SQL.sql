
E-Commerce SQL Analysis
-- This script includes:
-- - Customer, product, and order details
-- - Recent orders (latest 3)
-- - Spending analysis (total and average per customer)
-- - Product and customer categorization using CASE statements
-- - Identification of top customer by total spending

SELECT 
	c.first_name, 
    c.last_name, 
    p.product_name,
    o.quantity,
    o.total_amount
FROM orders o
INNER JOIN customers c 
	ON o.customer_id = c.customer_id
INNER JOIN product_items p 
	ON o.product_id = p.product_id;

# recent customer orders 

SELECT * 
FROM orders 
ORDER BY order_date DESC
LIMIT 3;


SELECT 
	o.order_id,
    o.order_date, 
    c.first_name,
    c.last_name,
    p.product_name,
    o.quantity,
    o.total_amount
FROM orders o
INNER JOIN customers c 
	ON o.customer_id = c.customer_id
INNER JOIN product_items p 
	ON o.product_id = p.product_id
ORDER BY order_date DESC
LIMIT 3;

# customer spending patterns

SELECT 
	c.customer_id, 
    CONCAT(c.first_name, " ", c.last_name) AS customer_full_name, 
    COUNT(o.order_id) AS number_of_orders, 
    SUM(o.total_amount) AS total_spent, 
    AVG(o.total_amount) AS avg_order_amt
-- table location
FROM orders o 
JOIN customers c 
	ON o.customer_id = c.customer_id
-- grouping by customer 
GROUP BY c.customer_id
ORDER BY total_spent DESC;


# CASE Statement 
# Simple CASE 

SELECT 
*
FROM product_items;

SELECT product_name, price,
	CASE price 
		WHEN 19.99 THEN "Discounted"
        WHEN 29.99 THEN "Mid-Range"
        WHEN 49.99 THEN "Premium"
        ELSE "Other"
	END AS price_category
FROM product_items;

# search CASE 

SELECT 
	first_name, 
    last_name, 
    age,
	CASE 
		WHEN age <= 30 THEN "Young"
        WHEN age BETWEEN 31 AND 45 THEN "Adult" 
		WHEN age >=46 THEN "Senior"
	END AS age_category, 
    city
FROM customers;

# price < 20 and stock > 75, then categorize as "Low price, High stock" 
# price between 20 and 40 and stock < 75, "Medium price, Low stock" 
# price > 40 and stock < 50, then "High price, Limited stock"

SELECT 
	product_id, 
    product_name, 
    price, 
    stock,
    CASE 
		WHEN price < 20 AND stock > 75 THEN "Low price, High stock"
        WHEN (price BETWEEN 20 AND 40) AND stock < 75 THEN "Medium price, Low stock"
        WHEN price > 40 AND stock < 50 THEN "High price, Limited stock"
        ELSE "Other"
	END AS price_stock_category
FROM product_items;


# find the no. 1 top customer based on their total spending 

SELECT first_name, last_name, email, total_spent
FROM (
	SELECT 
		customer_id, 
		SUM(total_amount) AS total_spent
	FROM orders
	GROUP BY customer_id
	ORDER BY total_spent DESC
	LIMIT 1) AS top_customer
JOIN customers 
ON top_customer.customer_id = customers.customer_id;

