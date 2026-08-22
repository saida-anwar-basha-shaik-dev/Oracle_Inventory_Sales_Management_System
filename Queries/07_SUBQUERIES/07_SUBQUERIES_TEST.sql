-- =====================================================
-- ORACLE SQL SUBQUERIES - RULES, SYNTAX & 100 QUESTIONS
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
-- SUBQUERIES TEST
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

SPOOL 'F:\Exploring Technologies\OrcaleSqlPlusExploring\Oracle_Inventory_Sales_Management_System\Queries\07_Subqueries\07_SUBQUERIES_TEST_OUTPUT.txt'


-- ============================================================
-- ORACLE SQL 11g
-- SUBQUERIES — COMPLETE TEST
-- ============================================================
-- Total Questions : 100
-- Difficulty      : Basic -> Intermediate -> Advanced
--
-- Topics Covered:
-- 1. Single-row subqueries (WHERE clause)
-- 2. Multi-row subqueries (IN, ANY, ALL)
-- 3. Subqueries with aggregate functions
-- 4. Correlated subqueries
-- 5. Subqueries in FROM (inline views)
-- 6. Subqueries in SELECT (scalar subqueries)
-- 7. EXISTS / NOT EXISTS
-- 8. Nested subqueries (subquery within a subquery)
-- 9. Interview-style / advanced subqueries
--
-- IMPORTANT:
-- A single-row subquery must return exactly one row and one column,
-- or Oracle raises "ORA-01427: single-row subquery returns more
-- than one row". Use IN / ANY / ALL for subqueries that can return
-- multiple rows.
-- ============================================================
-- =====================================================
-- SUBQUERIES
-- =====================================================

-- SUBQUERY (INNER QUERY)   : A SELECT statement nested inside another
--                             SQL statement (SELECT, INSERT, UPDATE, DELETE).
-- SINGLE-ROW SUBQUERY      : Returns exactly one row and one column;
--                             used with =, >, <, >=, <=, <>.
-- MULTI-ROW SUBQUERY       : Returns multiple rows; used with IN, ANY, ALL.
-- CORRELATED SUBQUERY      : References a column from the outer query,
--                             so it is re-evaluated once per outer row.
-- SCALAR SUBQUERY          : A subquery that returns a single value,
--                             usable directly inside a SELECT list.
-- INLINE VIEW              : A subquery used in the FROM clause, acting
--                             like a temporary named table.
-- EXISTS / NOT EXISTS      : Tests whether a correlated subquery returns
--                             any rows at all; does not care about values.

-- =====================================================
-- BASIC SYNTAX
-- =====================================================

-- SINGLE-ROW SUBQUERY
--SELECT columns
--FROM table_name
--WHERE column = (SELECT column FROM table_name WHERE condition);

-- MULTI-ROW SUBQUERY WITH IN
--SELECT columns
--FROM table_name
--WHERE column IN (SELECT column FROM table_name WHERE condition);

-- MULTI-ROW SUBQUERY WITH ANY / ALL
--SELECT columns
--FROM table_name
--WHERE column > ANY (SELECT column FROM table_name WHERE condition);
--WHERE column > ALL (SELECT column FROM table_name WHERE condition);

-- CORRELATED SUBQUERY
--SELECT columns
--FROM table_name outer_alias
--WHERE column operator (SELECT AGGREGATE_FUNCTION(column)
--                        FROM table_name inner_alias
--                        WHERE inner_alias.key = outer_alias.key);

-- SUBQUERY IN FROM (INLINE VIEW)
--SELECT alias.columns
--FROM (SELECT columns FROM table_name GROUP BY column) alias
--WHERE condition;

-- SCALAR SUBQUERY IN SELECT
--SELECT columns,
--       (SELECT AGGREGATE_FUNCTION(column) FROM table_name WHERE condition) AS alias
--FROM table_name;

-- EXISTS SUBQUERY
--SELECT columns
--FROM table_name outer_alias
--WHERE EXISTS (SELECT 1 FROM table_name inner_alias WHERE inner_alias.key = outer_alias.key);

-- NOT EXISTS SUBQUERY
--SELECT columns
--FROM table_name outer_alias
--WHERE NOT EXISTS (SELECT 1 FROM table_name inner_alias WHERE inner_alias.key = outer_alias.key);

-- =====================================================
-- SUBQUERY RULES
-- =====================================================

-- RULE 01: A subquery is always enclosed in parentheses.
-- RULE 02: A subquery is executed first, and its result is used by the outer query.
-- RULE 03: A single-row subquery must return exactly one row and one column.
-- RULE 04: A multi-row subquery is used with IN, ANY, or ALL, never with =, >, < directly.
-- RULE 05: ORDER BY cannot be used inside a subquery that feeds WHERE/HAVING (only in the outermost query, or inside an inline view for ranking with ROWNUM).
-- RULE 06: A correlated subquery references a column from the outer query and runs once per outer row.
-- RULE 07: A non-correlated subquery runs independently of the outer query, only once.
-- RULE 08: Subqueries can appear in SELECT, FROM, WHERE, and HAVING clauses.
-- RULE 09: A subquery used in FROM is called an inline view and must have an alias.
-- RULE 10: A scalar subquery in SELECT must return exactly one value per outer row.
-- RULE 11: EXISTS returns TRUE/FALSE based on whether the subquery returns any rows; it does not evaluate specific column values.
-- RULE 12: NOT EXISTS is commonly used to find rows in one table with no matching rows in another.
-- RULE 13: NOT IN with a subquery that can return NULL values can silently return no rows; prefer NOT EXISTS in that case.
-- RULE 14: Subqueries can be nested inside other subqueries to any reasonable depth.
-- RULE 15: A subquery in HAVING filters groups, typically comparing an aggregate to another aggregate.
-- RULE 16: Column aliases from the outer SELECT cannot be referenced inside a subquery.
-- RULE 17: Subqueries can use aggregate functions just like a normal SELECT.
-- RULE 18: ANY compares to at least one value returned by the subquery (e.g., > ANY means greater than the minimum).
-- RULE 19: ALL compares to every value returned by the subquery (e.g., > ALL means greater than the maximum).
-- RULE 20: A well-written subquery should be as simple as possible; overly deep nesting can usually be replaced with a JOIN.

