-- =====================================================
-- ORACLE SQL 11g
-- REAL-WORLD INTERVIEW — 100 QUESTIONS & ANSWERS
-- =====================================================
-- Project : Oracle Inventory Sales Management System
-- Total Questions : 100
-- Difficulty      : Intermediate -> Advanced
-- Oracle Version  : 11g
-- =====================================================

-- =====================================================
-- SQL*PLUS FORMATTING
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
-- DATE FORMAT
-- =====================================================

ALTER SESSION SET NLS_DATE_FORMAT = 'DD-MM-YYYY';

-- =====================================================
-- COLUMN FORMATTING
-- =====================================================

COLUMN CATEGORY_ID    FORMAT 999999
COLUMN CATEGORY_NAME  FORMAT A25

COLUMN CUSTOMER_ID    FORMAT 999999
COLUMN CUSTOMER_NAME  FORMAT A30
COLUMN PHONE          FORMAT A15
COLUMN EMAIL          FORMAT A30
COLUMN ADDRESS        FORMAT A30
COLUMN CITY           FORMAT A20

COLUMN EMP_ID         FORMAT 999999
COLUMN EMP_NAME       FORMAT A30
COLUMN DESIGNATION    FORMAT A20
COLUMN SALARY         FORMAT 99999999.99

COLUMN SUPPLIER_ID    FORMAT 999999
COLUMN SUPPLIER_NAME  FORMAT A30

COLUMN PRODUCT_ID     FORMAT 999999
COLUMN PRODUCT_NAME   FORMAT A35
COLUMN PRICE          FORMAT 99999999.99
COLUMN STOCK          FORMAT 999999

COLUMN ORDER_ID       FORMAT 999999
COLUMN ORDER_ITEM_ID  FORMAT 999999
COLUMN ORDER_DATE     FORMAT A12
COLUMN STATUS         FORMAT A20
COLUMN QUANTITY       FORMAT 999999

COLUMN PAYMENT_ID     FORMAT 999999
COLUMN PAYMENT_DATE   FORMAT A12
COLUMN PAYMENT_MODE   FORMAT A20
COLUMN AMOUNT         FORMAT 99999999.99

COLUMN PURCHASE_ID    FORMAT 999999
COLUMN PURCHASE_DATE  FORMAT A12

COLUMN LOG_ID         FORMAT 999999
COLUMN OLD_STOCK      FORMAT 999999
COLUMN NEW_STOCK      FORMAT 999999
COLUMN UPDATED_DATE   FORMAT A12

-- =====================================================
-- SPOOL OUTPUT
-- =====================================================

SPOOL 'F:\Exploring Technologies\OrcaleSqlPlusExploring\Oracle_Inventory_Sales_Management_System\Queries\14_Real_World_Interview\14_REAL_WORLD_INTERVIEW_OUTPUT.txt'


-- =====================================================
-- REAL-WORLD INTERVIEW SQL
-- QUESTIONS 01-100
-- =====================================================


-- =====================================================
-- LEVEL 1: BUSINESS BASICS
-- Q01-Q10
-- =====================================================

-- Q01. Find the total number of customers.
SELECT COUNT(*) AS TOTAL_CUSTOMERS
FROM CUSTOMERS;


-- Q02. Find the total number of products.
SELECT COUNT(*) AS TOTAL_PRODUCTS
FROM PRODUCTS;


-- Q03. Find the total number of orders.
SELECT COUNT(*) AS TOTAL_ORDERS
FROM ORDERS;


-- Q04. Find the total sales quantity.
SELECT SUM(QUANTITY) AS TOTAL_SALES_QUANTITY
FROM ORDER_ITEMS;


-- Q05. Find the total sales value.
SELECT SUM(QUANTITY * PRICE) AS TOTAL_SALES_VALUE
FROM ORDER_ITEMS;


-- Q06. Find the total payment amount collected.
SELECT SUM(AMOUNT) AS TOTAL_PAYMENT_AMOUNT
FROM PAYMENTS;


-- Q07. Find the total purchase quantity.
SELECT SUM(QUANTITY) AS TOTAL_PURCHASE_QUANTITY
FROM PURCHASES;


-- Q08. Find the average product price.
SELECT AVG(PRICE) AS AVERAGE_PRODUCT_PRICE
FROM PRODUCTS;


-- Q09. Find the highest product price.
SELECT MAX(PRICE) AS HIGHEST_PRODUCT_PRICE
FROM PRODUCTS;


-- Q10. Find the lowest product price.
SELECT MIN(PRICE) AS LOWEST_PRODUCT_PRICE
FROM PRODUCTS;


-- =====================================================
-- LEVEL 2: CUSTOMER ANALYSIS
-- Q11-Q20
-- =====================================================

-- Q11. Find the number of orders placed by each customer.
SELECT C.CUSTOMER_NAME,
       COUNT(O.ORDER_ID) AS NO_OF_ORDERS
FROM CUSTOMERS C
LEFT JOIN ORDERS O
ON C.CUSTOMER_ID = O.CUSTOMER_ID
GROUP BY C.CUSTOMER_NAME;


-- Q12. Find customers who have placed more than 3 orders.
SELECT C.CUSTOMER_NAME,
       COUNT(O.ORDER_ID) AS NO_OF_ORDERS
FROM CUSTOMERS C
JOIN ORDERS O
ON C.CUSTOMER_ID = O.CUSTOMER_ID
GROUP BY C.CUSTOMER_NAME
HAVING COUNT(O.ORDER_ID) > 3;


