-- =====================================================
-- ORACLE SQL ANALYTICAL FUNCTIONS
-- RULES, SYNTAX & 100 QUESTIONS WITH ANSWERS
-- Oracle 11g
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

SPOOL 'F:\Exploring Technologies\OrcaleSqlPlusExploring\Oracle_Inventory_Sales_Management_System\Queries\12_Analytical_Functions\12_ANALYTICAL_FUNCTIONS_TEST_OUTPUT.txt'

-- =====================================================
-- ANALYTICAL FUNCTIONS
-- =====================================================

-- Analytical functions calculate values across a set of rows
-- while still returning individual rows.

-- =====================================================
-- BASIC SYNTAX
-- =====================================================

-- FUNCTION() OVER (
--     PARTITION BY column
--     ORDER BY column
-- )

-- =====================================================
-- IMPORTANT ANALYTICAL FUNCTIONS
-- =====================================================

-- ROW_NUMBER()
-- Gives a unique sequential number to each row.

-- RANK()
-- Gives ranking with gaps when ties occur.

-- DENSE_RANK()
-- Gives ranking without gaps when ties occur.

-- LAG()
-- Accesses a previous row.

-- LEAD()
-- Accesses a following row.

-- FIRST_VALUE()
-- Returns the first value within the analytical window.

-- LAST_VALUE()
-- Returns the last value within the analytical window.

-- SUM() OVER()
-- Calculates total or running total without GROUP BY.

-- AVG() OVER()
-- Calculates average across rows without GROUP BY.

-- COUNT() OVER()
-- Calculates row count across a window.

-- MIN() OVER()
-- Finds minimum value across a window.

-- MAX() OVER()
-- Finds maximum value across a window.

-- =====================================================
-- ANALYTICAL FUNCTION RULES
-- =====================================================

-- RULE 01:
-- Analytical functions use the OVER() clause.

-- RULE 02:
-- Analytical functions return one result for each input row.

-- RULE 03:
-- GROUP BY reduces rows, but analytical functions do not reduce rows.

-- RULE 04:
-- PARTITION BY divides rows into separate groups.

-- RULE 05:
-- ORDER BY inside OVER() controls analytical calculation order.

-- RULE 06:
-- ROW_NUMBER() always produces unique sequential numbers.

-- RULE 07:
-- RANK() gives the same rank to tied rows and leaves gaps.

-- RULE 08:
-- DENSE_RANK() gives the same rank to tied rows without gaps.

-- RULE 09:
-- LAG() accesses a previous row.

-- RULE 10:
-- LEAD() accesses a following row.

-- RULE 11:
-- SUM() OVER() can calculate running totals.

-- RULE 12:
-- AVG() OVER() can calculate running averages.

-- RULE 13:
-- PARTITION BY is optional.

-- RULE 14:
-- ORDER BY inside OVER() is optional for some analytical functions.

-- RULE 15:
-- Analytical functions are normally written in the SELECT list.

-- RULE 16:
-- Analytical functions can be used in an outer query for filtering.

-- RULE 17:
-- Oracle 11g does not support the FETCH FIRST syntax.

-- RULE 18:
-- For Top-N analytical queries, ROW_NUMBER(), RANK(), or DENSE_RANK()
-- can be used in a subquery.

-- RULE 19:
-- RANK() may produce duplicate ranking numbers.

-- RULE 20:
-- DENSE_RANK() does not leave gaps after ties.

-- =====================================================
-- EXECUTION ORDER
-- =====================================================

-- FROM
-- WHERE
-- GROUP BY
-- HAVING
-- SELECT
-- ANALYTICAL FUNCTIONS
-- ORDER BY

-- =====================================================
-- LEVEL 1
-- ROW_NUMBER()
-- =====================================================

-- Q01. Assign a unique row number to every product ordered by product_id.
SELECT PRODUCT_ID,
       PRODUCT_NAME,
       ROW_NUMBER() OVER (ORDER BY PRODUCT_ID) AS ROW_NUM
FROM PRODUCTS;

-- Q02. Assign row numbers to products ordered by price from highest to lowest.
SELECT PRODUCT_NAME,
       PRICE,
       ROW_NUMBER() OVER (ORDER BY PRICE DESC) AS ROW_NUM
FROM PRODUCTS;

-- Q03. Assign row numbers to employees ordered by salary from highest to lowest.
SELECT EMP_NAME,
       SALARY,
       ROW_NUMBER() OVER (ORDER BY SALARY DESC) AS ROW_NUM
FROM EMPLOYEES;

-- Q04. Assign row numbers to customers ordered alphabetically by customer name.
SELECT CUSTOMER_NAME,
       ROW_NUMBER() OVER (ORDER BY CUSTOMER_NAME) AS ROW_NUM
FROM CUSTOMERS;

-- Q05. Assign row numbers to orders ordered by order date.
SELECT ORDER_ID,
       ORDER_DATE,
       ROW_NUMBER() OVER (ORDER BY ORDER_DATE) AS ROW_NUM
FROM ORDERS;

-- Q06. Assign row numbers to payments ordered by amount from highest to lowest.
SELECT PAYMENT_ID,
       AMOUNT,
       ROW_NUMBER() OVER (ORDER BY AMOUNT DESC) AS ROW_NUM
FROM PAYMENTS;

