--CREATE TABLES

--CUSTOMERS TABLE
CREATE TABLE customers (
    [customer_id] VARCHAR(50) NOT NULL,
    [customer_unique_id] VARCHAR(50) NOT NULL,
    [customer_zip_code_prefix] INT,
    [customer_city] VARCHAR(100),
    [customer_state] VARCHAR(10),
);


--ORDERS TABLE
CREATE TABLE orders (
    [order_id] VARCHAR(50) NOT NULL,
    [customer_id] VARCHAR(50) NOT NULL,
    [order_status] VARCHAR(50),
    [order_purchase_timestamp] DATETIME,
    [order_approved_at] DATETIME NULL,
    [order_delivered_carrier_date] DATETIME NULL,
    [order_delivered_customer_date] DATETIME NULL,
    [order_estimated_delivery_date] DATETIME NULL,
);


--PAYMENTS TABLE
CREATE TABLE payments (
    [order_id] VARCHAR(50) NOT NULL,
    [payment_sequential] INT,
    [payment_type] VARCHAR(50) NOT NULL,
    [payment_installments] INT,
    [payment_value] DECIMAL(18, 2),
);

SELECT * FROM customers;

SELECT COUNT(*) AS total_customers
 FROM customers;



SELECT * FROM orders;

SELECT COUNT(*) AS total_orders
 FROM orders;



SELECT * FROM payments;

select COUNT(*) AS total_payments
 FROM payments;




TRUNCATE TABLE customers;
TRUNCATE TABLE orders;
TRUNCATE TABLE payments;