-- Q13. Find customers who have never placed an order.
SELECT C.CUSTOMER_NAME
FROM CUSTOMERS C
LEFT JOIN ORDERS O
ON C.CUSTOMER_ID = O.CUSTOMER_ID
WHERE O.ORDER_ID IS NULL;


-- Q14. Find the latest order date for each customer.
SELECT C.CUSTOMER_NAME,
       MAX(O.ORDER_DATE) AS LATEST_ORDER_DATE
FROM CUSTOMERS C
JOIN ORDERS O
ON C.CUSTOMER_ID = O.CUSTOMER_ID
GROUP BY C.CUSTOMER_NAME;


-- Q15. Find the first order date for each customer.
SELECT C.CUSTOMER_NAME,
       MIN(O.ORDER_DATE) AS FIRST_ORDER_DATE
FROM CUSTOMERS C
JOIN ORDERS O
ON C.CUSTOMER_ID = O.CUSTOMER_ID
GROUP BY C.CUSTOMER_NAME;


-- Q16. Find total payment made by each customer.
SELECT C.CUSTOMER_NAME,
       SUM(PM.AMOUNT) AS TOTAL_PAID
FROM CUSTOMERS C
JOIN ORDERS O
ON C.CUSTOMER_ID = O.CUSTOMER_ID
JOIN PAYMENTS PM
ON O.ORDER_ID = PM.ORDER_ID
GROUP BY C.CUSTOMER_NAME;


-- Q17. Find customers whose total payment exceeds 20000.
SELECT C.CUSTOMER_NAME,
       SUM(PM.AMOUNT) AS TOTAL_PAID
FROM CUSTOMERS C
JOIN ORDERS O
ON C.CUSTOMER_ID = O.CUSTOMER_ID
JOIN PAYMENTS PM
ON O.ORDER_ID = PM.ORDER_ID
GROUP BY C.CUSTOMER_NAME
HAVING SUM(PM.AMOUNT) > 20000;


-- Q18. Find customers who placed orders but never made a payment.
SELECT DISTINCT C.CUSTOMER_NAME
FROM CUSTOMERS C
JOIN ORDERS O
ON C.CUSTOMER_ID = O.CUSTOMER_ID
LEFT JOIN PAYMENTS PM
ON O.ORDER_ID = PM.ORDER_ID
WHERE PM.PAYMENT_ID IS NULL;


-- Q19. Find the customer with the highest number of orders.
SELECT CUSTOMER_NAME,
       NO_OF_ORDERS
FROM
(
    SELECT C.CUSTOMER_NAME,
           COUNT(O.ORDER_ID) AS NO_OF_ORDERS
    FROM CUSTOMERS C
    JOIN ORDERS O
    ON C.CUSTOMER_ID = O.CUSTOMER_ID
    GROUP BY C.CUSTOMER_NAME
    ORDER BY NO_OF_ORDERS DESC
)
WHERE ROWNUM = 1;


-- Q20. Find the customer with the highest total payment.
SELECT CUSTOMER_NAME,
       TOTAL_PAID
FROM
(
    SELECT C.CUSTOMER_NAME,
           SUM(PM.AMOUNT) AS TOTAL_PAID
    FROM CUSTOMERS C
    JOIN ORDERS O
    ON C.CUSTOMER_ID = O.CUSTOMER_ID
    JOIN PAYMENTS PM
    ON O.ORDER_ID = PM.ORDER_ID
    GROUP BY C.CUSTOMER_NAME
    ORDER BY TOTAL_PAID DESC
)
WHERE ROWNUM = 1;


-- =====================================================
-- LEVEL 3: PRODUCT ANALYSIS
-- Q21-Q30
-- =====================================================

-- Q21. Find total quantity sold for each product.
SELECT P.PRODUCT_NAME,
       SUM(OI.QUANTITY) AS TOTAL_SOLD
FROM PRODUCTS P
JOIN ORDER_ITEMS OI
ON P.PRODUCT_ID = OI.PRODUCT_ID
GROUP BY P.PRODUCT_NAME;


-- Q22. Find products that have never been sold.
SELECT P.PRODUCT_NAME
FROM PRODUCTS P
LEFT JOIN ORDER_ITEMS OI
ON P.PRODUCT_ID = OI.PRODUCT_ID
WHERE OI.ORDER_ITEM_ID IS NULL;


-- Q23. Find the best-selling product by quantity.
SELECT PRODUCT_NAME,
       TOTAL_SOLD
FROM
(
    SELECT P.PRODUCT_NAME,
           SUM(OI.QUANTITY) AS TOTAL_SOLD
    FROM PRODUCTS P
    JOIN ORDER_ITEMS OI
    ON P.PRODUCT_ID = OI.PRODUCT_ID
    GROUP BY P.PRODUCT_NAME
    ORDER BY TOTAL_SOLD DESC
)
WHERE ROWNUM = 1;


-- Q24. Find products with stock below 10.
SELECT PRODUCT_NAME,
       STOCK
FROM PRODUCTS
WHERE STOCK < 10;


-- Q25. Find products priced above the average product price.
SELECT PRODUCT_NAME,
       PRICE
FROM PRODUCTS
WHERE PRICE > (SELECT AVG(PRICE) FROM PRODUCTS);


-- Q26. Find products whose total sales value exceeds 50000.
SELECT P.PRODUCT_NAME,
       SUM(OI.QUANTITY * OI.PRICE) AS TOTAL_SALES
FROM PRODUCTS P
JOIN ORDER_ITEMS OI
ON P.PRODUCT_ID = OI.PRODUCT_ID
GROUP BY P.PRODUCT_NAME
HAVING SUM(OI.QUANTITY * OI.PRICE) > 50000;


