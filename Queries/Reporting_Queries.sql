-- Reporting_Queries.sql

-- 1. Customer Order Summary
SELECT c.customer_name, COUNT(o.order_id) AS total_orders, SUM(pay.amount) AS total_spent
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN payments pay ON o.order_id = pay.order_id
GROUP BY c.customer_name;

-- 2. Product Sales Report
SELECT p.product_name, SUM(oi.quantity) AS total_quantity_sold, SUM(oi.quantity * oi.price) AS total_revenue
FROM products p
JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY p.product_name;

-- 3. Employee Performance (Sales handled)
SELECT e.emp_name, COUNT(o.order_id) AS orders_handled, SUM(pay.amount) AS total_sales
FROM employees e
JOIN orders o ON e.emp_id = o.emp_id
JOIN payments pay ON o.order_id = pay.order_id
GROUP BY e.emp_name;

-- 4. Supplier Contribution
SELECT s.supplier_name, COUNT(p.product_id) AS products_supplied, SUM(p.stock) AS total_stock
FROM suppliers s
JOIN products p ON s.supplier_id = p.supplier_id
GROUP BY s.supplier_name;

-- 5. Inventory Change Log
SELECT p.product_name, i.old_stock, i.new_stock, i.updated_date
FROM inventory_log i
JOIN products p ON i.product_id = p.product_id
ORDER BY i.updated_date DESC;
