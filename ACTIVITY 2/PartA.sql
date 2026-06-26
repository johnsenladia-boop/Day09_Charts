-- 1. Total orders per region
SELECT
    region,
    COUNT(order_id) AS total_orders
FROM sales
GROUP BY region
ORDER BY total_orders DESC, region;
--Results: NCR 67, Mindanao 27, Visayas 19, Luzon 7

-- 2. Total revenue per category (use SUM(total)), sorted descending
SELECT
    category,
    SUM(total) AS total_revenue
FROM sales
GROUP BY category
ORDER BY total_revenue DESC, category;
--Results: Electronics 1981500, Accessories 179200, Storage 81800

-- 3. Monthly revenue: group by substr(order_date, 1, 7) and sum total
SELECT
    substr(order_date, 1, 7) AS month,
    SUM(total) AS monthly_revenue
FROM sales
GROUP BY substr(order_date, 1, 7)
--Results: 2025-01 138120 

-- 4. Average order value per region, rounded to 0 decimals
SELECT
    region,
    ROUND(AVG(total), 0) AS avg_order_value
FROM sales
GROUP BY region
ORDER BY avg_order_value DESC, region;
--Results: NCR 22161, Visayas 14736, Mindanao 14637, Luzon 11790

-- 5. For each product, the total units sold (SUM(quantity)) and total revenue
SELECT
    product,
    SUM(quantity) AS total_units_sold,
    SUM(total) AS total_revenue
FROM sales
GROUP BY product
ORDER BY total_revenue DESC, total_units_sold DESC, product;
--Results: Laptop 1981500, Mouse 179200, External Hard Drive 81800

-- 6. Count of orders per quantity value (1, 2, 3, 4, 5)
SELECT
    quantity,
    COUNT(order_id) AS order_count
FROM sales
WHERE quantity IN (1, 2, 3, 4, 5)
GROUP BY quantity
ORDER BY quantity;
--Results: 1 49, 2 34, 3 16, 4 13, 5 8

-- 7. Top 5 customers by total spend
SELECT
    customer_id,
    SUM(total) AS total_spend
FROM sales
GROUP BY customer_id
ORDER BY total_spend DESC
LIMIT 5;
--Results: 5 307190, 9 299600, 4 235980, 19 200330, 17 168390

-- 8. Number of distinct customers per region
SELECT
    region,
    COUNT(DISTINCT customer_id) AS distinct_customers
FROM sales
GROUP BY region
ORDER BY distinct_customers DESC, region;
--Results: NCR 11, Mindanao 4, Visayas 4, Luzon 1