-- =====================================================
-- EXECUTION ORDER (CONCEPTUAL)
-- =====================================================

-- INNERMOST SUBQUERY EXECUTES FIRST
-- ITS RESULT IS PASSED TO THE NEXT OUTER LEVEL
-- THIS CONTINUES UNTIL THE OUTERMOST QUERY IS EVALUATED
-- (A CORRELATED SUBQUERY IS THE EXCEPTION: IT RE-EXECUTES ONCE PER OUTER ROW)

-- =====================================================
-- LEVEL 1: SINGLE-ROW SUBQUERIES (WHERE CLAUSE)
-- =====================================================

-- Q01. Find employees who earn more than the average salary of all employees.
SELECT EMP_NAME, SALARY FROM EMPLOYEES WHERE SALARY > (SELECT AVG(SALARY) FROM EMPLOYEES);

-- Q02. Find the employee with the highest salary.
SELECT EMP_NAME, SALARY FROM EMPLOYEES WHERE SALARY = (SELECT MAX(SALARY) FROM EMPLOYEES);

-- Q03. Find the employee with the lowest salary.
SELECT EMP_NAME, SALARY FROM EMPLOYEES WHERE SALARY = (SELECT MIN(SALARY) FROM EMPLOYEES);

-- Q04. Find the product with the highest price.
SELECT PRODUCT_NAME, PRICE FROM PRODUCTS WHERE PRICE = (SELECT MAX(PRICE) FROM PRODUCTS);

-- Q05. Find the product with the lowest price.
SELECT PRODUCT_NAME, PRICE FROM PRODUCTS WHERE PRICE = (SELECT MIN(PRICE) FROM PRODUCTS);

-- Q06. Find products priced above the average product price.
SELECT PRODUCT_NAME, PRICE FROM PRODUCTS WHERE PRICE > (SELECT AVG(PRICE) FROM PRODUCTS);

-- Q07. Find the order with the highest payment amount.
SELECT ORDER_ID FROM PAYMENTS WHERE AMOUNT = (SELECT MAX(AMOUNT) FROM PAYMENTS);

-- Q08. Find the supplier who supplies the product with the highest stock.
SELECT SUPPLIER_ID, PRODUCT_NAME, STOCK FROM PRODUCTS WHERE STOCK = (SELECT MAX(STOCK) FROM PRODUCTS);

-- Q09. Find employees who earn the same salary as the employee named in a known designation's top earner (single row assumed).
SELECT EMP_NAME, SALARY FROM EMPLOYEES WHERE SALARY = (SELECT MAX(SALARY) FROM EMPLOYEES WHERE DESIGNATION = 'MANAGER');

-- Q10. Find the customer who made the single largest payment.
SELECT O.CUSTOMER_ID FROM ORDERS O WHERE O.ORDER_ID = (SELECT ORDER_ID FROM PAYMENTS WHERE AMOUNT = (SELECT MAX(AMOUNT) FROM PAYMENTS));

-- Q11. Find products whose price is less than the highest priced product's price.
SELECT PRODUCT_NAME, PRICE FROM PRODUCTS WHERE PRICE < (SELECT MAX(PRICE) FROM PRODUCTS);

-- Q12. Find the purchase record with the maximum quantity purchased.
SELECT PURCHASE_ID, QUANTITY FROM PURCHASES WHERE QUANTITY = (SELECT MAX(QUANTITY) FROM PURCHASES);

-- Q13. Find employees whose salary equals the average salary of the 'CLERK' designation.
SELECT EMP_NAME, SALARY FROM EMPLOYEES WHERE SALARY = (SELECT AVG(SALARY) FROM EMPLOYEES WHERE DESIGNATION = 'CLERK');

-- Q14. Find the category with the highest average product price.
SELECT CATEGORY_ID FROM PRODUCTS GROUP BY CATEGORY_ID HAVING AVG(PRICE) = (SELECT MAX(AVG_PRICE) FROM (SELECT AVG(PRICE) AS AVG_PRICE FROM PRODUCTS GROUP BY CATEGORY_ID));

-- Q15. Find the order item with the highest quantity sold in a single line.
SELECT ORDER_ITEM_ID, QUANTITY FROM ORDER_ITEMS WHERE QUANTITY = (SELECT MAX(QUANTITY) FROM ORDER_ITEMS);

-- =====================================================
-- LEVEL 2: MULTI-ROW SUBQUERIES (IN, ANY, ALL)
-- =====================================================

-- Q16. Find employees who work in designations that have more than 2 employees.
SELECT EMP_NAME, DESIGNATION FROM EMPLOYEES WHERE DESIGNATION IN (SELECT DESIGNATION FROM EMPLOYEES GROUP BY DESIGNATION HAVING COUNT(*) > 2);

-- Q17. Find products that belong to categories having more than 5 products.
SELECT PRODUCT_NAME, CATEGORY_ID FROM PRODUCTS WHERE CATEGORY_ID IN (SELECT CATEGORY_ID FROM PRODUCTS GROUP BY CATEGORY_ID HAVING COUNT(*) > 5);