-- Q07. Assign row numbers to products within each category based on price descending.
SELECT PRODUCT_NAME,
       CATEGORY_ID,
       PRICE,
       ROW_NUMBER() OVER (
           PARTITION BY CATEGORY_ID
           ORDER BY PRICE DESC
       ) AS ROW_NUM
FROM PRODUCTS;

-- Q08. Assign row numbers to employees within each designation based on salary descending.
SELECT EMP_NAME,
       DESIGNATION,
       SALARY,
       ROW_NUMBER() OVER (
           PARTITION BY DESIGNATION
           ORDER BY SALARY DESC
       ) AS ROW_NUM
FROM EMPLOYEES;

-- Q09. Assign row numbers to orders for each customer based on order date.
SELECT ORDER_ID,
       CUSTOMER_ID,
       ORDER_DATE,
       ROW_NUMBER() OVER (
           PARTITION BY CUSTOMER_ID
           ORDER BY ORDER_DATE
       ) AS ORDER_NUM
FROM ORDERS;

-- Q10. Assign row numbers to order items within each order based on quantity descending.
SELECT ORDER_ITEM_ID,
       ORDER_ID,
       QUANTITY,
       ROW_NUMBER() OVER (
           PARTITION BY ORDER_ID
           ORDER BY QUANTITY DESC
       ) AS ITEM_NUM
FROM ORDER_ITEMS;

-- =====================================================
-- LEVEL 2
-- RANK()
-- =====================================================

-- Q11. Rank employees by salary from highest to lowest.
SELECT EMP_NAME,
       SALARY,
       RANK() OVER (ORDER BY SALARY DESC) AS SALARY_RANK
FROM EMPLOYEES;

-- Q12. Rank products by price from highest to lowest.
SELECT PRODUCT_NAME,
       PRICE,
       RANK() OVER (ORDER BY PRICE DESC) AS PRICE_RANK
FROM PRODUCTS;

-- Q13. Rank employees within each designation based on salary.
SELECT EMP_NAME,
       DESIGNATION,
       SALARY,
       RANK() OVER (
           PARTITION BY DESIGNATION
           ORDER BY SALARY DESC
       ) AS DESIGNATION_RANK
FROM EMPLOYEES;

-- Q14. Rank products within each category based on price.
SELECT PRODUCT_NAME,
       CATEGORY_ID,
       PRICE,
       RANK() OVER (
           PARTITION BY CATEGORY_ID
           ORDER BY PRICE DESC
       ) AS CATEGORY_RANK
FROM PRODUCTS;

-- Q15. Rank customers based on total payment amount.
SELECT C.CUSTOMER_NAME,
       SUM(PM.AMOUNT) AS TOTAL_PAID,
       RANK() OVER (
           ORDER BY SUM(PM.AMOUNT) DESC
       ) AS PAYMENT_RANK
FROM CUSTOMERS C
JOIN ORDERS O
    ON C.CUSTOMER_ID = O.CUSTOMER_ID
JOIN PAYMENTS PM
    ON O.ORDER_ID = PM.ORDER_ID
GROUP BY C.CUSTOMER_NAME;

-- Q16. Rank suppliers based on total purchase quantity.
SELECT S.SUPPLIER_NAME,
       SUM(PU.QUANTITY) AS TOTAL_QUANTITY,
       RANK() OVER (
           ORDER BY SUM(PU.QUANTITY) DESC
       ) AS SUPPLIER_RANK
FROM SUPPLIERS S
JOIN PURCHASES PU
    ON S.SUPPLIER_ID = PU.SUPPLIER_ID
GROUP BY S.SUPPLIER_NAME;

-- Q17. Rank categories based on total product stock.
SELECT C.CATEGORY_NAME,
       SUM(P.STOCK) AS TOTAL_STOCK,
       RANK() OVER (
           ORDER BY SUM(P.STOCK) DESC
       ) AS STOCK_RANK
FROM CATEGORIES C
JOIN PRODUCTS P
    ON C.CATEGORY_ID = P.CATEGORY_ID
GROUP BY C.CATEGORY_NAME;

-- Q18. Rank products based on total quantity sold.
SELECT P.PRODUCT_NAME,
       SUM(OI.QUANTITY) AS TOTAL_SOLD,
       RANK() OVER (
           ORDER BY SUM(OI.QUANTITY) DESC
       ) AS SALES_RANK
FROM PRODUCTS P
JOIN ORDER_ITEMS OI
    ON P.PRODUCT_ID = OI.PRODUCT_ID
GROUP BY P.PRODUCT_NAME;

-- Q19. Rank employees based on number of orders handled.
SELECT E.EMP_NAME,
       COUNT(O.ORDER_ID) AS NO_OF_ORDERS,
       RANK() OVER (
           ORDER BY COUNT(O.ORDER_ID) DESC
       ) AS ORDER_RANK
FROM EMPLOYEES E
JOIN ORDERS O
    ON E.EMP_ID = O.EMP_ID
GROUP BY E.EMP_NAME;

-- Q20. Rank payment modes based on total payment amount.
SELECT PAYMENT_MODE,
       SUM(AMOUNT) AS TOTAL_AMOUNT,
       RANK() OVER (
           ORDER BY SUM(AMOUNT) DESC
       ) AS PAYMENT_MODE_RANK
FROM PAYMENTS
GROUP BY PAYMENT_MODE;

-- =====================================================
-- LEVEL 3
-- DENSE_RANK()
-- =====================================================

