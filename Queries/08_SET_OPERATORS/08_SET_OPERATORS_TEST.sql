-- =====================================================
-- ORACLE SQL SET OPERATORS - RULES, SYNTAX & 100 QUESTIONS
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
-- SET OPERATORS TEST
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

SPOOL 'F:\Exploring Technologies\OrcaleSqlPlusExploring\Oracle_Inventory_Sales_Management_System\Queries\08_Set_Operators\08_SET_OPERATORS_TEST_OUTPUT.txt'


-- ============================================================
-- ORACLE SQL 11g
-- SET OPERATORS — COMPLETE TEST
-- ============================================================
-- Total Questions : 100
-- Difficulty      : Basic -> Intermediate -> Advanced
--
-- Topics Covered:
-- 1. UNION
-- 2. UNION ALL
-- 3. INTERSECT
-- 4. MINUS
-- 5. Set operators with WHERE conditions
-- 6. Set operators with aggregate functions
-- 7. Set operators with ORDER BY
-- 8. Set operators combined with JOINS
-- 9. Set operators combined with subqueries
-- 10. Interview-style / advanced set operator problems
--
-- IMPORTANT:
-- Every query combined by a set operator must return the SAME
-- NUMBER OF COLUMNS, in the SAME ORDER, with COMPATIBLE DATATYPES.
-- Column names/aliases in the final result come from the FIRST
-- SELECT only.
-- ============================================================
-- =====================================================
-- SET OPERATORS
-- =====================================================

