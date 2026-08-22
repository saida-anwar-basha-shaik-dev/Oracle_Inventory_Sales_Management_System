-- =====================================================
-- ORACLE SQL - ROWNUM / TOP-N
-- RULES, SYNTAX & 100 QUESTIONS WITH ANSWERS
-- Oracle 11g SQL*PLUS
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

COLUMN CATEGORY_ID   FORMAT 999999
COLUMN CATEGORY_NAME FORMAT A25

COLUMN CUSTOMER_ID   FORMAT 999999
COLUMN CUSTOMER_NAME FORMAT A30
COLUMN CITY          FORMAT A20

COLUMN EMP_ID        FORMAT 999999
COLUMN EMP_NAME      FORMAT A30
COLUMN DESIGNATION   FORMAT A20
COLUMN SALARY        FORMAT 99999999.99

COLUMN SUPPLIER_ID   FORMAT 999999
COLUMN SUPPLIER_NAME FORMAT A30

COLUMN PRODUCT_ID    FORMAT 999999
COLUMN PRODUCT_NAME  FORMAT A35
COLUMN PRICE         FORMAT 99999999.99
COLUMN STOCK         FORMAT 999999

COLUMN ORDER_ID      FORMAT 999999
COLUMN ORDER_DATE    FORMAT A12
COLUMN STATUS        FORMAT A20

COLUMN ORDER_ITEM_ID FORMAT 999999
COLUMN QUANTITY      FORMAT 999999

COLUMN PAYMENT_ID    FORMAT 999999
COLUMN PAYMENT_DATE  FORMAT A12
COLUMN PAYMENT_MODE  FORMAT A20
COLUMN AMOUNT        FORMAT 99999999.99

COLUMN PURCHASE_ID   FORMAT 999999
COLUMN PURCHASE_DATE FORMAT A12

COLUMN LOG_ID        FORMAT 999999
COLUMN OLD_STOCK     FORMAT 999999
COLUMN NEW_STOCK     FORMAT 999999


-- =====================================================
-- SPOOL OUTPUT
-- =====================================================

SPOOL 'F:\Exploring Technologies\OrcaleSqlPlusExploring\Oracle_Inventory_Sales_Management_System\Queries\11_ROWNUM_TOP_N\11_ROWNUM_TOP_N_TEST_OUTPUT.txt'


-- =====================================================
-- ORACLE SQL 11g
-- ROWNUM / TOP-N COMPLETE TEST
-- =====================================================
-- Total Questions : 100
-- Difficulty      : Basic -> Intermediate -> Advanced
--
-- Topics Covered:
-- 1. ROWNUM basics
-- 2. ROWNUM <= N
-- 3. ROWNUM with ORDER BY
-- 4. Correct Top-N queries
-- 5. Bottom-N queries
-- 6. Top-N by salary
-- 7. Top-N by price
-- 8. Top-N by sales
-- 9. Top-N by quantity
-- 10. Top-N with GROUP BY
-- 11. Top-N with JOIN
-- 12. Top-N per result set
-- 13. Pagination using ROWNUM
-- 14. ROWNUM with subqueries
-- 15. Interview-style questions
--
-- IMPORTANT:
-- In Oracle 11g:
-- ROWNUM is assigned BEFORE ORDER BY in the same query block.
--
-- WRONG:
-- SELECT * FROM PRODUCTS
-- WHERE ROWNUM <= 5
-- ORDER BY PRICE DESC;
--
-- This does NOT return the 5 most expensive products.
--
-- CORRECT:
-- SELECT *
-- FROM (
--     SELECT *
--     FROM PRODUCTS
--     ORDER BY PRICE DESC
-- )
-- WHERE ROWNUM <= 5;
-- =====================================================


-- =====================================================
-- ROWNUM RULES
-- =====================================================

-- RULE 01:
-- ROWNUM is a pseudocolumn.

-- RULE 02:
-- ROWNUM assigns a number to rows as they are returned.

-- RULE 03:
-- ROWNUM starts from 1.

-- RULE 04:
-- ROWNUM <= N can be used directly.

-- RULE 05:
-- ROWNUM > 1 does not work directly in a normal query block.

-- RULE 06:
-- ROWNUM must be handled using a subquery when pagination is required.

-- RULE 07:
-- For Top-N after ORDER BY, use an inline view.

-- RULE 08:
-- ORDER BY must be inside the subquery for correct Top-N results.

-- RULE 09:
-- Outer query applies ROWNUM after the ordered result is produced.

-- RULE 10:
-- Always use a deterministic ORDER BY for reliable Top-N results.

-- RULE 11:
-- ROWNUM is not the same as ROW_NUMBER().

-- RULE 12:
-- ROW_NUMBER() is an analytic function.

-- RULE 13:
-- ROWNUM is useful for Top-N and pagination in Oracle 11g.

-- RULE 14:
-- For second page / later pages, use nested queries.

-- RULE 15:
-- If ORDER BY is outside the ROWNUM filter, Top-N may be incorrect.

-- RULE 16:
-- ROWNUM can be used with SELECT, WHERE and subqueries.

-- RULE 17:
-- ROWNUM can be combined with JOIN and GROUP BY through subqueries.

-- RULE 18:
-- Aggregate Top-N queries require GROUP BY first and ROWNUM outside.

-- RULE 19:
-- Always sort before applying Top-N.

-- RULE 20:
-- Oracle 12c introduced FETCH FIRST, but these exercises use Oracle 11g ROWNUM.


-- =====================================================
-- BASIC SYNTAX
-- =====================================================

-- BASIC ROWNUM
-- SELECT ROWNUM, COLUMN_NAME
-- FROM TABLE_NAME;

-- FIRST N ROWS
-- SELECT *
-- FROM TABLE_NAME
-- WHERE ROWNUM <= N;

