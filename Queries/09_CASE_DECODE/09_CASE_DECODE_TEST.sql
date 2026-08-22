-- =====================================================
-- ORACLE SQL CASE & DECODE - RULES, SYNTAX & 100 QUESTIONS
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
COLUMN CUSTOMER_ID    FORMAT 999999
COLUMN EMP_ID         FORMAT 999999
COLUMN ORDER_DATE     FORMAT A12
COLUMN STATUS         FORMAT A20

COLUMN QUANTITY       FORMAT 999999
COLUMN PAYMENT_ID     FORMAT 999999
COLUMN PAYMENT_MODE   FORMAT A20
COLUMN PAYMENT_DATE   FORMAT A12
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

SPOOL 'F:\Exploring Technologies\OrcaleSqlPlusExploring\Oracle_Inventory_Sales_Management_System\Queries\09_CASE_DECODE\09_CASE_DECODE_TEST_OUTPUT.txt'


-- ============================================================
-- ORACLE SQL 11g
-- CASE & DECODE — COMPLETE TEST
-- ============================================================
-- Total Questions : 100
-- Difficulty      : Basic -> Intermediate -> Advanced
--
-- Topics Covered:
-- 1. Simple CASE
-- 2. Searched CASE
-- 3. CASE with numbers
-- 4. CASE with strings
-- 5. CASE with NULL
-- 6. CASE with calculations
-- 7. CASE with aggregate functions
-- 8. CASE + GROUP BY
-- 9. CASE + HAVING
-- 10. CASE + JOIN
-- 11. Nested CASE
-- 12. DECODE basics
-- 13. DECODE with numbers
-- 14. DECODE with strings
-- 15. DECODE + aggregate
-- 16. CASE vs DECODE
-- 17. Interview-style questions
-- ============================================================


-- =====================================================
-- CASE EXPRESSION
-- =====================================================

-- CASE is used to perform conditional logic inside SQL.

-- =====================================================
-- SIMPLE CASE SYNTAX
-- =====================================================

-- CASE column_name
--     WHEN value1 THEN result1
--     WHEN value2 THEN result2
--     ELSE default_result
-- END


-- =====================================================
-- SEARCHED CASE SYNTAX
-- =====================================================

-- CASE
--     WHEN condition1 THEN result1
--     WHEN condition2 THEN result2
--     ELSE default_result
-- END


-- =====================================================
-- DECODE SYNTAX
-- =====================================================

-- DECODE(column_name,
--        value1, result1,
--        value2, result2,
--        default_result)


-- =====================================================
-- CASE RULES
-- =====================================================

-- RULE 01: CASE evaluates conditions from top to bottom.
-- RULE 02: The first matching WHEN condition is returned.
-- RULE 03: ELSE is optional.
-- RULE 04: If no condition matches and ELSE is absent, CASE returns NULL.
-- RULE 05: Simple CASE compares one expression with multiple values.
-- RULE 06: Searched CASE allows conditions such as >, <, BETWEEN and LIKE.
-- RULE 07: CASE can be used inside SELECT.
-- RULE 08: CASE can be used inside ORDER BY.
-- RULE 09: CASE can be used inside GROUP BY.
-- RULE 10: CASE can be used inside aggregate functions.
-- RULE 11: CASE can be nested inside another CASE.
-- RULE 12: CASE can handle NULL using IS NULL.
-- RULE 13: DECODE performs equality comparison.
-- RULE 14: DECODE cannot directly perform >, <, BETWEEN or LIKE conditions.
-- RULE 15: DECODE is commonly used for simple value-to-value mapping.
-- RULE 16: CASE is more flexible than DECODE.
-- RULE 17: DECODE can compare NULL with NULL.
-- RULE 18: Always provide ELSE when a meaningful default is required.
-- RULE 19: CASE can return text, numbers, dates, or expressions.
-- RULE 20: CASE is preferred for complex conditional logic.


-- =====================================================
-- LEVEL 1: SIMPLE CASE - BASIC
-- Q01-Q15
-- =====================================================

-- Q01. Display product name and classify stock as HIGH, MEDIUM, or LOW.
SELECT PRODUCT_NAME,
       STOCK,
       CASE
           WHEN STOCK > 100 THEN 'HIGH'
           WHEN STOCK >= 50 THEN 'MEDIUM'
           ELSE 'LOW'
       END AS STOCK_LEVEL
FROM PRODUCTS;


-- Q02. Display product name and classify price as EXPENSIVE or AFFORDABLE.
SELECT PRODUCT_NAME,
       PRICE,
       CASE
           WHEN PRICE > 5000 THEN 'EXPENSIVE'
           ELSE 'AFFORDABLE'
       END AS PRICE_CATEGORY
FROM PRODUCTS;


-- Q03. Display employee name and classify salary as HIGH, MEDIUM, or LOW.
SELECT EMP_NAME,
       SALARY,
       CASE
           WHEN SALARY >= 100000 THEN 'HIGH'
           WHEN SALARY >= 50000 THEN 'MEDIUM'
           ELSE 'LOW'
       END AS SALARY_LEVEL
FROM EMPLOYEES;


-- Q04. Display order id and classify DELIVERED orders as COMPLETED.
SELECT ORDER_ID,
       STATUS,
       CASE STATUS
           WHEN 'DELIVERED' THEN 'COMPLETED'
           ELSE 'PENDING'
       END AS ORDER_CATEGORY
FROM ORDERS;


-- Q05. Display order id and classify order status.
SELECT ORDER_ID,
       STATUS,
       CASE STATUS
           WHEN 'DELIVERED' THEN 'SUCCESS'
           WHEN 'CANCELLED' THEN 'FAILED'
           WHEN 'PENDING' THEN 'WAITING'
           ELSE 'OTHER'
       END AS STATUS_CATEGORY
FROM ORDERS;


-- Q06. Display payment id and classify CASH payments.
SELECT PAYMENT_ID,
       PAYMENT_MODE,
       CASE PAYMENT_MODE
           WHEN 'CASH' THEN 'CASH PAYMENT'
           ELSE 'NON-CASH PAYMENT'
       END AS PAYMENT_TYPE
FROM PAYMENTS;


-- Q07. Display payment mode and classify payment method.
SELECT PAYMENT_ID,
       PAYMENT_MODE,
       CASE PAYMENT_MODE
           WHEN 'CASH' THEN 'PHYSICAL'
           WHEN 'UPI' THEN 'DIGITAL'
           WHEN 'CARD' THEN 'DIGITAL'
           ELSE 'OTHER'
       END AS PAYMENT_CATEGORY
