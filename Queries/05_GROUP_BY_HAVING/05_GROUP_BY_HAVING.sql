-- ============================================================
-- ORACLE SQL - GROUP BY + HAVING
-- 100 PRACTICE QUESTIONS WITH ANSWERS
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

SPOOL 'F:\Exploring Technologies\OrcaleSqlPlusExploring\Oracle_Inventory_Sales_Management_System\Queries\05_GROUP_BY_HAVING\05_GROUP_BY_HAVING_OUTPUT.txt'


-- ============================================================
-- SECTION 1: BASIC GROUP BY
-- ============================================================

-- Q01. Count customers by city.
SELECT CITY, COUNT(*) AS CUSTOMER_COUNT
FROM CUSTOMERS
GROUP BY CITY;


-- Q02. Count employees by designation.
SELECT DESIGNATION, COUNT(*) AS EMPLOYEE_COUNT
FROM EMPLOYEES
GROUP BY DESIGNATION;


-- Q03. Find average salary by designation.
SELECT DESIGNATION, AVG(SALARY) AS AVG_SALARY
FROM EMPLOYEES
GROUP BY DESIGNATION;


-- Q04. Find maximum salary by designation.
SELECT DESIGNATION, MAX(SALARY) AS MAX_SALARY
FROM EMPLOYEES
GROUP BY DESIGNATION;


-- Q05. Find minimum salary by designation.
SELECT DESIGNATION, MIN(SALARY) AS MIN_SALARY
FROM EMPLOYEES
GROUP BY DESIGNATION;


-- Q06. Find total salary by designation.
SELECT DESIGNATION, SUM(SALARY) AS TOTAL_SALARY
FROM EMPLOYEES
GROUP BY DESIGNATION;


-- Q07. Count products by category.
SELECT CATEGORY_ID, COUNT(*) AS PRODUCT_COUNT
FROM PRODUCTS
GROUP BY CATEGORY_ID;


-- Q08. Find average product price by category.
SELECT CATEGORY_ID, AVG(PRICE) AS AVG_PRICE
FROM PRODUCTS
GROUP BY CATEGORY_ID;


-- Q09. Find maximum product price by category.
SELECT CATEGORY_ID, MAX(PRICE) AS MAX_PRICE
FROM PRODUCTS
GROUP BY CATEGORY_ID;


-- Q10. Find minimum product price by category.
SELECT CATEGORY_ID, MIN(PRICE) AS MIN_PRICE
FROM PRODUCTS
GROUP BY CATEGORY_ID;


-- Q11. Find total stock by category.
SELECT CATEGORY_ID, SUM(STOCK) AS TOTAL_STOCK
FROM PRODUCTS
GROUP BY CATEGORY_ID;


-- Q12. Find average product price by supplier.
SELECT SUPPLIER_ID, AVG(PRICE) AS AVG_PRICE
FROM PRODUCTS
GROUP BY SUPPLIER_ID;


-- Q13. Find total stock by supplier.
SELECT SUPPLIER_ID, SUM(STOCK) AS TOTAL_STOCK
FROM PRODUCTS
GROUP BY SUPPLIER_ID;


-- Q14. Count products by supplier.
SELECT SUPPLIER_ID, COUNT(*) AS PRODUCT_COUNT
FROM PRODUCTS
GROUP BY SUPPLIER_ID;


-- Q15. Count orders by customer.
SELECT CUSTOMER_ID, COUNT(*) AS ORDER_COUNT
FROM ORDERS
GROUP BY CUSTOMER_ID;


-- Q16. Count orders by employee.
SELECT EMP_ID, COUNT(*) AS ORDER_COUNT
FROM ORDERS
GROUP BY EMP_ID;


-- Q17. Count orders by order status.
SELECT STATUS, COUNT(*) AS ORDER_COUNT
FROM ORDERS
GROUP BY STATUS;


-- Q18. Count orders by order date.
SELECT ORDER_DATE, COUNT(*) AS ORDER_COUNT
FROM ORDERS
GROUP BY ORDER_DATE;