-- TOP-N
-- SELECT *
-- FROM (
--     SELECT *
--     FROM TABLE_NAME
--     ORDER BY COLUMN_NAME DESC
-- )
-- WHERE ROWNUM <= N;

-- TOP-N ASCENDING
-- SELECT *
-- FROM (
--     SELECT *
--     FROM TABLE_NAME
--     ORDER BY COLUMN_NAME ASC
-- )
-- WHERE ROWNUM <= N;

-- PAGINATION
-- SELECT *
-- FROM (
--     SELECT ROWNUM RN, T.*
--     FROM (
--         SELECT *
--         FROM TABLE_NAME
--         ORDER BY COLUMN_NAME DESC
--     ) T
--     WHERE ROWNUM <= 10
-- )
-- WHERE RN >= 6;


-- =====================================================
-- LEVEL 1: ROWNUM BASIC
-- Q01-Q15
-- =====================================================


-- Q01. Display the first 5 products using ROWNUM.

SELECT ROWNUM, P.*
FROM PRODUCTS P
WHERE ROWNUM <= 5;


-- Q02. Display the first 10 customers using ROWNUM.

SELECT ROWNUM, C.*
FROM CUSTOMERS C
WHERE ROWNUM <= 10;


-- Q03. Display the first 5 employees using ROWNUM.

SELECT ROWNUM, E.*
FROM EMPLOYEES E
WHERE ROWNUM <= 5;


-- Q04. Display the first 10 orders using ROWNUM.

SELECT ROWNUM, O.*
FROM ORDERS O
WHERE ROWNUM <= 10;


-- Q05. Display the first 10 products showing product name and price.

SELECT ROWNUM, P.PRODUCT_NAME, P.PRICE
FROM PRODUCTS P
WHERE ROWNUM <= 10;


-- Q06. Display the first 5 customers showing customer name and city.

SELECT ROWNUM, C.CUSTOMER_NAME, C.CITY
FROM CUSTOMERS C
WHERE ROWNUM <= 5;


-- Q07. Display the first 5 employees showing employee name and salary.

SELECT ROWNUM, E.EMP_NAME, E.SALARY
FROM EMPLOYEES E
WHERE ROWNUM <= 5;


-- Q08. Display the first 10 order IDs.

SELECT ROWNUM, O.ORDER_ID
FROM ORDERS O
WHERE ROWNUM <= 10;


-- Q09. Display the first 5 payments.

SELECT ROWNUM, PM.PAYMENT_ID, PM.AMOUNT
FROM PAYMENTS PM
WHERE ROWNUM <= 5;


-- Q10. Display the first 10 products showing product ID, name and stock.

SELECT ROWNUM, P.PRODUCT_ID, P.PRODUCT_NAME, P.STOCK
FROM PRODUCTS P
WHERE ROWNUM <= 10;


-- Q11. Display the first 5 suppliers.

SELECT ROWNUM, S.*
FROM SUPPLIERS S
WHERE ROWNUM <= 5;


-- Q12. Display the first 10 purchases.

SELECT ROWNUM, PU.*
FROM PURCHASES PU
WHERE ROWNUM <= 10;


-- Q13. Display the first 5 categories.

SELECT ROWNUM, C.*
FROM CATEGORIES C
WHERE ROWNUM <= 5;


-- Q14. Display the first 10 order items.

SELECT ROWNUM, OI.*
FROM ORDER_ITEMS OI
WHERE ROWNUM <= 10;


-- Q15. Display the first 5 inventory log records.

SELECT ROWNUM, IL.*
FROM INVENTORY_LOG IL
WHERE ROWNUM <= 5;


-- =====================================================
-- LEVEL 2: ROWNUM + ORDER BY
-- Q16-Q30
-- =====================================================


-- Q16. Find the 5 most expensive products.

SELECT *
FROM (
    SELECT P.PRODUCT_NAME, P.PRICE
    FROM PRODUCTS P
    ORDER BY P.PRICE DESC
)
WHERE ROWNUM <= 5;


-- Q17. Find the 5 cheapest products.

SELECT *
FROM (
    SELECT P.PRODUCT_NAME, P.PRICE
    FROM PRODUCTS P
    ORDER BY P.PRICE ASC
)
WHERE ROWNUM <= 5;


-- Q18. Find the 10 products with the highest stock.

SELECT *
FROM (
    SELECT P.PRODUCT_NAME, P.STOCK
    FROM PRODUCTS P
    ORDER BY P.STOCK DESC
)
WHERE ROWNUM <= 10;


-- Q19. Find the 5 products with the lowest stock.

SELECT *
FROM (
    SELECT P.PRODUCT_NAME, P.STOCK
    FROM PRODUCTS P
    ORDER BY P.STOCK ASC
)
WHERE ROWNUM <= 5;


-- Q20. Find the 5 highest-paid employees.

SELECT *
FROM (
    SELECT E.EMP_NAME, E.SALARY
    FROM EMPLOYEES E
    ORDER BY E.SALARY DESC
)
WHERE ROWNUM <= 5;


-- Q21. Find the 3 lowest-paid employees.

SELECT *
FROM (
    SELECT E.EMP_NAME, E.SALARY
    FROM EMPLOYEES E
    ORDER BY E.SALARY ASC
)
WHERE ROWNUM <= 3;


-- Q22. Find the 10 latest orders.

SELECT *
FROM (
    SELECT O.ORDER_ID, O.ORDER_DATE, O.STATUS
    FROM ORDERS O
    ORDER BY O.ORDER_DATE DESC
)
WHERE ROWNUM <= 10;


-- Q23. Find the 5 earliest orders.

SELECT *
FROM (
    SELECT O.ORDER_ID, O.ORDER_DATE, O.STATUS
    FROM ORDERS O
    ORDER BY O.ORDER_DATE ASC
)
WHERE ROWNUM <= 5;