FROM PAYMENTS;


-- Q08. Display employee designation and classify managers.
SELECT EMP_NAME,
       DESIGNATION,
       CASE DESIGNATION
           WHEN 'MANAGER' THEN 'MANAGEMENT'
           ELSE 'NON-MANAGEMENT'
       END AS EMPLOYEE_TYPE
FROM EMPLOYEES;


-- Q09. Display customer city and classify Hyderabad customers.
SELECT CUSTOMER_NAME,
       CITY,
       CASE CITY
           WHEN 'HYDERABAD' THEN 'LOCAL'
           ELSE 'OUTSTATION'
       END AS CUSTOMER_TYPE
FROM CUSTOMERS;


-- Q10. Display product stock and classify products as IN STOCK or OUT OF STOCK.
SELECT PRODUCT_NAME,
       STOCK,
       CASE
           WHEN STOCK > 0 THEN 'IN STOCK'
           ELSE 'OUT OF STOCK'
       END AS STOCK_STATUS
FROM PRODUCTS;


-- Q11. Display payment amount and classify as LARGE or SMALL.
SELECT PAYMENT_ID,
       AMOUNT,
       CASE
           WHEN AMOUNT >= 10000 THEN 'LARGE'
           ELSE 'SMALL'
       END AS PAYMENT_SIZE
FROM PAYMENTS;


-- Q12. Display order quantity and classify as BULK or NORMAL.
SELECT ORDER_ITEM_ID,
       QUANTITY,
       CASE
           WHEN QUANTITY >= 50 THEN 'BULK'
           ELSE 'NORMAL'
       END AS QUANTITY_TYPE
FROM ORDER_ITEMS;


-- Q13. Display supplier email availability.
SELECT SUPPLIER_NAME,
       EMAIL,
       CASE
           WHEN EMAIL IS NULL THEN 'EMAIL NOT AVAILABLE'
           ELSE 'EMAIL AVAILABLE'
       END AS EMAIL_STATUS
FROM SUPPLIERS;


-- Q14. Display customer phone availability.
SELECT CUSTOMER_NAME,
       PHONE,
       CASE
           WHEN PHONE IS NULL THEN 'PHONE NOT AVAILABLE'
           ELSE 'PHONE AVAILABLE'
       END AS PHONE_STATUS
FROM CUSTOMERS;


-- Q15. Display employee salary and eligibility for bonus.
SELECT EMP_NAME,
       SALARY,
       CASE
           WHEN SALARY >= 75000 THEN 'BONUS ELIGIBLE'
           ELSE 'NOT ELIGIBLE'
       END AS BONUS_STATUS
FROM EMPLOYEES;


-- =====================================================
-- LEVEL 2: SEARCHED CASE
-- Q16-Q30
-- =====================================================

-- Q16. Classify products based on price ranges.
SELECT PRODUCT_NAME,
       PRICE,
       CASE
           WHEN PRICE >= 10000 THEN 'PREMIUM'
           WHEN PRICE >= 5000 THEN 'EXPENSIVE'
           WHEN PRICE >= 1000 THEN 'MEDIUM'
           ELSE 'LOW'
       END AS PRICE_RANGE
FROM PRODUCTS;


-- Q17. Classify employees based on salary.
SELECT EMP_NAME,
       SALARY,
       CASE
           WHEN SALARY >= 100000 THEN 'A'
           WHEN SALARY >= 75000 THEN 'B'
           WHEN SALARY >= 50000 THEN 'C'
           ELSE 'D'
       END AS SALARY_GRADE
FROM EMPLOYEES;


-- Q18. Classify stock into four levels.
SELECT PRODUCT_NAME,
       STOCK,
       CASE
           WHEN STOCK >= 200 THEN 'VERY HIGH'
           WHEN STOCK >= 100 THEN 'HIGH'
           WHEN STOCK >= 50 THEN 'MEDIUM'
           ELSE 'LOW'
       END AS STOCK_LEVEL
FROM PRODUCTS;


-- Q19. Classify orders based on status.
SELECT ORDER_ID,
       STATUS,
       CASE
           WHEN STATUS = 'DELIVERED' THEN 'COMPLETED'
           WHEN STATUS = 'CANCELLED' THEN 'CANCELLED'
           WHEN STATUS = 'PENDING' THEN 'PENDING'
           ELSE 'IN PROCESS'
       END AS ORDER_CATEGORY
FROM ORDERS;


-- Q20. Classify payments based on amount.
SELECT PAYMENT_ID,
       AMOUNT,
       CASE
           WHEN AMOUNT >= 50000 THEN 'VERY LARGE'
           WHEN AMOUNT >= 20000 THEN 'LARGE'
           WHEN AMOUNT >= 5000 THEN 'MEDIUM'
           ELSE 'SMALL'
       END AS PAYMENT_CATEGORY
FROM PAYMENTS;


-- Q21. Classify order item quantities.
SELECT ORDER_ITEM_ID,
       QUANTITY,
       CASE
           WHEN QUANTITY >= 100 THEN 'VERY LARGE ORDER'
           WHEN QUANTITY >= 50 THEN 'LARGE ORDER'
           WHEN QUANTITY >= 10 THEN 'MEDIUM ORDER'
           ELSE 'SMALL ORDER'
       END AS ORDER_SIZE
FROM ORDER_ITEMS;


-- Q22. Calculate a product discount percentage based on price.
SELECT PRODUCT_NAME,
       PRICE,
       CASE
           WHEN PRICE >= 10000 THEN 20
           WHEN PRICE >= 5000 THEN 15
           WHEN PRICE >= 1000 THEN 10
           ELSE 5
       END AS DISCOUNT_PERCENT
FROM PRODUCTS;


-- Q23. Calculate discount amount based on product price.
SELECT PRODUCT_NAME,
       PRICE,
       CASE
           WHEN PRICE >= 10000 THEN PRICE * 0.20
           WHEN PRICE >= 5000 THEN PRICE * 0.15
           WHEN PRICE >= 1000 THEN PRICE * 0.10
           ELSE PRICE * 0.05
       END AS DISCOUNT_AMOUNT
FROM PRODUCTS;


