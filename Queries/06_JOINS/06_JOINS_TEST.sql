-- =====================================================
-- ORACLE SQL JOINS - RULES, SYNTAX & 100 QUESTIONS
-- =====================================================
-- =====================================================
-- SQL*PLUS FORMATTING
-- Oracle 11g
-- =====================================================

SET LINESIZE 200
SET PAGESIZE 100
SET WRAP OFF
SET TAB OFF
SET HEADING ON
SET FEEDBACK ON
SET VERIFY OFF
SET ECHO OFF
SET TRIMSPOOL ON
SET COLSEP ' | '


-- =====================================================
-- ORACLE SQL*PLUS 11g
-- JOINS TEST
-- COLUMN FORMATTING
-- Q1-Q100
-- =====================================================

SET LINESIZE 200
SET PAGESIZE 100
SET TAB OFF
SET TRIMSPOOL ON
SET FEEDBACK ON


-- =====================================================
-- DATE FORMAT
-- =====================================================

ALTER SESSION SET NLS_DATE_FORMAT = 'DD-MM-YYYY';


-- =====================================================
-- CATEGORIES
-- =====================================================

COLUMN CATEGORY_ID   FORMAT 999999
COLUMN CATEGORY_NAME FORMAT A25


-- =====================================================
-- CUSTOMERS
-- =====================================================

COLUMN CUSTOMER_ID   FORMAT 999999
COLUMN CUSTOMER_NAME FORMAT A30
COLUMN PHONE         FORMAT A15
COLUMN EMAIL         FORMAT A30
COLUMN ADDRESS       FORMAT A30
COLUMN CITY          FORMAT A20


-- =====================================================
-- EMPLOYEES
-- =====================================================

COLUMN EMP_ID       FORMAT 999999
COLUMN EMP_NAME     FORMAT A30
COLUMN DESIGNATION  FORMAT A20
COLUMN SALARY       FORMAT 99999999.99


-- =====================================================
-- SUPPLIERS
-- =====================================================

COLUMN SUPPLIER_ID   FORMAT 999999
COLUMN SUPPLIER_NAME FORMAT A30
COLUMN PHONE         FORMAT A15
COLUMN EMAIL         FORMAT A30
COLUMN ADDRESS       FORMAT A30
COLUMN CITY          FORMAT A20


-- =====================================================
-- PRODUCTS
-- =====================================================

COLUMN PRODUCT_ID   FORMAT 999999
COLUMN PRODUCT_NAME FORMAT A35
COLUMN CATEGORY_ID  FORMAT 999999
COLUMN SUPPLIER_ID  FORMAT 999999
COLUMN PRICE        FORMAT 99999999.99
COLUMN STOCK        FORMAT 999999


-- =====================================================
-- ORDERS
-- =====================================================

COLUMN ORDER_ID     FORMAT 999999
COLUMN CUSTOMER_ID  FORMAT 999999
COLUMN EMP_ID       FORMAT 999999
COLUMN ORDER_DATE   FORMAT A12
COLUMN STATUS       FORMAT A20


-- =====================================================
-- ORDER_ITEMS
-- =====================================================

COLUMN ORDER_ITEM_ID FORMAT 999999
COLUMN ORDER_ID      FORMAT 999999
COLUMN PRODUCT_ID    FORMAT 999999
COLUMN QUANTITY      FORMAT 999999
COLUMN PRICE         FORMAT 99999999.99


-- =====================================================
-- PAYMENTS
-- =====================================================

COLUMN PAYMENT_ID    FORMAT 999999
COLUMN ORDER_ID      FORMAT 999999
COLUMN PAYMENT_DATE  FORMAT A12
COLUMN PAYMENT_MODE  FORMAT A20
COLUMN AMOUNT        FORMAT 99999999.99


-- =====================================================
-- PURCHASES
-- =====================================================

COLUMN PURCHASE_ID   FORMAT 999999
COLUMN SUPPLIER_ID   FORMAT 999999
COLUMN PRODUCT_ID    FORMAT 999999
COLUMN PURCHASE_DATE FORMAT A12
COLUMN QUANTITY      FORMAT 999999
COLUMN PRICE         FORMAT 99999999.99


-- =====================================================
-- INVENTORY_LOG
-- =====================================================

COLUMN LOG_ID        FORMAT 999999
COLUMN PRODUCT_ID    FORMAT 999999
COLUMN OLD_STOCK     FORMAT 999999
COLUMN NEW_STOCK     FORMAT 999999
COLUMN LOG_DATE      FORMAT A20


-- =====================================================
-- SPOOL OUTPUT
-- =====================================================

SPOOL 'F:\Exploring Technologies\OrcaleSqlPlusExploring\Oracle_Inventory_Sales_Management_System\Queries\06_Joins\06_JOINS_TEST_OUTPUT.txt'


-- ============================================================
-- ORACLE SQL 11g
-- JOINS — COMPLETE TEST
-- ============================================================
-- Total Questions : 100
-- Difficulty      : Basic -> Intermediate -> Advanced
--
-- Topics Covered:
-- 1. INNER JOIN (two tables)
-- 2. Joining three or more tables
-- 3. LEFT OUTER JOIN
-- 4. RIGHT OUTER JOIN
-- 5. FULL OUTER JOIN
-- 6. SELF JOIN
-- 7. JOIN + WHERE conditions
-- 8. JOIN + GROUP BY / HAVING
-- 9. JOIN + Aggregate + ORDER BY
-- 10. Interview-style / advanced joins (anti-joins, CROSS JOIN, NATURAL JOIN)
--
-- IMPORTANT:
-- Do NOT confuse an OUTER JOIN direction.
-- LEFT JOIN  : all rows from the LEFT table, matched rows from the right.
-- RIGHT JOIN : all rows from the RIGHT table, matched rows from the left.
-- FULL JOIN  : all rows from BOTH tables, matched where possible.
-- ============================================================
-- =====================================================
-- JOINS
-- =====================================================

-- INNER JOIN       : Returns only rows that have matching values in both tables.
-- LEFT OUTER JOIN   : Returns all rows from the left table, plus matched rows
--                     from the right table (NULLs where there is no match).
-- RIGHT OUTER JOIN  : Returns all rows from the right table, plus matched rows
--                     from the left table (NULLs where there is no match).
-- FULL OUTER JOIN   : Returns all rows from both tables, matched where possible.
-- SELF JOIN         : A table joined to itself, using two different aliases.
-- CROSS JOIN        : Returns the Cartesian product of two tables.
-- NATURAL JOIN      : Joins automatically on all identically named columns.