-- Q24. Find the 5 largest payments.

SELECT *
FROM (
    SELECT PM.PAYMENT_ID, PM.AMOUNT
    FROM PAYMENTS PM
    ORDER BY PM.AMOUNT DESC
)
WHERE ROWNUM <= 5;


-- Q25. Find the 5 smallest payments.

SELECT *
FROM (
    SELECT PM.PAYMENT_ID, PM.AMOUNT
    FROM PAYMENTS PM
    ORDER BY PM.AMOUNT ASC
)
WHERE ROWNUM <= 5;


-- Q26. Find the 10 largest order quantities.

SELECT *
FROM (
    SELECT OI.ORDER_ITEM_ID, OI.QUANTITY
    FROM ORDER_ITEMS OI
    ORDER BY OI.QUANTITY DESC
)
WHERE ROWNUM <= 10;


-- Q27. Find the 5 smallest order quantities.

SELECT *
FROM (
    SELECT OI.ORDER_ITEM_ID, OI.QUANTITY
    FROM ORDER_ITEMS OI
    ORDER BY OI.QUANTITY ASC
)
WHERE ROWNUM <= 5;


-- Q28. Find the 5 largest purchases by quantity.

SELECT *
FROM (
    SELECT PU.PURCHASE_ID, PU.QUANTITY
    FROM PURCHASES PU
    ORDER BY PU.QUANTITY DESC
)
WHERE ROWNUM <= 5;


-- Q29. Find the 5 latest payments.

SELECT *
FROM (
    SELECT PM.PAYMENT_ID, PM.PAYMENT_DATE, PM.AMOUNT
    FROM PAYMENTS PM
    ORDER BY PM.PAYMENT_DATE DESC
)
WHERE ROWNUM <= 5;


-- Q30. Find the 5 latest inventory log records.

SELECT *
FROM (
    SELECT IL.LOG_ID, IL.UPDATED_DATE, IL.OLD_STOCK, IL.NEW_STOCK
    FROM INVENTORY_LOG IL
    ORDER BY IL.UPDATED_DATE DESC
)
WHERE ROWNUM <= 5;


-- =====================================================
-- LEVEL 3: TOP-N WITH JOINS
-- Q31-Q45
-- =====================================================


-- Q31. Find the 5 most expensive products with category name.

SELECT *
FROM (
    SELECT P.PRODUCT_NAME, P.PRICE, C.CATEGORY_NAME
    FROM PRODUCTS P
    JOIN CATEGORIES C
      ON P.CATEGORY_ID = C.CATEGORY_ID
    ORDER BY P.PRICE DESC
)
WHERE ROWNUM <= 5;


-- Q32. Find the 5 most expensive products with supplier name.

SELECT *
FROM (
    SELECT P.PRODUCT_NAME, P.PRICE, S.SUPPLIER_NAME
    FROM PRODUCTS P
    JOIN SUPPLIERS S
      ON P.SUPPLIER_ID = S.SUPPLIER_ID
    ORDER BY P.PRICE DESC
)
WHERE ROWNUM <= 5;


-- Q33. Find the 10 products with highest stock and category name.

SELECT *
FROM (
    SELECT P.PRODUCT_NAME, P.STOCK, C.CATEGORY_NAME
    FROM PRODUCTS P
    JOIN CATEGORIES C
      ON P.CATEGORY_ID = C.CATEGORY_ID
    ORDER BY P.STOCK DESC
)
WHERE ROWNUM <= 10;


-- Q34. Find the 5 highest-paid employees with their designation.

SELECT *
FROM (
    SELECT E.EMP_NAME, E.DESIGNATION, E.SALARY
    FROM EMPLOYEES E
    ORDER BY E.SALARY DESC
)
WHERE ROWNUM <= 5;


-- Q35. Find the 5 latest orders with customer name.

SELECT *
FROM (
    SELECT O.ORDER_ID, O.ORDER_DATE, C.CUSTOMER_NAME
    FROM ORDERS O
    JOIN CUSTOMERS C
      ON O.CUSTOMER_ID = C.CUSTOMER_ID
    ORDER BY O.ORDER_DATE DESC
)
WHERE ROWNUM <= 5;


-- Q36. Find the 10 latest orders with customer and employee names.

SELECT *
FROM (
    SELECT O.ORDER_ID,
           O.ORDER_DATE,
           C.CUSTOMER_NAME,
           E.EMP_NAME
    FROM ORDERS O
    JOIN CUSTOMERS C
      ON O.CUSTOMER_ID = C.CUSTOMER_ID
    JOIN EMPLOYEES E
      ON O.EMP_ID = E.EMP_ID
    ORDER BY O.ORDER_DATE DESC
)
WHERE ROWNUM <= 10;


-- Q37. Find the 5 largest payments with customer name.

SELECT *
FROM (
    SELECT PM.PAYMENT_ID,
           PM.AMOUNT,
           C.CUSTOMER_NAME
    FROM PAYMENTS PM
    JOIN ORDERS O
      ON PM.ORDER_ID = O.ORDER_ID
    JOIN CUSTOMERS C
      ON O.CUSTOMER_ID = C.CUSTOMER_ID
    ORDER BY PM.AMOUNT DESC
)
WHERE ROWNUM <= 5;


-- Q38. Find the 5 largest order items by quantity with product name.

SELECT *
FROM (
    SELECT OI.ORDER_ITEM_ID,
           PR.PRODUCT_NAME,
           OI.QUANTITY
    FROM ORDER_ITEMS OI
    JOIN PRODUCTS PR
      ON OI.PRODUCT_ID = PR.PRODUCT_ID
    ORDER BY OI.QUANTITY DESC
)
WHERE ROWNUM <= 5;


