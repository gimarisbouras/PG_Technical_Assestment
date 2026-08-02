--CREATE VIEW

CREATE VIEW vw_sales AS
SELECT
 O.order_id,
 O.customer_id,
 C.customer_state,
 O.order_status,
 O.order_purchase_timestamp,
 P.payment_type,
 P.payment_value
FROM orders O
LEFT JOIN customers C ON O.customer_id = C.customer_id
LEFT JOIN payments P ON O.order_id = P.order_id; 


SELECT * FROM vw_sales;

SELECT COUNT(*) AS total_sales
 FROM vw_sales;