-- Q21. Dense rank employees by salary.
SELECT EMP_NAME,
       SALARY,
       DENSE_RANK() OVER (ORDER BY SALARY DESC) AS SALARY_RANK
FROM EMPLOYEES;

-- Q22. Dense rank products by price.
SELECT PRODUCT_NAME,
       PRICE,
       DENSE_RANK() OVER (ORDER BY PRICE DESC) AS PRICE_RANK
FROM PRODUCTS;

-- Q23. Dense rank employees within each designation.
SELECT EMP_NAME,
       DESIGNATION,
       SALARY,
       DENSE_RANK() OVER (
           PARTITION BY DESIGNATION
           ORDER BY SALARY DESC
       ) AS DESIGNATION_RANK
FROM EMPLOYEES;

-- Q24. Dense rank products within each category.
SELECT PRODUCT_NAME,
       CATEGORY_ID,
       PRICE,
       DENSE_RANK() OVER (
           PARTITION BY CATEGORY_ID
           ORDER BY PRICE DESC
       ) AS CATEGORY_RANK
FROM PRODUCTS;

-- Q25. Dense rank customers based on total payment.
SELECT C.CUSTOMER_NAME,
       SUM(PM.AMOUNT) AS TOTAL_PAID,
       DENSE_RANK() OVER (
           ORDER BY SUM(PM.AMOUNT) DESC
       ) AS PAYMENT_RANK
FROM CUSTOMERS C
JOIN ORDERS O
    ON C.CUSTOMER_ID = O.CUSTOMER_ID
JOIN PAYMENTS PM
    ON O.ORDER_ID = PM.ORDER_ID
GROUP BY C.CUSTOMER_NAME;

-- Q26. Dense rank suppliers based on purchase quantity.
SELECT S.SUPPLIER_NAME,
       SUM(PU.QUANTITY) AS TOTAL_QUANTITY,
       DENSE_RANK() OVER (
           ORDER BY SUM(PU.QUANTITY) DESC
       ) AS SUPPLIER_RANK
FROM SUPPLIERS S
JOIN PURCHASES PU
    ON S.SUPPLIER_ID = PU.SUPPLIER_ID
GROUP BY S.SUPPLIER_NAME;

-- Q27. Dense rank categories by total sales value.
SELECT C.CATEGORY_NAME,
       SUM(OI.QUANTITY * OI.PRICE) AS TOTAL_SALES,
       DENSE_RANK() OVER (
           ORDER BY SUM(OI.QUANTITY * OI.PRICE) DESC
       ) AS SALES_RANK
FROM CATEGORIES C
JOIN PRODUCTS P
    ON C.CATEGORY_ID = P.CATEGORY_ID
JOIN ORDER_ITEMS OI
    ON P.PRODUCT_ID = OI.PRODUCT_ID
GROUP BY C.CATEGORY_NAME;

-- Q28. Dense rank products by stock.
SELECT PRODUCT_NAME,
       STOCK,
       DENSE_RANK() OVER (ORDER BY STOCK DESC) AS STOCK_RANK
FROM PRODUCTS;

-- Q29. Dense rank employees by salary within designation.
SELECT EMP_NAME,
       DESIGNATION,
       SALARY,
       DENSE_RANK() OVER (
           PARTITION BY DESIGNATION
           ORDER BY SALARY DESC
       ) AS SALARY_RANK
FROM EMPLOYEES;

-- Q30. Dense rank customers by number of orders.
SELECT C.CUSTOMER_NAME,
       COUNT(O.ORDER_ID) AS NO_OF_ORDERS,
       DENSE_RANK() OVER (
           ORDER BY COUNT(O.ORDER_ID) DESC
       ) AS ORDER_RANK
FROM CUSTOMERS C
JOIN ORDERS O
    ON C.CUSTOMER_ID = O.CUSTOMER_ID
GROUP BY C.CUSTOMER_NAME;

-- =====================================================
-- LEVEL 4
-- PARTITION BY
-- =====================================================

-- Q31. Show each product and its price along with the average price of its category.
SELECT PRODUCT_NAME,
       CATEGORY_ID,
       PRICE,
       AVG(PRICE) OVER (
           PARTITION BY CATEGORY_ID
       ) AS CATEGORY_AVG_PRICE
FROM PRODUCTS;

-- Q32. Show each product and its stock along with total stock of its category.
SELECT PRODUCT_NAME,
       CATEGORY_ID,
       STOCK,
       SUM(STOCK) OVER (
           PARTITION BY CATEGORY_ID
       ) AS CATEGORY_TOTAL_STOCK
FROM PRODUCTS;

-- Q33. Show each employee and salary along with average salary of their designation.
SELECT EMP_NAME,
       DESIGNATION,
       SALARY,
       AVG(SALARY) OVER (
           PARTITION BY DESIGNATION
       ) AS DESIGNATION_AVG_SALARY
FROM EMPLOYEES;

-- Q34. Show each employee and salary along with maximum salary in their designation.
SELECT EMP_NAME,
       DESIGNATION,
       SALARY,
       MAX(SALARY) OVER (
           PARTITION BY DESIGNATION
       ) AS MAX_DESIGNATION_SALARY
FROM EMPLOYEES;

-- Q35. Show each employee and salary along with minimum salary in their designation.
SELECT EMP_NAME,
       DESIGNATION,
       SALARY,
       MIN(SALARY) OVER (
           PARTITION BY DESIGNATION
       ) AS MIN_DESIGNATION_SALARY
FROM EMPLOYEES;