-- =====================================================
-- BASIC SYNTAX
-- =====================================================

-- INNER JOIN (ANSI STYLE)
--SELECT columns
--FROM table1 t1
--JOIN table2 t2 ON t1.common_column = t2.common_column;

-- LEFT OUTER JOIN
--SELECT columns
--FROM table1 t1
--LEFT JOIN table2 t2 ON t1.common_column = t2.common_column;

-- RIGHT OUTER JOIN
--SELECT columns
--FROM table1 t1
--RIGHT JOIN table2 t2 ON t1.common_column = t2.common_column;

-- FULL OUTER JOIN
--SELECT columns
--FROM table1 t1
--FULL JOIN table2 t2 ON t1.common_column = t2.common_column;

-- SELF JOIN
--SELECT a.columns, b.columns
--FROM table_name a
--JOIN table_name b ON a.common_column = b.common_column
--WHERE a.primary_key <> b.primary_key;

-- OLD ORACLE JOIN SYNTAX (NOT RECOMMENDED, SHOWN FOR REFERENCE)
--SELECT columns
--FROM table1 t1, table2 t2
--WHERE t1.common_column = t2.common_column;

-- =====================================================
-- JOIN RULES
-- =====================================================

-- RULE 01: A JOIN combines rows from two or more tables based on a related column.
-- RULE 02: INNER JOIN returns only rows with matches in both tables.
-- RULE 03: LEFT JOIN returns all left-table rows even without a match (NULLs on the right side).
-- RULE 04: RIGHT JOIN returns all right-table rows even without a match (NULLs on the left side).
-- RULE 05: FULL JOIN returns all rows from both tables, with NULLs wherever there is no match.
-- RULE 06: A SELF JOIN needs two different aliases for the same table.
-- RULE 07: CROSS JOIN returns every combination of rows from both tables (Cartesian product).
-- RULE 08: NATURAL JOIN joins automatically on columns with identical names in both tables.
-- RULE 09: Prefer explicit ON conditions over NATURAL JOIN for clarity and safety.
-- RULE 10: The ANSI JOIN syntax (JOIN ... ON) is preferred over the old comma + WHERE syntax.
-- RULE 11: You can join more than two tables by chaining multiple JOIN clauses.
-- RULE 12: WHERE conditions after an OUTER JOIN can accidentally turn it into an INNER JOIN if applied to the nullable side incorrectly.
-- RULE 13: Aggregate functions can be applied to the result of a JOIN, usually with GROUP BY.
-- RULE 14: HAVING filters the grouped/joined result after GROUP BY.
-- RULE 15: Table aliases make multi-table JOIN queries easier to read and are required to disambiguate identical column names.
-- RULE 16: A JOIN condition is normally an equality between a primary key and a foreign key.
-- RULE 17: Rows that do not match in an OUTER JOIN appear with NULLs in place of the unmatched table's columns.
-- RULE 18: An "anti-join" (rows in A with no match in B) can be written as a LEFT JOIN with WHERE b.key IS NULL, or with NOT EXISTS.
-- RULE 19: ORDER BY is always the last clause, even after a JOIN + GROUP BY + HAVING.
-- RULE 20: The number of JOIN conditions should generally be one less than the number of tables involved.

-- =====================================================
-- EXECUTION ORDER
-- =====================================================

-- FROM (including JOIN + ON)
-- WHERE
-- GROUP BY
-- HAVING
-- SELECT
-- ORDER BY

-- =====================================================
-- LEVEL 1: INNER JOIN - BASIC (TWO TABLES)
-- =====================================================

-- Q01. List each product with its category name.
SELECT P.PRODUCT_NAME, C.CATEGORY_NAME FROM PRODUCTS P JOIN CATEGORIES C ON P.CATEGORY_ID = C.CATEGORY_ID;

-- Q02. List each product with its supplier name.
SELECT P.PRODUCT_NAME, S.SUPPLIER_NAME FROM PRODUCTS P JOIN SUPPLIERS S ON P.SUPPLIER_ID = S.SUPPLIER_ID;

-- Q03. List each order with the customer name who placed it.
SELECT O.ORDER_ID, C.CUSTOMER_NAME FROM ORDERS O JOIN CUSTOMERS C ON O.CUSTOMER_ID = C.CUSTOMER_ID;

-- Q04. List each order with the name of the employee who handled it.
SELECT O.ORDER_ID, E.EMP_NAME FROM ORDERS O JOIN EMPLOYEES E ON O.EMP_ID = E.EMP_ID;

-- Q05. List each order item with the product name.
SELECT OI.ORDER_ITEM_ID, PR.PRODUCT_NAME FROM ORDER_ITEMS OI JOIN PRODUCTS PR ON OI.PRODUCT_ID = PR.PRODUCT_ID;

-- Q06. List each payment with its order id and payment amount.
SELECT PM.PAYMENT_ID, O.ORDER_ID, PM.AMOUNT FROM PAYMENTS PM JOIN ORDERS O ON PM.ORDER_ID = O.ORDER_ID;

-- Q07. List each purchase with the supplier name.
SELECT PU.PURCHASE_ID, S.SUPPLIER_NAME FROM PURCHASES PU JOIN SUPPLIERS S ON PU.SUPPLIER_ID = S.SUPPLIER_ID;

-- Q08. List each purchase with the product name purchased.
SELECT PU.PURCHASE_ID, PR.PRODUCT_NAME FROM PURCHASES PU JOIN PRODUCTS PR ON PU.PRODUCT_ID = PR.PRODUCT_ID;

-- Q09. List each inventory log entry with the corresponding product name.
SELECT IL.LOG_ID, PR.PRODUCT_NAME FROM INVENTORY_LOG IL JOIN PRODUCTS PR ON IL.PRODUCT_ID = PR.PRODUCT_ID;

-- Q10. List each product with its price and the category name it belongs to.
SELECT P.PRODUCT_NAME, P.PRICE, C.CATEGORY_NAME FROM PRODUCTS P JOIN CATEGORIES C ON P.CATEGORY_ID = C.CATEGORY_ID;