-- UNION       : Combines results of two queries, removing duplicate rows,
--               and sorts the result.
-- UNION ALL   : Combines results of two queries, KEEPING all duplicates,
--               and does NOT sort (faster than UNION).
-- INTERSECT   : Returns only the rows that are common to both queries.
-- MINUS       : Returns rows from the first query that do NOT appear
--               in the second query (Oracle's version of EXCEPT).

-- =====================================================
-- BASIC SYNTAX
-- =====================================================

-- UNION
--SELECT columns FROM table1
--UNION
--SELECT columns FROM table2;

-- UNION ALL
--SELECT columns FROM table1
--UNION ALL
--SELECT columns FROM table2;

-- INTERSECT
--SELECT columns FROM table1
--INTERSECT
--SELECT columns FROM table2;

-- MINUS
--SELECT columns FROM table1
--MINUS
--SELECT columns FROM table2;

-- SET OPERATOR + ORDER BY (ORDER BY GOES AT THE VERY END, ONCE ONLY)
--SELECT columns FROM table1
--UNION
--SELECT columns FROM table2
--ORDER BY column;

-- =====================================================
-- SET OPERATOR RULES
-- =====================================================

-- RULE 01: All SELECT statements combined by a set operator must return the same number of columns.
-- RULE 02: Corresponding columns across all SELECTs must have compatible datatypes.
-- RULE 03: Column names/headings in the final result are taken from the FIRST SELECT statement.
-- RULE 04: UNION removes duplicate rows from the combined result.
-- RULE 05: UNION ALL keeps all rows, including duplicates, and is faster than UNION because it skips the sort/dedup step.
-- RULE 06: INTERSECT returns only rows present in the result of BOTH queries.
-- RULE 07: MINUS returns rows from the first query's result that do not appear in the second query's result.
-- RULE 08: ORDER BY can only appear once, at the very end of the entire combined statement.
-- RULE 09: ORDER BY must use column names/aliases/positions from the FIRST SELECT.
-- RULE 10: You cannot use ORDER BY inside one of the individual SELECT statements being combined (only at the end).
-- RULE 11: Set operators can combine more than two SELECT statements by chaining them.
-- RULE 12: When mixing set operators (e.g., UNION and MINUS together), use parentheses to control evaluation order.
-- RULE 13: GROUP BY and HAVING can be used inside each individual SELECT of a set operator query.
-- RULE 14: A set-operator query cannot use FOR UPDATE.
-- RULE 15: NULLs are treated as equal to each other when Oracle determines duplicates for UNION/INTERSECT/MINUS.
-- RULE 16: UNION ALL should be preferred over UNION whenever duplicates are known not to matter, for performance.
-- RULE 17: The number of columns, not their names, is what must match between SELECTs (aliases can differ).
-- RULE 18: MINUS is order-sensitive: A MINUS B is not the same as B MINUS A.
-- RULE 19: INTERSECT is commutative: A INTERSECT B gives the same rows as B INTERSECT A (row order may differ without ORDER BY).
-- RULE 20: Set operators are often used to simulate outer joins, symmetric differences, or "in A but not B" style comparisons.

-- =====================================================
-- EXECUTION ORDER (CONCEPTUAL)
-- =====================================================

-- EACH INDIVIDUAL SELECT IS EVALUATED
-- THE SET OPERATOR IS APPLIED TO COMBINE THE RESULTS
-- (UNION/INTERSECT/MINUS PERFORM AN IMPLICIT SORT-DISTINCT, UNION ALL DOES NOT)
-- FINAL ORDER BY (IF ANY) IS APPLIED LAST

-- =====================================================
-- LEVEL 1: UNION - BASICS
-- =====================================================

-- Q01. List all distinct cities that appear in either CUSTOMERS or SUPPLIERS.
SELECT CITY FROM CUSTOMERS
UNION
SELECT CITY FROM SUPPLIERS;

-- Q02. List all distinct phone numbers used by either customers or suppliers.
SELECT PHONE FROM CUSTOMERS
UNION
SELECT PHONE FROM SUPPLIERS;

-- Q03. List all distinct emails used by either customers or suppliers.
SELECT EMAIL FROM CUSTOMERS
UNION
SELECT EMAIL FROM SUPPLIERS;

-- Q04. List all distinct IDs that are either a product ID or a category ID.
SELECT PRODUCT_ID FROM PRODUCTS
UNION
SELECT CATEGORY_ID FROM CATEGORIES;

-- Q05. List all distinct names from employees and customers combined.
SELECT EMP_NAME AS PERSON_NAME FROM EMPLOYEES
UNION
SELECT CUSTOMER_NAME FROM CUSTOMERS;

-- Q06. List all distinct order statuses that appear in ORDERS.
SELECT STATUS FROM ORDERS
UNION
SELECT STATUS FROM ORDERS;

-- Q07. List all distinct dates that appear as either an order date or a payment date.
SELECT ORDER_DATE AS EVENT_DATE FROM ORDERS
UNION
SELECT PAYMENT_DATE FROM PAYMENTS;

-- Q08. List all distinct dates that appear as either an order date or a purchase date.
SELECT ORDER_DATE AS EVENT_DATE FROM ORDERS
UNION
SELECT PURCHASE_DATE FROM PURCHASES;

-- Q09. List all distinct payment modes used, combined with all distinct order statuses (as a single labeled list).
SELECT 'PAYMENT_MODE' AS TYPE, PAYMENT_MODE AS VALUE FROM PAYMENTS
UNION
SELECT 'ORDER_STATUS' AS TYPE, STATUS AS VALUE FROM ORDERS;

-- Q10. List all supplier IDs and all customer IDs together as a single distinct list of "party" IDs.
SELECT SUPPLIER_ID AS PARTY_ID FROM SUPPLIERS
UNION
SELECT CUSTOMER_ID FROM CUSTOMERS;

-- =====================================================
-- LEVEL 2: UNION ALL
-- =====================================================

-- Q11. List all cities from customers and suppliers, keeping duplicates.
SELECT CITY FROM CUSTOMERS
UNION ALL
SELECT CITY FROM SUPPLIERS;

-- Q12. List all product IDs referenced in ORDER_ITEMS and all product IDs referenced in PURCHASES, keeping duplicates.
SELECT PRODUCT_ID FROM ORDER_ITEMS
UNION ALL
SELECT PRODUCT_ID FROM PURCHASES;

-- Q13. List all payment amounts and all order-item sales values together, keeping duplicates.
SELECT AMOUNT FROM PAYMENTS
UNION ALL
SELECT QUANTITY*PRICE FROM ORDER_ITEMS;

-- Q14. List all employee names and all customer names together, keeping duplicates.
SELECT EMP_NAME AS PERSON_NAME FROM EMPLOYEES
UNION ALL
SELECT CUSTOMER_NAME FROM CUSTOMERS;

-- Q15. Count the total number of "contact" rows by combining customers and suppliers with UNION ALL.
SELECT COUNT(*) AS TOTAL_CONTACTS FROM (
  SELECT CUSTOMER_ID AS ID FROM CUSTOMERS
  UNION ALL
  SELECT SUPPLIER_ID FROM SUPPLIERS
);

-- Q16. List all supplier IDs from PRODUCTS and all supplier IDs from PURCHASES, keeping duplicates.
SELECT SUPPLIER_ID FROM PRODUCTS
UNION ALL
SELECT SUPPLIER_ID FROM PURCHASES;

-- Q17. List all quantities from ORDER_ITEMS and all quantities from PURCHASES, keeping duplicates.
SELECT QUANTITY FROM ORDER_ITEMS
UNION ALL
SELECT QUANTITY FROM PURCHASES;

-- Q18. List all order IDs from ORDERS and all order IDs from PAYMENTS, keeping duplicates (to spot mismatches later).
SELECT ORDER_ID FROM ORDERS
UNION ALL
SELECT ORDER_ID FROM PAYMENTS;

-- Q19. List all prices from PRODUCTS and all prices from ORDER_ITEMS, keeping duplicates.
SELECT PRICE FROM PRODUCTS
UNION ALL
SELECT PRICE FROM ORDER_ITEMS;

-- Q20. List all category IDs from PRODUCTS and all category IDs from CATEGORIES, keeping duplicates.
SELECT CATEGORY_ID FROM PRODUCTS
UNION ALL
SELECT CATEGORY_ID FROM CATEGORIES;

-- =====================================================
-- LEVEL 3: INTERSECT
-- =====================================================

-- Q21. Find cities that have both a customer AND a supplier located there.
SELECT CITY FROM CUSTOMERS
INTERSECT
SELECT CITY FROM SUPPLIERS;

-- Q22. Find product IDs that appear in BOTH ORDER_ITEMS and PURCHASES.
SELECT PRODUCT_ID FROM ORDER_ITEMS
INTERSECT
SELECT PRODUCT_ID FROM PURCHASES;

-- Q23. Find supplier IDs that appear in BOTH PRODUCTS and PURCHASES.
SELECT SUPPLIER_ID FROM PRODUCTS
INTERSECT
SELECT SUPPLIER_ID FROM PURCHASES;

-- Q24. Find order IDs that appear in BOTH ORDERS and PAYMENTS (i.e., orders that have been paid).
SELECT ORDER_ID FROM ORDERS
INTERSECT
SELECT ORDER_ID FROM PAYMENTS;

-- Q25. Find prices that appear in BOTH PRODUCTS and ORDER_ITEMS (exact price matches).
SELECT PRICE FROM PRODUCTS
INTERSECT
SELECT PRICE FROM ORDER_ITEMS;

-- Q26. Find category IDs that appear in BOTH PRODUCTS and CATEGORIES (i.e., categories that actually have products).
SELECT CATEGORY_ID FROM PRODUCTS
INTERSECT
SELECT CATEGORY_ID FROM CATEGORIES;

-- Q27. Find customer IDs that have BOTH placed an order AND made a payment.
SELECT O.CUSTOMER_ID FROM ORDERS O
INTERSECT
SELECT O2.CUSTOMER_ID FROM ORDERS O2 JOIN PAYMENTS PM ON O2.ORDER_ID = PM.ORDER_ID;

-- Q28. Find product IDs that exist in BOTH PRODUCTS and INVENTORY_LOG.
SELECT PRODUCT_ID FROM PRODUCTS
INTERSECT
SELECT PRODUCT_ID FROM INVENTORY_LOG;

-- Q29. Find employee IDs that have handled orders with BOTH 'PENDING' and 'DELIVERED' status.
SELECT EMP_ID FROM ORDERS WHERE STATUS = 'PENDING'
INTERSECT
SELECT EMP_ID FROM ORDERS WHERE STATUS = 'DELIVERED';

-- Q30. Find quantities that appear in BOTH ORDER_ITEMS and PURCHASES (exact quantity matches).
SELECT QUANTITY FROM ORDER_ITEMS
INTERSECT
SELECT QUANTITY FROM PURCHASES;

-- =====================================================
-- LEVEL 4: MINUS
-- =====================================================

-- Q31. Find cities that have a customer but NO supplier located there.
SELECT CITY FROM CUSTOMERS
MINUS
SELECT CITY FROM SUPPLIERS;

-- Q32. Find cities that have a supplier but NO customer located there.
SELECT CITY FROM SUPPLIERS
MINUS
SELECT CITY FROM CUSTOMERS;

-- Q33. Find products that have never appeared in ORDER_ITEMS.
SELECT PRODUCT_ID FROM PRODUCTS
MINUS
SELECT PRODUCT_ID FROM ORDER_ITEMS;

-- Q34. Find products that have never appeared in PURCHASES.
SELECT PRODUCT_ID FROM PRODUCTS
MINUS
SELECT PRODUCT_ID FROM PURCHASES;

-- Q35. Find orders that have NOT received any payment.
SELECT ORDER_ID FROM ORDERS
MINUS
SELECT ORDER_ID FROM PAYMENTS;

-- Q36. Find suppliers that supply NO products at all.
SELECT SUPPLIER_ID FROM SUPPLIERS
MINUS
SELECT SUPPLIER_ID FROM PRODUCTS;

-- Q37. Find categories that have NO products at all.
SELECT CATEGORY_ID FROM CATEGORIES
MINUS
SELECT CATEGORY_ID FROM PRODUCTS;

-- Q38. Find customers who have NEVER placed an order.
SELECT CUSTOMER_ID FROM CUSTOMERS
MINUS
SELECT CUSTOMER_ID FROM ORDERS;

-- Q39. Find employees who have NEVER handled an order.
SELECT EMP_ID FROM EMPLOYEES
MINUS
SELECT EMP_ID FROM ORDERS;

-- Q40. Find product IDs that appear in ORDER_ITEMS but NOT in PURCHASES.
SELECT PRODUCT_ID FROM ORDER_ITEMS
MINUS
SELECT PRODUCT_ID FROM PURCHASES;

-- =====================================================
-- LEVEL 5: SET OPERATORS + WHERE CONDITIONS
-- =====================================================

-- Q41. List customers from 'HYDERABAD' UNION suppliers from 'HYDERABAD' (city names only).
SELECT CUSTOMER_NAME AS PARTY_NAME FROM CUSTOMERS WHERE CITY = 'HYDERABAD'
UNION
SELECT SUPPLIER_NAME FROM SUPPLIERS WHERE CITY = 'HYDERABAD';

-- Q42. Find products priced above 1000 that are also products with stock below 10 (INTERSECT after filtering).
SELECT PRODUCT_ID FROM PRODUCTS WHERE PRICE > 1000
INTERSECT
SELECT PRODUCT_ID FROM PRODUCTS WHERE STOCK < 10;

-- Q43. Find employees earning above 30000 who are NOT also in designation 'MANAGER' (MINUS after filtering).
SELECT EMP_ID FROM EMPLOYEES WHERE SALARY > 30000
MINUS
SELECT EMP_ID FROM EMPLOYEES WHERE DESIGNATION = 'MANAGER';

-- Q44. List order IDs with status 'PENDING' UNION order IDs with status 'CANCELLED'.
SELECT ORDER_ID FROM ORDERS WHERE STATUS = 'PENDING'
UNION
SELECT ORDER_ID FROM ORDERS WHERE STATUS = 'CANCELLED';

-- Q45. Find suppliers in 'MUMBAI' who ALSO supply at least one product priced above 500 (INTERSECT).
SELECT SUPPLIER_ID FROM SUPPLIERS WHERE CITY = 'MUMBAI'
INTERSECT
SELECT SUPPLIER_ID FROM PRODUCTS WHERE PRICE > 500;

-- Q46. Find customers in 'DELHI' who have NOT placed any order with status 'DELIVERED' (MINUS).
SELECT CUSTOMER_ID FROM CUSTOMERS WHERE CITY = 'DELHI'
MINUS
SELECT CUSTOMER_ID FROM ORDERS WHERE STATUS = 'DELIVERED';

-- Q47. List products priced above 1000 UNION products with stock above 500.
SELECT PRODUCT_ID FROM PRODUCTS WHERE PRICE > 1000
UNION
SELECT PRODUCT_ID FROM PRODUCTS WHERE STOCK > 500;

-- Q48. Find purchase records with quantity above 100 that ALSO relate to a supplier in 'CHENNAI' (INTERSECT).
SELECT SUPPLIER_ID FROM PURCHASES WHERE QUANTITY > 100
INTERSECT
SELECT SUPPLIER_ID FROM SUPPLIERS WHERE CITY = 'CHENNAI';

-- Q49. Find employees with designation 'CLERK' who do NOT earn below 15000 (MINUS after filtering).
SELECT EMP_ID FROM EMPLOYEES WHERE DESIGNATION = 'CLERK'
MINUS
SELECT EMP_ID FROM EMPLOYEES WHERE SALARY < 15000;

-- Q50. List payment records using 'CASH' UNION payment records using 'CARD'.
SELECT PAYMENT_ID FROM PAYMENTS WHERE PAYMENT_MODE = 'CASH'
UNION
SELECT PAYMENT_ID FROM PAYMENTS WHERE PAYMENT_MODE = 'CARD';

-- =====================================================
-- LEVEL 6: SET OPERATORS + AGGREGATE FUNCTIONS
-- =====================================================

-- Q51. List designations with more than 2 employees UNION designations with average salary above 30000.
SELECT DESIGNATION FROM EMPLOYEES GROUP BY DESIGNATION HAVING COUNT(*) > 2
UNION
SELECT DESIGNATION FROM EMPLOYEES GROUP BY DESIGNATION HAVING AVG(SALARY) > 30000;

-- Q52. Find categories with more than 5 products that ALSO have total stock above 500 (INTERSECT of two HAVING filters).
SELECT CATEGORY_ID FROM PRODUCTS GROUP BY CATEGORY_ID HAVING COUNT(*) > 5
INTERSECT
SELECT CATEGORY_ID FROM PRODUCTS GROUP BY CATEGORY_ID HAVING SUM(STOCK) > 500;

-- Q53. Find suppliers with more than 10 products who do NOT also have average price above 1000 (MINUS of two HAVING filters).
SELECT SUPPLIER_ID FROM PRODUCTS GROUP BY SUPPLIER_ID HAVING COUNT(*) > 10
MINUS
SELECT SUPPLIER_ID FROM PRODUCTS GROUP BY SUPPLIER_ID HAVING AVG(PRICE) > 1000;

-- Q54. List customers with more than 3 orders UNION customers whose total payment exceeds 20000.
SELECT O.CUSTOMER_ID FROM ORDERS O GROUP BY O.CUSTOMER_ID HAVING COUNT(*) > 3
UNION
SELECT O2.CUSTOMER_ID FROM ORDERS O2 JOIN PAYMENTS PM ON O2.ORDER_ID = PM.ORDER_ID GROUP BY O2.CUSTOMER_ID HAVING SUM(PM.AMOUNT) > 20000;

-- Q55. Find products whose total quantity sold exceeds 100 that are NOT also products whose total quantity purchased exceeds 100 (MINUS).
SELECT PRODUCT_ID FROM ORDER_ITEMS GROUP BY PRODUCT_ID HAVING SUM(QUANTITY) > 100
MINUS
SELECT PRODUCT_ID FROM PURCHASES GROUP BY PRODUCT_ID HAVING SUM(QUANTITY) > 100;

-- Q56. Find employees who handle more than 5 orders AND belong to a designation with more than 2 employees (INTERSECT).
SELECT EMP_ID FROM ORDERS GROUP BY EMP_ID HAVING COUNT(*) > 5
INTERSECT
SELECT EMP_ID FROM EMPLOYEES WHERE DESIGNATION IN (SELECT DESIGNATION FROM EMPLOYEES GROUP BY DESIGNATION HAVING COUNT(*) > 2);

-- Q57. List payment modes with total amount above 50000 UNION payment modes used in more than 10 payments.
SELECT PAYMENT_MODE FROM PAYMENTS GROUP BY PAYMENT_MODE HAVING SUM(AMOUNT) > 50000
UNION
SELECT PAYMENT_MODE FROM PAYMENTS GROUP BY PAYMENT_MODE HAVING COUNT(*) > 10;

-- Q58. Find categories whose average price exceeds 1000 that are NOT among categories with more than 5 products (MINUS).
SELECT CATEGORY_ID FROM PRODUCTS GROUP BY CATEGORY_ID HAVING AVG(PRICE) > 1000
MINUS
SELECT CATEGORY_ID FROM PRODUCTS GROUP BY CATEGORY_ID HAVING COUNT(*) > 5;

-- Q59. Find suppliers with total purchase quantity above 200 AND total purchase value above 100000 (INTERSECT).
SELECT SUPPLIER_ID FROM PURCHASES GROUP BY SUPPLIER_ID HAVING SUM(QUANTITY) > 200
INTERSECT
SELECT SUPPLIER_ID FROM PURCHASES GROUP BY SUPPLIER_ID HAVING SUM(QUANTITY*PRICE) > 100000;

-- Q60. List designations having minimum salary above 15000 UNION designations having maximum salary below 50000.
SELECT DESIGNATION FROM EMPLOYEES GROUP BY DESIGNATION HAVING MIN(SALARY) > 15000
UNION
SELECT DESIGNATION FROM EMPLOYEES GROUP BY DESIGNATION HAVING MAX(SALARY) < 50000;

-- =====================================================
-- LEVEL 7: SET OPERATORS + ORDER BY
-- =====================================================

-- Q61. List all distinct cities from customers and suppliers, ordered alphabetically.
SELECT CITY FROM CUSTOMERS
UNION
SELECT CITY FROM SUPPLIERS
ORDER BY CITY;

-- Q62. List all product IDs that appear in either ORDER_ITEMS or PURCHASES, ordered ascending.
SELECT PRODUCT_ID FROM ORDER_ITEMS
UNION
SELECT PRODUCT_ID FROM PURCHASES
ORDER BY PRODUCT_ID;

-- Q63. Find cities with both a customer and a supplier, ordered alphabetically.
SELECT CITY FROM CUSTOMERS
INTERSECT
SELECT CITY FROM SUPPLIERS
ORDER BY CITY;

-- Q64. Find products never purchased, ordered by product id descending.
SELECT PRODUCT_ID FROM PRODUCTS
MINUS
SELECT PRODUCT_ID FROM PURCHASES
ORDER BY PRODUCT_ID DESC;

-- Q65. List all distinct order statuses, ordered alphabetically (self-union to demonstrate ORDER BY placement).
SELECT STATUS FROM ORDERS
UNION
SELECT STATUS FROM ORDERS
ORDER BY STATUS;

-- Q66. List employee names and customer names combined, ordered alphabetically, using column alias from the first SELECT.
SELECT EMP_NAME AS PERSON_NAME FROM EMPLOYEES
UNION
SELECT CUSTOMER_NAME FROM CUSTOMERS
ORDER BY PERSON_NAME;

-- Q67. List all supplier IDs and customer IDs combined as party IDs, ordered ascending.
SELECT SUPPLIER_ID AS PARTY_ID FROM SUPPLIERS
UNION
SELECT CUSTOMER_ID FROM CUSTOMERS
ORDER BY PARTY_ID;

-- Q68. List orders NOT yet paid, ordered by order id ascending.
SELECT ORDER_ID FROM ORDERS
MINUS
SELECT ORDER_ID FROM PAYMENTS
ORDER BY ORDER_ID ASC;

-- =====================================================
-- LEVEL 8: SET OPERATORS COMBINED WITH JOINS
-- =====================================================

-- Q69. List customer names who placed orders UNION supplier names who supplied products, as a single labeled party list.
SELECT DISTINCT 'CUSTOMER' AS PARTY_TYPE, C.CUSTOMER_NAME AS PARTY_NAME FROM CUSTOMERS C JOIN ORDERS O ON C.CUSTOMER_ID = O.CUSTOMER_ID
UNION
SELECT DISTINCT 'SUPPLIER' AS PARTY_TYPE, S.SUPPLIER_NAME FROM SUPPLIERS S JOIN PRODUCTS P ON S.SUPPLIER_ID = P.SUPPLIER_ID;

-- Q70. Find product names that were sold (via ORDER_ITEMS join) that are ALSO product names that were purchased (via PURCHASES join), using INTERSECT.
SELECT PR.PRODUCT_NAME FROM ORDER_ITEMS OI JOIN PRODUCTS PR ON OI.PRODUCT_ID = PR.PRODUCT_ID
INTERSECT
SELECT PR2.PRODUCT_NAME FROM PURCHASES PU JOIN PRODUCTS PR2 ON PU.PRODUCT_ID = PR2.PRODUCT_ID;

-- Q71. Find category names of products that were sold, MINUS category names of products that were purchased.
SELECT C.CATEGORY_NAME FROM ORDER_ITEMS OI JOIN PRODUCTS P ON OI.PRODUCT_ID = P.PRODUCT_ID JOIN CATEGORIES C ON P.CATEGORY_ID = C.CATEGORY_ID
MINUS
SELECT C2.CATEGORY_NAME FROM PURCHASES PU JOIN PRODUCTS P2 ON PU.PRODUCT_ID = P2.PRODUCT_ID JOIN CATEGORIES C2 ON P2.CATEGORY_ID = C2.CATEGORY_ID;

-- Q72. List customer names who paid via 'CASH' UNION customer names who paid via 'CARD'.
SELECT C.CUSTOMER_NAME FROM CUSTOMERS C JOIN ORDERS O ON C.CUSTOMER_ID = O.CUSTOMER_ID JOIN PAYMENTS PM ON O.ORDER_ID = PM.ORDER_ID WHERE PM.PAYMENT_MODE = 'CASH'
UNION
SELECT C2.CUSTOMER_NAME FROM CUSTOMERS C2 JOIN ORDERS O2 ON C2.CUSTOMER_ID = O2.CUSTOMER_ID JOIN PAYMENTS PM2 ON O2.ORDER_ID = PM2.ORDER_ID WHERE PM2.PAYMENT_MODE = 'CARD';

-- Q73. Find employee names who handled 'DELIVERED' orders that ALSO handled 'PENDING' orders (INTERSECT).
SELECT E.EMP_NAME FROM EMPLOYEES E JOIN ORDERS O ON E.EMP_ID = O.EMP_ID WHERE O.STATUS = 'DELIVERED'
INTERSECT
SELECT E2.EMP_NAME FROM EMPLOYEES E2 JOIN ORDERS O2 ON E2.EMP_ID = O2.EMP_ID WHERE O2.STATUS = 'PENDING';

-- Q74. Find supplier names supplying category 'ELECTRONICS' MINUS supplier names supplying category 'FURNITURE'.
SELECT S.SUPPLIER_NAME FROM SUPPLIERS S JOIN PRODUCTS P ON S.SUPPLIER_ID = P.SUPPLIER_ID JOIN CATEGORIES C ON P.CATEGORY_ID = C.CATEGORY_ID WHERE C.CATEGORY_NAME = 'ELECTRONICS'
MINUS
SELECT S2.SUPPLIER_NAME FROM SUPPLIERS S2 JOIN PRODUCTS P2 ON S2.SUPPLIER_ID = P2.SUPPLIER_ID JOIN CATEGORIES C2 ON P2.CATEGORY_ID = C2.CATEGORY_ID WHERE C2.CATEGORY_NAME = 'FURNITURE';

-- Q75. List customer names from 'MUMBAI' who ordered UNION employee names from designation 'MANAGER' who handled orders.
SELECT C.CUSTOMER_NAME AS PERSON_NAME FROM CUSTOMERS C JOIN ORDERS O ON C.CUSTOMER_ID = O.CUSTOMER_ID WHERE C.CITY = 'MUMBAI'
UNION
SELECT E.EMP_NAME FROM EMPLOYEES E JOIN ORDERS O2 ON E.EMP_ID = O2.EMP_ID WHERE E.DESIGNATION = 'MANAGER';

-- Q76. Find product names sold to customers in 'DELHI' that were ALSO sold to customers in 'MUMBAI' (INTERSECT).
SELECT PR.PRODUCT_NAME FROM ORDER_ITEMS OI JOIN ORDERS O ON OI.ORDER_ID = O.ORDER_ID JOIN CUSTOMERS C ON O.CUSTOMER_ID = C.CUSTOMER_ID JOIN PRODUCTS PR ON OI.PRODUCT_ID = PR.PRODUCT_ID WHERE C.CITY = 'DELHI'
INTERSECT
SELECT PR2.PRODUCT_NAME FROM ORDER_ITEMS OI2 JOIN ORDERS O2 ON OI2.ORDER_ID = O2.ORDER_ID JOIN CUSTOMERS C2 ON O2.CUSTOMER_ID = C2.CUSTOMER_ID JOIN PRODUCTS PR2 ON OI2.PRODUCT_ID = PR2.PRODUCT_ID WHERE C2.CITY = 'MUMBAI';

-- Q77. Find supplier names who supply products that HAVE been purchased, MINUS supplier names who supply products that have NEVER been purchased.
SELECT S.SUPPLIER_NAME FROM SUPPLIERS S JOIN PRODUCTS P ON S.SUPPLIER_ID = P.SUPPLIER_ID JOIN PURCHASES PU ON P.PRODUCT_ID = PU.PRODUCT_ID
MINUS
SELECT S2.SUPPLIER_NAME FROM SUPPLIERS S2 JOIN PRODUCTS P2 ON S2.SUPPLIER_ID = P2.SUPPLIER_ID WHERE NOT EXISTS (SELECT 1 FROM PURCHASES PU2 WHERE PU2.PRODUCT_ID = P2.PRODUCT_ID);

-- Q78. List customer names with orders handled by employee designation 'MANAGER' UNION customer names with orders handled by designation 'CLERK'.
SELECT C.CUSTOMER_NAME FROM CUSTOMERS C JOIN ORDERS O ON C.CUSTOMER_ID = O.CUSTOMER_ID JOIN EMPLOYEES E ON O.EMP_ID = E.EMP_ID WHERE E.DESIGNATION = 'MANAGER'
UNION
SELECT C2.CUSTOMER_NAME FROM CUSTOMERS C2 JOIN ORDERS O2 ON C2.CUSTOMER_ID = O2.CUSTOMER_ID JOIN EMPLOYEES E2 ON O2.EMP_ID = E2.EMP_ID WHERE E2.DESIGNATION = 'CLERK';

-- =====================================================
-- LEVEL 9: SET OPERATORS COMBINED WITH SUBQUERIES
-- =====================================================

-- Q79. Find employees earning above the average salary UNION employees who have handled more than 5 orders.
SELECT EMP_ID FROM EMPLOYEES WHERE SALARY > (SELECT AVG(SALARY) FROM EMPLOYEES)
UNION
SELECT EMP_ID FROM ORDERS GROUP BY EMP_ID HAVING COUNT(*) > 5;

-- Q80. Find products priced above the overall average price that are ALSO products whose stock is below the overall average stock (INTERSECT).
SELECT PRODUCT_ID FROM PRODUCTS WHERE PRICE > (SELECT AVG(PRICE) FROM PRODUCTS)
INTERSECT
SELECT PRODUCT_ID FROM PRODUCTS WHERE STOCK < (SELECT AVG(STOCK) FROM PRODUCTS);

-- Q81. Find customers whose order count exceeds the average order count per customer, MINUS customers who have made at least one payment.
SELECT CUSTOMER_ID FROM ORDERS GROUP BY CUSTOMER_ID HAVING COUNT(*) > (SELECT AVG(CNT) FROM (SELECT COUNT(*) AS CNT FROM ORDERS GROUP BY CUSTOMER_ID))
MINUS
SELECT O.CUSTOMER_ID FROM ORDERS O JOIN PAYMENTS PM ON O.ORDER_ID = PM.ORDER_ID;

-- Q82. Find categories whose average price exceeds the overall average price UNION categories with more than 5 products.
SELECT CATEGORY_ID FROM PRODUCTS GROUP BY CATEGORY_ID HAVING AVG(PRICE) > (SELECT AVG(PRICE) FROM PRODUCTS)
UNION
SELECT CATEGORY_ID FROM PRODUCTS GROUP BY CATEGORY_ID HAVING COUNT(*) > 5;

-- Q83. Find suppliers whose total purchase value exceeds the overall average total purchase value per supplier, that are ALSO suppliers located in a city with a customer (INTERSECT).
SELECT SUPPLIER_ID FROM PURCHASES GROUP BY SUPPLIER_ID
HAVING SUM(QUANTITY*PRICE) > (SELECT AVG(SUP_TOTAL) FROM (SELECT SUM(QUANTITY*PRICE) AS SUP_TOTAL FROM PURCHASES GROUP BY SUPPLIER_ID))
INTERSECT
SELECT SUPPLIER_ID FROM SUPPLIERS WHERE CITY IN (SELECT CITY FROM CUSTOMERS);

-- Q84. Find products that exist in the highest-total-sales category, UNION products that exist in the highest-total-stock category.
SELECT PRODUCT_ID FROM PRODUCTS WHERE CATEGORY_ID = (
  SELECT CATEGORY_ID FROM (
    SELECT P.CATEGORY_ID, SUM(OI.QUANTITY*OI.PRICE) AS TOTAL_SALES FROM ORDER_ITEMS OI JOIN PRODUCTS P ON OI.PRODUCT_ID = P.PRODUCT_ID GROUP BY P.CATEGORY_ID ORDER BY TOTAL_SALES DESC
  ) WHERE ROWNUM = 1
)
UNION
SELECT PRODUCT_ID FROM PRODUCTS WHERE CATEGORY_ID = (
  SELECT CATEGORY_ID FROM (
    SELECT CATEGORY_ID, SUM(STOCK) AS TOTAL_STOCK FROM PRODUCTS GROUP BY CATEGORY_ID ORDER BY TOTAL_STOCK DESC
  ) WHERE ROWNUM = 1
);

-- Q85. Find employees whose designation has the single highest total salary, MINUS employees who have never handled an order.
SELECT EMP_ID FROM EMPLOYEES WHERE DESIGNATION = (
  SELECT DESIGNATION FROM (
    SELECT DESIGNATION, SUM(SALARY) AS TOTAL_SALARY FROM EMPLOYEES GROUP BY DESIGNATION ORDER BY TOTAL_SALARY DESC
  ) WHERE ROWNUM = 1
)
MINUS
SELECT EMP_ID FROM EMPLOYEES WHERE EMP_ID NOT IN (SELECT DISTINCT EMP_ID FROM ORDERS WHERE EMP_ID IS NOT NULL);

-- =====================================================
-- LEVEL 10: INTERVIEW-STYLE / ADVANCED SET OPERATOR PROBLEMS
-- =====================================================

-- Q86. Find the symmetric difference of customer cities and supplier cities (cities that have ONE but not BOTH).
(SELECT CITY FROM CUSTOMERS MINUS SELECT CITY FROM SUPPLIERS)
UNION
(SELECT CITY FROM SUPPLIERS MINUS SELECT CITY FROM CUSTOMERS);

-- Q87. Verify that (A MINUS B) UNION (A INTERSECT B) reconstructs A, for order IDs vs payment order IDs.
(SELECT ORDER_ID FROM ORDERS MINUS SELECT ORDER_ID FROM PAYMENTS)
UNION
(SELECT ORDER_ID FROM ORDERS INTERSECT SELECT ORDER_ID FROM PAYMENTS);

-- Q88. Find products that are EITHER never sold OR never purchased (but list each such product only once).
(SELECT PRODUCT_ID FROM PRODUCTS MINUS SELECT PRODUCT_ID FROM ORDER_ITEMS)
UNION
(SELECT PRODUCT_ID FROM PRODUCTS MINUS SELECT PRODUCT_ID FROM PURCHASES);

-- Q89. Find categories that have products from MORE THAN ONE supplier (using INTERSECT-based self-comparison via GROUP BY HAVING instead, since INTERSECT alone cannot count).
SELECT CATEGORY_ID FROM PRODUCTS GROUP BY CATEGORY_ID HAVING COUNT(DISTINCT SUPPLIER_ID) > 1;

-- Q90. Find the set of customer IDs that placed orders in BOTH 'PENDING' and 'DELIVERED' status, using INTERSECT, then exclude those who ALSO have a 'CANCELLED' order, using MINUS.
(SELECT CUSTOMER_ID FROM ORDERS WHERE STATUS = 'PENDING' INTERSECT SELECT CUSTOMER_ID FROM ORDERS WHERE STATUS = 'DELIVERED')
MINUS
SELECT CUSTOMER_ID FROM ORDERS WHERE STATUS = 'CANCELLED';

-- Q91. Compare row counts: total distinct product IDs across ORDER_ITEMS and PURCHASES combined (UNION) vs common to both (INTERSECT).
SELECT (SELECT COUNT(*) FROM (SELECT PRODUCT_ID FROM ORDER_ITEMS UNION SELECT PRODUCT_ID FROM PURCHASES)) AS UNION_COUNT,
       (SELECT COUNT(*) FROM (SELECT PRODUCT_ID FROM ORDER_ITEMS INTERSECT SELECT PRODUCT_ID FROM PURCHASES)) AS INTERSECT_COUNT
FROM DUAL;

-- Q92. Find suppliers who supply products in EVERY category (a "division" query), expressed using MINUS twice.
SELECT S.SUPPLIER_ID FROM SUPPLIERS S
WHERE NOT EXISTS (
  (SELECT CATEGORY_ID FROM CATEGORIES)
  MINUS
  (SELECT CATEGORY_ID FROM PRODUCTS P WHERE P.SUPPLIER_ID = S.SUPPLIER_ID)
);

-- Q93. Chain three set operators together: cities with a customer, UNION cities with a supplier, MINUS cities that appear in neither's high-value list (price/amount above 5000, order matters left to right without parentheses per Oracle's default evaluation).
SELECT CITY FROM CUSTOMERS
UNION
SELECT CITY FROM SUPPLIERS
MINUS
SELECT CITY FROM CUSTOMERS WHERE CUSTOMER_ID IN (SELECT CUSTOMER_ID FROM ORDERS O JOIN PAYMENTS PM ON O.ORDER_ID = PM.ORDER_ID WHERE PM.AMOUNT > 5000);