-- Q24. Calculate final product price after discount.
SELECT PRODUCT_NAME,
       PRICE,
       PRICE -
       CASE
           WHEN PRICE >= 10000 THEN PRICE * 0.20
           WHEN PRICE >= 5000 THEN PRICE * 0.15
           WHEN PRICE >= 1000 THEN PRICE * 0.10
           ELSE PRICE * 0.05
       END AS FINAL_PRICE
FROM PRODUCTS;


-- Q25. Classify products based on stock availability.
SELECT PRODUCT_NAME,
       STOCK,
       CASE
           WHEN STOCK = 0 THEN 'OUT OF STOCK'
           WHEN STOCK < 10 THEN 'CRITICAL'
           WHEN STOCK < 50 THEN 'LOW'
           WHEN STOCK < 100 THEN 'NORMAL'
           ELSE 'HIGH'
       END AS STOCK_STATUS
FROM PRODUCTS;


-- Q26. Calculate employee bonus based on salary.
SELECT EMP_NAME,
       SALARY,
       CASE
           WHEN SALARY >= 100000 THEN SALARY * 0.20
           WHEN SALARY >= 75000 THEN SALARY * 0.15
           WHEN SALARY >= 50000 THEN SALARY * 0.10
           ELSE SALARY * 0.05
       END AS BONUS
FROM EMPLOYEES;


-- Q27. Calculate employee salary after bonus.
SELECT EMP_NAME,
       SALARY,
       SALARY +
       CASE
           WHEN SALARY >= 100000 THEN SALARY * 0.20
           WHEN SALARY >= 75000 THEN SALARY * 0.15
           WHEN SALARY >= 50000 THEN SALARY * 0.10
           ELSE SALARY * 0.05
       END AS TOTAL_SALARY
FROM EMPLOYEES;


-- Q28. Classify payments based on payment mode.
SELECT PAYMENT_ID,
       PAYMENT_MODE,
       CASE
           WHEN PAYMENT_MODE = 'CASH' THEN 'OFFLINE'
           WHEN PAYMENT_MODE IN ('UPI','CARD') THEN 'ONLINE'
           ELSE 'OTHER'
       END AS PAYMENT_CATEGORY
FROM PAYMENTS;


-- Q29. Classify customers based on city.
SELECT CUSTOMER_NAME,
       CITY,
       CASE
           WHEN CITY = 'HYDERABAD' THEN 'SOUTH'
           WHEN CITY = 'BANGALORE' THEN 'SOUTH'
           WHEN CITY = 'CHENNAI' THEN 'SOUTH'
           WHEN CITY = 'MUMBAI' THEN 'WEST'
           WHEN CITY = 'DELHI' THEN 'NORTH'
           ELSE 'OTHER'
       END AS REGION
FROM CUSTOMERS;


-- Q30. Classify inventory changes.
SELECT LOG_ID,
       OLD_STOCK,
       NEW_STOCK,
       CASE
           WHEN NEW_STOCK > OLD_STOCK THEN 'STOCK INCREASED'
           WHEN NEW_STOCK < OLD_STOCK THEN 'STOCK DECREASED'
           ELSE 'NO CHANGE'
       END AS STOCK_MOVEMENT
FROM INVENTORY_LOG;


-- =====================================================
-- LEVEL 3: CASE WITH CALCULATIONS
-- Q31-Q45
-- =====================================================

-- Q31. Calculate sales value and classify each order item.
SELECT ORDER_ITEM_ID,
       QUANTITY,
       PRICE,
       QUANTITY * PRICE AS SALES_VALUE,
       CASE
           WHEN QUANTITY * PRICE >= 50000 THEN 'HIGH VALUE'
           WHEN QUANTITY * PRICE >= 10000 THEN 'MEDIUM VALUE'
           ELSE 'LOW VALUE'
       END AS SALES_CATEGORY
FROM ORDER_ITEMS;


-- Q32. Calculate stock value and classify products.
SELECT PRODUCT_NAME,
       STOCK,
       PRICE,
       STOCK * PRICE AS STOCK_VALUE,
       CASE
           WHEN STOCK * PRICE >= 100000 THEN 'HIGH VALUE STOCK'
           WHEN STOCK * PRICE >= 50000 THEN 'MEDIUM VALUE STOCK'
           ELSE 'LOW VALUE STOCK'
       END AS STOCK_CATEGORY
FROM PRODUCTS;


-- Q33. Calculate inventory change quantity.
SELECT LOG_ID,
       OLD_STOCK,
       NEW_STOCK,
       NEW_STOCK - OLD_STOCK AS STOCK_CHANGE,
       CASE
           WHEN NEW_STOCK > OLD_STOCK THEN 'ADDED'
           WHEN NEW_STOCK < OLD_STOCK THEN 'REMOVED'
           ELSE 'UNCHANGED'
       END AS CHANGE_TYPE
FROM INVENTORY_LOG;


-- Q34. Calculate purchase quantity category.
SELECT PURCHASE_ID,
       QUANTITY,
       CASE
           WHEN QUANTITY >= 100 THEN 'BULK'
           WHEN QUANTITY >= 50 THEN 'MEDIUM'
           ELSE 'SMALL'
       END AS PURCHASE_TYPE
FROM PURCHASES;


-- Q35. Calculate payment fee based on amount.
SELECT PAYMENT_ID,
       AMOUNT,
       CASE
           WHEN AMOUNT >= 50000 THEN AMOUNT * 0.02
           WHEN AMOUNT >= 10000 THEN AMOUNT * 0.01
           ELSE 0
       END AS PAYMENT_FEE
FROM PAYMENTS;


-- Q36. Calculate product selling price after discount.
SELECT PRODUCT_NAME,
       PRICE,
       CASE
           WHEN PRICE >= 10000 THEN PRICE * 0.80
           WHEN PRICE >= 5000 THEN PRICE * 0.85
           WHEN PRICE >= 1000 THEN PRICE * 0.90
           ELSE PRICE * 0.95
       END AS SELLING_PRICE
FROM PRODUCTS;


-- Q37. Classify product stock value.
SELECT PRODUCT_NAME,
       STOCK * PRICE AS STOCK_VALUE,
       CASE
           WHEN STOCK * PRICE >= 200000 THEN 'A'
           WHEN STOCK * PRICE >= 100000 THEN 'B'
           WHEN STOCK * PRICE >= 50000 THEN 'C'
           ELSE 'D'
       END AS STOCK_GRADE
