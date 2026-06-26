-- Q9: Customers who placed 8 or more orders (HAVING)
SELECT customer_name,
    COUNT(customer_id) AS order_count
FROM sales
GROUP BY customer_id,
    customer_name
HAVING COUNT(customer_id) >= 8 -- Result: (run query to view values)
  
-- Q10: Products that sold more than 50 total units (HAVING)
SELECT product,
    SUM(quantity) AS total_units_sold
FROM sales
GROUP BY product
HAVING SUM(quantity) > 50 -- Result: (run query to view values)

-- Q11: Customers whose total spend is above the average customer spend (Subquery)
SELECT customer_name,
    SUM(total) AS total_spend
FROM sales
GROUP BY customer_id
HAVING SUM(total) > (
    SELECT AVG(total_spend)
    FROM (
        SELECT customer_id,
            SUM(total) AS total_spend
        FROM sales
        GROUP BY customer_id
    ) AS customer_spends
); 
-- Result: (run query to view values)