-- Q19. Find total order amount by customer.
SELECT CUSTOMER_ID, SUM(AMOUNT) AS TOTAL_AMOUNT
FROM ORDERS
GROUP BY CUSTOMER_ID;


-- Q20. Find average order amount by customer.
SELECT CUSTOMER_ID, AVG(AMOUNT) AS AVG_AMOUNT
FROM ORDERS
GROUP BY CUSTOMER_ID;



-- ============================================================
-- SECTION 2: GROUP BY WITH HAVING
-- ============================================================

-- Q21. Find cities having more than 3 customers.
SELECT CITY, COUNT(*) AS CUSTOMER_COUNT
FROM CUSTOMERS
GROUP BY CITY
HAVING COUNT(*) > 3;


-- Q22. Find designations having more than 2 employees.
SELECT DESIGNATION, COUNT(*) AS EMPLOYEE_COUNT
FROM EMPLOYEES
GROUP BY DESIGNATION
HAVING COUNT(*) > 2;


-- Q23. Find designations whose average salary is greater than 30000.
SELECT DESIGNATION, AVG(SALARY) AS AVG_SALARY
FROM EMPLOYEES
GROUP BY DESIGNATION
HAVING AVG(SALARY) > 30000;


-- Q24. Find designations whose maximum salary is greater than 50000.
SELECT DESIGNATION, MAX(SALARY) AS MAX_SALARY
FROM EMPLOYEES
GROUP BY DESIGNATION
HAVING MAX(SALARY) > 50000;


-- Q25. Find designations whose minimum salary is greater than 20000.
SELECT DESIGNATION, MIN(SALARY) AS MIN_SALARY
FROM EMPLOYEES
GROUP BY DESIGNATION
HAVING MIN(SALARY) > 20000;


-- Q26. Find designations whose total salary is greater than 100000.
SELECT DESIGNATION, SUM(SALARY) AS TOTAL_SALARY
FROM EMPLOYEES
GROUP BY DESIGNATION
HAVING SUM(SALARY) > 100000;


-- Q27. Find categories having more than 5 products.
SELECT CATEGORY_ID, COUNT(*) AS PRODUCT_COUNT
FROM PRODUCTS
GROUP BY CATEGORY_ID
HAVING COUNT(*) > 5;


-- Q28. Find categories whose average product price is greater than 1000.
SELECT CATEGORY_ID, AVG(PRICE) AS AVG_PRICE
FROM PRODUCTS
GROUP BY CATEGORY_ID
HAVING AVG(PRICE) > 1000;


-- Q29. Find categories whose total stock is greater than 100.
SELECT CATEGORY_ID, SUM(STOCK) AS TOTAL_STOCK
FROM PRODUCTS
GROUP BY CATEGORY_ID
HAVING SUM(STOCK) > 100;


-- Q30. Find suppliers having more than 3 products.
SELECT SUPPLIER_ID, COUNT(*) AS PRODUCT_COUNT
FROM PRODUCTS
GROUP BY SUPPLIER_ID
HAVING COUNT(*) > 3;


-- Q31. Find suppliers whose total stock is greater than 200.
SELECT SUPPLIER_ID, SUM(STOCK) AS TOTAL_STOCK
FROM PRODUCTS
GROUP BY SUPPLIER_ID
HAVING SUM(STOCK) > 200;


-- Q32. Find customers who have placed more than 3 orders.
SELECT CUSTOMER_ID, COUNT(*) AS ORDER_COUNT
FROM ORDERS
GROUP BY CUSTOMER_ID
HAVING COUNT(*) > 3;


-- Q33. Find employees who have handled more than 5 orders.
SELECT EMP_ID, COUNT(*) AS ORDER_COUNT
FROM ORDERS
GROUP BY EMP_ID
HAVING COUNT(*) > 5;