FROM PRODUCTS;


-- Q38. Classify order item sales value.
SELECT ORDER_ITEM_ID,
       QUANTITY * PRICE AS SALES_VALUE,
       CASE
           WHEN QUANTITY * PRICE >= 100000 THEN 'PREMIUM'
           WHEN QUANTITY * PRICE >= 50000 THEN 'HIGH'
           WHEN QUANTITY * PRICE >= 10000 THEN 'MEDIUM'
           ELSE 'LOW'
       END AS SALES_LEVEL
FROM ORDER_ITEMS;


-- Q39. Calculate commission based on payment amount.
SELECT PAYMENT_ID,
       AMOUNT,
       CASE
           WHEN AMOUNT >= 50000 THEN AMOUNT * 0.03
           WHEN AMOUNT >= 20000 THEN AMOUNT * 0.02
           ELSE AMOUNT * 0.01
       END AS COMMISSION
FROM PAYMENTS;


-- Q40. Classify salary after considering bonus.
SELECT EMP_NAME,
       SALARY,
       SALARY +
       CASE
           WHEN SALARY >= 100000 THEN SALARY * 0.20
           WHEN SALARY >= 50000 THEN SALARY * 0.10
           ELSE SALARY * 0.05
       END AS TOTAL_COMPENSATION,
       CASE
           WHEN SALARY >= 100000 THEN 'EXECUTIVE'
           WHEN SALARY >= 50000 THEN 'STANDARD'
           ELSE 'JUNIOR'
       END AS EMPLOYEE_LEVEL
FROM EMPLOYEES;


-- Q41. Determine stock reorder requirement.
SELECT PRODUCT_NAME,
       STOCK,
       CASE
           WHEN STOCK = 0 THEN 'URGENT REORDER'
           WHEN STOCK < 10 THEN 'REORDER'
           WHEN STOCK < 50 THEN 'MONITOR'
           ELSE 'NO REORDER'
       END AS REORDER_STATUS
FROM PRODUCTS;


-- Q42. Determine payment risk level.
SELECT PAYMENT_ID,
       AMOUNT,
       CASE
           WHEN AMOUNT >= 100000 THEN 'HIGH RISK'
           WHEN AMOUNT >= 50000 THEN 'MEDIUM RISK'
           ELSE 'LOW RISK'
       END AS RISK_LEVEL
FROM PAYMENTS;


-- Q43. Determine purchase priority.
SELECT PURCHASE_ID,
       QUANTITY,
       CASE
           WHEN QUANTITY >= 200 THEN 'HIGH PRIORITY'
           WHEN QUANTITY >= 100 THEN 'MEDIUM PRIORITY'
           ELSE 'LOW PRIORITY'
       END AS PRIORITY
FROM PURCHASES;


-- Q44. Determine inventory movement severity.
SELECT LOG_ID,
       OLD_STOCK,
       NEW_STOCK,
       ABS(NEW_STOCK - OLD_STOCK) AS STOCK_DIFFERENCE,
       CASE
           WHEN ABS(NEW_STOCK - OLD_STOCK) >= 100 THEN 'MAJOR'
           WHEN ABS(NEW_STOCK - OLD_STOCK) >= 50 THEN 'MEDIUM'
           ELSE 'MINOR'
       END AS MOVEMENT_LEVEL
FROM INVENTORY_LOG;


-- Q45. Classify products using both price and stock.
SELECT PRODUCT_NAME,
       PRICE,
       STOCK,
       CASE
           WHEN PRICE >= 10000 AND STOCK < 10 THEN 'EXPENSIVE LOW STOCK'
           WHEN PRICE >= 10000 AND STOCK >= 10 THEN 'EXPENSIVE'
           WHEN PRICE < 10000 AND STOCK < 10 THEN 'CHEAP LOW STOCK'
           ELSE 'NORMAL'
       END AS PRODUCT_STATUS
FROM PRODUCTS;


-- =====================================================
-- LEVEL 4: CASE + NULL
-- Q46-Q55
-- =====================================================

-- Q46. Display customer email status.
SELECT CUSTOMER_NAME,
       CASE
           WHEN EMAIL IS NULL THEN 'MISSING'
           ELSE 'AVAILABLE'
       END AS EMAIL_STATUS
FROM CUSTOMERS;


-- Q47. Display customer phone status.
SELECT CUSTOMER_NAME,
       CASE
           WHEN PHONE IS NULL THEN 'MISSING'
           ELSE 'AVAILABLE'
       END AS PHONE_STATUS
FROM CUSTOMERS;


-- Q48. Display order customer assignment status.
SELECT ORDER_ID,
       CASE
           WHEN CUSTOMER_ID IS NULL THEN 'CUSTOMER NOT ASSIGNED'
           ELSE 'CUSTOMER ASSIGNED'
       END AS CUSTOMER_STATUS
FROM ORDERS;


-- Q49. Display order employee assignment status.
SELECT ORDER_ID,
       CASE
           WHEN EMP_ID IS NULL THEN 'EMPLOYEE NOT ASSIGNED'
           ELSE 'EMPLOYEE ASSIGNED'
       END AS EMPLOYEE_STATUS
FROM ORDERS;


-- Q50. Display product category assignment status.
SELECT PRODUCT_NAME,
       CASE
           WHEN CATEGORY_ID IS NULL THEN 'CATEGORY NOT ASSIGNED'
           ELSE 'CATEGORY ASSIGNED'
       END AS CATEGORY_STATUS
FROM PRODUCTS;


-- Q51. Display product supplier assignment status.
SELECT PRODUCT_NAME,
       CASE
           WHEN SUPPLIER_ID IS NULL THEN 'SUPPLIER NOT ASSIGNED'
           ELSE 'SUPPLIER ASSIGNED'
       END AS SUPPLIER_STATUS
FROM PRODUCTS;


-- Q52. Display inventory log stock availability.
SELECT LOG_ID,
       CASE
           WHEN OLD_STOCK IS NULL OR NEW_STOCK IS NULL
           THEN 'INCOMPLETE LOG'
           ELSE 'COMPLETE LOG'
       END AS LOG_STATUS
FROM INVENTORY_LOG;


-- Q53. Display payment order assignment status.
SELECT PAYMENT_ID,
       CASE
           WHEN ORDER_ID IS NULL THEN 'ORDER NOT ASSIGNED'
           ELSE 'ORDER ASSIGNED'
       END AS ORDER_STATUS
