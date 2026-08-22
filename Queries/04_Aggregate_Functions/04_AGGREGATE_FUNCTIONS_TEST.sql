-- =====================================================
-- ORACLE SQL AGGREGATE FUNCTIONS - RULES, SYNTAX & 50 QUESTIONS
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
-- AGGREGATE FUNCTIONS TEST
-- COLUMN FORMATTING
-- Q1–Q50
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

SPOOL 'F:\Exploring Technologies\OrcaleSqlPlusExploring\Oracle_Inventory_Sales_Management_System\Queries\04_Aggregate_Functions\04_AGGREGATE_FUNCTIONS_TEST_OUTPUT.txt'


-- ============================================================
-- ORACLE SQL 11g
-- AGGREGATE FUNCTIONS — COMPLETE TEST
-- ============================================================
-- Total Questions : 50
-- Difficulty      : Basic → Intermediate → Advanced
--
-- Topics Covered:
-- 1. COUNT()
-- 2. SUM()
-- 3. AVG()
-- 4. MIN()
-- 5. MAX()
-- 6. Aggregate Functions with WHERE
-- 7. GROUP BY + Aggregate Functions
-- 8. HAVING + Aggregate Functions
-- 9. Aggregate Functions with ORDER BY
-- 10. Multiple Aggregate Functions
-- 11. Interview-Style Aggregate Problems
--
-- IMPORTANT:
-- Do NOT use the aggregate function blindly.
-- First understand whether the question requires:
-- COUNT(), SUM(), AVG(), MIN(), MAX()
-- and then decide whether GROUP BY or HAVING is required.
-- ============================================================
-- =====================================================
-- AGGREGATE FUNCTIONS
-- =====================================================

-- COUNT()    : Counts rows or non-NULL values
-- SUM()      : Calculates total
-- AVG()      : Calculates average
-- MIN()      : Finds minimum value
-- MAX()      : Finds maximum value

-- =====================================================
-- BASIC SYNTAX
-- =====================================================

-- COUNT ALL ROWS
--SELECT COUNT(*) FROM table_name;

-- COUNT NON-NULL VALUES
--SELECT COUNT(column_name) FROM table_name;

-- SUM
--SELECT SUM(column_name) FROM table_name;

-- AVG
--SELECT AVG(column_name) FROM table_name;

-- MIN
--SELECT MIN(column_name) FROM table_name;

-- MAX
--SELECT MAX(column_name) FROM table_name;

-- =====================================================
-- AGGREGATE FUNCTION RULES
-- =====================================================

-- RULE 01: COUNT(*) counts all rows.
-- RULE 02: COUNT(column) counts only non-NULL values.
-- RULE 03: SUM() calculates the total of numeric values.
-- RULE 04: AVG() calculates the average of numeric values.
-- RULE 05: MIN() returns the smallest value.
-- RULE 06: MAX() returns the largest value.
-- RULE 07: Aggregate functions normally return one result without GROUP BY.
-- RULE 08: NULL values are ignored by SUM(), AVG(), MIN() and MAX().
-- RULE 09: DISTINCT can be used inside aggregate functions.
-- RULE 10: WHERE filters rows before aggregation.
-- RULE 11: GROUP BY creates groups.
-- RULE 12: HAVING filters groups after GROUP BY.
-- RULE 13: ORDER BY can sort aggregate results.
-- RULE 14: A non-aggregate column in SELECT should normally appear in GROUP BY.
-- RULE 15: WHERE comes before GROUP BY.
-- RULE 16: HAVING comes after GROUP BY.
-- RULE 17: ORDER BY is used to sort the final result.
-- RULE 18: Aggregate functions can be used with expressions.
-- RULE 19: Aggregate functions can be given aliases.
-- RULE 20: Multiple aggregate functions can be used in one SELECT statement.

-- =====================================================
-- WHERE + AGGREGATE SYNTAX
-- =====================================================

-- SELECT AGGREGATE_FUNCTION(column)
-- FROM table_name
-- WHERE condition;