-- Q34. Find customers whose total order amount is greater than 20000.
SELECT CUSTOMER_ID, SUM(AMOUNT) AS TOTAL_AMOUNT
FROM ORDERS
GROUP BY CUSTOMER_ID
HAVING SUM(AMOUNT) > 20000;


-- Q35. Find customers whose average order amount is greater than 5000.
SELECT CUSTOMER_ID, AVG(AMOUNT) AS AVG_AMOUNT
FROM ORDERS
GROUP BY CUSTOMER_ID
HAVING AVG(AMOUNT) > 5000;


-- Q36. Find employees whose total handled order amount is greater than 50000.
SELECT EMP_ID, SUM(AMOUNT) AS TOTAL_AMOUNT
FROM ORDERS
GROUP BY EMP_ID
HAVING SUM(AMOUNT) > 50000;


-- Q37. Find order statuses having more than 10 orders.
SELECT STATUS, COUNT(*) AS ORDER_COUNT
FROM ORDERS
GROUP BY STATUS
HAVING COUNT(*) > 10;


-- Q38. Find order dates having more than 5 orders.
SELECT ORDER_DATE, COUNT(*) AS ORDER_COUNT
FROM ORDERS
GROUP BY ORDER_DATE
HAVING COUNT(*) > 5;


-- Q39. Find customers whose maximum order amount is greater than 10000.
SELECT CUSTOMER_ID, MAX(AMOUNT) AS MAX_AMOUNT
FROM ORDERS
GROUP BY CUSTOMER_ID
HAVING MAX(AMOUNT) > 10000;


-- Q40. Find customers whose minimum order amount is greater than 1000.
SELECT CUSTOMER_ID, MIN(AMOUNT) AS MIN_AMOUNT
FROM ORDERS
GROUP BY CUSTOMER_ID
HAVING MIN(AMOUNT) > 1000;



-- ============================================================
-- SECTION 3: GROUP BY + HAVING WITH MULTIPLE CONDITIONS
-- ============================================================

-- Q41. Find customers with more than 3 orders and total amount above 20000.
SELECT CUSTOMER_ID,
       COUNT(*) AS ORDER_COUNT,
       SUM(AMOUNT) AS TOTAL_AMOUNT
FROM ORDERS
GROUP BY CUSTOMER_ID
HAVING COUNT(*) > 3
AND SUM(AMOUNT) > 20000;


-- Q42. Find customers with at least 5 orders and average order amount above 3000.
SELECT CUSTOMER_ID,
       COUNT(*) AS ORDER_COUNT,
       AVG(AMOUNT) AS AVG_AMOUNT
FROM ORDERS
GROUP BY CUSTOMER_ID
HAVING COUNT(*) >= 5
AND AVG(AMOUNT) > 3000;


-- Q43. Find employees handling more than 5 orders with total amount above 50000.
SELECT EMP_ID,
       COUNT(*) AS ORDER_COUNT,
       SUM(AMOUNT) AS TOTAL_AMOUNT
FROM ORDERS
GROUP BY EMP_ID
HAVING COUNT(*) > 5
AND SUM(AMOUNT) > 50000;


-- Q44. Find categories having more than 5 products and total stock above 100.
SELECT CATEGORY_ID,
       COUNT(*) AS PRODUCT_COUNT,
       SUM(STOCK) AS TOTAL_STOCK
FROM PRODUCTS
GROUP BY CATEGORY_ID
HAVING COUNT(*) > 5
AND SUM(STOCK) > 100;


-- Q45. Find suppliers having more than 3 products and average price above 1000.
SELECT SUPPLIER_ID,
       COUNT(*) AS PRODUCT_COUNT,
       AVG(PRICE) AS AVG_PRICE
FROM PRODUCTS
GROUP BY SUPPLIER_ID
HAVING COUNT(*) > 3
AND AVG(PRICE) > 1000;


-- Q46. Find designations having more than 2 employees and average salary above 30000.
SELECT DESIGNATION,
       COUNT(*) AS EMPLOYEE_COUNT,
       AVG(SALARY) AS AVG_SALARY