-- Q39. Find the 5 largest purchases with supplier name.

SELECT *
FROM (
    SELECT PU.PURCHASE_ID,
           S.SUPPLIER_NAME,
           PU.QUANTITY
    FROM PURCHASES PU
    JOIN SUPPLIERS S
      ON PU.SUPPLIER_ID = S.SUPPLIER_ID
    ORDER BY PU.QUANTITY DESC
)
WHERE ROWNUM <= 5;


-- Q40. Find the 5 products with the highest price and supplier name.

SELECT *
FROM (
    SELECT P.PRODUCT_NAME,
           P.PRICE,
           S.SUPPLIER_NAME
    FROM PRODUCTS P
    JOIN SUPPLIERS S
      ON P.SUPPLIER_ID = S.SUPPLIER_ID
    ORDER BY P.PRICE DESC
)
WHERE ROWNUM <= 5;


-- Q41. Find the 5 products with the lowest price and category name.

SELECT *
FROM (
    SELECT P.PRODUCT_NAME,
           P.PRICE,
           C.CATEGORY_NAME
    FROM PRODUCTS P
    JOIN CATEGORIES C
      ON P.CATEGORY_ID = C.CATEGORY_ID
    ORDER BY P.PRICE ASC
)
WHERE ROWNUM <= 5;


-- Q42. Find the 5 customers with the latest orders.

SELECT *
FROM (
    SELECT C.CUSTOMER_NAME,
           O.ORDER_ID,
           O.ORDER_DATE
    FROM CUSTOMERS C
    JOIN ORDERS O
      ON C.CUSTOMER_ID = O.CUSTOMER_ID
    ORDER BY O.ORDER_DATE DESC
)
WHERE ROWNUM <= 5;


-- Q43. Find the 5 employees who handled the latest orders.

SELECT *
FROM (
    SELECT E.EMP_NAME,
           O.ORDER_ID,
           O.ORDER_DATE
    FROM EMPLOYEES E
    JOIN ORDERS O
      ON E.EMP_ID = O.EMP_ID
    ORDER BY O.ORDER_DATE DESC
)
WHERE ROWNUM <= 5;


-- Q44. Find the 5 products with highest total stock value.

SELECT *
FROM (
    SELECT P.PRODUCT_NAME,
           P.STOCK * P.PRICE AS STOCK_VALUE
    FROM PRODUCTS P
    ORDER BY STOCK_VALUE DESC
)
WHERE ROWNUM <= 5;


-- Q45. Find the 5 largest sales transactions.

SELECT *
FROM (
    SELECT OI.ORDER_ITEM_ID,
           PR.PRODUCT_NAME,
           OI.QUANTITY * OI.PRICE AS SALES_VALUE
    FROM ORDER_ITEMS OI
    JOIN PRODUCTS PR
      ON OI.PRODUCT_ID = PR.PRODUCT_ID
    ORDER BY SALES_VALUE DESC
)
WHERE ROWNUM <= 5;


-- =====================================================
-- LEVEL 4: TOP-N + GROUP BY
-- Q46-Q60
-- =====================================================


-- Q46. Find the top 5 customers by number of orders.

SELECT *
FROM (
    SELECT C.CUSTOMER_NAME,
           COUNT(O.ORDER_ID) AS NO_OF_ORDERS
    FROM CUSTOMERS C
    JOIN ORDERS O
      ON C.CUSTOMER_ID = O.CUSTOMER_ID
    GROUP BY C.CUSTOMER_NAME
    ORDER BY NO_OF_ORDERS DESC
)
WHERE ROWNUM <= 5;


-- Q47. Find the top 5 employees by number of handled orders.

SELECT *
FROM (
    SELECT E.EMP_NAME,
           COUNT(O.ORDER_ID) AS NO_OF_ORDERS
    FROM EMPLOYEES E
    JOIN ORDERS O
      ON E.EMP_ID = O.EMP_ID
    GROUP BY E.EMP_NAME
    ORDER BY NO_OF_ORDERS DESC
)
WHERE ROWNUM <= 5;


-- Q48. Find the top 5 suppliers by number of products.

SELECT *
FROM (
    SELECT S.SUPPLIER_NAME,
           COUNT(P.PRODUCT_ID) AS NO_OF_PRODUCTS
    FROM SUPPLIERS S
    JOIN PRODUCTS P
      ON S.SUPPLIER_ID = P.SUPPLIER_ID
    GROUP BY S.SUPPLIER_NAME
    ORDER BY NO_OF_PRODUCTS DESC
)
WHERE ROWNUM <= 5;


-- Q49. Find the top 5 categories by number of products.

SELECT *
FROM (
    SELECT C.CATEGORY_NAME,
           COUNT(P.PRODUCT_ID) AS NO_OF_PRODUCTS
    FROM CATEGORIES C
    JOIN PRODUCTS P
      ON C.CATEGORY_ID = P.CATEGORY_ID
    GROUP BY C.CATEGORY_NAME
    ORDER BY NO_OF_PRODUCTS DESC
)
WHERE ROWNUM <= 5;


-- Q50. Find the top 5 products by total quantity sold.

SELECT *
FROM (
    SELECT P.PRODUCT_NAME,
           SUM(OI.QUANTITY) AS TOTAL_QUANTITY
    FROM PRODUCTS P
    JOIN ORDER_ITEMS OI
      ON P.PRODUCT_ID = OI.PRODUCT_ID
    GROUP BY P.PRODUCT_NAME
    ORDER BY TOTAL_QUANTITY DESC
)
WHERE ROWNUM <= 5;


-- Q51. Find the top 5 products by total sales value.