-- Q18. Find customers who have placed at least one order.
SELECT CUSTOMER_NAME FROM CUSTOMERS WHERE CUSTOMER_ID IN (SELECT CUSTOMER_ID FROM ORDERS);

-- Q19. Find customers who have never placed an order (using NOT IN).
SELECT CUSTOMER_NAME FROM CUSTOMERS WHERE CUSTOMER_ID NOT IN (SELECT CUSTOMER_ID FROM ORDERS WHERE CUSTOMER_ID IS NOT NULL);

-- Q20. Find products that have never been ordered (using NOT IN).
SELECT PRODUCT_NAME FROM PRODUCTS WHERE PRODUCT_ID NOT IN (SELECT PRODUCT_ID FROM ORDER_ITEMS WHERE PRODUCT_ID IS NOT NULL);

-- Q21. Find employees whose salary is greater than ANY employee's salary in designation 'CLERK'.
SELECT EMP_NAME, SALARY FROM EMPLOYEES WHERE SALARY > ANY (SELECT SALARY FROM EMPLOYEES WHERE DESIGNATION = 'CLERK');

-- Q22. Find employees whose salary is greater than ALL employees' salaries in designation 'CLERK'.
SELECT EMP_NAME, SALARY FROM EMPLOYEES WHERE SALARY > ALL (SELECT SALARY FROM EMPLOYEES WHERE DESIGNATION = 'CLERK');

-- Q23. Find products whose price is less than ANY product's price in category 1.
SELECT PRODUCT_NAME, PRICE FROM PRODUCTS WHERE PRICE < ANY (SELECT PRICE FROM PRODUCTS WHERE CATEGORY_ID = 1);

-- Q24. Find products whose price is less than ALL products' prices in category 1.
SELECT PRODUCT_NAME, PRICE FROM PRODUCTS WHERE PRICE < ALL (SELECT PRICE FROM PRODUCTS WHERE CATEGORY_ID = 1);

-- Q25. Find suppliers who supply at least one product priced above 1000.
SELECT SUPPLIER_NAME FROM SUPPLIERS WHERE SUPPLIER_ID IN (SELECT SUPPLIER_ID FROM PRODUCTS WHERE PRICE > 1000);

-- Q26. Find orders whose status matches any of the statuses used by employee id 1.
SELECT ORDER_ID, STATUS FROM ORDERS WHERE STATUS IN (SELECT DISTINCT STATUS FROM ORDERS WHERE EMP_ID = 1);

-- Q27. Find products that were part of purchases with quantity greater than 100.
SELECT PRODUCT_NAME FROM PRODUCTS WHERE PRODUCT_ID IN (SELECT PRODUCT_ID FROM PURCHASES WHERE QUANTITY > 100);

-- Q28. Find employees who have handled at least one order with status 'CANCELLED'.
SELECT EMP_NAME FROM EMPLOYEES WHERE EMP_ID IN (SELECT EMP_ID FROM ORDERS WHERE STATUS = 'CANCELLED');

-- Q29. Find customers who paid using any payment mode used for orders handled by employee id 2.
SELECT CUSTOMER_NAME FROM CUSTOMERS WHERE CUSTOMER_ID IN (
  SELECT O.CUSTOMER_ID FROM ORDERS O JOIN PAYMENTS PM ON O.ORDER_ID = PM.ORDER_ID
  WHERE PM.PAYMENT_MODE IN (SELECT PM2.PAYMENT_MODE FROM PAYMENTS PM2 JOIN ORDERS O2 ON PM2.ORDER_ID = O2.ORDER_ID WHERE O2.EMP_ID = 2)
);

-- Q30. Find categories that contain products supplied by supplier id 5.
SELECT CATEGORY_NAME FROM CATEGORIES WHERE CATEGORY_ID IN (SELECT CATEGORY_ID FROM PRODUCTS WHERE SUPPLIER_ID = 5);

-- =====================================================
-- LEVEL 3: SUBQUERIES WITH AGGREGATE FUNCTIONS
-- =====================================================

-- Q31. Find designations whose total salary is greater than the overall average total salary per designation.
SELECT DESIGNATION, SUM(SALARY) AS TOTAL_SALARY FROM EMPLOYEES GROUP BY DESIGNATION
HAVING SUM(SALARY) > (SELECT AVG(DES_TOTAL) FROM (SELECT SUM(SALARY) AS DES_TOTAL FROM EMPLOYEES GROUP BY DESIGNATION));

-- Q32. Find the total sales value compared to the total purchase value (single row vs single row).
SELECT (SELECT SUM(QUANTITY*PRICE) FROM ORDER_ITEMS) AS TOTAL_SALES, (SELECT SUM(QUANTITY*PRICE) FROM PURCHASES) AS TOTAL_PURCHASES FROM DUAL;

-- Q33. Find products priced above the average price within their own category (self-referencing aggregate subquery).
SELECT PRODUCT_NAME, PRICE, CATEGORY_ID FROM PRODUCTS P1 WHERE PRICE > (SELECT AVG(PRICE) FROM PRODUCTS P2 WHERE P2.CATEGORY_ID = P1.CATEGORY_ID);

-- Q34. Find the number of employees earning more than the company-wide average salary.
SELECT COUNT(*) AS ABOVE_AVERAGE_COUNT FROM EMPLOYEES WHERE SALARY > (SELECT AVG(SALARY) FROM EMPLOYEES);

