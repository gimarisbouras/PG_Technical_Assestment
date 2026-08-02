--SQL QUERIES


--TOTAL SALES BY STATE
SELECT
 customer_state,
 SUM(payment_value) AS total_sales
FROM vw_sales
GROUP BY customer_state
ORDER BY total_sales DESC; 


--NUMBER OF ORDERS BY STATE
SELECT
 customer_state,
 COUNT(DISTINCT order_id) AS total_orders
FROM vw_sales
GROUP BY customer_state
ORDER BY total_orders DESC;

--SALES BY MONTH
SELECT
 YEAR(order_purchase_timestamp) AS sales_year,
 MONTH(order_purchase_timestamp) AS sales_month,
 SUM(payment_value) AS total_sales
FROM vw_sales
GROUP BY
 YEAR(order_purchase_timestamp), MONTH(order_purchase_timestamp)
ORDER BY
 sales_year, sales_month; 


--AVERAGE ORDER VALUE
SELECT
 AVG(order_total) AS average_order_value
FROM (
 SELECT
 order_id,
 SUM(payment_value) AS order_total
 FROM vw_sales
 GROUP BY order_id
 )t;