-- Q11. List each order item with product name, quantity, and price.
SELECT PR.PRODUCT_NAME, OI.QUANTITY, OI.PRICE FROM ORDER_ITEMS OI JOIN PRODUCTS PR ON OI.PRODUCT_ID = PR.PRODUCT_ID;

-- Q12. List each order with the customer's city.
SELECT O.ORDER_ID, C.CITY FROM ORDERS O JOIN CUSTOMERS C ON O.CUSTOMER_ID = C.CUSTOMER_ID;

-- Q13. List each product with the supplier's city.
SELECT P.PRODUCT_NAME, S.CITY FROM PRODUCTS P JOIN SUPPLIERS S ON P.SUPPLIER_ID = S.SUPPLIER_ID;

-- Q14. List each employee with the orders they have handled.
SELECT E.EMP_NAME, O.ORDER_ID FROM EMPLOYEES E JOIN ORDERS O ON E.EMP_ID = O.EMP_ID;

-- Q15. List each payment along with the payment mode and the order status.
SELECT PM.PAYMENT_ID, PM.PAYMENT_MODE, O.STATUS FROM PAYMENTS PM JOIN ORDERS O ON PM.ORDER_ID = O.ORDER_ID;

-- =====================================================
-- LEVEL 2: JOINING THREE OR MORE TABLES
-- =====================================================

-- Q16. List each order item with the customer name, product name, and quantity.
SELECT C.CUSTOMER_NAME, PR.PRODUCT_NAME, OI.QUANTITY
FROM ORDERS O
JOIN CUSTOMERS C ON O.CUSTOMER_ID = C.CUSTOMER_ID
JOIN ORDER_ITEMS OI ON O.ORDER_ID = OI.ORDER_ID
JOIN PRODUCTS PR ON OI.PRODUCT_ID = PR.PRODUCT_ID;

-- Q17. List each order item with product name, category name, and quantity.
SELECT PR.PRODUCT_NAME, C.CATEGORY_NAME, OI.QUANTITY
FROM ORDER_ITEMS OI
JOIN PRODUCTS PR ON OI.PRODUCT_ID = PR.PRODUCT_ID
JOIN CATEGORIES C ON PR.CATEGORY_ID = C.CATEGORY_ID;

-- Q18. List each order with customer name, employee name, and order status.
SELECT C.CUSTOMER_NAME, E.EMP_NAME, O.STATUS
FROM ORDERS O
JOIN CUSTOMERS C ON O.CUSTOMER_ID = C.CUSTOMER_ID
JOIN EMPLOYEES E ON O.EMP_ID = E.EMP_ID;

-- Q19. List each product with supplier name and category name.
SELECT PR.PRODUCT_NAME, S.SUPPLIER_NAME, C.CATEGORY_NAME
FROM PRODUCTS PR
JOIN SUPPLIERS S ON PR.SUPPLIER_ID = S.SUPPLIER_ID
JOIN CATEGORIES C ON PR.CATEGORY_ID = C.CATEGORY_ID;

-- Q20. List each purchase with supplier name and product name.
SELECT S.SUPPLIER_NAME, PR.PRODUCT_NAME, PU.QUANTITY
FROM PURCHASES PU
JOIN SUPPLIERS S ON PU.SUPPLIER_ID = S.SUPPLIER_ID
JOIN PRODUCTS PR ON PU.PRODUCT_ID = PR.PRODUCT_ID;

-- Q21. List each payment with the customer name and order status.
SELECT C.CUSTOMER_NAME, O.STATUS, PM.AMOUNT
FROM PAYMENTS PM
JOIN ORDERS O ON PM.ORDER_ID = O.ORDER_ID
JOIN CUSTOMERS C ON O.CUSTOMER_ID = C.CUSTOMER_ID;

-- Q22. List each order item with customer name, product name, and supplier name.
SELECT C.CUSTOMER_NAME, PR.PRODUCT_NAME, S.SUPPLIER_NAME
FROM ORDERS O
JOIN CUSTOMERS C ON O.CUSTOMER_ID = C.CUSTOMER_ID
JOIN ORDER_ITEMS OI ON O.ORDER_ID = OI.ORDER_ID
JOIN PRODUCTS PR ON OI.PRODUCT_ID = PR.PRODUCT_ID
JOIN SUPPLIERS S ON PR.SUPPLIER_ID = S.SUPPLIER_ID;

-- Q23. List each order with customer name, employee name, product name, and quantity.
SELECT C.CUSTOMER_NAME, E.EMP_NAME, PR.PRODUCT_NAME, OI.QUANTITY
FROM ORDERS O
JOIN CUSTOMERS C ON O.CUSTOMER_ID = C.CUSTOMER_ID
JOIN EMPLOYEES E ON O.EMP_ID = E.EMP_ID
JOIN ORDER_ITEMS OI ON O.ORDER_ID = OI.ORDER_ID
JOIN PRODUCTS PR ON OI.PRODUCT_ID = PR.PRODUCT_ID;

-- Q24. List each inventory log entry with product name, category name, and stock change.
SELECT PR.PRODUCT_NAME, C.CATEGORY_NAME, (IL.NEW_STOCK - IL.OLD_STOCK) AS STOCK_CHANGE
FROM INVENTORY_LOG IL
JOIN PRODUCTS PR ON IL.PRODUCT_ID = PR.PRODUCT_ID
JOIN CATEGORIES C ON PR.CATEGORY_ID = C.CATEGORY_ID;

-- Q25. List each payment with customer name, order status, and payment mode.
SELECT C.CUSTOMER_NAME, O.STATUS, PM.PAYMENT_MODE, PM.AMOUNT
FROM PAYMENTS PM
JOIN ORDERS O ON PM.ORDER_ID = O.ORDER_ID
JOIN CUSTOMERS C ON O.CUSTOMER_ID = C.CUSTOMER_ID;

-- Q26. List each purchase with supplier name, product name, and category name.
SELECT S.SUPPLIER_NAME, PR.PRODUCT_NAME, C.CATEGORY_NAME
FROM PURCHASES PU
JOIN SUPPLIERS S ON PU.SUPPLIER_ID = S.SUPPLIER_ID
JOIN PRODUCTS PR ON PU.PRODUCT_ID = PR.PRODUCT_ID
JOIN CATEGORIES C ON PR.CATEGORY_ID = C.CATEGORY_ID;