-- Q35. Find the difference between the highest and lowest product price using a subquery in SELECT.
SELECT (SELECT MAX(PRICE) FROM PRODUCTS) - (SELECT MIN(PRICE) FROM PRODUCTS) AS PRICE_RANGE FROM DUAL;

-- Q36. Find categories whose average product price is above the overall average product price.
SELECT CATEGORY_ID, AVG(PRICE) AS AVG_PRICE FROM PRODUCTS GROUP BY CATEGORY_ID HAVING AVG(PRICE) > (SELECT AVG(PRICE) FROM PRODUCTS);

-- Q37. Find the percentage that the highest paid employee's salary represents of the total salary bill.
SELECT (SELECT MAX(SALARY) FROM EMPLOYEES) / (SELECT SUM(SALARY) FROM EMPLOYEES) * 100 AS PERCENT_OF_TOTAL FROM DUAL;

-- Q38. Find suppliers whose total purchase quantity is above the average total purchase quantity per supplier.
SELECT SUPPLIER_ID, SUM(QUANTITY) AS TOTAL_QTY FROM PURCHASES GROUP BY SUPPLIER_ID
HAVING SUM(QUANTITY) > (SELECT AVG(SUP_TOTAL) FROM (SELECT SUM(QUANTITY) AS SUP_TOTAL FROM PURCHASES GROUP BY SUPPLIER_ID));

-- Q39. Find the number of categories whose product count exceeds the average product count per category.
SELECT COUNT(*) AS CATEGORIES_ABOVE_AVERAGE FROM (
  SELECT CATEGORY_ID, COUNT(*) AS CNT FROM PRODUCTS GROUP BY CATEGORY_ID
  HAVING COUNT(*) > (SELECT AVG(CAT_CNT) FROM (SELECT COUNT(*) AS CAT_CNT FROM PRODUCTS GROUP BY CATEGORY_ID))
);

-- Q40. Find the employee(s) whose salary is exactly the second highest in the company.
SELECT EMP_NAME, SALARY FROM EMPLOYEES WHERE SALARY = (SELECT MAX(SALARY) FROM EMPLOYEES WHERE SALARY < (SELECT MAX(SALARY) FROM EMPLOYEES));

-- =====================================================
-- LEVEL 4: CORRELATED SUBQUERIES
-- =====================================================

-- Q41. Find employees who earn more than the average salary of their own designation.
SELECT E1.EMP_NAME, E1.DESIGNATION, E1.SALARY FROM EMPLOYEES E1
WHERE E1.SALARY > (SELECT AVG(E2.SALARY) FROM EMPLOYEES E2 WHERE E2.DESIGNATION = E1.DESIGNATION);

-- Q42. Find products priced higher than the average price of products from the same supplier.
SELECT P1.PRODUCT_NAME, P1.PRICE FROM PRODUCTS P1
WHERE P1.PRICE > (SELECT AVG(P2.PRICE) FROM PRODUCTS P2 WHERE P2.SUPPLIER_ID = P1.SUPPLIER_ID);

-- Q43. Find customers whose number of orders is greater than the average number of orders per customer.
SELECT C.CUSTOMER_NAME FROM CUSTOMERS C
WHERE (SELECT COUNT(*) FROM ORDERS O WHERE O.CUSTOMER_ID = C.CUSTOMER_ID) > (SELECT AVG(CNT) FROM (SELECT COUNT(*) AS CNT FROM ORDERS GROUP BY CUSTOMER_ID));

-- Q44. Find each employee whose salary is the highest within their designation.
SELECT E1.EMP_NAME, E1.DESIGNATION, E1.SALARY FROM EMPLOYEES E1
WHERE E1.SALARY = (SELECT MAX(E2.SALARY) FROM EMPLOYEES E2 WHERE E2.DESIGNATION = E1.DESIGNATION);

-- Q45. Find products that are the cheapest in their category.
SELECT P1.PRODUCT_NAME, P1.CATEGORY_ID, P1.PRICE FROM PRODUCTS P1
WHERE P1.PRICE = (SELECT MIN(P2.PRICE) FROM PRODUCTS P2 WHERE P2.CATEGORY_ID = P1.CATEGORY_ID);

-- Q46. Find orders whose payment amount is greater than the average payment amount for that same customer.
SELECT O.ORDER_ID FROM ORDERS O
WHERE (SELECT PM.AMOUNT FROM PAYMENTS PM WHERE PM.ORDER_ID = O.ORDER_ID) >
      (SELECT AVG(PM2.AMOUNT) FROM PAYMENTS PM2 JOIN ORDERS O2 ON PM2.ORDER_ID = O2.ORDER_ID WHERE O2.CUSTOMER_ID = O.CUSTOMER_ID);

-- Q47. Find suppliers whose average product price is higher than the average product price across all suppliers.
SELECT S.SUPPLIER_NAME FROM SUPPLIERS S
WHERE (SELECT AVG(P.PRICE) FROM PRODUCTS P WHERE P.SUPPLIER_ID = S.SUPPLIER_ID) > (SELECT AVG(PRICE) FROM PRODUCTS);

-- Q48. Find employees who have handled more orders than the average number of orders handled per employee.
SELECT E.EMP_NAME FROM EMPLOYEES E
WHERE (SELECT COUNT(*) FROM ORDERS O WHERE O.EMP_ID = E.EMP_ID) > (SELECT AVG(CNT) FROM (SELECT COUNT(*) AS CNT FROM ORDERS GROUP BY EMP_ID));

-- Q49. Find products whose stock is below the average stock of products in the same category.
SELECT P1.PRODUCT_NAME, P1.STOCK, P1.CATEGORY_ID FROM PRODUCTS P1
WHERE P1.STOCK < (SELECT AVG(P2.STOCK) FROM PRODUCTS P2 WHERE P2.CATEGORY_ID = P1.CATEGORY_ID);