-- Q36. Show each customer order along with total orders placed by that customer.
SELECT ORDER_ID,
       CUSTOMER_ID,
       COUNT(*) OVER (
           PARTITION BY CUSTOMER_ID
       ) AS CUSTOMER_ORDER_COUNT
FROM ORDERS;

-- Q37. Show each order item along with total quantity in its order.
SELECT ORDER_ITEM_ID,
       ORDER_ID,
       QUANTITY,
       SUM(QUANTITY) OVER (
           PARTITION BY ORDER_ID
       ) AS ORDER_TOTAL_QUANTITY
FROM ORDER_ITEMS;

-- Q38. Show each payment along with total payment amount for its order.
SELECT PAYMENT_ID,
       ORDER_ID,
       AMOUNT,
       SUM(AMOUNT) OVER (
           PARTITION BY ORDER_ID
       ) AS ORDER_TOTAL_PAYMENT
FROM PAYMENTS;

-- Q39. Show each product along with the number of products supplied by its supplier.
SELECT PRODUCT_NAME,
       SUPPLIER_ID,
       COUNT(*) OVER (
           PARTITION BY SUPPLIER_ID
       ) AS SUPPLIER_PRODUCT_COUNT
FROM PRODUCTS;

-- Q40. Show each order along with the total number of orders having the same status.
SELECT ORDER_ID,
       STATUS,
       COUNT(*) OVER (
           PARTITION BY STATUS
       ) AS STATUS_COUNT
FROM ORDERS;

-- =====================================================
-- LEVEL 5
-- SUM / AVG / COUNT / MIN / MAX OVER
-- =====================================================

-- Q41. Calculate running total of order item quantities ordered by order_item_id.
SELECT ORDER_ITEM_ID,
       QUANTITY,
       SUM(QUANTITY) OVER (
           ORDER BY ORDER_ITEM_ID
       ) AS RUNNING_QUANTITY
FROM ORDER_ITEMS;

-- Q42. Calculate running total of payment amounts ordered by payment_id.
SELECT PAYMENT_ID,
       AMOUNT,
       SUM(AMOUNT) OVER (
           ORDER BY PAYMENT_ID
       ) AS RUNNING_PAYMENT
FROM PAYMENTS;

-- Q43. Calculate running average of product prices ordered by product_id.
SELECT PRODUCT_ID,
       PRODUCT_NAME,
       PRICE,
       AVG(PRICE) OVER (
           ORDER BY PRODUCT_ID
       ) AS RUNNING_AVG_PRICE
FROM PRODUCTS;

-- Q44. Show each employee salary and overall average salary.
SELECT EMP_NAME,
       SALARY,
       AVG(SALARY) OVER () AS OVERALL_AVG_SALARY
FROM EMPLOYEES;

-- Q45. Show each product price and overall maximum product price.
SELECT PRODUCT_NAME,
       PRICE,
       MAX(PRICE) OVER () AS MAX_PRODUCT_PRICE
FROM PRODUCTS;

-- Q46. Show each product stock and overall minimum stock.
SELECT PRODUCT_NAME,
       STOCK,
       MIN(STOCK) OVER () AS MIN_PRODUCT_STOCK
FROM PRODUCTS;

-- Q47. Show each customer order and total number of orders in the table.
SELECT ORDER_ID,
       CUSTOMER_ID,
       COUNT(*) OVER () AS TOTAL_ORDERS
FROM ORDERS;

-- Q48. Show each payment and total payment amount in the table.
SELECT PAYMENT_ID,
       AMOUNT,
       SUM(AMOUNT) OVER () AS GRAND_TOTAL_PAYMENT
FROM PAYMENTS;

-- Q49. Show each product and total stock across all products.
SELECT PRODUCT_NAME,
       STOCK,
       SUM(STOCK) OVER () AS GRAND_TOTAL_STOCK
FROM PRODUCTS;

-- Q50. Show each employee salary and difference from overall average salary.
SELECT EMP_NAME,
       SALARY,
       AVG(SALARY) OVER () AS AVG_SALARY,
       SALARY - AVG(SALARY) OVER () AS DIFFERENCE
FROM EMPLOYEES;

-- =====================================================
-- LEVEL 6
-- RUNNING TOTALS
-- =====================================================

-- Q51. Calculate running sales quantity ordered by order_item_id.
SELECT ORDER_ITEM_ID,
       QUANTITY,
       SUM(QUANTITY) OVER (
           ORDER BY ORDER_ITEM_ID
           ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
       ) AS RUNNING_TOTAL
FROM ORDER_ITEMS;

-- Q52. Calculate running payment amount ordered by payment_id.
SELECT PAYMENT_ID,
       AMOUNT,
       SUM(AMOUNT) OVER (
           ORDER BY PAYMENT_ID
           ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
       ) AS RUNNING_TOTAL
FROM PAYMENTS;

-- Q53. Calculate running stock total ordered by product_id.
SELECT PRODUCT_ID,
       PRODUCT_NAME,
       STOCK,
       SUM(STOCK) OVER (
           ORDER BY PRODUCT_ID
           ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
       ) AS RUNNING_STOCK
FROM PRODUCTS;

-- Q54. Calculate running quantity purchased ordered by purchase_id.
SELECT PURCHASE_ID,
       QUANTITY,
       SUM(QUANTITY) OVER (
           ORDER BY PURCHASE_ID
           ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
       ) AS RUNNING_PURCHASE_QTY