-- Q94. Use parentheses to force evaluation order: (cities with a customer UNION cities with a supplier) MINUS cities with a high-value order.
(SELECT CITY FROM CUSTOMERS UNION SELECT CITY FROM SUPPLIERS)
MINUS
SELECT CITY FROM CUSTOMERS WHERE CUSTOMER_ID IN (SELECT CUSTOMER_ID FROM ORDERS O JOIN PAYMENTS PM ON O.ORDER_ID = PM.ORDER_ID WHERE PM.AMOUNT > 5000);

-- Q95. Find employees who appear in the top 3 salaries UNION employees who appear in the bottom 3 salaries.
(SELECT EMP_ID FROM (SELECT EMP_ID FROM EMPLOYEES ORDER BY SALARY DESC) WHERE ROWNUM <= 3)
UNION
(SELECT EMP_ID FROM (SELECT EMP_ID FROM EMPLOYEES ORDER BY SALARY ASC) WHERE ROWNUM <= 3);

-- Q96. Find products that are in the top 3 by price UNION products that are in the top 3 by stock, labeled by which list they came from.
SELECT PRODUCT_ID, 'TOP_PRICE' AS REASON FROM (SELECT PRODUCT_ID FROM PRODUCTS ORDER BY PRICE DESC) WHERE ROWNUM <= 3
UNION
SELECT PRODUCT_ID, 'TOP_STOCK' AS REASON FROM (SELECT PRODUCT_ID FROM PRODUCTS ORDER BY STOCK DESC) WHERE ROWNUM <= 3;