-- Q50. Find order items where the quantity is the maximum quantity for that particular order.
SELECT OI1.ORDER_ITEM_ID, OI1.ORDER_ID, OI1.QUANTITY FROM ORDER_ITEMS OI1
WHERE OI1.QUANTITY = (SELECT MAX(OI2.QUANTITY) FROM ORDER_ITEMS OI2 WHERE OI2.ORDER_ID = OI1.ORDER_ID);

-- Q51. Find categories where the highest priced product costs more than double the category's average price.
SELECT DISTINCT P1.CATEGORY_ID FROM PRODUCTS P1
WHERE (SELECT MAX(P2.PRICE) FROM PRODUCTS P2 WHERE P2.CATEGORY_ID = P1.CATEGORY_ID) > 2 * (SELECT AVG(P3.PRICE) FROM PRODUCTS P3 WHERE P3.CATEGORY_ID = P1.CATEGORY_ID);

-- Q52. Find purchases whose quantity is greater than the average quantity purchased from the same supplier.
SELECT PU1.PURCHASE_ID, PU1.SUPPLIER_ID, PU1.QUANTITY FROM PURCHASES PU1
WHERE PU1.QUANTITY > (SELECT AVG(PU2.QUANTITY) FROM PURCHASES PU2 WHERE PU2.SUPPLIER_ID = PU1.SUPPLIER_ID);

-- Q53. Find customers whose total payment amount is greater than the average total payment amount of all customers.
SELECT C.CUSTOMER_NAME FROM CUSTOMERS C
WHERE (SELECT NVL(SUM(PM.AMOUNT),0) FROM ORDERS O JOIN PAYMENTS PM ON O.ORDER_ID = PM.ORDER_ID WHERE O.CUSTOMER_ID = C.CUSTOMER_ID)
    > (SELECT AVG(CUST_TOTAL) FROM (SELECT SUM(PM2.AMOUNT) AS CUST_TOTAL FROM ORDERS O2 JOIN PAYMENTS PM2 ON O2.ORDER_ID = PM2.ORDER_ID GROUP BY O2.CUSTOMER_ID));

-- Q54. Find employees earning the lowest salary within their own designation.
SELECT E1.EMP_NAME, E1.DESIGNATION, E1.SALARY FROM EMPLOYEES E1
WHERE E1.SALARY = (SELECT MIN(E2.SALARY) FROM EMPLOYEES E2 WHERE E2.DESIGNATION = E1.DESIGNATION);

-- Q55. Find products whose price is more than twice the minimum price in their category.
SELECT P1.PRODUCT_NAME, P1.PRICE, P1.CATEGORY_ID FROM PRODUCTS P1
WHERE P1.PRICE > 2 * (SELECT MIN(P2.PRICE) FROM PRODUCTS P2 WHERE P2.CATEGORY_ID = P1.CATEGORY_ID);

-- =====================================================
-- LEVEL 5: SUBQUERIES IN FROM (INLINE VIEWS)
-- =====================================================

-- Q56. Find the top category by total sales value using an inline view.
SELECT * FROM (
  SELECT P.CATEGORY_ID, SUM(OI.QUANTITY*OI.PRICE) AS TOTAL_SALES
  FROM ORDER_ITEMS OI JOIN PRODUCTS P ON OI.PRODUCT_ID = P.PRODUCT_ID
  GROUP BY P.CATEGORY_ID
  ORDER BY TOTAL_SALES DESC
) WHERE ROWNUM = 1;

-- Q57. Find the top 3 customers by total payment amount using an inline view.
SELECT * FROM (
  SELECT O.CUSTOMER_ID, SUM(PM.AMOUNT) AS TOTAL_PAID
  FROM ORDERS O JOIN PAYMENTS PM ON O.ORDER_ID = PM.ORDER_ID
  GROUP BY O.CUSTOMER_ID
  ORDER BY TOTAL_PAID DESC
) WHERE ROWNUM <= 3;

-- Q58. Find designation-wise average salary, then filter designations above 30000 using an inline view.
SELECT * FROM (
  SELECT DESIGNATION, AVG(SALARY) AS AVG_SALARY FROM EMPLOYEES GROUP BY DESIGNATION
) WHERE AVG_SALARY > 30000;

-- Q59. Find product-wise total quantity sold, then keep only products above 100 units using an inline view.
SELECT * FROM (
  SELECT PRODUCT_ID, SUM(QUANTITY) AS TOTAL_QTY FROM ORDER_ITEMS GROUP BY PRODUCT_ID
) WHERE TOTAL_QTY > 100;

-- Q60. Rank employees by salary within their designation using an inline view with ROW_NUMBER.
SELECT * FROM (
  SELECT EMP_NAME, DESIGNATION, SALARY, ROW_NUMBER() OVER (PARTITION BY DESIGNATION ORDER BY SALARY DESC) AS RNK
  FROM EMPLOYEES
) WHERE RNK = 1;

-- Q61. Find the second highest priced product per category using an inline view with ROW_NUMBER.
SELECT * FROM (
  SELECT PRODUCT_NAME, CATEGORY_ID, PRICE, ROW_NUMBER() OVER (PARTITION BY CATEGORY_ID ORDER BY PRICE DESC) AS RNK
  FROM PRODUCTS
) WHERE RNK = 2;