FROM PURCHASES;

-- Q55. Calculate running payment total separately for each payment mode.
SELECT PAYMENT_ID,
       PAYMENT_MODE,
       AMOUNT,
       SUM(AMOUNT) OVER (
           PARTITION BY PAYMENT_MODE
           ORDER BY PAYMENT_ID
       ) AS RUNNING_MODE_TOTAL
FROM PAYMENTS;

-- Q56. Calculate running quantity sold separately for each product.
SELECT ORDER_ITEM_ID,
       PRODUCT_ID,
       QUANTITY,
       SUM(QUANTITY) OVER (
           PARTITION BY PRODUCT_ID
           ORDER BY ORDER_ITEM_ID
       ) AS RUNNING_PRODUCT_QTY
FROM ORDER_ITEMS;

-- Q57. Calculate running purchase quantity separately for each supplier.
SELECT PURCHASE_ID,
       SUPPLIER_ID,
       QUANTITY,
       SUM(QUANTITY) OVER (
           PARTITION BY SUPPLIER_ID
           ORDER BY PURCHASE_ID
       ) AS RUNNING_SUPPLIER_QTY
FROM PURCHASES;

-- Q58. Calculate running order count for each customer.
SELECT ORDER_ID,
       CUSTOMER_ID,
       COUNT(*) OVER (
           PARTITION BY CUSTOMER_ID
           ORDER BY ORDER_ID
       ) AS RUNNING_ORDER_COUNT
FROM ORDERS;

-- Q59. Calculate running stock separately for each category.
SELECT PRODUCT_ID,
       CATEGORY_ID,
       STOCK,
       SUM(STOCK) OVER (
           PARTITION BY CATEGORY_ID
           ORDER BY PRODUCT_ID
       ) AS RUNNING_CATEGORY_STOCK
FROM PRODUCTS;

-- Q60. Calculate running payment amount separately for each order.
SELECT PAYMENT_ID,
       ORDER_ID,
       AMOUNT,
       SUM(AMOUNT) OVER (
           PARTITION BY ORDER_ID
           ORDER BY PAYMENT_ID
       ) AS RUNNING_ORDER_PAYMENT
FROM PAYMENTS;

-- =====================================================
-- LEVEL 7
-- LAG() AND LEAD()
-- =====================================================

-- Q61. Display each product price and the previous product price.
SELECT PRODUCT_ID,
       PRODUCT_NAME,
       PRICE,
       LAG(PRICE) OVER (
           ORDER BY PRODUCT_ID
       ) AS PREVIOUS_PRICE
FROM PRODUCTS;

-- Q62. Display each product price and the next product price.
SELECT PRODUCT_ID,
       PRODUCT_NAME,
       PRICE,
       LEAD(PRICE) OVER (
           ORDER BY PRODUCT_ID
       ) AS NEXT_PRICE
FROM PRODUCTS;

-- Q63. Display each employee salary and previous employee salary.
SELECT EMP_ID,
       EMP_NAME,
       SALARY,
       LAG(SALARY) OVER (
           ORDER BY EMP_ID
       ) AS PREVIOUS_SALARY
FROM EMPLOYEES;

-- Q64. Display each employee salary and next employee salary.
SELECT EMP_ID,
       EMP_NAME,
       SALARY,
       LEAD(SALARY) OVER (
           ORDER BY EMP_ID
       ) AS NEXT_SALARY
FROM EMPLOYEES;

-- Q65. Compare each order date with the previous order date.
SELECT ORDER_ID,
       ORDER_DATE,
       LAG(ORDER_DATE) OVER (
           ORDER BY ORDER_DATE
       ) AS PREVIOUS_ORDER_DATE
FROM ORDERS;

-- Q66. Compare each order date with the next order date.
SELECT ORDER_ID,
       ORDER_DATE,
       LEAD(ORDER_DATE) OVER (
           ORDER BY ORDER_DATE
       ) AS NEXT_ORDER_DATE
FROM ORDERS;

-- Q67. Show each payment amount and difference from the previous payment.
SELECT PAYMENT_ID,
       AMOUNT,
       AMOUNT - LAG(AMOUNT) OVER (
           ORDER BY PAYMENT_ID
       ) AS DIFFERENCE_FROM_PREVIOUS
FROM PAYMENTS;

-- Q68. Show each product price and difference from the next product price.
SELECT PRODUCT_ID,
       PRODUCT_NAME,
       PRICE,
       PRICE - LEAD(PRICE) OVER (
           ORDER BY PRODUCT_ID
       ) AS DIFFERENCE_FROM_NEXT
FROM PRODUCTS;

-- Q69. Show previous salary for each employee within the same designation.
SELECT EMP_NAME,
       DESIGNATION,
       SALARY,
       LAG(SALARY) OVER (
           PARTITION BY DESIGNATION
           ORDER BY SALARY
       ) AS PREVIOUS_SALARY
FROM EMPLOYEES;

-- Q70. Show next order for each customer.
SELECT ORDER_ID,
       CUSTOMER_ID,
       ORDER_DATE,
       LEAD(ORDER_ID) OVER (
           PARTITION BY CUSTOMER_ID
           ORDER BY ORDER_DATE
       ) AS NEXT_ORDER_ID
FROM ORDERS;

-- =====================================================
-- LEVEL 8
-- FIRST_VALUE() / LAST_VALUE()
-- =====================================================