-- Q97. Find customers who exist in CUSTOMERS but their CUSTOMER_ID also happens to match a SUPPLIER_ID (INTERSECT across unrelated tables, purely on ID overlap).
SELECT CUSTOMER_ID FROM CUSTOMERS
INTERSECT
SELECT SUPPLIER_ID FROM SUPPLIERS;

-- Q98. Verify UNION ALL row count equals the sum of two individual counts (sanity check query).
SELECT (SELECT COUNT(*) FROM CUSTOMERS) + (SELECT COUNT(*) FROM SUPPLIERS) AS EXPECTED_COUNT,
       (SELECT COUNT(*) FROM (SELECT CUSTOMER_ID FROM CUSTOMERS UNION ALL SELECT SUPPLIER_ID FROM SUPPLIERS)) AS ACTUAL_UNION_ALL_COUNT
FROM DUAL;

-- Q99. Find designations that exist among employees handling orders MINUS designations among employees who have never handled an order.
SELECT E.DESIGNATION FROM EMPLOYEES E JOIN ORDERS O ON E.EMP_ID = O.EMP_ID
MINUS
SELECT E2.DESIGNATION FROM EMPLOYEES E2 WHERE E2.EMP_ID NOT IN (SELECT DISTINCT EMP_ID FROM ORDERS WHERE EMP_ID IS NOT NULL);