FROM EMPLOYEES
GROUP BY DESIGNATION
HAVING COUNT(*) > 2
AND AVG(SALARY) > 30000;


-- Q47. Find cities having more than 3 customers.
SELECT CITY, COUNT(*) AS CUSTOMER_COUNT
FROM CUSTOMERS
GROUP BY CITY
HAVING COUNT(*) > 3;


-- Q48. Find customers having more than 2 orders and maximum order above 10000.
SELECT CUSTOMER_ID,
       COUNT(*) AS ORDER_COUNT,
       MAX(AMOUNT) AS MAX_AMOUNT
FROM ORDERS
GROUP BY CUSTOMER_ID
HAVING COUNT(*) > 2
AND MAX(AMOUNT) > 10000;


-- Q49. Find customers having more than 3 orders and minimum order above 2000.
SELECT CUSTOMER_ID,
       COUNT(*) AS ORDER_COUNT,
       MIN(AMOUNT) AS MIN_AMOUNT
FROM ORDERS
GROUP BY CUSTOMER_ID
HAVING COUNT(*) > 3
AND MIN(AMOUNT) > 2000;


-- Q50. Find suppliers having more than 5 products and total stock above 300.
SELECT SUPPLIER_ID,
       COUNT(*) AS PRODUCT_COUNT,
       SUM(STOCK) AS TOTAL_STOCK
FROM PRODUCTS
GROUP BY SUPPLIER_ID
HAVING COUNT(*) > 5
AND SUM(STOCK) > 300;



-- ============================================================
-- SECTION 4: GROUP BY MULTIPLE COLUMNS
-- ============================================================

-- Q51. Count customers by city and state.
SELECT CITY, STATE, COUNT(*) AS CUSTOMER_COUNT
FROM CUSTOMERS
GROUP BY CITY, STATE;


-- Q52. Count employees by designation and department.
SELECT DESIGNATION, DEPARTMENT, COUNT(*) AS EMPLOYEE_COUNT
FROM EMPLOYEES
GROUP BY DESIGNATION, DEPARTMENT;


-- Q53. Find average salary by department and designation.
SELECT DEPARTMENT, DESIGNATION, AVG(SALARY) AS AVG_SALARY
FROM EMPLOYEES
GROUP BY DEPARTMENT, DESIGNATION;


-- Q54. Find total salary by department and designation.
SELECT DEPARTMENT, DESIGNATION, SUM(SALARY) AS TOTAL_SALARY
FROM EMPLOYEES
GROUP BY DEPARTMENT, DESIGNATION;


-- Q55. Find product count by category and supplier.
SELECT CATEGORY_ID, SUPPLIER_ID, COUNT(*) AS PRODUCT_COUNT
FROM PRODUCTS
GROUP BY CATEGORY_ID, SUPPLIER_ID;


-- Q56. Find total stock by category and supplier.
SELECT CATEGORY_ID, SUPPLIER_ID, SUM(STOCK) AS TOTAL_STOCK
FROM PRODUCTS
GROUP BY CATEGORY_ID, SUPPLIER_ID;


-- Q57. Find average price by category and supplier.
SELECT CATEGORY_ID, SUPPLIER_ID, AVG(PRICE) AS AVG_PRICE
FROM PRODUCTS
GROUP BY CATEGORY_ID, SUPPLIER_ID;


-- Q58. Count orders by customer and employee.
SELECT CUSTOMER_ID, EMP_ID, COUNT(*) AS ORDER_COUNT
FROM ORDERS
GROUP BY CUSTOMER_ID, EMP_ID;


-- Q59. Find total order amount by customer and employee.
SELECT CUSTOMER_ID, EMP_ID, SUM(AMOUNT) AS TOTAL_AMOUNT
FROM ORDERS
GROUP BY CUSTOMER_ID, EMP_ID;


-- Q60. Find average order amount by customer and employee.
SELECT CUSTOMER_ID, EMP_ID, AVG(AMOUNT) AS AVG_AMOUNT
FROM ORDERS
GROUP BY CUSTOMER_ID, EMP_ID;