-- Q27. Find the most expensive product.
SELECT PRODUCT_NAME,
       PRICE
FROM
(
    SELECT PRODUCT_NAME,
           PRICE
    FROM PRODUCTS
    ORDER BY PRICE DESC
)
WHERE ROWNUM = 1;


-- Q28. Find the second-highest product price.
SELECT MAX(PRICE) AS SECOND_HIGHEST_PRICE
FROM PRODUCTS
WHERE PRICE < (SELECT MAX(PRICE) FROM PRODUCTS);


-- Q29. Find products having stock greater than the average stock.
SELECT PRODUCT_NAME,
       STOCK
FROM PRODUCTS
WHERE STOCK > (SELECT AVG(STOCK) FROM PRODUCTS);


-- Q30. Find products whose price is greater than 1000 and stock is less than 20.
SELECT PRODUCT_NAME,
       PRICE,
       STOCK
FROM PRODUCTS
WHERE PRICE > 1000
AND STOCK < 20;


-- =====================================================
-- LEVEL 4: CATEGORY & SUPPLIER ANALYSIS
-- Q31-Q40
-- =====================================================

-- Q31. Find number of products in each category.
SELECT C.CATEGORY_NAME,
       COUNT(P.PRODUCT_ID) AS NO_OF_PRODUCTS
FROM CATEGORIES C
LEFT JOIN PRODUCTS P
ON C.CATEGORY_ID = P.CATEGORY_ID
GROUP BY C.CATEGORY_NAME;


-- Q32. Find category with the highest number of products.
SELECT CATEGORY_NAME,
       NO_OF_PRODUCTS
FROM
(
    SELECT C.CATEGORY_NAME,
           COUNT(P.PRODUCT_ID) AS NO_OF_PRODUCTS
    FROM CATEGORIES C
    JOIN PRODUCTS P
    ON C.CATEGORY_ID = P.CATEGORY_ID
    GROUP BY C.CATEGORY_NAME
    ORDER BY NO_OF_PRODUCTS DESC
)
WHERE ROWNUM = 1;


-- Q33. Find total stock for each category.
SELECT C.CATEGORY_NAME,
       SUM(P.STOCK) AS TOTAL_STOCK
FROM CATEGORIES C
JOIN PRODUCTS P
ON C.CATEGORY_ID = P.CATEGORY_ID
GROUP BY C.CATEGORY_NAME;


-- Q34. Find categories having total stock greater than 500.
SELECT C.CATEGORY_NAME,
       SUM(P.STOCK) AS TOTAL_STOCK
FROM CATEGORIES C
JOIN PRODUCTS P
ON C.CATEGORY_ID = P.CATEGORY_ID
GROUP BY C.CATEGORY_NAME
HAVING SUM(P.STOCK) > 500;


-- Q35. Find total products supplied by each supplier.
SELECT S.SUPPLIER_NAME,
       COUNT(P.PRODUCT_ID) AS NO_OF_PRODUCTS
FROM SUPPLIERS S
LEFT JOIN PRODUCTS P
ON S.SUPPLIER_ID = P.SUPPLIER_ID
GROUP BY S.SUPPLIER_NAME;


-- Q36. Find suppliers who supply more than 3 products.
SELECT S.SUPPLIER_NAME,
       COUNT(P.PRODUCT_ID) AS NO_OF_PRODUCTS
FROM SUPPLIERS S
JOIN PRODUCTS P
ON S.SUPPLIER_ID = P.SUPPLIER_ID
GROUP BY S.SUPPLIER_NAME
HAVING COUNT(P.PRODUCT_ID) > 3;


-- Q37. Find suppliers who have never supplied a product.
SELECT S.SUPPLIER_NAME
FROM SUPPLIERS S
LEFT JOIN PRODUCTS P
ON S.SUPPLIER_ID = P.SUPPLIER_ID
WHERE P.PRODUCT_ID IS NULL;


-- Q38. Find total purchase quantity for each supplier.
SELECT S.SUPPLIER_NAME,
       SUM(PU.QUANTITY) AS TOTAL_PURCHASE_QTY
FROM SUPPLIERS S
JOIN PURCHASES PU
ON S.SUPPLIER_ID = PU.SUPPLIER_ID
GROUP BY S.SUPPLIER_NAME;


-- Q39. Find suppliers whose total purchase quantity exceeds 200.
SELECT S.SUPPLIER_NAME,
       SUM(PU.QUANTITY) AS TOTAL_PURCHASE_QTY
FROM SUPPLIERS S
JOIN PURCHASES PU
ON S.SUPPLIER_ID = PU.SUPPLIER_ID
GROUP BY S.SUPPLIER_NAME
HAVING SUM(PU.QUANTITY) > 200;


-- Q40. Find the supplier supplying the highest number of products.
SELECT SUPPLIER_NAME,
       NO_OF_PRODUCTS
FROM
(
    SELECT S.SUPPLIER_NAME,
           COUNT(P.PRODUCT_ID) AS NO_OF_PRODUCTS
    FROM SUPPLIERS S
    JOIN PRODUCTS P
    ON S.SUPPLIER_ID = P.SUPPLIER_ID
    GROUP BY S.SUPPLIER_NAME
    ORDER BY NO_OF_PRODUCTS DESC
)
WHERE ROWNUM = 1;


-- =====================================================
-- LEVEL 5: SALES ANALYSIS
-- Q41-Q50
-- =====================================================

