-- Q9: Customers who placed 8 or more orders (HAVING)
SELECT customer_name,
    COUNT(customer_id) AS order_count
FROM sales
GROUP BY customer_id,
    customer_name
HAVING COUNT(customer_id) >= 8 
-- Result: Carlos 10, Joy 8, Kenneth 8, Grace Domingo 14, Leo 10
  
-- Q10: Products that sold more than 50 total units (HAVING)
SELECT product,
    SUM(quantity) AS total_units_sold
FROM sales
GROUP BY product
HAVING SUM(quantity) > 50 
-- Result: o

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
-- Result: 9 rows 