FROM PAYMENTS;


-- Q54. Display order item product assignment status.
SELECT ORDER_ITEM_ID,
       CASE
           WHEN PRODUCT_ID IS NULL THEN 'PRODUCT NOT ASSIGNED'
           ELSE 'PRODUCT ASSIGNED'
       END AS PRODUCT_STATUS
FROM ORDER_ITEMS;


-- Q55. Display order item quantity status.
SELECT ORDER_ITEM_ID,
       CASE
           WHEN QUANTITY IS NULL THEN 'QUANTITY MISSING'
           WHEN QUANTITY = 0 THEN 'ZERO QUANTITY'
           ELSE 'VALID QUANTITY'
       END AS QUANTITY_STATUS
FROM ORDER_ITEMS;


-- =====================================================
-- LEVEL 5: CASE + AGGREGATE
-- Q56-Q65
-- =====================================================

-- Q56. Count high-value products.
SELECT COUNT(
           CASE
               WHEN PRICE >= 10000 THEN 1
           END
       ) AS HIGH_VALUE_PRODUCTS
FROM PRODUCTS;


-- Q57. Count low-stock products.
SELECT COUNT(
           CASE
               WHEN STOCK < 10 THEN 1
           END
       ) AS LOW_STOCK_PRODUCTS
FROM PRODUCTS;


-- Q58. Count delivered orders.
SELECT COUNT(
           CASE
               WHEN STATUS = 'DELIVERED' THEN 1
           END
       ) AS DELIVERED_ORDERS
FROM ORDERS;


-- Q59. Count cancelled orders.
SELECT COUNT(
           CASE
               WHEN STATUS = 'CANCELLED' THEN 1
           END
       ) AS CANCELLED_ORDERS
FROM ORDERS;


-- Q60. Find total sales value of high-value order items.
SELECT SUM(
           CASE
               WHEN QUANTITY * PRICE >= 50000
               THEN QUANTITY * PRICE
               ELSE 0
           END
       ) AS HIGH_VALUE_SALES
FROM ORDER_ITEMS;


-- Q61. Find total sales value of low-value order items.
SELECT SUM(
           CASE
               WHEN QUANTITY * PRICE < 50000
               THEN QUANTITY * PRICE
               ELSE 0
           END
       ) AS LOW_VALUE_SALES
FROM ORDER_ITEMS;


-- Q62. Find total stock of low-stock products.
SELECT SUM(
           CASE
               WHEN STOCK < 10 THEN STOCK
               ELSE 0
           END
       ) AS LOW_STOCK_QUANTITY
FROM PRODUCTS;


-- Q63. Find total payment collected through CASH.
SELECT SUM(
           CASE
               WHEN PAYMENT_MODE = 'CASH' THEN AMOUNT
               ELSE 0
           END
       ) AS CASH_TOTAL
FROM PAYMENTS;


-- Q64. Find total payment collected through UPI.
SELECT SUM(
           CASE
               WHEN PAYMENT_MODE = 'UPI' THEN AMOUNT
               ELSE 0
           END
       ) AS UPI_TOTAL
FROM PAYMENTS;


-- Q65. Find total salary paid to managers.
SELECT SUM(
           CASE
               WHEN DESIGNATION = 'MANAGER' THEN SALARY
               ELSE 0
           END
       ) AS MANAGER_SALARY_TOTAL
FROM EMPLOYEES;


-- =====================================================
-- LEVEL 6: CASE + GROUP BY / HAVING
-- Q66-Q75
-- =====================================================

-- Q66. Count products by stock category.
SELECT
       CASE
           WHEN STOCK >= 100 THEN 'HIGH'
           WHEN STOCK >= 50 THEN 'MEDIUM'
           ELSE 'LOW'
       END AS STOCK_CATEGORY,
       COUNT(*) AS PRODUCT_COUNT
FROM PRODUCTS
GROUP BY
       CASE
           WHEN STOCK >= 100 THEN 'HIGH'
           WHEN STOCK >= 50 THEN 'MEDIUM'
           ELSE 'LOW'
       END;


-- Q67. Count employees by salary grade.
SELECT
       CASE
           WHEN SALARY >= 100000 THEN 'A'
           WHEN SALARY >= 75000 THEN 'B'
           WHEN SALARY >= 50000 THEN 'C'
           ELSE 'D'
       END AS SALARY_GRADE,
       COUNT(*) AS EMPLOYEE_COUNT
FROM EMPLOYEES
GROUP BY
       CASE
           WHEN SALARY >= 100000 THEN 'A'
           WHEN SALARY >= 75000 THEN 'B'
           WHEN SALARY >= 50000 THEN 'C'
           ELSE 'D'
       END;


-- Q68. Find total sales by sales category.
SELECT
       CASE
           WHEN QUANTITY * PRICE >= 50000 THEN 'HIGH'
           WHEN QUANTITY * PRICE >= 10000 THEN 'MEDIUM'
           ELSE 'LOW'
       END AS SALES_CATEGORY,
       SUM(QUANTITY * PRICE) AS TOTAL_SALES
FROM ORDER_ITEMS
GROUP BY
       CASE
           WHEN QUANTITY * PRICE >= 50000 THEN 'HIGH'
           WHEN QUANTITY * PRICE >= 10000 THEN 'MEDIUM'
           ELSE 'LOW'
       END;


-- Q69. Find payment totals by payment category.
SELECT
       CASE
           WHEN AMOUNT >= 50000 THEN 'HIGH'
           WHEN AMOUNT >= 10000 THEN 'MEDIUM'
           ELSE 'LOW'
       END AS PAYMENT_CATEGORY,
       SUM(AMOUNT) AS TOTAL_AMOUNT
FROM PAYMENTS
GROUP BY
       CASE
           WHEN AMOUNT >= 50000 THEN 'HIGH'
           WHEN AMOUNT >= 10000 THEN 'MEDIUM'
           ELSE 'LOW'
       END;


-- Q70. Count orders by status category.
SELECT
       CASE STATUS
           WHEN 'DELIVERED' THEN 'COMPLETED'
           WHEN 'CANCELLED' THEN 'FAILED'
           WHEN 'PENDING' THEN 'WAITING'
           ELSE 'OTHER'
       END AS STATUS_CATEGORY,
       COUNT(*) AS ORDER_COUNT