-- Q41. Find total sales value for each product.
SELECT P.PRODUCT_NAME,
       SUM(OI.QUANTITY * OI.PRICE) AS TOTAL_SALES
FROM PRODUCTS P
JOIN ORDER_ITEMS OI
ON P.PRODUCT_ID = OI.PRODUCT_ID
GROUP BY P.PRODUCT_NAME;


-- Q42. Find total sales value for each customer.
SELECT C.CUSTOMER_NAME,
       SUM(OI.QUANTITY * OI.PRICE) AS TOTAL_SALES
FROM CUSTOMERS C
JOIN ORDERS O
ON C.CUSTOMER_ID = O.CUSTOMER_ID
JOIN ORDER_ITEMS OI
ON O.ORDER_ID = OI.ORDER_ID
GROUP BY C.CUSTOMER_NAME;


-- Q43. Find total sales value for each category.
SELECT C.CATEGORY_NAME,
       SUM(OI.QUANTITY * OI.PRICE) AS TOTAL_SALES
FROM CATEGORIES C
JOIN PRODUCTS P
ON C.CATEGORY_ID = P.CATEGORY_ID
JOIN ORDER_ITEMS OI
ON P.PRODUCT_ID = OI.PRODUCT_ID
GROUP BY C.CATEGORY_NAME;


-- Q44. Find total sales value for each supplier.
SELECT S.SUPPLIER_NAME,
       SUM(OI.QUANTITY * OI.PRICE) AS TOTAL_SALES
FROM SUPPLIERS S
JOIN PRODUCTS P
ON S.SUPPLIER_ID = P.SUPPLIER_ID
JOIN ORDER_ITEMS OI
ON P.PRODUCT_ID = OI.PRODUCT_ID
GROUP BY S.SUPPLIER_NAME;


-- Q45. Find the highest-value order item.
SELECT OI.ORDER_ITEM_ID,
       OI.QUANTITY,
       OI.PRICE,
       OI.QUANTITY * OI.PRICE AS SALES_VALUE
FROM
(
    SELECT OI.*,
           OI.QUANTITY * OI.PRICE AS SALES_VALUE
    FROM ORDER_ITEMS OI
    ORDER BY SALES_VALUE DESC
)
WHERE ROWNUM = 1;


-- Q46. Find orders whose total value exceeds 10000.
SELECT O.ORDER_ID,
       SUM(OI.QUANTITY * OI.PRICE) AS ORDER_VALUE
FROM ORDERS O
JOIN ORDER_ITEMS OI
ON O.ORDER_ID = OI.ORDER_ID
GROUP BY O.ORDER_ID
HAVING SUM(OI.QUANTITY * OI.PRICE) > 10000;


-- Q47. Find average order value.
SELECT AVG(ORDER_VALUE) AS AVERAGE_ORDER_VALUE
FROM
(
    SELECT ORDER_ID,
           SUM(QUANTITY * PRICE) AS ORDER_VALUE
    FROM ORDER_ITEMS
    GROUP BY ORDER_ID
);


-- Q48. Find orders whose value is greater than the average order value.
SELECT ORDER_ID,
       ORDER_VALUE
FROM
(
    SELECT ORDER_ID,
           SUM(QUANTITY * PRICE) AS ORDER_VALUE
    FROM ORDER_ITEMS
    GROUP BY ORDER_ID
)
WHERE ORDER_VALUE >
(
    SELECT AVG(ORDER_VALUE)
    FROM
    (
        SELECT ORDER_ID,
               SUM(QUANTITY * PRICE) AS ORDER_VALUE
        FROM ORDER_ITEMS
        GROUP BY ORDER_ID
    )
);


-- Q49. Find the top 3 products by total sales value.
SELECT PRODUCT_NAME,
       TOTAL_SALES
FROM
(
    SELECT P.PRODUCT_NAME,
           SUM(OI.QUANTITY * OI.PRICE) AS TOTAL_SALES
    FROM PRODUCTS P
    JOIN ORDER_ITEMS OI
    ON P.PRODUCT_ID = OI.PRODUCT_ID
    GROUP BY P.PRODUCT_NAME
    ORDER BY TOTAL_SALES DESC
)
WHERE ROWNUM <= 3;


-- Q50. Find the top 3 customers by total sales value.
SELECT CUSTOMER_NAME,
       TOTAL_SALES
FROM
(
    SELECT C.CUSTOMER_NAME,
           SUM(OI.QUANTITY * OI.PRICE) AS TOTAL_SALES
    FROM CUSTOMERS C
    JOIN ORDERS O
    ON C.CUSTOMER_ID = O.CUSTOMER_ID
    JOIN ORDER_ITEMS OI
    ON O.ORDER_ID = OI.ORDER_ID
    GROUP BY C.CUSTOMER_NAME
    ORDER BY TOTAL_SALES DESC
)
WHERE ROWNUM <= 3;


-- =====================================================
-- LEVEL 6: ORDER & PAYMENT ANALYSIS
-- Q51-Q60
-- =====================================================

-- Q51. Find the number of orders for each status.
SELECT STATUS,
       COUNT(*) AS NO_OF_ORDERS
FROM ORDERS
GROUP BY STATUS;


-- Q52. Find the most common order status.
SELECT STATUS,
       NO_OF_ORDERS
FROM
(
    SELECT STATUS,
           COUNT(*) AS NO_OF_ORDERS
    FROM ORDERS
    GROUP BY STATUS
    ORDER BY NO_OF_ORDERS DESC
)
WHERE ROWNUM = 1;


-- Q53. Find employees who handled more than 5 orders.
SELECT E.EMP_NAME,
       COUNT(O.ORDER_ID) AS NO_OF_ORDERS