-- Q62. Find supplier-wise total purchase value, keeping only suppliers above 100000 using an inline view.
SELECT * FROM (
  SELECT SUPPLIER_ID, SUM(QUANTITY*PRICE) AS TOTAL_VALUE FROM PURCHASES GROUP BY SUPPLIER_ID
) WHERE TOTAL_VALUE > 100000;

-- Q63. Find the 5 most recent orders using an inline view ordered by order date.
SELECT * FROM (
  SELECT ORDER_ID, ORDER_DATE FROM ORDERS ORDER BY ORDER_DATE DESC
) WHERE ROWNUM <= 5;

-- Q64. Find category-wise product count and average price, keeping only categories with more than 5 products, using an inline view.
SELECT * FROM (
  SELECT CATEGORY_ID, COUNT(*) AS PRODUCT_COUNT, AVG(PRICE) AS AVG_PRICE FROM PRODUCTS GROUP BY CATEGORY_ID
) WHERE PRODUCT_COUNT > 5;

-- Q65. Find employee-wise order counts, keeping only employees below the overall average, using an inline view.
SELECT * FROM (
  SELECT EMP_ID, COUNT(*) AS ORDER_COUNT FROM ORDERS GROUP BY EMP_ID
) WHERE ORDER_COUNT < (SELECT AVG(CNT) FROM (SELECT COUNT(*) AS CNT FROM ORDERS GROUP BY EMP_ID));

-- =====================================================
-- LEVEL 6: SUBQUERIES IN SELECT (SCALAR SUBQUERIES)
-- =====================================================

-- Q66. List each employee's salary alongside the company-wide average salary.
SELECT EMP_NAME, SALARY, (SELECT AVG(SALARY) FROM EMPLOYEES) AS COMPANY_AVG_SALARY FROM EMPLOYEES;

-- Q67. List each product's price alongside the average price of its own category.
SELECT PRODUCT_NAME, PRICE, (SELECT AVG(P2.PRICE) FROM PRODUCTS P2 WHERE P2.CATEGORY_ID = P1.CATEGORY_ID) AS CATEGORY_AVG_PRICE FROM PRODUCTS P1;

-- Q68. List each customer with their total number of orders as a scalar subquery.
SELECT CUSTOMER_NAME, (SELECT COUNT(*) FROM ORDERS O WHERE O.CUSTOMER_ID = C.CUSTOMER_ID) AS TOTAL_ORDERS FROM CUSTOMERS C;

-- Q69. List each supplier with the number of products they supply as a scalar subquery.
SELECT SUPPLIER_NAME, (SELECT COUNT(*) FROM PRODUCTS P WHERE P.SUPPLIER_ID = S.SUPPLIER_ID) AS NO_OF_PRODUCTS FROM SUPPLIERS S;

-- Q70. List each order with its total payment amount as a scalar subquery.
SELECT ORDER_ID, (SELECT SUM(AMOUNT) FROM PAYMENTS PM WHERE PM.ORDER_ID = O.ORDER_ID) AS TOTAL_PAID FROM ORDERS O;

-- Q71. List each category with its highest priced product's price as a scalar subquery.
SELECT CATEGORY_NAME, (SELECT MAX(P.PRICE) FROM PRODUCTS P WHERE P.CATEGORY_ID = C.CATEGORY_ID) AS HIGHEST_PRICE FROM CATEGORIES C;

-- Q72. List each employee with the number of orders they have handled as a scalar subquery.
SELECT EMP_NAME, (SELECT COUNT(*) FROM ORDERS O WHERE O.EMP_ID = E.EMP_ID) AS ORDERS_HANDLED FROM EMPLOYEES E;

-- Q73. List each product with the total quantity purchased for it as a scalar subquery.
SELECT PRODUCT_NAME, (SELECT NVL(SUM(QUANTITY),0) FROM PURCHASES PU WHERE PU.PRODUCT_ID = P.PRODUCT_ID) AS TOTAL_PURCHASED FROM PRODUCTS P;

-- Q74. List each customer with their city and the date of their most recent order as a scalar subquery.
SELECT CUSTOMER_NAME, CITY, (SELECT MAX(ORDER_DATE) FROM ORDERS O WHERE O.CUSTOMER_ID = C.CUSTOMER_ID) AS LAST_ORDER_DATE FROM CUSTOMERS C;

-- Q75. List each supplier with their total purchase value as a scalar subquery.
SELECT SUPPLIER_NAME, (SELECT NVL(SUM(QUANTITY*PRICE),0) FROM PURCHASES PU WHERE PU.SUPPLIER_ID = S.SUPPLIER_ID) AS TOTAL_PURCHASE_VALUE FROM SUPPLIERS S;

-- =====================================================
-- LEVEL 7: EXISTS / NOT EXISTS
-- =====================================================

-- Q76. Find customers who have placed at least one order (using EXISTS).
SELECT CUSTOMER_NAME FROM CUSTOMERS C WHERE EXISTS (SELECT 1 FROM ORDERS O WHERE O.CUSTOMER_ID = C.CUSTOMER_ID);

-- Q77. Find customers who have never placed an order (using NOT EXISTS).
SELECT CUSTOMER_NAME FROM CUSTOMERS C WHERE NOT EXISTS (SELECT 1 FROM ORDERS O WHERE O.CUSTOMER_ID = C.CUSTOMER_ID);

-- Q78. Find products that have never been purchased (using NOT EXISTS).
SELECT PRODUCT_NAME FROM PRODUCTS P WHERE NOT EXISTS (SELECT 1 FROM PURCHASES PU WHERE PU.PRODUCT_ID = P.PRODUCT_ID);