-- Q27. List each order item with order date, customer name, and product name.
SELECT O.ORDER_DATE, C.CUSTOMER_NAME, PR.PRODUCT_NAME
FROM ORDERS O
JOIN CUSTOMERS C ON O.CUSTOMER_ID = C.CUSTOMER_ID
JOIN ORDER_ITEMS OI ON O.ORDER_ID = OI.ORDER_ID
JOIN PRODUCTS PR ON OI.PRODUCT_ID = PR.PRODUCT_ID;

-- Q28. List each order with customer city, employee designation, and order status.
SELECT C.CITY, E.DESIGNATION, O.STATUS
FROM ORDERS O
JOIN CUSTOMERS C ON O.CUSTOMER_ID = C.CUSTOMER_ID
JOIN EMPLOYEES E ON O.EMP_ID = E.EMP_ID;

-- Q29. List each product with category name, supplier name, and supplier city.
SELECT PR.PRODUCT_NAME, C.CATEGORY_NAME, S.SUPPLIER_NAME, S.CITY
FROM PRODUCTS PR
JOIN CATEGORIES C ON PR.CATEGORY_ID = C.CATEGORY_ID
JOIN SUPPLIERS S ON PR.SUPPLIER_ID = S.SUPPLIER_ID;

-- Q30. List each order item with product name, category name, and supplier name.
SELECT PR.PRODUCT_NAME, C.CATEGORY_NAME, S.SUPPLIER_NAME
FROM ORDER_ITEMS OI
JOIN PRODUCTS PR ON OI.PRODUCT_ID = PR.PRODUCT_ID
JOIN CATEGORIES C ON PR.CATEGORY_ID = C.CATEGORY_ID
JOIN SUPPLIERS S ON PR.SUPPLIER_ID = S.SUPPLIER_ID;

-- =====================================================
-- LEVEL 3: LEFT OUTER JOIN
-- =====================================================

-- Q31. List all customers along with their orders, including customers who have not placed any order.
SELECT C.CUSTOMER_NAME, O.ORDER_ID FROM CUSTOMERS C LEFT JOIN ORDERS O ON C.CUSTOMER_ID = O.CUSTOMER_ID;

-- Q32. List all products with their order item sales, including products never sold.
SELECT P.PRODUCT_NAME, OI.ORDER_ITEM_ID FROM PRODUCTS P LEFT JOIN ORDER_ITEMS OI ON P.PRODUCT_ID = OI.PRODUCT_ID;

-- Q33. List all employees with the orders they handled, including employees who have handled no orders.
SELECT E.EMP_NAME, O.ORDER_ID FROM EMPLOYEES E LEFT JOIN ORDERS O ON E.EMP_ID = O.EMP_ID;

-- Q34. List all suppliers with their products, including suppliers who supply no products.
SELECT S.SUPPLIER_NAME, P.PRODUCT_NAME FROM SUPPLIERS S LEFT JOIN PRODUCTS P ON S.SUPPLIER_ID = P.SUPPLIER_ID;

-- Q35. List all categories with their products, including categories with no products.
SELECT C.CATEGORY_NAME, P.PRODUCT_NAME FROM CATEGORIES C LEFT JOIN PRODUCTS P ON C.CATEGORY_ID = P.CATEGORY_ID;

-- Q36. List all orders with their payments, including orders that have not yet been paid.
SELECT O.ORDER_ID, PM.PAYMENT_ID, PM.AMOUNT FROM ORDERS O LEFT JOIN PAYMENTS PM ON O.ORDER_ID = PM.ORDER_ID;

-- Q37. Find customers who have never placed an order.
SELECT C.CUSTOMER_NAME FROM CUSTOMERS C LEFT JOIN ORDERS O ON C.CUSTOMER_ID = O.CUSTOMER_ID WHERE O.ORDER_ID IS NULL;

-- Q38. Find products that have never been sold.
SELECT P.PRODUCT_NAME FROM PRODUCTS P LEFT JOIN ORDER_ITEMS OI ON P.PRODUCT_ID = OI.PRODUCT_ID WHERE OI.ORDER_ITEM_ID IS NULL;

-- Q39. Find suppliers who have not supplied any products.
SELECT S.SUPPLIER_NAME FROM SUPPLIERS S LEFT JOIN PRODUCTS P ON S.SUPPLIER_ID = P.SUPPLIER_ID WHERE P.PRODUCT_ID IS NULL;

-- Q40. Find orders that have not received any payment.
SELECT O.ORDER_ID FROM ORDERS O LEFT JOIN PAYMENTS PM ON O.ORDER_ID = PM.ORDER_ID WHERE PM.PAYMENT_ID IS NULL;

-- =====================================================
-- LEVEL 4: RIGHT OUTER JOIN
-- =====================================================

-- Q41. List all orders along with their customers, including any orders whose customer record is missing.
SELECT O.ORDER_ID, C.CUSTOMER_NAME FROM CUSTOMERS C RIGHT JOIN ORDERS O ON C.CUSTOMER_ID = O.CUSTOMER_ID;

-- Q42. List all products along with their suppliers, including any products whose supplier is missing.
SELECT P.PRODUCT_NAME, S.SUPPLIER_NAME FROM SUPPLIERS S RIGHT JOIN PRODUCTS P ON S.SUPPLIER_ID = P.SUPPLIER_ID;

-- Q43. List all order items along with their products, including any order items whose product is missing.
SELECT OI.ORDER_ITEM_ID, P.PRODUCT_NAME FROM PRODUCTS P RIGHT JOIN ORDER_ITEMS OI ON P.PRODUCT_ID = OI.PRODUCT_ID;

-- Q44. List all orders along with the employee who handled them, including orders whose employee record is missing.
SELECT O.ORDER_ID, E.EMP_NAME FROM EMPLOYEES E RIGHT JOIN ORDERS O ON E.EMP_ID = O.EMP_ID;

-- Q45. List all products along with their category, including any products whose category is missing.
SELECT P.PRODUCT_NAME, C.CATEGORY_NAME FROM CATEGORIES C RIGHT JOIN PRODUCTS P ON C.CATEGORY_ID = P.CATEGORY_ID;

-- Q46. List all purchases along with their suppliers, including any purchases whose supplier is missing.
SELECT PU.PURCHASE_ID, S.SUPPLIER_NAME FROM SUPPLIERS S RIGHT JOIN PURCHASES PU ON S.SUPPLIER_ID = PU.SUPPLIER_ID;