FROM EMPLOYEES E
JOIN ORDERS O
ON E.EMP_ID = O.EMP_ID
GROUP BY E.EMP_NAME
HAVING COUNT(O.ORDER_ID) > 5;


-- Q54. Find total orders handled by each designation.
SELECT E.DESIGNATION,
       COUNT(O.ORDER_ID) AS NO_OF_ORDERS
FROM EMPLOYEES E
JOIN ORDERS O
ON E.EMP_ID = O.EMP_ID
GROUP BY E.DESIGNATION;


-- Q55. Find payment amount by payment mode.
SELECT PAYMENT_MODE,
       SUM(AMOUNT) AS TOTAL_AMOUNT
FROM PAYMENTS
GROUP BY PAYMENT_MODE;


-- Q56. Find the most-used payment mode.
SELECT PAYMENT_MODE,
       NO_OF_PAYMENTS
FROM
(
    SELECT PAYMENT_MODE,
           COUNT(*) AS NO_OF_PAYMENTS
    FROM PAYMENTS
    GROUP BY PAYMENT_MODE
    ORDER BY NO_OF_PAYMENTS DESC
)
WHERE ROWNUM = 1;


-- Q57. Find orders without payment.
SELECT O.ORDER_ID
FROM ORDERS O
LEFT JOIN PAYMENTS PM
ON O.ORDER_ID = PM.ORDER_ID
WHERE PM.PAYMENT_ID IS NULL;


-- Q58. Find payments that do not have a matching order.
SELECT PM.PAYMENT_ID,
       PM.ORDER_ID
FROM PAYMENTS PM
LEFT JOIN ORDERS O
ON PM.ORDER_ID = O.ORDER_ID
WHERE O.ORDER_ID IS NULL;


-- Q59. Find orders having more than one payment.
SELECT ORDER_ID,
       COUNT(PAYMENT_ID) AS NO_OF_PAYMENTS
FROM PAYMENTS
GROUP BY ORDER_ID
HAVING COUNT(PAYMENT_ID) > 1;


-- Q60. Find customers whose total payment is greater than their total sales value.
SELECT C.CUSTOMER_NAME,
       SUM(PM.AMOUNT) AS TOTAL_PAID,
       SUM(OI.QUANTITY * OI.PRICE) AS TOTAL_SALES
FROM CUSTOMERS C
JOIN ORDERS O
ON C.CUSTOMER_ID = O.CUSTOMER_ID
JOIN ORDER_ITEMS OI
ON O.ORDER_ID = OI.ORDER_ID
JOIN PAYMENTS PM
ON O.ORDER_ID = PM.ORDER_ID
GROUP BY C.CUSTOMER_NAME
HAVING SUM(PM.AMOUNT) > SUM(OI.QUANTITY * OI.PRICE);


-- =====================================================
-- LEVEL 7: DATE-BASED BUSINESS ANALYSIS
-- Q61-Q70
-- =====================================================

-- Q61. Find orders placed in 2025.
SELECT ORDER_ID,
       ORDER_DATE
FROM ORDERS
WHERE ORDER_DATE >= DATE '2025-01-01'
AND ORDER_DATE < DATE '2026-01-01';


-- Q62. Find the number of orders placed in each year.
SELECT EXTRACT(YEAR FROM ORDER_DATE) AS ORDER_YEAR,
       COUNT(*) AS NO_OF_ORDERS
FROM ORDERS
GROUP BY EXTRACT(YEAR FROM ORDER_DATE);


-- Q63. Find the number of orders placed in each month.
SELECT TO_CHAR(ORDER_DATE,'YYYY-MM') AS ORDER_MONTH,
       COUNT(*) AS NO_OF_ORDERS
FROM ORDERS
GROUP BY TO_CHAR(ORDER_DATE,'YYYY-MM')
ORDER BY ORDER_MONTH;


-- Q64. Find the total sales value for each month.
SELECT TO_CHAR(O.ORDER_DATE,'YYYY-MM') AS ORDER_MONTH,
       SUM(OI.QUANTITY * OI.PRICE) AS TOTAL_SALES
FROM ORDERS O
JOIN ORDER_ITEMS OI
ON O.ORDER_ID = OI.ORDER_ID
GROUP BY TO_CHAR(O.ORDER_DATE,'YYYY-MM')
ORDER BY ORDER_MONTH;


-- Q65. Find the latest order in the system.
SELECT ORDER_ID,
       ORDER_DATE
FROM
(
    SELECT ORDER_ID,
           ORDER_DATE
    FROM ORDERS
    ORDER BY ORDER_DATE DESC
)
WHERE ROWNUM = 1;


-- Q66. Find the earliest order in the system.
SELECT ORDER_ID,
       ORDER_DATE
FROM
(
    SELECT ORDER_ID,
           ORDER_DATE
    FROM ORDERS
    ORDER BY ORDER_DATE ASC
)
WHERE ROWNUM = 1;


-- Q67. Find customers who placed an order in 2025.
SELECT DISTINCT C.CUSTOMER_NAME
FROM CUSTOMERS C
JOIN ORDERS O
ON C.CUSTOMER_ID = O.CUSTOMER_ID
WHERE O.ORDER_DATE >= DATE '2025-01-01'
AND O.ORDER_DATE < DATE '2026-01-01';


-- Q68. Find the number of orders placed on each day.
SELECT ORDER_DATE,
       COUNT(*) AS NO_OF_ORDERS
FROM ORDERS
GROUP BY ORDER_DATE
ORDER BY ORDER_DATE;