FROM ORDERS
GROUP BY
       CASE STATUS
           WHEN 'DELIVERED' THEN 'COMPLETED'
           WHEN 'CANCELLED' THEN 'FAILED'
           WHEN 'PENDING' THEN 'WAITING'
           ELSE 'OTHER'
       END;


-- Q71. Find salary total for employees grouped by salary level.
SELECT
       CASE
           WHEN SALARY >= 100000 THEN 'HIGH'
           WHEN SALARY >= 50000 THEN 'MEDIUM'
           ELSE 'LOW'
       END AS SALARY_LEVEL,
       SUM(SALARY) AS TOTAL_SALARY
FROM EMPLOYEES
GROUP BY
       CASE
           WHEN SALARY >= 100000 THEN 'HIGH'
           WHEN SALARY >= 50000 THEN 'MEDIUM'
           ELSE 'LOW'
       END;


-- Q72. Find number of products in each price category.
SELECT
       CASE
           WHEN PRICE >= 10000 THEN 'PREMIUM'
           WHEN PRICE >= 5000 THEN 'EXPENSIVE'
           WHEN PRICE >= 1000 THEN 'MEDIUM'
           ELSE 'LOW'
       END AS PRICE_CATEGORY,
       COUNT(*) AS PRODUCT_COUNT
FROM PRODUCTS
GROUP BY
       CASE
           WHEN PRICE >= 10000 THEN 'PREMIUM'
           WHEN PRICE >= 5000 THEN 'EXPENSIVE'
           WHEN PRICE >= 1000 THEN 'MEDIUM'
           ELSE 'LOW'
       END;


-- Q73. Find stock total for each stock category.
SELECT
       CASE
           WHEN STOCK >= 100 THEN 'HIGH'
           WHEN STOCK >= 50 THEN 'MEDIUM'
           ELSE 'LOW'
       END AS STOCK_CATEGORY,
       SUM(STOCK) AS TOTAL_STOCK
FROM PRODUCTS
GROUP BY
       CASE
           WHEN STOCK >= 100 THEN 'HIGH'
           WHEN STOCK >= 50 THEN 'MEDIUM'
           ELSE 'LOW'
       END;


-- Q74. Find sales categories having total sales above 100000.
SELECT
       CASE
           WHEN QUANTITY * PRICE >= 50000 THEN 'HIGH'
           WHEN QUANTITY * PRICE >= 10000 THEN 'MEDIUM'
           ELSE 'LOW'
       END AS SALES_CATEGORY,
       SUM(QUANTITY * PRICE) AS TOTAL_SALES
FROM ORDER_ITEMS
GROUP BY
       CASE
           WHEN QUANTITY * PRICE >= 50000 THEN 'HIGH'
           WHEN QUANTITY * PRICE >= 10000 THEN 'MEDIUM'
           ELSE 'LOW'
       END
HAVING SUM(QUANTITY * PRICE) > 100000;


-- Q75. Find payment categories having more than 5 payments.
SELECT
       CASE
           WHEN AMOUNT >= 50000 THEN 'HIGH'
           WHEN AMOUNT >= 10000 THEN 'MEDIUM'
           ELSE 'LOW'
       END AS PAYMENT_CATEGORY,
       COUNT(*) AS PAYMENT_COUNT
FROM PAYMENTS
GROUP BY
       CASE
           WHEN AMOUNT >= 50000 THEN 'HIGH'
           WHEN AMOUNT >= 10000 THEN 'MEDIUM'
           ELSE 'LOW'
       END
HAVING COUNT(*) > 5;


-- =====================================================
-- LEVEL 7: CASE + JOIN
-- Q76-Q80
-- =====================================================

-- Q76. Display products with category and price classification.
SELECT P.PRODUCT_NAME,
       C.CATEGORY_NAME,
       P.PRICE,
       CASE
           WHEN P.PRICE >= 10000 THEN 'PREMIUM'
           WHEN P.PRICE >= 5000 THEN 'EXPENSIVE'
           ELSE 'NORMAL'
       END AS PRICE_CATEGORY
FROM PRODUCTS P
JOIN CATEGORIES C
ON P.CATEGORY_ID = C.CATEGORY_ID;


-- Q77. Display orders with customer name and order classification.
SELECT O.ORDER_ID,
       C.CUSTOMER_NAME,
       O.STATUS,
       CASE O.STATUS
           WHEN 'DELIVERED' THEN 'COMPLETED'
           WHEN 'CANCELLED' THEN 'FAILED'
           WHEN 'PENDING' THEN 'WAITING'
           ELSE 'PROCESSING'
       END AS ORDER_CATEGORY
FROM ORDERS O
JOIN CUSTOMERS C
ON O.CUSTOMER_ID = C.CUSTOMER_ID;


-- Q78. Display orders with employee and employee salary classification.
SELECT O.ORDER_ID,
       E.EMP_NAME,
       E.SALARY,
       CASE
           WHEN E.SALARY >= 100000 THEN 'HIGH SALARY'
           WHEN E.SALARY >= 50000 THEN 'MEDIUM SALARY'
           ELSE 'LOW SALARY'
       END AS SALARY_CATEGORY
FROM ORDERS O
JOIN EMPLOYEES E
ON O.EMP_ID = E.EMP_ID;


-- Q79. Display order items with product and sales classification.
SELECT PR.PRODUCT_NAME,
       OI.QUANTITY,
       OI.PRICE,
       CASE
           WHEN OI.QUANTITY * OI.PRICE >= 50000 THEN 'HIGH VALUE'
           WHEN OI.QUANTITY * OI.PRICE >= 10000 THEN 'MEDIUM VALUE'
           ELSE 'LOW VALUE'
       END AS SALES_CATEGORY
FROM ORDER_ITEMS OI
JOIN PRODUCTS PR
ON OI.PRODUCT_ID = PR.PRODUCT_ID;


-- Q80. Display payments with customer and payment classification.
SELECT C.CUSTOMER_NAME,
       PM.PAYMENT_MODE,
       PM.AMOUNT,
       CASE
           WHEN PM.AMOUNT >= 50000 THEN 'HIGH'
           WHEN PM.AMOUNT >= 10000 THEN 'MEDIUM'
           ELSE 'LOW'
       END AS PAYMENT_CATEGORY
FROM PAYMENTS PM
JOIN ORDERS O
ON PM.ORDER_ID = O.ORDER_ID
JOIN CUSTOMERS C
ON O.CUSTOMER_ID = C.CUSTOMER_ID;