-- =====================================================
-- GROUP BY + AGGREGATE SYNTAX
-- =====================================================

-- SELECT group_column, AGGREGATE_FUNCTION(column)
-- FROM table_name
-- GROUP BY group_column;

-- =====================================================
-- HAVING + AGGREGATE SYNTAX
-- =====================================================

-- SELECT group_column, AGGREGATE_FUNCTION(column)
-- FROM table_name
-- GROUP BY group_column
-- HAVING AGGREGATE_FUNCTION(column) condition;

-- =====================================================
-- GROUP BY + HAVING + ORDER BY SYNTAX
-- =====================================================

-- SELECT group_column, AGGREGATE_FUNCTION(column) AS alias
-- FROM table_name
-- GROUP BY group_column
-- HAVING AGGREGATE_FUNCTION(column) condition
-- ORDER BY alias;

-- =====================================================
-- EXECUTION ORDER
-- =====================================================

-- FROM
-- WHERE
-- GROUP BY
-- HAVING
-- SELECT
-- ORDER BY

-- =====================================================
-- LEVEL 1: COUNT() - BASIC QUESTIONS
-- =====================================================

-- Q01. Find the total number of employees.

SELECT COUNT(*) AS NO_OF_EMPLOYEES FROM EMPLOYEES;

-- Q02. Find the total number of customers.

SELECT COUNT(*) AS NO_OF_CUSTOMERS FROM CUSTOMERS;

-- Q03. Find the total number of products.

SELECT COUNT(*) AS NO_OF_PRODUCTS FROM PRODUCTS;

-- Q04. Find the total number of orders.

SELECT COUNT(*) AS NO_OF_ORDERS FROM ORDERS;

-- Q05. Find the total number of suppliers.

SELECT COUNT(*) AS NO_OF_SUPPLIERS FROM SUPPLIERS;

-- Q06. Find the total number of categories.

SELECT COUNT(*) AS NO_OF_CATEGORIES FROM CATEGORIES;

-- Q07. Find the total number of payments.

SELECT COUNT(*) AS NO_OF_PAYMENTS FROM PAYMENTS;

-- Q08. Find the total number of purchase records.

SELECT COUNT(*) AS NO_OF_PURCHASE_RECORDS FROM PURCHASES;

-- Q09. Count the number of employees whose salary is not NULL.

SELECT COUNT(*) AS NO_OF_EMPLOYEES FROM EMPLOYEES WHERE SALARY IS NOT NULL;

-- Q10. Count the number of customers whose city is not NULL.

SELECT COUNT(*) AS NO_OF_CUSTOMERS FROM CUSTOMERS WHERE CITY IS NOT NULL;

-- =====================================================
-- LEVEL 2: SUM() QUESTIONS
-- =====================================================

-- Q11. Find the total salary paid to all employees.

SELECT SUM(SALARY) AS TOTAL_SALARY FROM EMPLOYEES;

-- Q12. Find the total stock available for all products.

SELECT SUM(STOCK) AS TOTAL_STOCK FROM PRODUCTS;

-- Q13. Find the total quantity sold from ORDER_ITEMS.

SELECT SUM(QUANTITY) AS TOTAL_QUANTITY FROM ORDER_ITEMS;

-- Q14. Find the total amount received from all payments.

SELECT SUM(AMOUNT) AS TOTAL_AMOUNT FROM PAYMENTS;

-- Q15. Find the total quantity purchased from PURCHASES.

SELECT SUM(QUANTITY) AS TOTAL_QUANTITY FROM PURCHASES;

-- Q16. Find the total value of all products based on PRICE * STOCK.

SELECT SUM(PRICE*STOCK) AS TOTAL_VALUE_OF_ALL_PRODUCTS FROM PRODUCTS;

-- Q17. Find the total sales value using QUANTITY * PRICE from ORDER_ITEMS.

SELECT SUM(QUANTITY*PRICE) AS TOTAL_SALES_VALUE FROM ORDER_ITEMS;

-- Q18. Find the total salary paid to employees whose salary is greater than 30000.