-- ============================================================
-- SECTION 5: MULTIPLE GROUP BY + HAVING
-- ============================================================

-- Q61. Find city-state combinations having more than 2 customers.
SELECT CITY, STATE, COUNT(*) AS CUSTOMER_COUNT
FROM CUSTOMERS
GROUP BY CITY, STATE
HAVING COUNT(*) > 2;


-- Q62. Find departments having more than 3 employees in each designation.
SELECT DEPARTMENT, DESIGNATION, COUNT(*) AS EMPLOYEE_COUNT
FROM EMPLOYEES
GROUP BY DEPARTMENT, DESIGNATION
HAVING COUNT(*) > 3;


-- Q63. Find department-designation combinations with average salary above 40000.
SELECT DEPARTMENT, DESIGNATION, AVG(SALARY) AS AVG_SALARY
FROM EMPLOYEES
GROUP BY DEPARTMENT, DESIGNATION
HAVING AVG(SALARY) > 40000;


-- Q64. Find category-supplier combinations having more than 2 products.
SELECT CATEGORY_ID, SUPPLIER_ID, COUNT(*) AS PRODUCT_COUNT
FROM PRODUCTS
GROUP BY CATEGORY_ID, SUPPLIER_ID
HAVING COUNT(*) > 2;


-- Q65. Find category-supplier combinations whose total stock exceeds 100.
SELECT CATEGORY_ID, SUPPLIER_ID, SUM(STOCK) AS TOTAL_STOCK
FROM PRODUCTS
GROUP BY CATEGORY_ID, SUPPLIER_ID
HAVING SUM(STOCK) > 100;


-- Q66. Find category-supplier combinations with average price above 2000.
SELECT CATEGORY_ID, SUPPLIER_ID, AVG(PRICE) AS AVG_PRICE
FROM PRODUCTS
GROUP BY CATEGORY_ID, SUPPLIER_ID
HAVING AVG(PRICE) > 2000;


-- Q67. Find customer-employee combinations having more than 2 orders.
SELECT CUSTOMER_ID, EMP_ID, COUNT(*) AS ORDER_COUNT
FROM ORDERS
GROUP BY CUSTOMER_ID, EMP_ID
HAVING COUNT(*) > 2;


-- Q68. Find customer-employee combinations with total amount above 30000.
SELECT CUSTOMER_ID, EMP_ID, SUM(AMOUNT) AS TOTAL_AMOUNT
FROM ORDERS
GROUP BY CUSTOMER_ID, EMP_ID
HAVING SUM(AMOUNT) > 30000;


-- Q69. Find customer-employee combinations with average order amount above 5000.
SELECT CUSTOMER_ID, EMP_ID, AVG(AMOUNT) AS AVG_AMOUNT
FROM ORDERS
GROUP BY CUSTOMER_ID, EMP_ID
HAVING AVG(AMOUNT) > 5000;


-- Q70. Find order dates and statuses having more than 3 orders.
SELECT ORDER_DATE, STATUS, COUNT(*) AS ORDER_COUNT
FROM ORDERS
GROUP BY ORDER_DATE, STATUS
HAVING COUNT(*) > 3;



-- ============================================================
-- SECTION 6: AGGREGATE FUNCTION COMBINATIONS
-- ============================================================

-- Q71. Find customers with more than 3 orders,
-- total amount above 20000 and average amount above 4000.
SELECT CUSTOMER_ID,
       COUNT(*) AS ORDER_COUNT,
       SUM(AMOUNT) AS TOTAL_AMOUNT,
       AVG(AMOUNT) AS AVG_AMOUNT
FROM ORDERS
GROUP BY CUSTOMER_ID
HAVING COUNT(*) > 3
AND SUM(AMOUNT) > 20000
AND AVG(AMOUNT) > 4000;