-- =====================================================
-- LEVEL 8: DECODE - BASIC
-- Q81-Q90
-- =====================================================

-- Q81. Convert order status using DECODE.
SELECT ORDER_ID,
       STATUS,
       DECODE(STATUS,
              'DELIVERED','COMPLETED',
              'CANCELLED','FAILED',
              'PENDING','WAITING',
              'OTHER') AS STATUS_CATEGORY
FROM ORDERS;


-- Q82. Convert payment modes using DECODE.
SELECT PAYMENT_ID,
       PAYMENT_MODE,
       DECODE(PAYMENT_MODE,
              'CASH','OFFLINE',
              'UPI','ONLINE',
              'CARD','ONLINE',
              'OTHER') AS PAYMENT_CATEGORY
FROM PAYMENTS;


-- Q83. Convert employee designation using DECODE.
SELECT EMP_NAME,
       DESIGNATION,
       DECODE(DESIGNATION,
              'MANAGER','MANAGEMENT',
              'DEVELOPER','TECHNICAL',
              'TESTER','TESTING',
              'OTHER') AS DEPARTMENT_TYPE
FROM EMPLOYEES;


-- Q84. Convert customer city using DECODE.
SELECT CUSTOMER_NAME,
       CITY,
       DECODE(CITY,
              'HYDERABAD','TELANGANA',
              'BANGALORE','KARNATAKA',
              'CHENNAI','TAMIL NADU',
              'MUMBAI','MAHARASHTRA',
              'OTHER') AS STATE
FROM CUSTOMERS;


-- Q85. Convert stock availability using DECODE.
SELECT PRODUCT_NAME,
       STOCK,
       DECODE(STOCK,
              0,'OUT OF STOCK',
              'AVAILABLE') AS STOCK_STATUS
FROM PRODUCTS;


-- Q86. Convert order status into a numeric priority.
SELECT ORDER_ID,
       STATUS,
       DECODE(STATUS,
              'DELIVERED',1,
              'PENDING',2,
              'CANCELLED',3,
              4) AS PRIORITY
FROM ORDERS;


-- Q87. Convert payment mode into numeric codes.
SELECT PAYMENT_ID,
       PAYMENT_MODE,
       DECODE(PAYMENT_MODE,
              'CASH',1,
              'UPI',2,
              'CARD',3,
              4) AS PAYMENT_CODE
FROM PAYMENTS;


-- Q88. Convert employee designation into numeric levels.
SELECT EMP_NAME,
       DESIGNATION,
       DECODE(DESIGNATION,
              'MANAGER',1,
              'DEVELOPER',2,
              'TESTER',3,
              4) AS DESIGNATION_LEVEL
FROM EMPLOYEES;


-- Q89. Convert customer city into region.
SELECT CUSTOMER_NAME,
       CITY,
       DECODE(CITY,
              'HYDERABAD','SOUTH',
              'BANGALORE','SOUTH',
              'CHENNAI','SOUTH',
              'MUMBAI','WEST',
              'DELHI','NORTH',
              'OTHER') AS REGION
FROM CUSTOMERS;


-- Q90. Convert payment mode into payment type.
SELECT PAYMENT_ID,
       PAYMENT_MODE,
       DECODE(PAYMENT_MODE,
              'CASH','OFFLINE',
              'UPI','DIGITAL',
              'CARD','DIGITAL',
              'OTHER') AS PAYMENT_TYPE
FROM PAYMENTS;


-- =====================================================
-- LEVEL 9: DECODE + AGGREGATE / GROUP BY
-- Q91-Q95
-- =====================================================

-- Q91. Count orders by converted status.
SELECT DECODE(STATUS,
              'DELIVERED','COMPLETED',
              'CANCELLED','FAILED',
              'PENDING','WAITING',
              'OTHER') AS STATUS_CATEGORY,
       COUNT(*) AS ORDER_COUNT
FROM ORDERS
GROUP BY DECODE(STATUS,
                'DELIVERED','COMPLETED',
                'CANCELLED','FAILED',
                'PENDING','WAITING',
                'OTHER');


-- Q92. Find total payments by payment category.
SELECT DECODE(PAYMENT_MODE,
              'CASH','OFFLINE',
              'UPI','ONLINE',
              'CARD','ONLINE',
              'OTHER') AS PAYMENT_CATEGORY,
       SUM(AMOUNT) AS TOTAL_AMOUNT
FROM PAYMENTS
GROUP BY DECODE(PAYMENT_MODE,
                'CASH','OFFLINE',
                'UPI','ONLINE',
                'CARD','ONLINE',
                'OTHER');


-- Q93. Count employees by designation category.
SELECT DECODE(DESIGNATION,
              'MANAGER','MANAGEMENT',
              'DEVELOPER','TECHNICAL',
              'TESTER','TESTING',
              'OTHER') AS DESIGNATION_CATEGORY,
       COUNT(*) AS EMPLOYEE_COUNT
FROM EMPLOYEES
GROUP BY DECODE(DESIGNATION,
                'MANAGER','MANAGEMENT',
                'DEVELOPER','TECHNICAL',
                'TESTER','TESTING',
                'OTHER');


-- Q94. Find total payment amount for each payment mode.
SELECT DECODE(PAYMENT_MODE,
              'CASH','CASH',
              'UPI','UPI',
              'CARD','CARD',
              'OTHER') AS PAYMENT_MODE_NAME,
       SUM(AMOUNT) AS TOTAL_AMOUNT
FROM PAYMENTS
GROUP BY DECODE(PAYMENT_MODE,
                'CASH','CASH',
                'UPI','UPI',
                'CARD','CARD',
                'OTHER');


-- Q95. Find total order count by business status.
SELECT DECODE(STATUS,
              'DELIVERED','SUCCESSFUL',
              'CANCELLED','UNSUCCESSFUL',
              'PENDING','PENDING',
              'OTHER') AS BUSINESS_STATUS,
       COUNT(*) AS TOTAL_ORDERS
FROM ORDERS
GROUP BY DECODE(STATUS,
                'DELIVERED','SUCCESSFUL',
                'CANCELLED','UNSUCCESSFUL',
                'PENDING','PENDING',
                'OTHER');


-- =====================================================
-- LEVEL 10: INTERVIEW-STYLE CASE + DECODE
-- Q96-Q100
-- =====================================================