SELECT SUM(SALARY) AS TOTAL_SALARY FROM EMPLOYEES WHERE SALARY>30000;

-- =====================================================
-- LEVEL 3: AVG() QUESTIONS
-- =====================================================

-- Q19. Find the average salary of all employees.
SELECT AVG(SALARY) AS AVG_SALARY
FROM EMPLOYEES;

-- Q20. Find the average product price.
SELECT AVG(PRICE) AS AVG_PRICE
FROM PRODUCTS;

-- Q21. Find the average product stock.
SELECT AVG(STOCK) AS AVG_STOCK
FROM PRODUCTS;

-- Q22. Find the average order-item quantity.
SELECT AVG(QUANTITY) AS AVG_QUANTITY
FROM ORDER_ITEMS;

-- Q23. Find the average order-item price.
SELECT AVG(PRICE) AS AVG_PRICE
FROM ORDER_ITEMS;

-- Q24. Find the average payment amount.
SELECT AVG(AMOUNT) AS AVG_AMOUNT
FROM PAYMENTS;

-- Q25. Find the average purchase quantity.
SELECT AVG(QUANTITY) AS AVG_QUANTITY
FROM PURCHASES;

-- Q26. Find the average salary of employees whose salary is greater than 30000.
SELECT AVG(SALARY) AS AVG_SALARY
FROM EMPLOYEES
WHERE SALARY > 30000;

-- =====================================================
-- LEVEL 4: MIN() AND MAX() QUESTIONS
-- =====================================================

-- Q27. Find the minimum employee salary.

SELECT MIN(SALARY) AS LOWEST_SALARY FROM EMPLOYEES;

-- Q28. Find the maximum employee salary.

SELECT MAX(SALARY) AS HIGHEST_SALARY FROM EMPLOYEES;

-- Q29. Find the minimum product price.

SELECT MIN(PRICE) AS LOWEST_PRICE FROM PRODUCTS;

-- Q30. Find the maximum product price.

SELECT MAX(PRICE) AS HIGHEST_PRICE FROM PRODUCTS;

-- Q31. Find the minimum product stock.

SELECT MIN(STOCK) AS LOWEST_STOCK FROM PRODUCTS;

-- Q32. Find the maximum product stock.

SELECT MAX(STOCK) AS HIGHEST_STOCK FROM PRODUCTS;

-- Q33. Find the minimum payment amount.

SELECT MIN(AMOUNT) AS LOWEST_PAYMENT_AMOUNT FROM PAYMENTS;

-- Q34. Find the maximum payment amount.

SELECT MAX(AMOUNT) AS HIGHEST_PAYMENT_AMOUNT FROM PAYMENTS;

-- Q35. Find the minimum order-item quantity.

SELECT MIN(QUANTITY) AS LOWEST_QUANTITY FROM ORDER_ITEMS;

-- Q36. Find the maximum order-item quantity.

SELECT MAX(QUANTITY) AS HIGHEST_QUANTITY FROM ORDER_ITEMS;

-- =====================================================
-- LEVEL 5: GROUP BY + AGGREGATE QUESTIONS
-- =====================================================

-- Q37. Find the number of employees for each designation.

SELECT COUNT(*) AS NO_OF_EMPLOYEES,DESIGNATION FROM EMPLOYEES GROUP BY DESIGNATION;

-- Q38. Find the average salary for each designation.

SELECT AVG(SALARY) AS AVERAGE_SALARY,DESIGNATION FROM EMPLOYEES GROUP BY DESIGNATION;

-- Q39. Find the minimum salary for each designation.

SELECT MIN(SALARY) AS LOWEST_SALARY,DESIGNATION FROM EMPLOYEES GROUP BY DESIGNATION;

-- Q40. Find the maximum salary for each designation.

SELECT MAX(SALARY) AS HIGHEST_SALARY,DESIGNATION FROM EMPLOYEES GROUP BY DESIGNATION;

-- Q41. Find the total salary for each designation.

SELECT SUM(SALARY) AS TOTAL_SALARY,DESIGNATION FROM EMPLOYEES GROUP BY DESIGNATION;