-- Q71. Show each product and the highest priced product in its category.
SELECT PRODUCT_NAME,
       CATEGORY_ID,
       PRICE,
       FIRST_VALUE(PRODUCT_NAME) OVER (
           PARTITION BY CATEGORY_ID
           ORDER BY PRICE DESC
       ) AS HIGHEST_PRICED_PRODUCT
FROM PRODUCTS;

-- Q72. Show each product and the lowest priced product in its category.
SELECT PRODUCT_NAME,
       CATEGORY_ID,
       PRICE,
       FIRST_VALUE(PRODUCT_NAME) OVER (
           PARTITION BY CATEGORY_ID
           ORDER BY PRICE
       ) AS LOWEST_PRICED_PRODUCT
FROM PRODUCTS;

-- Q73. Show each employee and highest salary in their designation.
SELECT EMP_NAME,
       DESIGNATION,
       SALARY,
       FIRST_VALUE(SALARY) OVER (
           PARTITION BY DESIGNATION
           ORDER BY SALARY DESC
       ) AS HIGHEST_DESIGNATION_SALARY
FROM EMPLOYEES;

-- Q74. Show each employee and lowest salary in their designation.
SELECT EMP_NAME,
       DESIGNATION,
       SALARY,
       FIRST_VALUE(SALARY) OVER (
           PARTITION BY DESIGNATION
           ORDER BY SALARY
       ) AS LOWEST_DESIGNATION_SALARY
FROM EMPLOYEES;

-- Q75. Show each order and first order date for that customer.
SELECT ORDER_ID,
       CUSTOMER_ID,
       ORDER_DATE,
       FIRST_VALUE(ORDER_DATE) OVER (
           PARTITION BY CUSTOMER_ID
           ORDER BY ORDER_DATE
       ) AS FIRST_ORDER_DATE
FROM ORDERS;

-- Q76. Show each order and latest order date for that customer.
SELECT ORDER_ID,
       CUSTOMER_ID,
       ORDER_DATE,
       MAX(ORDER_DATE) OVER (
           PARTITION BY CUSTOMER_ID
       ) AS LATEST_ORDER_DATE
FROM ORDERS;

-- Q77. Show each payment and first payment amount for its order.
SELECT PAYMENT_ID,
       ORDER_ID,
       AMOUNT,
       FIRST_VALUE(AMOUNT) OVER (
           PARTITION BY ORDER_ID
           ORDER BY PAYMENT_ID
       ) AS FIRST_PAYMENT
FROM PAYMENTS;

-- Q78. Show each product and first product name within its category by product_id.
SELECT PRODUCT_ID,
       PRODUCT_NAME,
       CATEGORY_ID,
       FIRST_VALUE(PRODUCT_NAME) OVER (
           PARTITION BY CATEGORY_ID
           ORDER BY PRODUCT_ID
       ) AS FIRST_PRODUCT
FROM PRODUCTS;

-- Q79. Show each employee and highest salary in the entire company.
SELECT EMP_NAME,
       SALARY,
       FIRST_VALUE(SALARY) OVER (
           ORDER BY SALARY DESC
       ) AS HIGHEST_COMPANY_SALARY
FROM EMPLOYEES;

-- Q80. Show each employee and lowest salary in the entire company.
SELECT EMP_NAME,
       SALARY,
       FIRST_VALUE(SALARY) OVER (
           ORDER BY SALARY
       ) AS LOWEST_COMPANY_SALARY
FROM EMPLOYEES;

-- =====================================================
-- LEVEL 9
-- TOP-N / RANKING WITH ANALYTICAL FUNCTIONS
-- =====================================================

-- Q81. Find the top 5 highest-paid employees using ROW_NUMBER().
SELECT EMP_NAME,
       SALARY
FROM (
    SELECT EMP_NAME,
           SALARY,
           ROW_NUMBER() OVER (
               ORDER BY SALARY DESC
           ) AS RN
    FROM EMPLOYEES
)
WHERE RN <= 5;

-- Q82. Find the top 3 most expensive products using ROW_NUMBER().
SELECT PRODUCT_NAME,
       PRICE
FROM (
    SELECT PRODUCT_NAME,
           PRICE,
           ROW_NUMBER() OVER (
               ORDER BY PRICE DESC
           ) AS RN
    FROM PRODUCTS
)
WHERE RN <= 3;

-- Q83. Find the top 2 highest-paid employees from each designation.
SELECT EMP_NAME,
       DESIGNATION,
       SALARY
FROM (
    SELECT EMP_NAME,
           DESIGNATION,
           SALARY,
           ROW_NUMBER() OVER (
               PARTITION BY DESIGNATION
               ORDER BY SALARY DESC
           ) AS RN
    FROM EMPLOYEES
)
WHERE RN <= 2;

-- Q84. Find the top 3 most expensive products from each category.
SELECT PRODUCT_NAME,
       CATEGORY_ID,
       PRICE
FROM (
    SELECT PRODUCT_NAME,
           CATEGORY_ID,
           PRICE,
           ROW_NUMBER() OVER (
               PARTITION BY CATEGORY_ID
               ORDER BY PRICE DESC
           ) AS RN
    FROM PRODUCTS
)
WHERE RN <= 3;

-- Q85. Find the highest-paid employee from each designation.
SELECT EMP_NAME,
       DESIGNATION,
       SALARY