-- Q47. List all payments along with their orders, including any payments whose order is missing.
SELECT PM.PAYMENT_ID, O.ORDER_ID FROM ORDERS O RIGHT JOIN PAYMENTS PM ON O.ORDER_ID = PM.ORDER_ID;

-- Q48. List all inventory log entries along with their products, including any log entries whose product is missing.
SELECT IL.LOG_ID, P.PRODUCT_NAME FROM PRODUCTS P RIGHT JOIN INVENTORY_LOG IL ON P.PRODUCT_ID = IL.PRODUCT_ID;

-- =====================================================
-- LEVEL 5: FULL OUTER JOIN
-- =====================================================

-- Q49. List all customers and all orders, matched where possible, unmatched rows on either side included.
SELECT C.CUSTOMER_NAME, O.ORDER_ID FROM CUSTOMERS C FULL JOIN ORDERS O ON C.CUSTOMER_ID = O.CUSTOMER_ID;

-- Q50. List all products and all order items, matched where possible, unmatched rows on either side included.
SELECT P.PRODUCT_NAME, OI.ORDER_ITEM_ID FROM PRODUCTS P FULL JOIN ORDER_ITEMS OI ON P.PRODUCT_ID = OI.PRODUCT_ID;

-- Q51. List all suppliers and all products, matched where possible, unmatched rows on either side included.
SELECT S.SUPPLIER_NAME, P.PRODUCT_NAME FROM SUPPLIERS S FULL JOIN PRODUCTS P ON S.SUPPLIER_ID = P.SUPPLIER_ID;

-- Q52. List all orders and all payments, matched where possible, unmatched rows on either side included.
SELECT O.ORDER_ID, PM.PAYMENT_ID FROM ORDERS O FULL JOIN PAYMENTS PM ON O.ORDER_ID = PM.ORDER_ID;

-- Q53. List all categories and all products, matched where possible, unmatched rows on either side included.
SELECT C.CATEGORY_NAME, P.PRODUCT_NAME FROM CATEGORIES C FULL JOIN PRODUCTS P ON C.CATEGORY_ID = P.CATEGORY_ID;

-- Q54. List all employees and all orders they may have handled, matched where possible, unmatched rows on either side included.
SELECT E.EMP_NAME, O.ORDER_ID FROM EMPLOYEES E FULL JOIN ORDERS O ON E.EMP_ID = O.EMP_ID;

-- Q55. Find all customers with no orders AND all orders with no matching customer, in a single result set.
SELECT C.CUSTOMER_NAME, O.ORDER_ID FROM CUSTOMERS C FULL JOIN ORDERS O ON C.CUSTOMER_ID = O.CUSTOMER_ID WHERE C.CUSTOMER_ID IS NULL OR O.ORDER_ID IS NULL;

-- =====================================================
-- LEVEL 6: SELF JOIN
-- =====================================================

-- Q56. Find pairs of employees who share the same designation (excluding an employee paired with itself).
SELECT E1.EMP_NAME AS EMPLOYEE_1, E2.EMP_NAME AS EMPLOYEE_2, E1.DESIGNATION
FROM EMPLOYEES E1
JOIN EMPLOYEES E2 ON E1.DESIGNATION = E2.DESIGNATION AND E1.EMP_ID <> E2.EMP_ID;

-- Q57. Find employees who earn more than another employee in the same designation.
SELECT E1.EMP_NAME AS HIGHER_PAID, E2.EMP_NAME AS LOWER_PAID, E1.DESIGNATION
FROM EMPLOYEES E1
JOIN EMPLOYEES E2 ON E1.DESIGNATION = E2.DESIGNATION AND E1.SALARY > E2.SALARY;

-- Q58. Find pairs of customers who live in the same city (excluding a customer paired with itself).
SELECT C1.CUSTOMER_NAME AS CUSTOMER_1, C2.CUSTOMER_NAME AS CUSTOMER_2, C1.CITY
FROM CUSTOMERS C1
JOIN CUSTOMERS C2 ON C1.CITY = C2.CITY AND C1.CUSTOMER_ID <> C2.CUSTOMER_ID;

-- Q59. Find pairs of suppliers who operate in the same city (excluding a supplier paired with itself).
SELECT S1.SUPPLIER_NAME AS SUPPLIER_1, S2.SUPPLIER_NAME AS SUPPLIER_2, S1.CITY
FROM SUPPLIERS S1
JOIN SUPPLIERS S2 ON S1.CITY = S2.CITY AND S1.SUPPLIER_ID <> S2.SUPPLIER_ID;

-- Q60. Find pairs of products in the same category that have the same price.
SELECT P1.PRODUCT_NAME AS PRODUCT_1, P2.PRODUCT_NAME AS PRODUCT_2, P1.CATEGORY_ID, P1.PRICE
FROM PRODUCTS P1
JOIN PRODUCTS P2 ON P1.CATEGORY_ID = P2.CATEGORY_ID AND P1.PRICE = P2.PRICE AND P1.PRODUCT_ID <> P2.PRODUCT_ID;

-- Q61. Find the employee(s) with the highest salary using a self join (no employee earns more than them).
SELECT E1.EMP_NAME, E1.SALARY
FROM EMPLOYEES E1
WHERE NOT EXISTS (SELECT 1 FROM EMPLOYEES E2 WHERE E2.SALARY > E1.SALARY);

-- Q62. Find pairs of products supplied by the same supplier (excluding a product paired with itself).
SELECT P1.PRODUCT_NAME AS PRODUCT_1, P2.PRODUCT_NAME AS PRODUCT_2, P1.SUPPLIER_ID
FROM PRODUCTS P1
JOIN PRODUCTS P2 ON P1.SUPPLIER_ID = P2.SUPPLIER_ID AND P1.PRODUCT_ID <> P2.PRODUCT_ID;

-- Q63. Find pairs of orders placed by the same customer on different dates.
SELECT O1.ORDER_ID AS ORDER_1, O2.ORDER_ID AS ORDER_2, O1.CUSTOMER_ID
FROM ORDERS O1
JOIN ORDERS O2 ON O1.CUSTOMER_ID = O2.CUSTOMER_ID AND O1.ORDER_ID <> O2.ORDER_ID AND O1.ORDER_DATE <> O2.ORDER_DATE;

-- =====================================================
-- LEVEL 7: JOIN + WHERE CONDITIONS
-- =====================================================