-- Q100. Build a full "activity summary" list: customers who ordered, UNION suppliers who supplied, MINUS any party located in a city that appears in BOTH customer and supplier cities (INTERSECT nested inside MINUS).
(SELECT CUSTOMER_NAME AS PARTY_NAME, CITY FROM CUSTOMERS WHERE CUSTOMER_ID IN (SELECT CUSTOMER_ID FROM ORDERS)
 UNION
 SELECT SUPPLIER_NAME, CITY FROM SUPPLIERS WHERE SUPPLIER_ID IN (SELECT SUPPLIER_ID FROM PRODUCTS))
MINUS
SELECT CUSTOMER_NAME, CITY FROM CUSTOMERS WHERE CITY IN (SELECT CITY FROM CUSTOMERS INTERSECT SELECT CITY FROM SUPPLIERS);

-- =====================================================
-- PRACTICE ORDER
-- =====================================================

-- Q01-Q10   : UNION - Basics
-- Q11-Q20   : UNION ALL
-- Q21-Q30   : INTERSECT
-- Q31-Q40   : MINUS
-- Q41-Q50   : Set operators + WHERE conditions
-- Q51-Q60   : Set operators + aggregate functions
-- Q61-Q68   : Set operators + ORDER BY
-- Q69-Q78   : Set operators combined with JOINS
-- Q79-Q85   : Set operators combined with subqueries
-- Q86-Q100  : Interview-style / advanced set operator problems

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
-- END OF SET OPERATORS PRACTICE
-- =====================================================

SPOOL OFF