FROM (
    SELECT EMP_NAME,
           DESIGNATION,
           SALARY,
           ROW_NUMBER() OVER (
               PARTITION BY DESIGNATION
               ORDER BY SALARY DESC
           ) AS RN
    FROM EMPLOYEES
)
WHERE RN = 1;

-- Q86. Find the highest-priced product from each category.
SELECT PRODUCT_NAME,
       CATEGORY_ID,
       PRICE
FROM (
    SELECT PRODUCT_NAME,
           CATEGORY_ID,
           PRICE,
           ROW_NUMBER() OVER (
               PARTITION BY CATEGORY_ID
               ORDER BY PRICE DESC
           ) AS RN
    FROM PRODUCTS
)
WHERE RN = 1;

-- Q87. Find the top 3 customers by total payment.
SELECT CUSTOMER_NAME,
       TOTAL_PAID
FROM (
    SELECT C.CUSTOMER_NAME,
           SUM(PM.AMOUNT) AS TOTAL_PAID,
           ROW_NUMBER() OVER (
               ORDER BY SUM(PM.AMOUNT) DESC
           ) AS RN
    FROM CUSTOMERS C
    JOIN ORDERS O
        ON C.CUSTOMER_ID = O.CUSTOMER_ID
    JOIN PAYMENTS PM
        ON O.ORDER_ID = PM.ORDER_ID
    GROUP BY C.CUSTOMER_NAME
)
WHERE RN <= 3;

-- Q88. Find the top 5 products by total quantity sold.
SELECT PRODUCT_NAME,
       TOTAL_SOLD
FROM (
    SELECT P.PRODUCT_NAME,
           SUM(OI.QUANTITY) AS TOTAL_SOLD,
           ROW_NUMBER() OVER (
               ORDER BY SUM(OI.QUANTITY) DESC
           ) AS RN
    FROM PRODUCTS P
    JOIN ORDER_ITEMS OI
        ON P.PRODUCT_ID = OI.PRODUCT_ID
    GROUP BY P.PRODUCT_NAME
)
WHERE RN <= 5;

-- Q89. Find the top 2 suppliers by total purchase quantity.
SELECT SUPPLIER_NAME,
       TOTAL_PURCHASE_QTY
FROM (
    SELECT S.SUPPLIER_NAME,
           SUM(PU.QUANTITY) AS TOTAL_PURCHASE_QTY,
           ROW_NUMBER() OVER (
               ORDER BY SUM(PU.QUANTITY) DESC
           ) AS RN
    FROM SUPPLIERS S
    JOIN PURCHASES PU
        ON S.SUPPLIER_ID = PU.SUPPLIER_ID
    GROUP BY S.SUPPLIER_NAME
)
WHERE RN <= 2;

-- Q90. Find the top 3 categories by total sales value.
SELECT CATEGORY_NAME,
       TOTAL_SALES
FROM (
    SELECT C.CATEGORY_NAME,
           SUM(OI.QUANTITY * OI.PRICE) AS TOTAL_SALES,
           ROW_NUMBER() OVER (
               ORDER BY SUM(OI.QUANTITY * OI.PRICE) DESC
           ) AS RN
    FROM CATEGORIES C
    JOIN PRODUCTS P
        ON C.CATEGORY_ID = P.CATEGORY_ID
    JOIN ORDER_ITEMS OI
        ON P.PRODUCT_ID = OI.PRODUCT_ID
    GROUP BY C.CATEGORY_NAME
)
WHERE RN <= 3;

-- =====================================================
-- LEVEL 10
-- INTERVIEW / ADVANCED ANALYTICAL FUNCTIONS
-- =====================================================

-- Q91. Find employees whose salary is greater than the average salary.
SELECT EMP_NAME,
       SALARY,
       AVG_SALARY
FROM (
    SELECT EMP_NAME,
           SALARY,
           AVG(SALARY) OVER () AS AVG_SALARY
    FROM EMPLOYEES
)
WHERE SALARY > AVG_SALARY;

-- Q92. Find products whose price is greater than the average price of their category.
SELECT PRODUCT_NAME,
       CATEGORY_ID,
       PRICE,
       CATEGORY_AVG_PRICE
FROM (
    SELECT PRODUCT_NAME,
           CATEGORY_ID,
           PRICE,
           AVG(PRICE) OVER (
               PARTITION BY CATEGORY_ID
           ) AS CATEGORY_AVG_PRICE
    FROM PRODUCTS
)
WHERE PRICE > CATEGORY_AVG_PRICE;

-- Q93. Find employees earning the highest salary in their designation.
SELECT EMP_NAME,
       DESIGNATION,
       SALARY
FROM (
    SELECT EMP_NAME,
           DESIGNATION,
           SALARY,
           RANK() OVER (
               PARTITION BY DESIGNATION
               ORDER BY SALARY DESC
           ) AS RN
    FROM EMPLOYEES
)
WHERE RN = 1;

-- Q94. Find products having the highest price in each category.
SELECT PRODUCT_NAME,
       CATEGORY_ID,
       PRICE
FROM (
    SELECT PRODUCT_NAME,
           CATEGORY_ID,
           PRICE,
           RANK() OVER (
               PARTITION BY CATEGORY_ID
               ORDER BY PRICE DESC
           ) AS RN
    FROM PRODUCTS
)
WHERE RN = 1;

-- Q95. Find employees whose salary is above their designation average.
SELECT EMP_NAME,
       DESIGNATION,
       SALARY,
       DESIGNATION_AVG