-- Q64. List products priced above 1000 along with their category name.
SELECT P.PRODUCT_NAME, P.PRICE, C.CATEGORY_NAME FROM PRODUCTS P JOIN CATEGORIES C ON P.CATEGORY_ID = C.CATEGORY_ID WHERE P.PRICE > 1000;

-- Q65. List orders with status 'DELIVERED' along with the customer name.
SELECT O.ORDER_ID, C.CUSTOMER_NAME FROM ORDERS O JOIN CUSTOMERS C ON O.CUSTOMER_ID = C.CUSTOMER_ID WHERE O.STATUS = 'DELIVERED';

-- Q66. List employees with designation 'MANAGER' along with the orders they handled.
SELECT E.EMP_NAME, O.ORDER_ID FROM EMPLOYEES E JOIN ORDERS O ON E.EMP_ID = O.EMP_ID WHERE E.DESIGNATION = 'MANAGER';

-- Q67. List order items where quantity is greater than 5, along with the product name.
SELECT PR.PRODUCT_NAME, OI.QUANTITY FROM ORDER_ITEMS OI JOIN PRODUCTS PR ON OI.PRODUCT_ID = PR.PRODUCT_ID WHERE OI.QUANTITY > 5;

-- Q68. List payments made in payment mode 'CASH' along with the customer name.
SELECT C.CUSTOMER_NAME, PM.AMOUNT FROM PAYMENTS PM JOIN ORDERS O ON PM.ORDER_ID = O.ORDER_ID JOIN CUSTOMERS C ON O.CUSTOMER_ID = C.CUSTOMER_ID WHERE PM.PAYMENT_MODE = 'CASH';

-- Q69. List products supplied by suppliers located in 'HYDERABAD', along with supplier name.
SELECT P.PRODUCT_NAME, S.SUPPLIER_NAME FROM PRODUCTS P JOIN SUPPLIERS S ON P.SUPPLIER_ID = S.SUPPLIER_ID WHERE S.CITY = 'HYDERABAD';

-- Q70. List orders placed by customers located in 'MUMBAI', along with order status.
SELECT O.ORDER_ID, O.STATUS FROM ORDERS O JOIN CUSTOMERS C ON O.CUSTOMER_ID = C.CUSTOMER_ID WHERE C.CITY = 'MUMBAI';

-- Q71. List purchases where quantity purchased is greater than 50, along with supplier name and product name.
SELECT S.SUPPLIER_NAME, PR.PRODUCT_NAME, PU.QUANTITY FROM PURCHASES PU JOIN SUPPLIERS S ON PU.SUPPLIER_ID = S.SUPPLIER_ID JOIN PRODUCTS PR ON PU.PRODUCT_ID = PR.PRODUCT_ID WHERE PU.QUANTITY > 50;

-- Q72. List products in category 'ELECTRONICS' with stock less than 10, along with supplier name.
SELECT P.PRODUCT_NAME, P.STOCK, S.SUPPLIER_NAME FROM PRODUCTS P JOIN CATEGORIES C ON P.CATEGORY_ID = C.CATEGORY_ID JOIN SUPPLIERS S ON P.SUPPLIER_ID = S.SUPPLIER_ID WHERE C.CATEGORY_NAME = 'ELECTRONICS' AND P.STOCK < 10;

-- Q73. List order items belonging to orders placed after '01-01-2025', along with product name.
SELECT PR.PRODUCT_NAME, O.ORDER_DATE FROM ORDERS O JOIN ORDER_ITEMS OI ON O.ORDER_ID = OI.ORDER_ID JOIN PRODUCTS PR ON OI.PRODUCT_ID = PR.PRODUCT_ID WHERE O.ORDER_DATE > '01-01-2025';

-- =====================================================
-- LEVEL 8: JOIN + GROUP BY / HAVING
-- =====================================================

-- Q74. Find the total quantity sold for each product, showing the product name.
SELECT PR.PRODUCT_NAME, SUM(OI.QUANTITY) AS TOTAL_QUANTITY FROM ORDER_ITEMS OI JOIN PRODUCTS PR ON OI.PRODUCT_ID = PR.PRODUCT_ID GROUP BY PR.PRODUCT_NAME;

-- Q75. Find the total number of orders placed by each customer, showing the customer name.
SELECT C.CUSTOMER_NAME, COUNT(O.ORDER_ID) AS NO_OF_ORDERS FROM CUSTOMERS C JOIN ORDERS O ON C.CUSTOMER_ID = O.CUSTOMER_ID GROUP BY C.CUSTOMER_NAME;

-- Q76. Find the total sales value for each category, showing the category name.
SELECT C.CATEGORY_NAME, SUM(OI.QUANTITY * OI.PRICE) AS TOTAL_SALES_VALUE
FROM ORDER_ITEMS OI
JOIN PRODUCTS P ON OI.PRODUCT_ID = P.PRODUCT_ID
JOIN CATEGORIES C ON P.CATEGORY_ID = C.CATEGORY_ID
GROUP BY C.CATEGORY_NAME;

-- Q77. Find the number of products supplied by each supplier, showing the supplier name.
SELECT S.SUPPLIER_NAME, COUNT(P.PRODUCT_ID) AS NO_OF_PRODUCTS FROM SUPPLIERS S JOIN PRODUCTS P ON S.SUPPLIER_ID = P.SUPPLIER_ID GROUP BY S.SUPPLIER_NAME;

-- Q78. Find the total amount collected for each customer, showing the customer name, having total above 10000.
SELECT C.CUSTOMER_NAME, SUM(PM.AMOUNT) AS TOTAL_PAID
FROM CUSTOMERS C
JOIN ORDERS O ON C.CUSTOMER_ID = O.CUSTOMER_ID
JOIN PAYMENTS PM ON O.ORDER_ID = PM.ORDER_ID
GROUP BY C.CUSTOMER_NAME
HAVING SUM(PM.AMOUNT) > 10000;

-- Q79. Find the number of orders each employee has handled, showing employee name, having more than 5 orders.
SELECT E.EMP_NAME, COUNT(O.ORDER_ID) AS NO_OF_ORDERS FROM EMPLOYEES E JOIN ORDERS O ON E.EMP_ID = O.EMP_ID GROUP BY E.EMP_NAME HAVING COUNT(O.ORDER_ID) > 5;

