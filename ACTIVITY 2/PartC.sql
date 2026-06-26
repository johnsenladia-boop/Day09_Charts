--SQL Notes

--Q12: EXPLAIN QUERY PLAN for Q3 from Part A
```sql
EXPLAIN QUERY PLAN
SELECT substr(order_date, 1, 7) AS month, SUM(total) AS monthly_revenue
FROM sales
GROUP BY substr(order_date, 1, 7)
ORDER BY month;
```

-- Result:
-- The query plan will show the scan of the sales table and the grouping operation used for the monthly aggregation.

--Q13: Create an index and re-run Q3
```sql
CREATE INDEX idx_sales_date ON sales(order_date);
```

```sql
SELECT substr(order_date, 1, 7) AS month, SUM(total) AS monthly_revenue
FROM sales
GROUP BY substr(order_date, 1, 7)
ORDER BY month;
```

-- Note:
-- With the index on order_date, the database may use the index to speed up filtering and access for date-based operations.
-- In this case, the query still groups by an expression on order_date, so the difference may be minor unless the database can use the index effectively.