-- Q96. Compare CASE and DECODE for order status classification.
SELECT ORDER_ID,
       STATUS,
       CASE STATUS
           WHEN 'DELIVERED' THEN 'COMPLETED'
           WHEN 'CANCELLED' THEN 'FAILED'
           WHEN 'PENDING' THEN 'WAITING'
           ELSE 'OTHER'
       END AS CASE_RESULT,
       DECODE(STATUS,
              'DELIVERED','COMPLETED',
              'CANCELLED','FAILED',
              'PENDING','WAITING',
              'OTHER') AS DECODE_RESULT
FROM ORDERS;


-- Q97. Calculate product discount using CASE.
SELECT PRODUCT_NAME,
       PRICE,
       CASE
           WHEN PRICE >= 10000 THEN PRICE * 0.20
           WHEN PRICE >= 5000 THEN PRICE * 0.15
           WHEN PRICE >= 1000 THEN PRICE * 0.10
           ELSE PRICE * 0.05
       END AS DISCOUNT_AMOUNT,
       PRICE -
       CASE
           WHEN PRICE >= 10000 THEN PRICE * 0.20
           WHEN PRICE >= 5000 THEN PRICE * 0.15
           WHEN PRICE >= 1000 THEN PRICE * 0.10
           ELSE PRICE * 0.05
       END AS FINAL_PRICE
FROM PRODUCTS;


-- Q98. Find products requiring reorder using CASE and aggregate sales.
SELECT P.PRODUCT_NAME,
       P.STOCK,
       NVL(S.TOTAL_SOLD,0) AS TOTAL_SOLD,
       CASE
           WHEN P.STOCK = 0 THEN 'URGENT REORDER'
           WHEN P.STOCK < 10 THEN 'REORDER'
           WHEN NVL(S.TOTAL_SOLD,0) > 100 THEN 'HIGH DEMAND'
           ELSE 'NORMAL'
       END AS INVENTORY_STATUS
FROM PRODUCTS P
LEFT JOIN
(
    SELECT PRODUCT_ID,
           SUM(QUANTITY) AS TOTAL_SOLD
    FROM ORDER_ITEMS
    GROUP BY PRODUCT_ID
) S
ON P.PRODUCT_ID = S.PRODUCT_ID;


-- Q99. Classify customers based on their number of orders.
SELECT C.CUSTOMER_NAME,
       COUNT(O.ORDER_ID) AS NO_OF_ORDERS,
       CASE
           WHEN COUNT(O.ORDER_ID) >= 10 THEN 'VIP'
           WHEN COUNT(O.ORDER_ID) >= 5 THEN 'REGULAR'
           WHEN COUNT(O.ORDER_ID) > 0 THEN 'OCCASIONAL'
           ELSE 'NEW CUSTOMER'
       END AS CUSTOMER_CATEGORY
FROM CUSTOMERS C
LEFT JOIN ORDERS O
ON C.CUSTOMER_ID = O.CUSTOMER_ID
GROUP BY C.CUSTOMER_ID,
         C.CUSTOMER_NAME;


-- Q100. Classify employees based on salary and number of handled orders.
SELECT E.EMP_ID,
       E.EMP_NAME,
       E.SALARY,
       COUNT(O.ORDER_ID) AS NO_OF_ORDERS,
       CASE
           WHEN E.SALARY >= 100000
                AND COUNT(O.ORDER_ID) >= 10
           THEN 'TOP PERFORMER'

           WHEN E.SALARY >= 75000
                AND COUNT(O.ORDER_ID) >= 5
           THEN 'HIGH PERFORMER'

           WHEN COUNT(O.ORDER_ID) >= 1
           THEN 'NORMAL PERFORMER'

           ELSE 'NO ORDERS'
       END AS PERFORMANCE_LEVEL
FROM EMPLOYEES E
LEFT JOIN ORDERS O
ON E.EMP_ID = O.EMP_ID
GROUP BY E.EMP_ID,
         E.EMP_NAME,
         E.SALARY;


-- =====================================================
-- PRACTICE ORDER
-- =====================================================

-- Q01-Q15   : SIMPLE CASE - BASIC
-- Q16-Q30   : SEARCHED CASE
-- Q31-Q45   : CASE + CALCULATIONS
-- Q46-Q55   : CASE + NULL
-- Q56-Q65   : CASE + AGGREGATE
-- Q66-Q75   : CASE + GROUP BY / HAVING
-- Q76-Q80   : CASE + JOIN
-- Q81-Q90   : DECODE - BASIC
-- Q91-Q95   : DECODE + AGGREGATE / GROUP BY
-- Q96-Q100  : INTERVIEW-STYLE CASE + DECODE


-- =====================================================
-- IMPORTANT CASE FORMULAS
-- =====================================================

-- CONDITIONAL VALUE
-- CASE
--     WHEN condition THEN result
--     ELSE result
-- END


-- SIMPLE VALUE MAPPING
-- CASE column
--     WHEN value1 THEN result1
--     WHEN value2 THEN result2
--     ELSE result
-- END


-- DECODE
-- DECODE(column,
--        value1,result1,
--        value2,result2,
--        default_result)


-- CONDITIONAL COUNT
-- COUNT(CASE WHEN condition THEN 1 END)


-- CONDITIONAL SUM
-- SUM(CASE WHEN condition THEN amount ELSE 0 END)


-- CONDITIONAL CALCULATION
-- SUM(CASE WHEN condition THEN quantity * price ELSE 0 END)


-- CASE + GROUP BY
-- SELECT CASE WHEN condition THEN result END, COUNT(*)
-- FROM table
-- GROUP BY CASE WHEN condition THEN result END;


-- CASE + HAVING
-- SELECT CASE WHEN condition THEN result END, COUNT(*)
-- FROM table
-- GROUP BY CASE WHEN condition THEN result END
-- HAVING COUNT(*) > value;


-- =====================================================
-- CASE vs DECODE
-- =====================================================

-- CASE:
-- Supports =, >, <, >=, <=, BETWEEN, IN, LIKE, AND, OR.
-- Supports complex conditions.
-- ANSI SQL standard.
-- Recommended for modern SQL.

-- DECODE:
-- Mainly performs equality comparison.
-- Oracle-specific function.
-- Useful for simple value mapping.
-- Cannot directly handle >, < or BETWEEN conditions.


-- =====================================================
-- END OF CASE & DECODE PRACTICE
-- =====================================================

SPOOL OFF