-- Q80. Find category names having total product stock greater than 500.
SELECT C.CATEGORY_NAME, SUM(P.STOCK) AS TOTAL_STOCK FROM CATEGORIES C JOIN PRODUCTS P ON C.CATEGORY_ID = P.CATEGORY_ID GROUP BY C.CATEGORY_NAME HAVING SUM(P.STOCK) > 500;

-- Q81. Find supplier names whose total purchase quantity exceeds 200.
SELECT S.SUPPLIER_NAME, SUM(PU.QUANTITY) AS TOTAL_QUANTITY FROM SUPPLIERS S JOIN PURCHASES PU ON S.SUPPLIER_ID = PU.SUPPLIER_ID GROUP BY S.SUPPLIER_NAME HAVING SUM(PU.QUANTITY) > 200;

-- Q82. Find product names whose total sales value exceeds 50000.
SELECT PR.PRODUCT_NAME, SUM(OI.QUANTITY * OI.PRICE) AS TOTAL_SALES_VALUE FROM PRODUCTS PR JOIN ORDER_ITEMS OI ON PR.PRODUCT_ID = OI.PRODUCT_ID GROUP BY PR.PRODUCT_NAME HAVING SUM(OI.QUANTITY * OI.PRICE) > 50000;

-- Q83. Find customer names, along with city, having placed more than 2 orders.
SELECT C.CUSTOMER_NAME, C.CITY, COUNT(O.ORDER_ID) AS NO_OF_ORDERS FROM CUSTOMERS C JOIN ORDERS O ON C.CUSTOMER_ID = O.CUSTOMER_ID GROUP BY C.CUSTOMER_NAME, C.CITY HAVING COUNT(O.ORDER_ID) > 2;

-- Q84. Find payment modes with total amount above 50000, along with the number of distinct customers who used them.
SELECT PM.PAYMENT_MODE, SUM(PM.AMOUNT) AS TOTAL_AMOUNT, COUNT(DISTINCT O.CUSTOMER_ID) AS DISTINCT_CUSTOMERS
FROM PAYMENTS PM
JOIN ORDERS O ON PM.ORDER_ID = O.ORDER_ID
GROUP BY PM.PAYMENT_MODE
HAVING SUM(PM.AMOUNT) > 50000;

-- Q85. Find designations whose employees together handled more than 10 orders.
SELECT E.DESIGNATION, COUNT(O.ORDER_ID) AS NO_OF_ORDERS FROM EMPLOYEES E JOIN ORDERS O ON E.EMP_ID = O.EMP_ID GROUP BY E.DESIGNATION HAVING COUNT(O.ORDER_ID) > 10;

-- =====================================================
-- LEVEL 9: JOIN + AGGREGATE + ORDER BY
-- =====================================================

-- Q86. List each category's total sales value, ordered from highest to lowest.
SELECT C.CATEGORY_NAME, SUM(OI.QUANTITY * OI.PRICE) AS TOTAL_SALES_VALUE
FROM ORDER_ITEMS OI
JOIN PRODUCTS P ON OI.PRODUCT_ID = P.PRODUCT_ID
JOIN CATEGORIES C ON P.CATEGORY_ID = C.CATEGORY_ID
GROUP BY C.CATEGORY_NAME
ORDER BY TOTAL_SALES_VALUE DESC;

-- Q87. List each customer's total number of orders, ordered from highest to lowest.
SELECT C.CUSTOMER_NAME, COUNT(O.ORDER_ID) AS NO_OF_ORDERS FROM CUSTOMERS C JOIN ORDERS O ON C.CUSTOMER_ID = O.CUSTOMER_ID GROUP BY C.CUSTOMER_NAME ORDER BY NO_OF_ORDERS DESC;

-- Q88. List each supplier's number of products supplied, ordered alphabetically by supplier name.
SELECT S.SUPPLIER_NAME, COUNT(P.PRODUCT_ID) AS NO_OF_PRODUCTS FROM SUPPLIERS S JOIN PRODUCTS P ON S.SUPPLIER_ID = P.SUPPLIER_ID GROUP BY S.SUPPLIER_NAME ORDER BY S.SUPPLIER_NAME ASC;

-- Q89. List each employee's total number of handled orders, ordered from highest to lowest, top 5 only.
SELECT * FROM (
  SELECT E.EMP_NAME, COUNT(O.ORDER_ID) AS NO_OF_ORDERS FROM EMPLOYEES E JOIN ORDERS O ON E.EMP_ID = O.EMP_ID GROUP BY E.EMP_NAME ORDER BY NO_OF_ORDERS DESC
) WHERE ROWNUM <= 5;

-- Q90. List each product's total quantity sold, ordered from lowest to highest.
SELECT PR.PRODUCT_NAME, SUM(OI.QUANTITY) AS TOTAL_QUANTITY FROM ORDER_ITEMS OI JOIN PRODUCTS PR ON OI.PRODUCT_ID = PR.PRODUCT_ID GROUP BY PR.PRODUCT_NAME ORDER BY TOTAL_QUANTITY ASC;

-- Q91. List each customer's total payment amount, ordered from highest to lowest, top 3 only.
SELECT * FROM (
  SELECT C.CUSTOMER_NAME, SUM(PM.AMOUNT) AS TOTAL_PAID
  FROM CUSTOMERS C JOIN ORDERS O ON C.CUSTOMER_ID = O.CUSTOMER_ID JOIN PAYMENTS PM ON O.ORDER_ID = PM.ORDER_ID
  GROUP BY C.CUSTOMER_NAME ORDER BY TOTAL_PAID DESC
) WHERE ROWNUM <= 3;

-- Q92. List each category's average product price, ordered from highest to lowest.
SELECT C.CATEGORY_NAME, AVG(P.PRICE) AS AVG_PRICE FROM CATEGORIES C JOIN PRODUCTS P ON C.CATEGORY_ID = P.CATEGORY_ID GROUP BY C.CATEGORY_NAME ORDER BY AVG_PRICE DESC;

-- Q93. List each supplier's total purchase quantity supplied, ordered from highest to lowest.
SELECT S.SUPPLIER_NAME, SUM(PU.QUANTITY) AS TOTAL_QUANTITY FROM SUPPLIERS S JOIN PURCHASES PU ON S.SUPPLIER_ID = PU.SUPPLIER_ID GROUP BY S.SUPPLIER_NAME ORDER BY TOTAL_QUANTITY DESC;