-- Q72. Find employees with more than 5 orders,
-- total amount above 50000 and average amount above 5000.
SELECT EMP_ID,
       COUNT(*) AS ORDER_COUNT,
       SUM(AMOUNT) AS TOTAL_AMOUNT,
       AVG(AMOUNT) AS AVG_AMOUNT
FROM ORDERS
GROUP BY EMP_ID
HAVING COUNT(*) > 5
AND SUM(AMOUNT) > 50000
AND AVG(AMOUNT) > 5000;


-- Q73. Find categories with more than 5 products,
-- total stock above 200 and average price above 1000.
SELECT CATEGORY_ID,
       COUNT(*) AS PRODUCT_COUNT,
       SUM(STOCK) AS TOTAL_STOCK,
       AVG(PRICE) AS AVG_PRICE
FROM PRODUCTS
GROUP BY CATEGORY_ID
HAVING COUNT(*) > 5
AND SUM(STOCK) > 200
AND AVG(PRICE) > 1000;


-- Q74. Find suppliers with more than 4 products,
-- total stock above 200 and maximum price above 5000.
SELECT SUPPLIER_ID,
       COUNT(*) AS PRODUCT_COUNT,
       SUM(STOCK) AS TOTAL_STOCK,
       MAX(PRICE) AS MAX_PRICE
FROM PRODUCTS
GROUP BY SUPPLIER_ID
HAVING COUNT(*) > 4
AND SUM(STOCK) > 200
AND MAX(PRICE) > 5000;


-- Q75. Find designations with more than 3 employees,
-- total salary above 150000 and average salary above 40000.
SELECT DESIGNATION,
       COUNT(*) AS EMPLOYEE_COUNT,
       SUM(SALARY) AS TOTAL_SALARY,
       AVG(SALARY) AS AVG_SALARY
FROM EMPLOYEES
GROUP BY DESIGNATION
HAVING COUNT(*) > 3
AND SUM(SALARY) > 150000
AND AVG(SALARY) > 40000;


-- Q76. Find customers having between 3 and 10 orders.
SELECT CUSTOMER_ID, COUNT(*) AS ORDER_COUNT
FROM ORDERS
GROUP BY CUSTOMER_ID
HAVING COUNT(*) BETWEEN 3 AND 10;


-- Q77. Find customers whose total order amount is between 10000 and 50000.
SELECT CUSTOMER_ID, SUM(AMOUNT) AS TOTAL_AMOUNT
FROM ORDERS
GROUP BY CUSTOMER_ID
HAVING SUM(AMOUNT) BETWEEN 10000 AND 50000;


-- Q78. Find employees handling between 5 and 15 orders.
SELECT EMP_ID, COUNT(*) AS ORDER_COUNT
FROM ORDERS
GROUP BY EMP_ID
HAVING COUNT(*) BETWEEN 5 AND 15;


-- Q79. Find categories having product count between 3 and 10.
SELECT CATEGORY_ID, COUNT(*) AS PRODUCT_COUNT
FROM PRODUCTS
GROUP BY CATEGORY_ID
HAVING COUNT(*) BETWEEN 3 AND 10;


-- Q80. Find suppliers whose total stock is between 100 and 500.
SELECT SUPPLIER_ID, SUM(STOCK) AS TOTAL_STOCK
FROM PRODUCTS
GROUP BY SUPPLIER_ID
HAVING SUM(STOCK) BETWEEN 100 AND 500;



-- ============================================================
-- SECTION 7: PROJECT-BASED GROUP BY + HAVING
-- ============================================================

-- Q81. Find customers having more than 3 orders and total sales above 20000.
SELECT CUSTOMER_ID,
       COUNT(ORDER_ID) AS NO_OF_ORDERS,
       SUM(AMOUNT) AS TOTAL_SALES
FROM COMPLETE_INVENTORY_SALES_FULL_VIEW
GROUP BY CUSTOMER_ID
HAVING COUNT(ORDER_ID) > 3
AND SUM(AMOUNT) > 20000;


-- Q82. Find customers having more than 5 orders.
SELECT CUSTOMER_ID,
       COUNT(ORDER_ID) AS NO_OF_ORDERS