-- Q42. Find the number of products in each category.

SELECT COUNT(*) AS NO_OF_PRODUCTS,CATEGORY_ID FROM PRODUCTS GROUP BY CATEGORY_ID;

-- Q43. Find the average product price for each category.

SELECT AVG(PRICE) AS AVERAGE_PRICE,CATEGORY_ID FROM PRODUCTS GROUP BY CATEGORY_ID;

-- Q44. Find the total stock for each category.

SELECT SUM(STOCK) AS TOTAL_STOCK,CATEGORY_ID FROM PRODUCTS GROUP BY CATEGORY_ID;

-- Q45. Find the maximum product price for each category.

SELECT MAX(PRICE) AS HIGHEST_PRICE,CATEGORY_ID FROM PRODUCTS GROUP BY CATEGORY_ID;

-- Q46. Find the total quantity sold for each product.

SELECT SUM(QUANTITY) AS TOTAL_QUANTITY,PRODUCT_ID FROM ORDER_ITEMS GROUP BY PRODUCT_ID;

-- =====================================================
-- LEVEL 6: GROUP BY + HAVING QUESTIONS
-- =====================================================

-- Q47. Find designations having more than 2 employees.

SELECT DESIGNATION FROM EMPLOYEES GROUP BY DESIGNATION HAVING COUNT(*)>2;

-- Q48. Find designations whose average salary is greater than 30000.

SELECT DESIGNATION FROM EMPLOYEES GROUP BY DESIGNATION HAVING AVG(SALARY)>30000;

-- Q49. Find categories having total stock greater than 500.

SELECT CATEGORY_ID,SUM(STOCK) AS TOTAL_STOCK FROM PRODUCTS GROUP BY CATEGORY_ID HAVING SUM(STOCK)>500;

-- Q50. Find products whose total sold quantity is greater than 100.

SELECT PRODUCT_ID,SUM(QUANTITY) AS TOTAL_QUANTITY_SOLD FROM ORDER_ITEMS GROUP BY PRODUCT_ID HAVING SUM(QUANTITY)>100;
-- =====================================================
-- PRACTICE ORDER
-- =====================================================

-- Q01-Q10  : COUNT()
-- Q11-Q18  : SUM()
-- Q19-Q26  : AVG()
-- Q27-Q36  : MIN() + MAX()
-- Q37-Q46  : GROUP BY + Aggregate Functions
-- Q47-Q50  : GROUP BY + HAVING

-- =====================================================
-- IMPORTANT COLUMNS FROM YOUR PROJECT
-- =====================================================

-- EMPLOYEES      : EMP_ID, EMP_NAME, DESIGNATION, SALARY
-- PRODUCTS       : PRODUCT_ID, PRODUCT_NAME, CATEGORY_ID, SUPPLIER_ID, PRICE, STOCK
-- ORDER_ITEMS    : ORDER_ITEM_ID, ORDER_ID, PRODUCT_ID, QUANTITY, PRICE
-- PAYMENTS       : PAYMENT_ID, ORDER_ID, PAYMENT_MODE, PAYMENT_DATE, AMOUNT
-- PURCHASES      : PURCHASE_ID, SUPPLIER_ID, PRODUCT_ID, QUANTITY, PURCHASE_DATE
-- CUSTOMERS      : CUSTOMER_ID, CUSTOMER_NAME, PHONE, EMAIL, ADDRESS, CITY
-- ORDERS         : ORDER_ID, CUSTOMER_ID, EMP_ID, ORDER_DATE, STATUS
-- CATEGORIES     : CATEGORY_ID, CATEGORY_NAME
-- SUPPLIERS      : SUPPLIER_ID, SUPPLIER_NAME, PHONE, EMAIL
-- INVENTORY_LOG  : LOG_ID, PRODUCT_ID, OLD_STOCK, NEW_STOCK, UPDATED_DATE

-- =====================================================
-- END OF AGGREGATE FUNCTION PRACTICE
-- =====================================================

SPOOL OFF