SELECT *
FROM (
    SELECT P.PRODUCT_NAME,
           SUM(OI.QUANTITY * OI.PRICE) AS TOTAL_SALES
    FROM PRODUCTS P
    JOIN ORDER_ITEMS OI
      ON P.PRODUCT_ID = OI.PRODUCT_ID
    GROUP BY P.PRODUCT_NAME
    ORDER BY TOTAL_SALES DESC
)
WHERE ROWNUM <= 5;


-- Q52. Find the top 5 categories by total sales value.

SELECT *
FROM (
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
WHERE ROWNUM <= 5;


-- Q53. Find the top 5 suppliers by total purchase quantity.

SELECT *
FROM (
    SELECT S.SUPPLIER_NAME,
           SUM(PU.QUANTITY) AS TOTAL_PURCHASE_QTY
    FROM SUPPLIERS S
    JOIN PURCHASES PU
      ON S.SUPPLIER_ID = PU.SUPPLIER_ID
    GROUP BY S.SUPPLIER_NAME
    ORDER BY TOTAL_PURCHASE_QTY DESC
)
WHERE ROWNUM <= 5;


-- Q54. Find the top 5 customers by total payment amount.

SELECT *
FROM (
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
WHERE ROWNUM <= 5;


-- Q55. Find the top 3 payment modes by total amount.

SELECT *
FROM (
    SELECT PM.PAYMENT_MODE,
           SUM(PM.AMOUNT) AS TOTAL_AMOUNT
    FROM PAYMENTS PM
    GROUP BY PM.PAYMENT_MODE
    ORDER BY TOTAL_AMOUNT DESC
)
WHERE ROWNUM <= 3;


-- Q56. Find the top 5 categories by average product price.

SELECT *
FROM (
    SELECT C.CATEGORY_NAME,
           AVG(P.PRICE) AS AVG_PRICE
    FROM CATEGORIES C
    JOIN PRODUCTS P
      ON C.CATEGORY_ID = P.CATEGORY_ID
    GROUP BY C.CATEGORY_NAME
    ORDER BY AVG_PRICE DESC
)
WHERE ROWNUM <= 5;


-- Q57. Find the top 5 suppliers by total purchase value.

SELECT *
FROM (
    SELECT S.SUPPLIER_NAME,
           SUM(PU.QUANTITY * P.PRICE) AS TOTAL_VALUE
    FROM SUPPLIERS S
    JOIN PURCHASES PU
      ON S.SUPPLIER_ID = PU.SUPPLIER_ID
    JOIN PRODUCTS P
      ON PU.PRODUCT_ID = P.PRODUCT_ID
    GROUP BY S.SUPPLIER_NAME
    ORDER BY TOTAL_VALUE DESC
)
WHERE ROWNUM <= 5;


-- Q58. Find the top 5 customers by average payment amount.

SELECT *
FROM (
    SELECT C.CUSTOMER_NAME,
           AVG(PM.AMOUNT) AS AVG_PAYMENT
    FROM CUSTOMERS C
    JOIN ORDERS O
      ON C.CUSTOMER_ID = O.CUSTOMER_ID
    JOIN PAYMENTS PM
      ON O.ORDER_ID = PM.ORDER_ID
    GROUP BY C.CUSTOMER_NAME
    ORDER BY AVG_PAYMENT DESC
)
WHERE ROWNUM <= 5;


-- Q59. Find the top 5 employees by total salary.

SELECT *
FROM (
    SELECT E.EMP_NAME,
           E.SALARY
    FROM EMPLOYEES E
    ORDER BY E.SALARY DESC
)
WHERE ROWNUM <= 5;


-- Q60. Find the top 5 cities by number of customers.

SELECT *
FROM (
    SELECT C.CITY,
           COUNT(*) AS NO_OF_CUSTOMERS
    FROM CUSTOMERS C
    GROUP BY C.CITY
    ORDER BY NO_OF_CUSTOMERS DESC
)
WHERE ROWNUM <= 5;


-- =====================================================
-- LEVEL 5: BOTTOM-N
-- Q61-Q70
-- =====================================================


-- Q61. Find the 5 cheapest products.

SELECT *
FROM (
    SELECT PRODUCT_NAME, PRICE
    FROM PRODUCTS
    ORDER BY PRICE ASC
)
WHERE ROWNUM <= 5;


-- Q62. Find the 5 employees with the lowest salaries.

SELECT *
FROM (
    SELECT EMP_NAME, SALARY
    FROM EMPLOYEES
    ORDER BY SALARY ASC
)
WHERE ROWNUM <= 5;


-- Q63. Find the 5 products with the lowest stock.

SELECT *
FROM (
    SELECT PRODUCT_NAME, STOCK
    FROM PRODUCTS
    ORDER BY STOCK ASC
)
WHERE ROWNUM <= 5;


-- Q64. Find the 5 customers with the earliest orders.

SELECT *
FROM (
    SELECT C.CUSTOMER_NAME,
           O.ORDER_DATE
    FROM CUSTOMERS C
    JOIN ORDERS O
      ON C.CUSTOMER_ID = O.CUSTOMER_ID
    ORDER BY O.ORDER_DATE ASC
)
WHERE ROWNUM <= 5;


-- Q65. Find the 5 smallest payments.

SELECT *
FROM (
    SELECT PAYMENT_ID, AMOUNT
    FROM PAYMENTS
    ORDER BY AMOUNT ASC
)
WHERE ROWNUM <= 5;


-- Q66. Find the 5 products with the lowest total quantity sold.

SELECT *
FROM (
    SELECT P.PRODUCT_NAME,
           SUM(OI.QUANTITY) AS TOTAL_SOLD
    FROM PRODUCTS P
    JOIN ORDER_ITEMS OI
      ON P.PRODUCT_ID = OI.PRODUCT_ID
    GROUP BY P.PRODUCT_NAME
    ORDER BY TOTAL_SOLD ASC
)
WHERE ROWNUM <= 5;


-- Q67. Find the 5 categories with the lowest sales value.

SELECT *
FROM (
    SELECT C.CATEGORY_NAME,
           SUM(OI.QUANTITY * OI.PRICE) AS TOTAL_SALES
    FROM CATEGORIES C
    JOIN PRODUCTS P
      ON C.CATEGORY_ID = P.CATEGORY_ID
    JOIN ORDER_ITEMS OI
      ON P.PRODUCT_ID = OI.PRODUCT_ID
    GROUP BY C.CATEGORY_NAME
    ORDER BY TOTAL_SALES ASC
)
WHERE ROWNUM <= 5;


-- Q68. Find the 5 suppliers with the lowest purchase quantity.

SELECT *
FROM (
    SELECT S.SUPPLIER_NAME,
           SUM(PU.QUANTITY) AS TOTAL_PURCHASE
    FROM SUPPLIERS S
    JOIN PURCHASES PU
      ON S.SUPPLIER_ID = PU.SUPPLIER_ID
    GROUP BY S.SUPPLIER_NAME
    ORDER BY TOTAL_PURCHASE ASC
)
WHERE ROWNUM <= 5;


-- Q69. Find the 3 payment modes with the lowest total amount.

SELECT *
FROM (
    SELECT PAYMENT_MODE,
           SUM(AMOUNT) AS TOTAL_AMOUNT
    FROM PAYMENTS
    GROUP BY PAYMENT_MODE
    ORDER BY TOTAL_AMOUNT ASC
)
WHERE ROWNUM <= 3;


-- Q70. Find the 5 cities having the fewest customers.

SELECT *
FROM (
    SELECT CITY,
           COUNT(*) AS NO_OF_CUSTOMERS
    FROM CUSTOMERS
    GROUP BY CITY
    ORDER BY NO_OF_CUSTOMERS ASC
)
WHERE ROWNUM <= 5;


-- =====================================================
-- LEVEL 6: ROWNUM + CONDITIONS
-- Q71-Q80
-- =====================================================


-- Q71. Find the top 5 products priced above 1000.

SELECT *
FROM (
    SELECT PRODUCT_NAME, PRICE
    FROM PRODUCTS
    WHERE PRICE > 1000
    ORDER BY PRICE DESC
)
WHERE ROWNUM <= 5;


-- Q72. Find the top 5 products with stock below 50.

SELECT *
FROM (
    SELECT PRODUCT_NAME, STOCK
    FROM PRODUCTS
    WHERE STOCK < 50
    ORDER BY STOCK ASC
)
WHERE ROWNUM <= 5;


-- Q73. Find the top 5 highest-paid employees with salary above 30000.

SELECT *
FROM (
    SELECT EMP_NAME, SALARY
    FROM EMPLOYEES
    WHERE SALARY > 30000
    ORDER BY SALARY DESC
)
WHERE ROWNUM <= 5;


-- Q74. Find the latest 5 delivered orders.

SELECT *
FROM (
    SELECT ORDER_ID, ORDER_DATE, STATUS
    FROM ORDERS
    WHERE STATUS = 'DELIVERED'
    ORDER BY ORDER_DATE DESC
)
WHERE ROWNUM <= 5;


-- Q75. Find the top 5 payments above 10000.

SELECT *
FROM (
    SELECT PAYMENT_ID, AMOUNT
    FROM PAYMENTS
    WHERE AMOUNT > 10000
    ORDER BY AMOUNT DESC
)
WHERE ROWNUM <= 5;


-- Q76. Find the top 5 products in ELECTRONICS by price.

SELECT *
FROM (
    SELECT P.PRODUCT_NAME,
           P.PRICE
    FROM PRODUCTS P
    JOIN CATEGORIES C
      ON P.CATEGORY_ID = C.CATEGORY_ID
    WHERE C.CATEGORY_NAME = 'ELECTRONICS'
    ORDER BY P.PRICE DESC
)
WHERE ROWNUM <= 5;


-- Q77. Find the top 5 products supplied by suppliers from HYDERABAD.

SELECT *
FROM (
    SELECT P.PRODUCT_NAME,
           S.SUPPLIER_NAME,
           P.PRICE
    FROM PRODUCTS P
    JOIN SUPPLIERS S
      ON P.SUPPLIER_ID = S.SUPPLIER_ID
    WHERE S.CITY = 'HYDERABAD'
    ORDER BY P.PRICE DESC
)
WHERE ROWNUM <= 5;


-- Q78. Find the latest 5 orders placed by customers from MUMBAI.

SELECT *
FROM (
    SELECT O.ORDER_ID,
           C.CUSTOMER_NAME,
           O.ORDER_DATE
    FROM ORDERS O
    JOIN CUSTOMERS C
      ON O.CUSTOMER_ID = C.CUSTOMER_ID
    WHERE C.CITY = 'MUMBAI'
    ORDER BY O.ORDER_DATE DESC
)
WHERE ROWNUM <= 5;


-- Q79. Find the top 5 order items where quantity is greater than 5.

SELECT *
FROM (
    SELECT OI.ORDER_ITEM_ID,
           OI.QUANTITY
    FROM ORDER_ITEMS OI
    WHERE OI.QUANTITY > 5
    ORDER BY OI.QUANTITY DESC
)
WHERE ROWNUM <= 5;


-- Q80. Find the top 5 purchases where quantity is greater than 50.

SELECT *
FROM (
    SELECT PU.PURCHASE_ID,
           PU.QUANTITY
    FROM PURCHASES PU
    WHERE PU.QUANTITY > 50
    ORDER BY PU.QUANTITY DESC
)
WHERE ROWNUM <= 5;


-- =====================================================
-- LEVEL 7: PAGINATION USING ROWNUM
-- Q81-Q90
-- =====================================================


-- Q81. Display rows 1 to 5 from PRODUCTS.

SELECT *
FROM (
    SELECT ROWNUM RN, P.*
    FROM PRODUCTS P
)
WHERE RN BETWEEN 1 AND 5;


-- Q82. Display rows 6 to 10 from PRODUCTS.

SELECT *
FROM (
    SELECT ROWNUM RN, P.*
    FROM PRODUCTS P
)
WHERE RN BETWEEN 6 AND 10;


-- Q83. Display rows 11 to 15 from PRODUCTS.

SELECT *
FROM (
    SELECT ROWNUM RN, P.*
    FROM PRODUCTS P
)
WHERE RN BETWEEN 11 AND 15;


-- Q84. Display rows 6 to 10 of products ordered by price descending.

SELECT *
FROM (
    SELECT ROWNUM RN, T.*
    FROM (
        SELECT P.PRODUCT_NAME, P.PRICE
        FROM PRODUCTS P
        ORDER BY P.PRICE DESC
    ) T
    WHERE ROWNUM <= 10
)
WHERE RN >= 6;


-- Q85. Display rows 11 to 15 of products ordered by price descending.

SELECT *
FROM (
    SELECT ROWNUM RN, T.*
    FROM (
        SELECT P.PRODUCT_NAME, P.PRICE
        FROM PRODUCTS P
        ORDER BY P.PRICE DESC
    ) T
    WHERE ROWNUM <= 15
)
WHERE RN >= 11;


-- Q86. Display employees ranked 6 to 10 by salary.

SELECT *
FROM (
    SELECT ROWNUM RN, T.*
    FROM (
        SELECT E.EMP_NAME, E.SALARY
        FROM EMPLOYEES E
        ORDER BY E.SALARY DESC
    ) T
    WHERE ROWNUM <= 10
)
WHERE RN >= 6;


-- Q87. Display products ranked 11 to 20 by stock.

SELECT *
FROM (
    SELECT ROWNUM RN, T.*
    FROM (
        SELECT P.PRODUCT_NAME, P.STOCK
        FROM PRODUCTS P
        ORDER BY P.STOCK DESC
    ) T
    WHERE ROWNUM <= 20
)
WHERE RN >= 11;


-- Q88. Display orders 6 to 10 by latest order date.

SELECT *
FROM (
    SELECT ROWNUM RN, T.*
    FROM (
        SELECT O.ORDER_ID, O.ORDER_DATE
        FROM ORDERS O
        ORDER BY O.ORDER_DATE DESC
    ) T
    WHERE ROWNUM <= 10
)
WHERE RN >= 6;


-- Q89. List the top 5 employees who have handled the highest number of orders.
SELECT EMP_NAME, NO_OF_ORDERS
FROM (
    SELECT E.EMP_NAME,
           COUNT(O.ORDER_ID) AS NO_OF_ORDERS
    FROM EMPLOYEES E
    JOIN ORDERS O
        ON E.EMP_ID = O.EMP_ID
    GROUP BY E.EMP_NAME
    ORDER BY NO_OF_ORDERS DESC
)
WHERE ROWNUM <= 5;


-- Q90. Display products ranked 21 to 30 by price.

SELECT *
FROM (
    SELECT ROWNUM RN, T.*
    FROM (
        SELECT P.PRODUCT_NAME, P.PRICE
        FROM PRODUCTS P
        ORDER BY P.PRICE DESC
    ) T
    WHERE ROWNUM <= 30
)
WHERE RN >= 21;


-- =====================================================
-- LEVEL 8: INTERVIEW / ADVANCED TOP-N
-- Q91-Q100
-- =====================================================


-- Q91. List the top 3 customers who have made the highest total payment amount.
SELECT CUSTOMER_NAME, TOTAL_PAID
FROM (
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
WHERE ROWNUM <= 3;


-- Q92. Find the second-highest salary using ROWNUM.

SELECT SALARY
FROM (
    SELECT SALARY
    FROM EMPLOYEES
    ORDER BY SALARY DESC
)
WHERE ROWNUM <= 2
MINUS
SELECT SALARY
FROM (
    SELECT SALARY
    FROM EMPLOYEES
    ORDER BY SALARY DESC
)
WHERE ROWNUM = 1;


-- Q93. Find the top 3 highest-paid employees.

SELECT *
FROM (
    SELECT E.EMP_NAME, E.SALARY
    FROM EMPLOYEES E
    ORDER BY E.SALARY DESC
)
WHERE ROWNUM <= 3;


-- Q94. Find the 3 most expensive products in each result set after sorting.

SELECT *
FROM (
    SELECT P.PRODUCT_NAME,
           P.PRICE
    FROM PRODUCTS P
    ORDER BY P.PRICE DESC
)
WHERE ROWNUM <= 3;


-- Q95. Find the customer with the highest total payment.

SELECT *
FROM (
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


-- Q96. Find the product with the highest total sales value.

SELECT *
FROM (
    SELECT P.PRODUCT_NAME,
           SUM(OI.QUANTITY * OI.PRICE) AS TOTAL_SALES
    FROM PRODUCTS P
    JOIN ORDER_ITEMS OI
      ON P.PRODUCT_ID = OI.PRODUCT_ID
    GROUP BY P.PRODUCT_NAME
    ORDER BY TOTAL_SALES DESC
)
WHERE ROWNUM = 1;


-- Q97. Find the category with the highest total sales value.

SELECT *
FROM (
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


-- Q98. Find the supplier with the highest number of products.

SELECT *
FROM (
    SELECT S.SUPPLIER_NAME,
           COUNT(P.PRODUCT_ID) AS NO_OF_PRODUCTS
    FROM SUPPLIERS S
    JOIN PRODUCTS P
      ON S.SUPPLIER_ID = P.SUPPLIER_ID
    GROUP BY S.SUPPLIER_NAME
    ORDER BY NO_OF_PRODUCTS DESC
)
WHERE ROWNUM = 1;


-- Q99. Find the employee who handled the highest number of orders.

SELECT *
FROM (
    SELECT E.EMP_NAME,
           COUNT(O.ORDER_ID) AS NO_OF_ORDERS
    FROM EMPLOYEES E
    JOIN ORDERS O
      ON E.EMP_ID = O.EMP_ID
    GROUP BY E.EMP_NAME
    ORDER BY NO_OF_ORDERS DESC
)
WHERE ROWNUM = 1;


-- Q100. Find the top 5 customers by total sales value.

SELECT *
FROM (
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
WHERE ROWNUM <= 5;


-- =====================================================
-- PRACTICE ORDER
-- =====================================================

-- Q01-Q15   : ROWNUM BASIC
-- Q16-Q30   : ROWNUM + ORDER BY
-- Q31-Q45   : TOP-N WITH JOINS
-- Q46-Q60   : TOP-N + GROUP BY
-- Q61-Q70   : BOTTOM-N
-- Q71-Q80   : ROWNUM + CONDITIONS
-- Q81-Q90   : PAGINATION
-- Q91-Q100  : INTERVIEW / ADVANCED TOP-N


-- =====================================================
-- IMPORTANT ROWNUM PATTERNS TO REMEMBER
-- =====================================================

-- PATTERN 01: FIRST N ROWS

-- SELECT *
-- FROM TABLE_NAME
-- WHERE ROWNUM <= 5;


-- PATTERN 02: TOP-N

-- SELECT *
-- FROM (
--     SELECT *
--     FROM TABLE_NAME
--     ORDER BY COLUMN_NAME DESC
-- )
-- WHERE ROWNUM <= 5;


-- PATTERN 03: BOTTOM-N

-- SELECT *
-- FROM (
--     SELECT *
--     FROM TABLE_NAME
--     ORDER BY COLUMN_NAME ASC
-- )
-- WHERE ROWNUM <= 5;


-- PATTERN 04: PAGINATION

-- SELECT *
-- FROM (
--     SELECT ROWNUM RN, T.*
--     FROM (
--         SELECT *
--         FROM TABLE_NAME
--         ORDER BY COLUMN_NAME DESC
--     ) T
--     WHERE ROWNUM <= 10
-- )
-- WHERE RN >= 6;


-- PATTERN 05: TOP-N WITH GROUP BY

-- SELECT *
-- FROM (
--     SELECT GROUP_COLUMN,
--            SUM(VALUE_COLUMN) AS TOTAL_VALUE
--     FROM TABLE_NAME
--     GROUP BY GROUP_COLUMN
--     ORDER BY TOTAL_VALUE DESC
-- )
-- WHERE ROWNUM <= 5;


-- PATTERN 06: TOP-N WITH JOIN

-- SELECT *
-- FROM (
--     SELECT T1.COLUMN_NAME,
--            T2.COLUMN_NAME
--     FROM TABLE1 T1
--     JOIN TABLE2 T2
--       ON T1.KEY = T2.KEY
--     ORDER BY T1.VALUE_COLUMN DESC
-- )
-- WHERE ROWNUM <= 5;


-- =====================================================
-- ROWNUM INTERVIEW RULE
-- =====================================================

-- WRONG:

-- SELECT PRODUCT_NAME, PRICE
-- FROM PRODUCTS
-- WHERE ROWNUM <= 5
-- ORDER BY PRICE DESC;


-- CORRECT:

-- SELECT *
-- FROM (
--     SELECT PRODUCT_NAME, PRICE
--     FROM PRODUCTS
--     ORDER BY PRICE DESC
-- )
-- WHERE ROWNUM <= 5;


-- =====================================================
-- ROWNUM vs ROW_NUMBER()
-- =====================================================

-- ROWNUM:
-- Oracle pseudocolumn.
-- Useful for Top-N and pagination.
-- Assigned as rows are returned.

-- ROW_NUMBER():
-- Analytic function.
-- Generates sequential numbers according to ORDER BY.
-- Can be used for partitioned ranking.

-- =====================================================
-- PROJECT TABLES USED
-- =====================================================

-- CATEGORIES
-- CATEGORY_ID, CATEGORY_NAME

-- CUSTOMERS
-- CUSTOMER_ID, CUSTOMER_NAME, PHONE, EMAIL, ADDRESS, CITY

-- EMPLOYEES
-- EMP_ID, EMP_NAME, DESIGNATION, SALARY

-- PRODUCTS
-- PRODUCT_ID, PRODUCT_NAME, CATEGORY_ID, SUPPLIER_ID, PRICE, STOCK

-- SUPPLIERS
-- SUPPLIER_ID, SUPPLIER_NAME, PHONE, EMAIL

-- ORDERS
-- ORDER_ID, CUSTOMER_ID, EMP_ID, ORDER_DATE, STATUS

-- ORDER_ITEMS
-- ORDER_ITEM_ID, ORDER_ID, PRODUCT_ID, QUANTITY, PRICE

-- PAYMENTS
-- PAYMENT_ID, ORDER_ID, PAYMENT_MODE, PAYMENT_DATE, AMOUNT

-- PURCHASES
-- PURCHASE_ID, SUPPLIER_ID, PRODUCT_ID, QUANTITY, PURCHASE_DATE

-- INVENTORY_LOG
-- LOG_ID, PRODUCT_ID, OLD_STOCK, NEW_STOCK, UPDATED_DATE


-- =====================================================
-- END OF ROWNUM / TOP-N PRACTICE
-- =====================================================

SPOOL OFF