FROM COMPLETE_INVENTORY_SALES_FULL_VIEW
GROUP BY CUSTOMER_ID
HAVING COUNT(ORDER_ID) > 5;


-- Q83. Find customers whose total sales exceed 50000.
SELECT CUSTOMER_ID,
       SUM(AMOUNT) AS TOTAL_SALES
FROM COMPLETE_INVENTORY_SALES_FULL_VIEW
GROUP BY CUSTOMER_ID
HAVING SUM(AMOUNT) > 50000;


-- Q84. Find customers whose average order amount exceeds 5000.
SELECT CUSTOMER_ID,
       AVG(AMOUNT) AS AVG_ORDER_AMOUNT
FROM COMPLETE_INVENTORY_SALES_FULL_VIEW
GROUP BY CUSTOMER_ID
HAVING AVG(AMOUNT) > 5000;


-- Q85. Find employees who handled more than 5 orders.
SELECT EMP_ID,
       COUNT(ORDER_ID) AS TOTAL_ORDERS
FROM COMPLETE_INVENTORY_SALES_FULL_VIEW
GROUP BY EMP_ID
HAVING COUNT(ORDER_ID) > 5;


-- Q86. Find employees whose total sales exceed 100000.
SELECT EMP_ID,
       SUM(AMOUNT) AS TOTAL_SALES
FROM COMPLETE_INVENTORY_SALES_FULL_VIEW
GROUP BY EMP_ID
HAVING SUM(AMOUNT) > 100000;


-- Q87. Find products that appear in more than 3 sales records.
SELECT PRODUCT_ID,
       COUNT(ORDER_ID) AS SALES_COUNT
FROM COMPLETE_INVENTORY_SALES_FULL_VIEW
GROUP BY PRODUCT_ID
HAVING COUNT(ORDER_ID) > 3;


-- Q88. Find products whose total sold quantity exceeds 50.
SELECT PRODUCT_ID,
       SUM(QUANTITY) AS TOTAL_QUANTITY
FROM COMPLETE_INVENTORY_SALES_FULL_VIEW
GROUP BY PRODUCT_ID
HAVING SUM(QUANTITY) > 50;


-- Q89. Find products whose total sales value exceeds 50000.
SELECT PRODUCT_ID,
       SUM(AMOUNT) AS TOTAL_SALES
FROM COMPLETE_INVENTORY_SALES_FULL_VIEW
GROUP BY PRODUCT_ID
HAVING SUM(AMOUNT) > 50000;


-- Q90. Find categories having more than 10 sales records.
SELECT CATEGORY_ID,
       COUNT(ORDER_ID) AS SALES_COUNT
FROM COMPLETE_INVENTORY_SALES_FULL_VIEW
GROUP BY CATEGORY_ID
HAVING COUNT(ORDER_ID) > 10;



-- ============================================================
-- SECTION 8: ADVANCED GROUP BY + HAVING
-- ============================================================

-- Q91. Find categories whose total sales exceed 100000.
SELECT CATEGORY_ID,
       SUM(AMOUNT) AS TOTAL_SALES
FROM COMPLETE_INVENTORY_SALES_FULL_VIEW
GROUP BY CATEGORY_ID
HAVING SUM(AMOUNT) > 100000;


-- Q92. Find suppliers whose products generated total sales above 100000.
SELECT SUPPLIER_ID,
       SUM(AMOUNT) AS TOTAL_SALES
FROM COMPLETE_INVENTORY_SALES_FULL_VIEW
GROUP BY SUPPLIER_ID
HAVING SUM(AMOUNT) > 100000;


-- Q93. Find customers who purchased more than 10 total units.
SELECT CUSTOMER_ID,
       SUM(QUANTITY) AS TOTAL_QUANTITY
FROM COMPLETE_INVENTORY_SALES_FULL_VIEW
GROUP BY CUSTOMER_ID
HAVING SUM(QUANTITY) > 10;