-- Q79. Find suppliers who supply at least one product (using EXISTS).
SELECT SUPPLIER_NAME FROM SUPPLIERS S WHERE EXISTS (SELECT 1 FROM PRODUCTS P WHERE P.SUPPLIER_ID = S.SUPPLIER_ID);

-- Q80. Find suppliers who supply no products at all (using NOT EXISTS).
SELECT SUPPLIER_NAME FROM SUPPLIERS S WHERE NOT EXISTS (SELECT 1 FROM PRODUCTS P WHERE P.SUPPLIER_ID = S.SUPPLIER_ID);

-- Q81. Find employees who have never handled any order (using NOT EXISTS).
SELECT EMP_NAME FROM EMPLOYEES E WHERE NOT EXISTS (SELECT 1 FROM ORDERS O WHERE O.EMP_ID = E.EMP_ID);

-- Q82. Find orders that have received at least one payment (using EXISTS).
SELECT ORDER_ID FROM ORDERS O WHERE EXISTS (SELECT 1 FROM PAYMENTS PM WHERE PM.ORDER_ID = O.ORDER_ID);

-- Q83. Find orders that have not received any payment (using NOT EXISTS).
SELECT ORDER_ID FROM ORDERS O WHERE NOT EXISTS (SELECT 1 FROM PAYMENTS PM WHERE PM.ORDER_ID = O.ORDER_ID);

-- Q84. Find categories that contain at least one product (using EXISTS).
SELECT CATEGORY_NAME FROM CATEGORIES C WHERE EXISTS (SELECT 1 FROM PRODUCTS P WHERE P.CATEGORY_ID = C.CATEGORY_ID);

-- Q85. Find categories with no products at all (using NOT EXISTS).
SELECT CATEGORY_NAME FROM CATEGORIES C WHERE NOT EXISTS (SELECT 1 FROM PRODUCTS P WHERE P.CATEGORY_ID = C.CATEGORY_ID);

-- =====================================================
-- LEVEL 8: NESTED SUBQUERIES (SUBQUERY WITHIN A SUBQUERY)
-- =====================================================

-- Q86. Find employees earning more than the average salary of designations that have more than 2 employees.
SELECT EMP_NAME, SALARY FROM EMPLOYEES
WHERE SALARY > (
  SELECT AVG(SALARY) FROM EMPLOYEES
  WHERE DESIGNATION IN (SELECT DESIGNATION FROM EMPLOYEES GROUP BY DESIGNATION HAVING COUNT(*) > 2)
);

-- Q87. Find products priced above the average price of categories whose total stock exceeds 500.
SELECT PRODUCT_NAME, PRICE FROM PRODUCTS
WHERE PRICE > (
  SELECT AVG(PRICE) FROM PRODUCTS
  WHERE CATEGORY_ID IN (SELECT CATEGORY_ID FROM PRODUCTS GROUP BY CATEGORY_ID HAVING SUM(STOCK) > 500)
);

-- Q88. Find customers whose total orders exceed the average order count of customers who have made a payment.
SELECT CUSTOMER_NAME FROM CUSTOMERS C
WHERE (SELECT COUNT(*) FROM ORDERS O WHERE O.CUSTOMER_ID = C.CUSTOMER_ID) > (
  SELECT AVG(CNT) FROM (
    SELECT COUNT(*) AS CNT FROM ORDERS O2
    WHERE O2.CUSTOMER_ID IN (SELECT O3.CUSTOMER_ID FROM ORDERS O3 JOIN PAYMENTS PM ON O3.ORDER_ID = PM.ORDER_ID)
    GROUP BY O2.CUSTOMER_ID
  )
);

-- Q89. Find the supplier(s) whose total product stock is the highest among suppliers who supply more than one category.
SELECT SUPPLIER_ID FROM PRODUCTS
WHERE SUPPLIER_ID IN (SELECT SUPPLIER_ID FROM PRODUCTS GROUP BY SUPPLIER_ID HAVING COUNT(DISTINCT CATEGORY_ID) > 1)
GROUP BY SUPPLIER_ID
HAVING SUM(STOCK) = (
  SELECT MAX(TOTAL_STOCK) FROM (
    SELECT SUPPLIER_ID, SUM(STOCK) AS TOTAL_STOCK FROM PRODUCTS
    WHERE SUPPLIER_ID IN (SELECT SUPPLIER_ID FROM PRODUCTS GROUP BY SUPPLIER_ID HAVING COUNT(DISTINCT CATEGORY_ID) > 1)
    GROUP BY SUPPLIER_ID
  )
);

-- Q90. Find employees whose designation's total salary is the highest among all designations.
SELECT EMP_NAME, DESIGNATION FROM EMPLOYEES
WHERE DESIGNATION = (
  SELECT DESIGNATION FROM (
    SELECT DESIGNATION, SUM(SALARY) AS TOTAL_SALARY FROM EMPLOYEES GROUP BY DESIGNATION ORDER BY TOTAL_SALARY DESC
  ) WHERE ROWNUM = 1
);

-- Q91. Find products in the category that has the single highest total sales value.
SELECT PRODUCT_NAME FROM PRODUCTS
WHERE CATEGORY_ID = (
  SELECT CATEGORY_ID FROM (
    SELECT P.CATEGORY_ID, SUM(OI.QUANTITY*OI.PRICE) AS TOTAL_SALES
    FROM ORDER_ITEMS OI JOIN PRODUCTS P ON OI.PRODUCT_ID = P.PRODUCT_ID
    GROUP BY P.CATEGORY_ID ORDER BY TOTAL_SALES DESC
  ) WHERE ROWNUM = 1
);