-- Q69. Find the number of payments made in each month.
SELECT TO_CHAR(PAYMENT_DATE,'YYYY-MM') AS PAYMENT_MONTH,
       COUNT(*) AS NO_OF_PAYMENTS
FROM PAYMENTS
GROUP BY TO_CHAR(PAYMENT_DATE,'YYYY-MM')
ORDER BY PAYMENT_MONTH;


-- Q70. Find total payment amount collected in each month.
SELECT TO_CHAR(PAYMENT_DATE,'YYYY-MM') AS PAYMENT_MONTH,
       SUM(AMOUNT) AS TOTAL_PAYMENT
FROM PAYMENTS
GROUP BY TO_CHAR(PAYMENT_DATE,'YYYY-MM')
ORDER BY PAYMENT_MONTH;


-- =====================================================
-- LEVEL 8: ADVANCED SUBQUERIES
-- Q71-Q80
-- =====================================================

-- Q71. Find products priced above their category average price.
SELECT P.PRODUCT_NAME,
       P.PRICE,
       P.CATEGORY_ID
FROM PRODUCTS P
WHERE P.PRICE >
(
    SELECT AVG(P2.PRICE)
    FROM PRODUCTS P2
    WHERE P2.CATEGORY_ID = P.CATEGORY_ID
);


-- Q72. Find employees earning more than the average employee salary.
SELECT EMP_NAME,
       SALARY
FROM EMPLOYEES
WHERE SALARY > (SELECT AVG(SALARY) FROM EMPLOYEES);


-- Q73. Find employees earning the highest salary.
SELECT EMP_NAME,
       SALARY
FROM EMPLOYEES
WHERE SALARY = (SELECT MAX(SALARY) FROM EMPLOYEES);


-- Q74. Find products with the second-highest price.
SELECT PRODUCT_NAME,
       PRICE
FROM PRODUCTS
WHERE PRICE =
(
    SELECT MAX(PRICE)
    FROM PRODUCTS
    WHERE PRICE < (SELECT MAX(PRICE) FROM PRODUCTS)
);


-- Q75. Find customers whose order count is above the average order count per customer.
SELECT CUSTOMER_NAME,
       NO_OF_ORDERS
FROM
(
    SELECT C.CUSTOMER_NAME,
           COUNT(O.ORDER_ID) AS NO_OF_ORDERS
    FROM CUSTOMERS C
    JOIN ORDERS O
    ON C.CUSTOMER_ID = O.CUSTOMER_ID
    GROUP BY C.CUSTOMER_NAME
)
WHERE NO_OF_ORDERS >
(
    SELECT AVG(NO_OF_ORDERS)
    FROM
    (
        SELECT CUSTOMER_ID,
               COUNT(*) AS NO_OF_ORDERS
        FROM ORDERS
        GROUP BY CUSTOMER_ID
    )
);


-- Q76. Find products that have been purchased but never sold.
SELECT P.PRODUCT_NAME
FROM PRODUCTS P
WHERE EXISTS
(
    SELECT 1
    FROM PURCHASES PU
    WHERE PU.PRODUCT_ID = P.PRODUCT_ID
)
AND NOT EXISTS
(
    SELECT 1
    FROM ORDER_ITEMS OI
    WHERE OI.PRODUCT_ID = P.PRODUCT_ID
);


-- Q77. Find customers who have placed at least one order.
SELECT C.CUSTOMER_NAME
FROM CUSTOMERS C
WHERE EXISTS
(
    SELECT 1
    FROM ORDERS O
    WHERE O.CUSTOMER_ID = C.CUSTOMER_ID
);


-- Q78. Find suppliers whose products have been purchased.
SELECT DISTINCT S.SUPPLIER_NAME
FROM SUPPLIERS S
JOIN PRODUCTS P
ON S.SUPPLIER_ID = P.SUPPLIER_ID
WHERE EXISTS
(
    SELECT 1
    FROM PURCHASES PU
    WHERE PU.PRODUCT_ID = P.PRODUCT_ID
);


-- Q79. Find categories whose average product price is greater than the overall average price.
SELECT C.CATEGORY_NAME,
       AVG(P.PRICE) AS AVG_PRICE
FROM CATEGORIES C
JOIN PRODUCTS P
ON C.CATEGORY_ID = P.CATEGORY_ID
GROUP BY C.CATEGORY_NAME
HAVING AVG(P.PRICE) > (SELECT AVG(PRICE) FROM PRODUCTS);


-- Q80. Find employees who have handled orders in every status available.
SELECT E.EMP_NAME
FROM EMPLOYEES E
JOIN ORDERS O
ON E.EMP_ID = O.EMP_ID
GROUP BY E.EMP_NAME
HAVING COUNT(DISTINCT O.STATUS) =
(
    SELECT COUNT(DISTINCT STATUS)
    FROM ORDERS
);


-- =====================================================
-- LEVEL 9: ANALYTICAL / INTERVIEW QUERIES
-- Q81-Q90
-- =====================================================

-- Q81. Rank products by price.
SELECT PRODUCT_NAME,
       PRICE,
       RANK() OVER (ORDER BY PRICE DESC) AS PRICE_RANK
FROM PRODUCTS;


-- Q82. Rank employees by salary.
SELECT EMP_NAME,
       SALARY,
       RANK() OVER (ORDER BY SALARY DESC) AS SALARY_RANK
FROM EMPLOYEES;


-- Q83. Find the top 3 highest-paid employees using RANK.
SELECT EMP_NAME,
       SALARY,
       SALARY_RANK