-- Q94. Find customers who purchased more than 5 different orders
-- and total quantity exceeds 20.
SELECT CUSTOMER_ID,
       COUNT(DISTINCT ORDER_ID) AS ORDER_COUNT,
       SUM(QUANTITY) AS TOTAL_QUANTITY
FROM COMPLETE_INVENTORY_SALES_FULL_VIEW
GROUP BY CUSTOMER_ID
HAVING COUNT(DISTINCT ORDER_ID) > 5
AND SUM(QUANTITY) > 20;


-- Q95. Find customers whose total sales are greater than 30000
-- and average sales per order are greater than 5000.
SELECT CUSTOMER_ID,
       SUM(AMOUNT) AS TOTAL_SALES,
       AVG(AMOUNT) AS AVG_SALES
FROM COMPLETE_INVENTORY_SALES_FULL_VIEW
GROUP BY CUSTOMER_ID
HAVING SUM(AMOUNT) > 30000
AND AVG(AMOUNT) > 5000;


-- Q96. Find products having more than 5 orders and
-- total quantity sold greater than 100.
SELECT PRODUCT_ID,
       COUNT(DISTINCT ORDER_ID) AS ORDER_COUNT,
       SUM(QUANTITY) AS TOTAL_QUANTITY
FROM COMPLETE_INVENTORY_SALES_FULL_VIEW
GROUP BY PRODUCT_ID
HAVING COUNT(DISTINCT ORDER_ID) > 5
AND SUM(QUANTITY) > 100;


-- Q97. Find employees having more than 10 orders
-- and total sales greater than 200000.
SELECT EMP_ID,
       COUNT(DISTINCT ORDER_ID) AS ORDER_COUNT,
       SUM(AMOUNT) AS TOTAL_SALES
FROM COMPLETE_INVENTORY_SALES_FULL_VIEW
GROUP BY EMP_ID
HAVING COUNT(DISTINCT ORDER_ID) > 10
AND SUM(AMOUNT) > 200000;


-- Q98. Find categories having more than 20 orders
-- and total sales greater than 500000.
SELECT CATEGORY_ID,
       COUNT(DISTINCT ORDER_ID) AS ORDER_COUNT,
       SUM(AMOUNT) AS TOTAL_SALES
FROM COMPLETE_INVENTORY_SALES_FULL_VIEW
GROUP BY CATEGORY_ID
HAVING COUNT(DISTINCT ORDER_ID) > 20
AND SUM(AMOUNT) > 500000;


-- Q99. Find customers having more than 3 orders,
-- total quantity above 20 and total sales above 50000.
SELECT CUSTOMER_ID,
       COUNT(DISTINCT ORDER_ID) AS ORDER_COUNT,
       SUM(QUANTITY) AS TOTAL_QUANTITY,
       SUM(AMOUNT) AS TOTAL_SALES
FROM COMPLETE_INVENTORY_SALES_FULL_VIEW
GROUP BY CUSTOMER_ID
HAVING COUNT(DISTINCT ORDER_ID) > 3
AND SUM(QUANTITY) > 20
AND SUM(AMOUNT) > 50000;


-- Q100. Find customers having more than 5 orders,
-- total quantity above 30, total sales above 100000
-- and average order amount above 10000.
SELECT CUSTOMER_ID,
       COUNT(DISTINCT ORDER_ID) AS ORDER_COUNT,
       SUM(QUANTITY) AS TOTAL_QUANTITY,
       SUM(AMOUNT) AS TOTAL_SALES,
       AVG(AMOUNT) AS AVG_ORDER_AMOUNT
FROM COMPLETE_INVENTORY_SALES_FULL_VIEW
GROUP BY CUSTOMER_ID
HAVING COUNT(DISTINCT ORDER_ID) > 5
AND SUM(QUANTITY) > 30
AND SUM(AMOUNT) > 100000
AND AVG(AMOUNT) > 10000;

-- =====================================================
-- END OF GROUP BY, HAVING PRACTICE
-- =====================================================

SPOOL OFF