-- Q92. Find suppliers whose products appear only in the category that has the single highest total product count.
SELECT DISTINCT SUPPLIER_NAME FROM SUPPLIERS S
WHERE S.SUPPLIER_ID IN (
  SELECT PRODUCT.SUPPLIER_ID FROM PRODUCTS PRODUCT
  WHERE PRODUCT.CATEGORY_ID = (
    SELECT CATEGORY_ID FROM (
      SELECT CATEGORY_ID, COUNT(*) AS CNT FROM PRODUCTS GROUP BY CATEGORY_ID ORDER BY CNT DESC
    ) WHERE ROWNUM = 1
  )
);

-- Q93. Find customers who placed orders handled only by employees earning above the company average salary.
SELECT DISTINCT C.CUSTOMER_NAME FROM CUSTOMERS C
WHERE C.CUSTOMER_ID IN (
  SELECT O.CUSTOMER_ID FROM ORDERS O
  WHERE O.EMP_ID IN (SELECT EMP_ID FROM EMPLOYEES WHERE SALARY > (SELECT AVG(SALARY) FROM EMPLOYEES))
);

-- =====================================================
-- LEVEL 9: INTERVIEW-STYLE / ADVANCED SUBQUERIES
-- =====================================================

-- Q94. Find the Nth highest salary (e.g., 3rd highest) using a nested subquery.
SELECT MIN(SALARY) AS THIRD_HIGHEST_SALARY FROM (
  SELECT DISTINCT SALARY FROM EMPLOYEES ORDER BY SALARY DESC
) WHERE ROWNUM <= 3;

-- Q95. Find products whose price ranks in the top 3 within their category using a correlated subquery count.
SELECT P1.PRODUCT_NAME, P1.CATEGORY_ID, P1.PRICE FROM PRODUCTS P1
WHERE (SELECT COUNT(*) FROM PRODUCTS P2 WHERE P2.CATEGORY_ID = P1.CATEGORY_ID AND P2.PRICE > P1.PRICE) < 3;

-- Q96. Find customers whose every order has been fully paid (payment amount equals order items total) using NOT EXISTS.
SELECT DISTINCT C.CUSTOMER_NAME FROM CUSTOMERS C
WHERE NOT EXISTS (
  SELECT 1 FROM ORDERS O
  WHERE O.CUSTOMER_ID = C.CUSTOMER_ID
  AND NVL((SELECT SUM(PM.AMOUNT) FROM PAYMENTS PM WHERE PM.ORDER_ID = O.ORDER_ID),0)
    < NVL((SELECT SUM(OI.QUANTITY*OI.PRICE) FROM ORDER_ITEMS OI WHERE OI.ORDER_ID = O.ORDER_ID),0)
);

-- Q97. Find the employee(s) who handled the most orders, using a subquery to find the maximum order count.
SELECT EMP_ID FROM ORDERS GROUP BY EMP_ID
HAVING COUNT(*) = (SELECT MAX(CNT) FROM (SELECT COUNT(*) AS CNT FROM ORDERS GROUP BY EMP_ID));

-- Q98. Find categories whose every product has stock greater than the overall average stock (using NOT EXISTS to check no exceptions).
SELECT CATEGORY_NAME FROM CATEGORIES C
WHERE NOT EXISTS (
  SELECT 1 FROM PRODUCTS P
  WHERE P.CATEGORY_ID = C.CATEGORY_ID AND P.STOCK <= (SELECT AVG(STOCK) FROM PRODUCTS)
) AND EXISTS (SELECT 1 FROM PRODUCTS P2 WHERE P2.CATEGORY_ID = C.CATEGORY_ID);

-- Q99. Find suppliers who supply every category that exists (a "division" style query using NOT EXISTS twice).
SELECT S.SUPPLIER_NAME FROM SUPPLIERS S
WHERE NOT EXISTS (
  SELECT CAT.CATEGORY_ID FROM CATEGORIES CAT
  WHERE NOT EXISTS (
    SELECT 1 FROM PRODUCTS P WHERE P.SUPPLIER_ID = S.SUPPLIER_ID AND P.CATEGORY_ID = CAT.CATEGORY_ID
  )
);

-- Q100. Find the product(s) with the second highest total quantity sold, using a nested subquery.
SELECT PRODUCT_ID, TOTAL_QTY FROM (
  SELECT PRODUCT_ID, SUM(QUANTITY) AS TOTAL_QTY FROM ORDER_ITEMS GROUP BY PRODUCT_ID
)
WHERE TOTAL_QTY = (
  SELECT MAX(TOTAL_QTY) FROM (
    SELECT SUM(QUANTITY) AS TOTAL_QTY FROM ORDER_ITEMS GROUP BY PRODUCT_ID
  )
  WHERE TOTAL_QTY < (SELECT MAX(SUM(QUANTITY)) FROM ORDER_ITEMS GROUP BY PRODUCT_ID)
);

-- =====================================================
-- PRACTICE ORDER
-- =====================================================

-- Q01-Q15   : Single-row subqueries (WHERE clause)
-- Q16-Q30   : Multi-row subqueries (IN, ANY, ALL)
-- Q31-Q40   : Subqueries with aggregate functions
-- Q41-Q55   : Correlated subqueries
-- Q56-Q65   : Subqueries in FROM (inline views)
-- Q66-Q75   : Subqueries in SELECT (scalar subqueries)
-- Q76-Q85   : EXISTS / NOT EXISTS
-- Q86-Q93   : Nested subqueries (subquery within a subquery, including Q92)
-- Q94-Q100  : Interview-style / advanced subqueries

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
-- END OF SUBQUERIES PRACTICE
-- =====================================================

SPOOL OFF