FROM
(
    SELECT EMP_NAME,
           SALARY,
           RANK() OVER (ORDER BY SALARY DESC) AS SALARY_RANK
    FROM EMPLOYEES
)
WHERE SALARY_RANK <= 3;


-- Q84. Assign row numbers to products by price descending.
SELECT PRODUCT_NAME,
       PRICE,
       ROW_NUMBER() OVER (ORDER BY PRICE DESC) AS RN
FROM PRODUCTS;


-- Q85. Find the highest-priced product in each category.
SELECT PRODUCT_NAME,
       CATEGORY_ID,
       PRICE
FROM
(
    SELECT P.*,
           ROW_NUMBER() OVER
           (
               PARTITION BY CATEGORY_ID
               ORDER BY PRICE DESC
           ) AS RN
    FROM PRODUCTS P
)
WHERE RN = 1;


-- Q86. Find the highest-selling product in each category.
SELECT PRODUCT_NAME,
       CATEGORY_ID,
       TOTAL_SALES
FROM
(
    SELECT P.PRODUCT_NAME,
           P.CATEGORY_ID,
           SUM(OI.QUANTITY * OI.PRICE) AS TOTAL_SALES,
           ROW_NUMBER() OVER
           (
               PARTITION BY P.CATEGORY_ID
               ORDER BY SUM(OI.QUANTITY * OI.PRICE) DESC
           ) AS RN
    FROM PRODUCTS P
    JOIN ORDER_ITEMS OI
    ON P.PRODUCT_ID = OI.PRODUCT_ID
    GROUP BY P.PRODUCT_NAME,
             P.CATEGORY_ID
)
WHERE RN = 1;


-- Q87. Show each employee salary along with the average salary of all employees.
SELECT EMP_NAME,
       SALARY,
       AVG(SALARY) OVER () AS AVG_SALARY
FROM EMPLOYEES;


-- Q88. Show each product price along with the average price of its category.
SELECT PRODUCT_NAME,
       CATEGORY_ID,
       PRICE,
       AVG(PRICE) OVER
       (
           PARTITION BY CATEGORY_ID
       ) AS CATEGORY_AVG_PRICE
FROM PRODUCTS;


-- Q89. Calculate running total of payment amount ordered by payment date.
SELECT PAYMENT_ID,
       PAYMENT_DATE,
       AMOUNT,
       SUM(AMOUNT) OVER
       (
           ORDER BY PAYMENT_DATE, PAYMENT_ID
       ) AS RUNNING_TOTAL
FROM PAYMENTS;


-- Q90. Find each customer's latest order using ROW_NUMBER.
SELECT CUSTOMER_NAME,
       ORDER_ID,
       ORDER_DATE
FROM
(
    SELECT C.CUSTOMER_NAME,
           O.ORDER_ID,
           O.ORDER_DATE,
           ROW_NUMBER() OVER
           (
               PARTITION BY C.CUSTOMER_ID
               ORDER BY O.ORDER_DATE DESC,
                        O.ORDER_ID DESC
           ) AS RN
    FROM CUSTOMERS C
    JOIN ORDERS O
    ON C.CUSTOMER_ID = O.CUSTOMER_ID
)
WHERE RN = 1;


-- =====================================================
-- LEVEL 10: REAL INTERVIEW SCENARIOS
-- Q91-Q100
-- =====================================================

-- Q91. Find products where total quantity sold is greater than total quantity purchased.
SELECT P.PRODUCT_NAME,
       NVL(S.SOLD_QTY,0) AS SOLD_QTY,
       NVL(B.BOUGHT_QTY,0) AS BOUGHT_QTY
FROM PRODUCTS P
LEFT JOIN
(
    SELECT PRODUCT_ID,
           SUM(QUANTITY) AS SOLD_QTY
    FROM ORDER_ITEMS
    GROUP BY PRODUCT_ID
) S
ON P.PRODUCT_ID = S.PRODUCT_ID
LEFT JOIN
(
    SELECT PRODUCT_ID,
           SUM(QUANTITY) AS BOUGHT_QTY
    FROM PURCHASES
    GROUP BY PRODUCT_ID
) B
ON P.PRODUCT_ID = B.PRODUCT_ID
WHERE NVL(S.SOLD_QTY,0) > NVL(B.BOUGHT_QTY,0);


-- Q92. Find products where current stock is less than total quantity sold.
SELECT P.PRODUCT_NAME,
       P.STOCK,
       NVL(S.SOLD_QTY,0) AS SOLD_QTY
FROM PRODUCTS P
LEFT JOIN
(
    SELECT PRODUCT_ID,
           SUM(QUANTITY) AS SOLD_QTY
    FROM ORDER_ITEMS
    GROUP BY PRODUCT_ID
) S
ON P.PRODUCT_ID = S.PRODUCT_ID
WHERE P.STOCK < NVL(S.SOLD_QTY,0);


-- Q93. Find customers with more than 2 orders and total sales above 20000.
SELECT C.CUSTOMER_NAME,
       COUNT(DISTINCT O.ORDER_ID) AS NO_OF_ORDERS,
       SUM(OI.QUANTITY * OI.PRICE) AS TOTAL_SALES
FROM CUSTOMERS C
JOIN ORDERS O
ON C.CUSTOMER_ID = O.CUSTOMER_ID
JOIN ORDER_ITEMS OI
ON O.ORDER_ID = OI.ORDER_ID
GROUP BY C.CUSTOMER_NAME
HAVING COUNT(DISTINCT O.ORDER_ID) > 2
AND SUM(OI.QUANTITY * OI.PRICE) > 20000;