FROM (
    SELECT EMP_NAME,
           DESIGNATION,
           SALARY,
           AVG(SALARY) OVER (
               PARTITION BY DESIGNATION
           ) AS DESIGNATION_AVG
    FROM EMPLOYEES
)
WHERE SALARY > DESIGNATION_AVG;

-- Q96. Find the difference between each employee salary and the highest salary in their designation.
SELECT EMP_NAME,
       DESIGNATION,
       SALARY,
       MAX(SALARY) OVER (
           PARTITION BY DESIGNATION
       ) - SALARY AS DIFFERENCE_FROM_MAX
FROM EMPLOYEES;

-- Q97. Find the difference between each product price and the category's highest price.
SELECT PRODUCT_NAME,
       CATEGORY_ID,
       PRICE,
       MAX(PRICE) OVER (
           PARTITION BY CATEGORY_ID
       ) - PRICE AS DIFFERENCE_FROM_MAX
FROM PRODUCTS;

-- Q98. Find each customer's first and latest order date.
SELECT ORDER_ID,
       CUSTOMER_ID,
       ORDER_DATE,
       MIN(ORDER_DATE) OVER (
           PARTITION BY CUSTOMER_ID
       ) AS FIRST_ORDER_DATE,
       MAX(ORDER_DATE) OVER (
           PARTITION BY CUSTOMER_ID
       ) AS LATEST_ORDER_DATE
FROM ORDERS;

-- Q99. Compare each product's sold quantity with the previous product's sold quantity.
SELECT PRODUCT_NAME,
       TOTAL_SOLD,
       LAG(TOTAL_SOLD) OVER (
           ORDER BY PRODUCT_ID
       ) AS PREVIOUS_PRODUCT_SOLD,
       TOTAL_SOLD -
       LAG(TOTAL_SOLD) OVER (
           ORDER BY PRODUCT_ID
       ) AS DIFFERENCE
FROM (
    SELECT P.PRODUCT_ID,
           P.PRODUCT_NAME,
           SUM(OI.QUANTITY) AS TOTAL_SOLD
    FROM PRODUCTS P
    JOIN ORDER_ITEMS OI
        ON P.PRODUCT_ID = OI.PRODUCT_ID
    GROUP BY P.PRODUCT_ID, P.PRODUCT_NAME
);

-- Q100. Find the top 3 highest-paid employees in each designation,
-- including ties, using DENSE_RANK().
SELECT EMP_NAME,
       DESIGNATION,
       SALARY
FROM (
    SELECT EMP_NAME,
           DESIGNATION,
           SALARY,
           DENSE_RANK() OVER (
               PARTITION BY DESIGNATION
               ORDER BY SALARY DESC
           ) AS SALARY_RANK
    FROM EMPLOYEES
)
WHERE SALARY_RANK <= 3;

-- =====================================================
-- PRACTICE ORDER
-- =====================================================

-- Q01-Q10   : ROW_NUMBER()
-- Q11-Q20   : RANK()
-- Q21-Q30   : DENSE_RANK()
-- Q31-Q40   : PARTITION BY
-- Q41-Q50   : SUM / AVG / COUNT / MIN / MAX OVER()
-- Q51-Q60   : RUNNING TOTALS
-- Q61-Q70   : LAG() / LEAD()
-- Q71-Q80   : FIRST_VALUE() / LAST_VALUE()
-- Q81-Q90   : TOP-N / RANKING
-- Q91-Q100  : INTERVIEW / ADVANCED

-- =====================================================
-- IMPORTANT PROJECT RELATIONSHIPS
-- =====================================================

-- EMPLOYEES
-- EMP_ID, EMP_NAME, DESIGNATION, SALARY

-- PRODUCTS
-- PRODUCT_ID, PRODUCT_NAME, CATEGORY_ID,
-- SUPPLIER_ID, PRICE, STOCK

-- ORDER_ITEMS
-- ORDER_ITEM_ID, ORDER_ID, PRODUCT_ID, QUANTITY, PRICE

-- ORDERS
-- ORDER_ID, CUSTOMER_ID, EMP_ID, ORDER_DATE, STATUS

-- PAYMENTS
-- PAYMENT_ID, ORDER_ID, PAYMENT_MODE,
-- PAYMENT_DATE, AMOUNT

-- PURCHASES
-- PURCHASE_ID, SUPPLIER_ID, PRODUCT_ID,
-- QUANTITY, PURCHASE_DATE

-- CUSTOMERS
-- CUSTOMER_ID, CUSTOMER_NAME, PHONE,
-- EMAIL, ADDRESS, CITY

-- CATEGORIES
-- CATEGORY_ID, CATEGORY_NAME

-- SUPPLIERS
-- SUPPLIER_ID, SUPPLIER_NAME, PHONE, EMAIL

-- INVENTORY_LOG
-- LOG_ID, PRODUCT_ID, OLD_STOCK,
-- NEW_STOCK, UPDATED_DATE

-- =====================================================
-- KEY DIFFERENCE TO REMEMBER
-- =====================================================

-- ROW_NUMBER()
-- 1, 2, 3, 4, 5
-- Always unique.

-- RANK()
-- 1, 2, 2, 4, 5
-- Ties create gaps.

-- DENSE_RANK()
-- 1, 2, 2, 3, 4
-- Ties do not create gaps.

-- =====================================================
-- END OF ANALYTICAL FUNCTIONS PRACTICE
-- =====================================================

SPOOL OFF