-- =====================================================
-- LEVEL 10: INTERVIEW-STYLE / ADVANCED JOINS
-- =====================================================

-- Q94. Find customers who have placed orders but have never made a payment (anti-join using LEFT JOIN).
SELECT C.CUSTOMER_NAME
FROM CUSTOMERS C
JOIN ORDERS O ON C.CUSTOMER_ID = O.CUSTOMER_ID
LEFT JOIN PAYMENTS PM ON O.ORDER_ID = PM.ORDER_ID
WHERE PM.PAYMENT_ID IS NULL;

-- Q95. Find products that have never appeared in any purchase record (anti-join using NOT EXISTS).
SELECT P.PRODUCT_NAME
FROM PRODUCTS P
WHERE NOT EXISTS (SELECT 1 FROM PURCHASES PU WHERE PU.PRODUCT_ID = P.PRODUCT_ID);

-- Q96. Generate a Cartesian product of all categories and all suppliers (CROSS JOIN), useful for building a coverage matrix.
SELECT C.CATEGORY_NAME, S.SUPPLIER_NAME FROM CATEGORIES C CROSS JOIN SUPPLIERS S;

-- Q97. Find the category with the highest total sales value using a JOIN, GROUP BY, and a subquery for the maximum.
SELECT CATEGORY_NAME, TOTAL_SALES_VALUE FROM (
  SELECT C.CATEGORY_NAME, SUM(OI.QUANTITY * OI.PRICE) AS TOTAL_SALES_VALUE
  FROM ORDER_ITEMS OI
  JOIN PRODUCTS P ON OI.PRODUCT_ID = P.PRODUCT_ID
  JOIN CATEGORIES C ON P.CATEGORY_ID = C.CATEGORY_ID
  GROUP BY C.CATEGORY_NAME
)
WHERE TOTAL_SALES_VALUE = (
  SELECT MAX(CAT_TOTAL) FROM (
    SELECT SUM(OI2.QUANTITY * OI2.PRICE) AS CAT_TOTAL
    FROM ORDER_ITEMS OI2
    JOIN PRODUCTS P2 ON OI2.PRODUCT_ID = P2.PRODUCT_ID
    GROUP BY P2.CATEGORY_ID
  )
);

-- Q98. Find suppliers who supply products but whose products have never been purchased in any PURCHASES record.
SELECT DISTINCT S.SUPPLIER_NAME
FROM SUPPLIERS S
JOIN PRODUCTS P ON S.SUPPLIER_ID = P.SUPPLIER_ID
WHERE NOT EXISTS (SELECT 1 FROM PURCHASES PU WHERE PU.PRODUCT_ID = P.PRODUCT_ID);

-- Q99. Compare each product's total quantity sold vs total quantity purchased, using LEFT JOINs and NVL for missing values.
SELECT P.PRODUCT_NAME,
       NVL(SOLD.TOTAL_SOLD, 0) AS TOTAL_SOLD,
       NVL(BOUGHT.TOTAL_BOUGHT, 0) AS TOTAL_BOUGHT
FROM PRODUCTS P
LEFT JOIN (SELECT PRODUCT_ID, SUM(QUANTITY) AS TOTAL_SOLD FROM ORDER_ITEMS GROUP BY PRODUCT_ID) SOLD ON P.PRODUCT_ID = SOLD.PRODUCT_ID
LEFT JOIN (SELECT PRODUCT_ID, SUM(QUANTITY) AS TOTAL_BOUGHT FROM PURCHASES GROUP BY PRODUCT_ID) BOUGHT ON P.PRODUCT_ID = BOUGHT.PRODUCT_ID;

-- Q100. Find employees who have handled orders in every distinct status value that exists, using JOIN + GROUP BY + HAVING with a subquery.
SELECT E.EMP_NAME
FROM EMPLOYEES E
JOIN ORDERS O ON E.EMP_ID = O.EMP_ID
GROUP BY E.EMP_NAME
HAVING COUNT(DISTINCT O.STATUS) = (SELECT COUNT(DISTINCT STATUS) FROM ORDERS);

-- =====================================================
-- PRACTICE ORDER
-- =====================================================

-- Q01-Q15   : INNER JOIN - Basic (two tables)
-- Q16-Q30   : Joining three or more tables
-- Q31-Q40   : LEFT OUTER JOIN
-- Q41-Q48   : RIGHT OUTER JOIN
-- Q49-Q55   : FULL OUTER JOIN
-- Q56-Q63   : SELF JOIN
-- Q64-Q73   : JOIN + WHERE conditions
-- Q74-Q85   : JOIN + GROUP BY / HAVING
-- Q86-Q93   : JOIN + Aggregate + ORDER BY
-- Q94-Q100  : Interview-style / advanced joins (anti-joins, CROSS JOIN, subqueries)

-- =====================================================
-- IMPORTANT COLUMNS FROM YOUR PROJECT
-- =====================================================

-- EMPLOYEES      : EMP_ID, EMP_NAME, DESIGNATION, SALARY
-- PRODUCTS       : PRODUCT_ID, PRODUCT_NAME, CATEGORY_ID, SUPPLIER_ID, PRICE, STOCK
-- ORDER_ITEMS    : ORDER_ITEM_ID, ORDER_ID, PRODUCT_ID, QUANTITY, PRICE
-- PAYMENTS       : PAYMENT_ID, ORDER_ID, PAYMENT_MODE, PAYMENT_DATE, AMOUNT
-- PURCHASES      : PURCHASE_ID, SUPPLIER_ID, PRODUCT_ID, QUANTITY, PURCHASE_DATE, PRICE
-- CUSTOMERS      : CUSTOMER_ID, CUSTOMER_NAME, PHONE, EMAIL, ADDRESS, CITY
-- ORDERS         : ORDER_ID, CUSTOMER_ID, EMP_ID, ORDER_DATE, STATUS
-- CATEGORIES     : CATEGORY_ID, CATEGORY_NAME
-- SUPPLIERS      : SUPPLIER_ID, SUPPLIER_NAME, PHONE, EMAIL, ADDRESS, CITY
-- INVENTORY_LOG  : LOG_ID, PRODUCT_ID, OLD_STOCK, NEW_STOCK, LOG_DATE

-- =====================================================
-- END OF JOINS PRACTICE
-- =====================================================

SPOOL OFF