-- Q94. Find employees whose handled-order count is above the average employee order count.
SELECT E.EMP_NAME,
       COUNT(O.ORDER_ID) AS NO_OF_ORDERS
FROM EMPLOYEES E
JOIN ORDERS O
ON E.EMP_ID = O.EMP_ID
GROUP BY E.EMP_NAME
HAVING COUNT(O.ORDER_ID) >
(
    SELECT AVG(NO_OF_ORDERS)
    FROM
    (
        SELECT EMP_ID,
               COUNT(*) AS NO_OF_ORDERS
        FROM ORDERS
        GROUP BY EMP_ID
    )
);


-- Q95. Find the category contributing the highest total sales.
SELECT CATEGORY_NAME,
       TOTAL_SALES
FROM
(
    SELECT C.CATEGORY_NAME,
           SUM(OI.QUANTITY * OI.PRICE) AS TOTAL_SALES
    FROM CATEGORIES C
    JOIN PRODUCTS P
    ON C.CATEGORY_ID = P.CATEGORY_ID
    JOIN ORDER_ITEMS OI
    ON P.PRODUCT_ID = OI.PRODUCT_ID
    GROUP BY C.CATEGORY_NAME
    ORDER BY TOTAL_SALES DESC
)
WHERE ROWNUM = 1;


-- Q96. Find customers who have ordered every product in a particular category.
-- Replace 1 with the required CATEGORY_ID.
SELECT C.CUSTOMER_NAME
FROM CUSTOMERS C
JOIN ORDERS O
ON C.CUSTOMER_ID = O.CUSTOMER_ID
JOIN ORDER_ITEMS OI
ON O.ORDER_ID = OI.ORDER_ID
JOIN PRODUCTS P
ON OI.PRODUCT_ID = P.PRODUCT_ID
WHERE P.CATEGORY_ID = 1
GROUP BY C.CUSTOMER_NAME
HAVING COUNT(DISTINCT P.PRODUCT_ID) =
(
    SELECT COUNT(*)
    FROM PRODUCTS
    WHERE CATEGORY_ID = 1
);


-- Q97. Find suppliers whose supplied products have both sales and purchase records.
SELECT DISTINCT S.SUPPLIER_NAME
FROM SUPPLIERS S
JOIN PRODUCTS P
ON S.SUPPLIER_ID = P.SUPPLIER_ID
WHERE EXISTS
(
    SELECT 1
    FROM PURCHASES PU
    WHERE PU.PRODUCT_ID = P.PRODUCT_ID
)
AND EXISTS
(
    SELECT 1
    FROM ORDER_ITEMS OI
    WHERE OI.PRODUCT_ID = P.PRODUCT_ID
);


-- Q98. Find duplicate product prices.
SELECT PRICE,
       COUNT(*) AS NO_OF_PRODUCTS
FROM PRODUCTS
GROUP BY PRICE
HAVING COUNT(*) > 1
ORDER BY PRICE DESC;


-- Q99. Find the second-highest salary using DENSE_RANK.
SELECT EMP_NAME,
       SALARY
FROM
(
    SELECT EMP_NAME,
           SALARY,
           DENSE_RANK() OVER (ORDER BY SALARY DESC) AS SALARY_RANK
    FROM EMPLOYEES
)
WHERE SALARY_RANK = 2;


-- Q100. Find the employee who handled the highest number of orders.
SELECT EMP_NAME,
       NO_OF_ORDERS
FROM
(
    SELECT E.EMP_NAME,
           COUNT(O.ORDER_ID) AS NO_OF_ORDERS,
           RANK() OVER
           (
               ORDER BY COUNT(O.ORDER_ID) DESC
           ) AS RNK
    FROM EMPLOYEES E
    JOIN ORDERS O
    ON E.EMP_ID = O.EMP_ID
    GROUP BY E.EMP_NAME
)
WHERE RNK = 1;


-- =====================================================
-- PRACTICE ORDER
-- =====================================================

-- Q01-Q10   : Business Basics
-- Q11-Q20   : Customer Analysis
-- Q21-Q30   : Product Analysis
-- Q31-Q40   : Category & Supplier Analysis
-- Q41-Q50   : Sales Analysis
-- Q51-Q60   : Order & Payment Analysis
-- Q61-Q70   : Date-Based Business Analysis
-- Q71-Q80   : Advanced Subqueries
-- Q81-Q90   : Analytical / Interview Queries
-- Q91-Q100  : Real Interview Scenarios

-- =====================================================
-- IMPORTANT TABLE RELATIONSHIPS
-- =====================================================

-- CUSTOMERS
-- CUSTOMER_ID -> ORDERS.CUSTOMER_ID

-- EMPLOYEES
-- EMP_ID -> ORDERS.EMP_ID

-- CATEGORIES
-- CATEGORY_ID -> PRODUCTS.CATEGORY_ID

-- SUPPLIERS
-- SUPPLIER_ID -> PRODUCTS.SUPPLIER_ID

-- PRODUCTS
-- PRODUCT_ID -> ORDER_ITEMS.PRODUCT_ID
-- PRODUCT_ID -> PURCHASES.PRODUCT_ID
-- PRODUCT_ID -> INVENTORY_LOG.PRODUCT_ID

-- ORDERS
-- ORDER_ID -> ORDER_ITEMS.ORDER_ID
-- ORDER_ID -> PAYMENTS.ORDER_ID

-- =====================================================
-- END OF REAL-WORLD INTERVIEW SQL
-- =====================================================

SPOOL OFF