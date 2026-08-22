-- =====================================================
-- ORACLE SQL - ADVANCED SQL
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
-- SPOOL OUTPUT
-- =====================================================

SPOOL 'F:\Exploring Technologies\OrcaleSqlPlusExploring\Oracle_Inventory_Sales_Management_System\Queries\13_Advanced_SQL\13_ADVANCED_SQL_TEST_OUTPUT.txt'


-- =====================================================
-- ORACLE SQL 11g
-- ADVANCED SQL - COMPLETE TEST
-- =====================================================
-- Total Questions : 100
-- Difficulty      : Basic Advanced -> Intermediate -> Advanced
--
-- TOPICS COVERED:
--
-- 1. Single-row subqueries
-- 2. Multi-row subqueries
-- 3. IN / NOT IN
-- 4. ANY / ALL
-- 5. EXISTS / NOT EXISTS
-- 6. Correlated subqueries
-- 7. Scalar subqueries
-- 8. Inline views
-- 9. Subqueries with GROUP BY
-- 10. Subqueries with HAVING
-- 11. JOIN + Subquery
-- 12. CASE + Subquery
-- 13. Top-N + Subquery
-- 14. Anti-joins
-- 15. Semi-joins
-- 16. UNION
-- 17. UNION ALL
-- 18. INTERSECT
-- 19. MINUS
-- 20. INSERT SELECT
-- 21. UPDATE with subquery
-- 22. DELETE with subquery
-- 23. Advanced reporting queries
-- =====================================================


-- =====================================================
-- IMPORTANT RULES
-- =====================================================

-- RULE 01: A subquery is a query written inside another SQL statement.

-- RULE 02: A subquery can be placed inside SELECT, FROM, WHERE, or HAVING.

-- RULE 03: A single-row subquery returns exactly one value.

-- RULE 04: Multi-row subqueries can return multiple values.

-- RULE 05: Use =, >, <, >=, <= with single-row subqueries.

-- RULE 06: Use IN when a subquery returns multiple values.

-- RULE 07: ANY compares a value with at least one value returned by the subquery.

-- RULE 08: ALL compares a value with every value returned by the subquery.

-- RULE 09: EXISTS checks whether the subquery returns at least one row.

-- RULE 10: NOT EXISTS checks whether the subquery returns no rows.

-- RULE 11: A correlated subquery references a column from the outer query.

-- RULE 12: A scalar subquery must return only one row and one column.

-- RULE 13: An inline view is a subquery used in the FROM clause.

-- RULE 14: GROUP BY can be used inside a subquery.

-- RULE 15: HAVING can filter grouped results inside a subquery.

-- RULE 16: UNION combines results and removes duplicate rows.

-- RULE 17: UNION ALL combines results and keeps duplicate rows.

-- RULE 18: INTERSECT returns rows common to both queries.

-- RULE 19: MINUS returns rows from the first query that are absent from the second.

-- RULE 20: Set operators require compatible numbers and data types of columns.

-- RULE 21: ORDER BY normally appears at the end of the complete set operation.

-- RULE 22: NOT IN can behave unexpectedly when NULL exists in the subquery.

-- RULE 23: NOT EXISTS is generally safer than NOT IN when NULL values are possible.

-- RULE 24: An UPDATE can use a subquery to determine which rows to modify.

-- RULE 25: A DELETE can use a subquery to determine which rows to remove.

-- RULE 26: INSERT INTO ... SELECT can copy/query data into another table.

-- RULE 27: An inline view can be used to calculate aggregates before applying another condition.

-- RULE 28: A subquery can be combined with CASE expressions.

-- RULE 29: A subquery can be combined with joins.

-- RULE 30: Advanced SQL usually combines multiple SQL concepts in one statement.


-- =====================================================
-- BASIC SUBQUERY SYNTAX
-- =====================================================

-- SINGLE-ROW SUBQUERY

-- SELECT column
-- FROM table
-- WHERE column = (SELECT column FROM table WHERE condition);


-- MULTI-ROW SUBQUERY

-- SELECT column
-- FROM table
-- WHERE column IN (SELECT column FROM table WHERE condition);


-- EXISTS

-- SELECT column
-- FROM table t
-- WHERE EXISTS
--       (SELECT 1
--        FROM another_table a
--        WHERE a.id = t.id);


-- CORRELATED SUBQUERY

-- SELECT column
-- FROM table t
-- WHERE column >
--       (SELECT AVG(column)
--        FROM table t2
--        WHERE t2.group_column = t.group_column);


-- INLINE VIEW

-- SELECT *
-- FROM
-- (
--     SELECT column, SUM(value)
--     FROM table
--     GROUP BY column
-- );


-- UNION

-- SELECT column FROM table1
-- UNION
-- SELECT column FROM table2;


-- UNION ALL

-- SELECT column FROM table1
-- UNION ALL
-- SELECT column FROM table2;


-- INTERSECT

-- SELECT column FROM table1
-- INTERSECT
-- SELECT column FROM table2;


-- MINUS

-- SELECT column FROM table1
-- MINUS
-- SELECT column FROM table2;



-- =====================================================
-- LEVEL 1
-- SINGLE-ROW SUBQUERIES
-- Q01-Q15
-- =====================================================


-- Q01. Find the product with the highest price.

SELECT PRODUCT_NAME, PRICE
FROM PRODUCTS
WHERE PRICE = (SELECT MAX(PRICE) FROM PRODUCTS);


-- Q02. Find the product with the lowest price.

SELECT PRODUCT_NAME, PRICE
FROM PRODUCTS
WHERE PRICE = (SELECT MIN(PRICE) FROM PRODUCTS);


-- Q03. Find employees earning the highest salary.

SELECT EMP_NAME, SALARY
FROM EMPLOYEES
WHERE SALARY = (SELECT MAX(SALARY) FROM EMPLOYEES);


-- Q04. Find employees earning the lowest salary.

SELECT EMP_NAME, SALARY
FROM EMPLOYEES
WHERE SALARY = (SELECT MIN(SALARY) FROM EMPLOYEES);


-- Q05. Find products whose price is greater than the average product price.

SELECT PRODUCT_NAME, PRICE
FROM PRODUCTS
WHERE PRICE > (SELECT AVG(PRICE) FROM PRODUCTS);


-- Q06. Find products whose price is below the average product price.

SELECT PRODUCT_NAME, PRICE
FROM PRODUCTS
WHERE PRICE < (SELECT AVG(PRICE) FROM PRODUCTS);


-- Q07. Find employees whose salary is greater than the average salary.

SELECT EMP_NAME, SALARY
FROM EMPLOYEES
WHERE SALARY > (SELECT AVG(SALARY) FROM EMPLOYEES);


-- Q08. Find employees whose salary is below the average salary.

SELECT EMP_NAME, SALARY
FROM EMPLOYEES
WHERE SALARY < (SELECT AVG(SALARY) FROM EMPLOYEES);


-- Q09. Find products having the same price as the most expensive product.

SELECT PRODUCT_NAME, PRICE
FROM PRODUCTS
WHERE PRICE = (SELECT MAX(PRICE) FROM PRODUCTS);


-- Q10. Find the second highest salary using a subquery.

SELECT MAX(SALARY) AS SECOND_HIGHEST_SALARY
FROM EMPLOYEES
WHERE SALARY < (SELECT MAX(SALARY) FROM EMPLOYEES);


-- Q11. Find the second highest product price.

SELECT MAX(PRICE) AS SECOND_HIGHEST_PRICE
FROM PRODUCTS
WHERE PRICE < (SELECT MAX(PRICE) FROM PRODUCTS);


-- Q12. Find employees earning more than employee with EMP_ID 1.

SELECT EMP_NAME, SALARY
FROM EMPLOYEES
WHERE SALARY >
      (SELECT SALARY
       FROM EMPLOYEES
       WHERE EMP_ID = 1);


-- Q13. Find products costing more than product with PRODUCT_ID 1.

SELECT PRODUCT_NAME, PRICE
FROM PRODUCTS
WHERE PRICE >
      (SELECT PRICE
       FROM PRODUCTS
       WHERE PRODUCT_ID = 1);


-- Q14. Find customers who placed more orders than the average number of orders per customer.

SELECT CUSTOMER_NAME
FROM CUSTOMERS
WHERE CUSTOMER_ID IN
(
    SELECT CUSTOMER_ID
    FROM ORDERS
    GROUP BY CUSTOMER_ID
    HAVING COUNT(*) >
    (
        SELECT AVG(NO_OF_ORDERS)
        FROM
        (
            SELECT CUSTOMER_ID, COUNT(*) AS NO_OF_ORDERS
            FROM ORDERS
            GROUP BY CUSTOMER_ID
        )
    )
);


-- Q15. Find the category having the highest number of products.

SELECT CATEGORY_ID, COUNT(*) AS NO_OF_PRODUCTS
FROM PRODUCTS
GROUP BY CATEGORY_ID
HAVING COUNT(*) =
(
    SELECT MAX(PRODUCT_COUNT)
    FROM
    (
        SELECT CATEGORY_ID, COUNT(*) AS PRODUCT_COUNT
        FROM PRODUCTS
        GROUP BY CATEGORY_ID
    )
);



-- =====================================================
-- LEVEL 2
-- IN / NOT IN / ANY / ALL
-- Q16-Q25
-- =====================================================


-- Q16. Find products belonging to categories that contain at least one product.

SELECT PRODUCT_NAME, CATEGORY_ID
FROM PRODUCTS
WHERE CATEGORY_ID IN
(
    SELECT CATEGORY_ID
    FROM PRODUCTS
    WHERE CATEGORY_ID IS NOT NULL
);


-- Q17. Find products supplied by suppliers who have products.

SELECT PRODUCT_NAME, SUPPLIER_ID
FROM PRODUCTS
WHERE SUPPLIER_ID IN
(
    SELECT SUPPLIER_ID
    FROM PRODUCTS
    WHERE SUPPLIER_ID IS NOT NULL
);


-- Q18. Find customers who have placed at least one order.

SELECT CUSTOMER_NAME
FROM CUSTOMERS
WHERE CUSTOMER_ID IN
(
    SELECT CUSTOMER_ID
    FROM ORDERS
    WHERE CUSTOMER_ID IS NOT NULL
);


-- Q19. Find customers who have never placed an order.

SELECT CUSTOMER_NAME
FROM CUSTOMERS
WHERE CUSTOMER_ID NOT IN
(
    SELECT CUSTOMER_ID
    FROM ORDERS
    WHERE CUSTOMER_ID IS NOT NULL
);


-- Q20. Find products that have never been sold.

SELECT PRODUCT_NAME
FROM PRODUCTS
WHERE PRODUCT_ID NOT IN
(
    SELECT PRODUCT_ID
    FROM ORDER_ITEMS
    WHERE PRODUCT_ID IS NOT NULL
);


-- Q21. Find products that have been purchased.

SELECT PRODUCT_NAME
FROM PRODUCTS
WHERE PRODUCT_ID IN
(
    SELECT PRODUCT_ID
    FROM PURCHASES
    WHERE PRODUCT_ID IS NOT NULL
);


-- Q22. Find employees whose salary is greater than ANY employee salary.

SELECT EMP_NAME, SALARY
FROM EMPLOYEES
WHERE SALARY > ANY
(
    SELECT SALARY
    FROM EMPLOYEES
);


-- Q23. Find employees whose salary is greater than ALL salaries of employees with designation 'MANAGER'.

SELECT EMP_NAME, SALARY
FROM EMPLOYEES
WHERE SALARY > ALL
(
    SELECT SALARY
    FROM EMPLOYEES
    WHERE DESIGNATION = 'MANAGER'
);


-- Q24. Find products whose price is greater than ALL products with stock below 10.

SELECT PRODUCT_NAME, PRICE
FROM PRODUCTS
WHERE PRICE > ALL
(
    SELECT PRICE
    FROM PRODUCTS
    WHERE STOCK < 10
);


-- Q25. Find products whose price is less than ANY product supplied by supplier 1.

SELECT PRODUCT_NAME, PRICE
FROM PRODUCTS
WHERE PRICE < ANY
(
    SELECT PRICE
    FROM PRODUCTS
    WHERE SUPPLIER_ID = 1
);



-- =====================================================
-- LEVEL 3
-- EXISTS / NOT EXISTS
-- Q26-Q35
-- =====================================================


-- Q26. Find customers who have at least one order.

SELECT C.CUSTOMER_NAME
FROM CUSTOMERS C
WHERE EXISTS
(
    SELECT 1
    FROM ORDERS O
    WHERE O.CUSTOMER_ID = C.CUSTOMER_ID
);


-- Q27. Find customers who have no orders.

SELECT C.CUSTOMER_NAME
FROM CUSTOMERS C
WHERE NOT EXISTS
(
    SELECT 1
    FROM ORDERS O
    WHERE O.CUSTOMER_ID = C.CUSTOMER_ID
);


-- Q28. Find products that have been sold.

SELECT P.PRODUCT_NAME
FROM PRODUCTS P
WHERE EXISTS
(
    SELECT 1
    FROM ORDER_ITEMS OI
    WHERE OI.PRODUCT_ID = P.PRODUCT_ID
);


-- Q29. Find products that have never been sold.

SELECT P.PRODUCT_NAME
FROM PRODUCTS P
WHERE NOT EXISTS
(
    SELECT 1
    FROM ORDER_ITEMS OI
    WHERE OI.PRODUCT_ID = P.PRODUCT_ID
);


-- Q30. Find suppliers having at least one product.

SELECT S.SUPPLIER_NAME
FROM SUPPLIERS S
WHERE EXISTS
(
    SELECT 1
    FROM PRODUCTS P
    WHERE P.SUPPLIER_ID = S.SUPPLIER_ID
);


-- Q31. Find suppliers having no products.

SELECT S.SUPPLIER_NAME
FROM SUPPLIERS S
WHERE NOT EXISTS
(
    SELECT 1
    FROM PRODUCTS P
    WHERE P.SUPPLIER_ID = S.SUPPLIER_ID
);


-- Q32. Find orders having at least one payment.

SELECT O.ORDER_ID
FROM ORDERS O
WHERE EXISTS
(
    SELECT 1
    FROM PAYMENTS P
    WHERE P.ORDER_ID = O.ORDER_ID
);


-- Q33. Find orders having no payment.

SELECT O.ORDER_ID
FROM ORDERS O
WHERE NOT EXISTS
(
    SELECT 1
    FROM PAYMENTS P
    WHERE P.ORDER_ID = O.ORDER_ID
);


-- Q34. Find products that have both sales and purchases.

SELECT P.PRODUCT_NAME
FROM PRODUCTS P
WHERE EXISTS
(
    SELECT 1
    FROM ORDER_ITEMS OI
    WHERE OI.PRODUCT_ID = P.PRODUCT_ID
)
AND EXISTS
(
    SELECT 1
    FROM PURCHASES PU
    WHERE PU.PRODUCT_ID = P.PRODUCT_ID
);


-- Q35. Find customers who have placed an order and made a payment.

SELECT C.CUSTOMER_NAME
FROM CUSTOMERS C
WHERE EXISTS
(
    SELECT 1
    FROM ORDERS O
    JOIN PAYMENTS P
    ON O.ORDER_ID = P.ORDER_ID
    WHERE O.CUSTOMER_ID = C.CUSTOMER_ID
);



-- =====================================================
-- LEVEL 4
-- CORRELATED SUBQUERIES
-- Q36-Q45
-- =====================================================


-- Q36. Find employees earning more than the average salary of their designation.

SELECT E1.EMP_NAME, E1.DESIGNATION, E1.SALARY
FROM EMPLOYEES E1
WHERE E1.SALARY >
(
    SELECT AVG(E2.SALARY)
    FROM EMPLOYEES E2
    WHERE E2.DESIGNATION = E1.DESIGNATION
);


-- Q37. Find products priced above the average price of their category.

SELECT P1.PRODUCT_NAME, P1.CATEGORY_ID, P1.PRICE
FROM PRODUCTS P1
WHERE P1.PRICE >
(
    SELECT AVG(P2.PRICE)
    FROM PRODUCTS P2
    WHERE P2.CATEGORY_ID = P1.CATEGORY_ID
);


-- Q38. Find products priced below the average price of their category.

SELECT P1.PRODUCT_NAME, P1.CATEGORY_ID, P1.PRICE
FROM PRODUCTS P1
WHERE P1.PRICE <
(
    SELECT AVG(P2.PRICE)
    FROM PRODUCTS P2
    WHERE P2.CATEGORY_ID = P1.CATEGORY_ID
);


-- Q39. Find the highest-paid employee in each designation.

SELECT E1.EMP_NAME, E1.DESIGNATION, E1.SALARY
FROM EMPLOYEES E1
WHERE E1.SALARY =
(
    SELECT MAX(E2.SALARY)
    FROM EMPLOYEES E2
    WHERE E2.DESIGNATION = E1.DESIGNATION
);


-- Q40. Find the lowest-priced product in each category.

SELECT P1.PRODUCT_NAME, P1.CATEGORY_ID, P1.PRICE
FROM PRODUCTS P1
WHERE P1.PRICE =
(
    SELECT MIN(P2.PRICE)
    FROM PRODUCTS P2
    WHERE P2.CATEGORY_ID = P1.CATEGORY_ID
);


-- Q41. Find customers who have placed more orders than another customer.

SELECT DISTINCT C1.CUSTOMER_NAME
FROM CUSTOMERS C1
WHERE
(
    SELECT COUNT(*)
    FROM ORDERS O1
    WHERE O1.CUSTOMER_ID = C1.CUSTOMER_ID
)
>
(
    SELECT COUNT(*)
    FROM ORDERS O2
    WHERE O2.CUSTOMER_ID =
    (
        SELECT MIN(C2.CUSTOMER_ID)
        FROM CUSTOMERS C2
    )
);


-- Q42. Find products whose stock is greater than the average stock of their category.

SELECT P1.PRODUCT_NAME, P1.STOCK, P1.CATEGORY_ID
FROM PRODUCTS P1
WHERE P1.STOCK >
(
    SELECT AVG(P2.STOCK)
    FROM PRODUCTS P2
    WHERE P2.CATEGORY_ID = P1.CATEGORY_ID
);


-- Q43. Find employees who are the highest paid within their designation.

SELECT E1.EMP_NAME, E1.DESIGNATION, E1.SALARY
FROM EMPLOYEES E1
WHERE NOT EXISTS
(
    SELECT 1
    FROM EMPLOYEES E2
    WHERE E2.DESIGNATION = E1.DESIGNATION
    AND E2.SALARY > E1.SALARY
);


-- Q44. Find products that have the maximum price within their category.

SELECT P1.PRODUCT_NAME, P1.PRICE, P1.CATEGORY_ID
FROM PRODUCTS P1
WHERE NOT EXISTS
(
    SELECT 1
    FROM PRODUCTS P2
    WHERE P2.CATEGORY_ID = P1.CATEGORY_ID
    AND P2.PRICE > P1.PRICE
);


-- Q45. Find customers who have at least two orders.

SELECT C.CUSTOMER_NAME
FROM CUSTOMERS C
WHERE
(
    SELECT COUNT(*)
    FROM ORDERS O
    WHERE O.CUSTOMER_ID = C.CUSTOMER_ID
) >= 2;



-- =====================================================
-- LEVEL 5
-- SCALAR SUBQUERIES
-- Q46-Q55
-- =====================================================


-- Q46. Display every product with the overall average product price.

SELECT PRODUCT_NAME,
       PRICE,
       (SELECT AVG(PRICE) FROM PRODUCTS) AS AVG_PRICE
FROM PRODUCTS;


-- Q47. Display every employee with the overall average salary.

SELECT EMP_NAME,
       SALARY,
       (SELECT AVG(SALARY) FROM EMPLOYEES) AS AVG_SALARY
FROM EMPLOYEES;


-- Q48. Display every product and the difference between its price and average price.

SELECT PRODUCT_NAME,
       PRICE,
       PRICE - (SELECT AVG(PRICE) FROM PRODUCTS) AS PRICE_DIFFERENCE
FROM PRODUCTS;


-- Q49. Display every employee and the difference between salary and average salary.

SELECT EMP_NAME,
       SALARY,
       SALARY - (SELECT AVG(SALARY) FROM EMPLOYEES) AS SALARY_DIFFERENCE
FROM EMPLOYEES;


-- Q50. Display each product and its percentage of total product stock.

SELECT PRODUCT_NAME,
       STOCK,
       ROUND(
           STOCK * 100 /
           (SELECT SUM(STOCK) FROM PRODUCTS),
           2
       ) AS STOCK_PERCENTAGE
FROM PRODUCTS;


-- Q51. Display each product and its percentage of total sales quantity.

SELECT P.PRODUCT_NAME,
       NVL(
           (SELECT SUM(OI.QUANTITY)
            FROM ORDER_ITEMS OI
            WHERE OI.PRODUCT_ID = P.PRODUCT_ID),
           0
       ) AS TOTAL_SOLD
FROM PRODUCTS P;


-- Q52. Display each employee with the maximum salary in the company.

SELECT EMP_NAME,
       SALARY,
       (SELECT MAX(SALARY) FROM EMPLOYEES) AS MAX_SALARY
FROM EMPLOYEES;


-- Q53. Display each product with the maximum product price.

SELECT PRODUCT_NAME,
       PRICE,
       (SELECT MAX(PRICE) FROM PRODUCTS) AS MAX_PRICE
FROM PRODUCTS;


-- Q54. Display each customer with their total number of orders.

SELECT C.CUSTOMER_NAME,
       (
           SELECT COUNT(*)
           FROM ORDERS O
           WHERE O.CUSTOMER_ID = C.CUSTOMER_ID
       ) AS NO_OF_ORDERS
FROM CUSTOMERS C;


-- Q55. Display each product with total quantity purchased.

SELECT P.PRODUCT_NAME,
       NVL(
           (
               SELECT SUM(PU.QUANTITY)
               FROM PURCHASES PU
               WHERE PU.PRODUCT_ID = P.PRODUCT_ID
           ),
           0
       ) AS TOTAL_PURCHASED
FROM PRODUCTS P;



-- =====================================================
-- LEVEL 6
-- INLINE VIEWS
-- Q56-Q65
-- =====================================================


-- Q56. Find customers having more than 2 orders using an inline view.

SELECT C.CUSTOMER_NAME, X.NO_OF_ORDERS
FROM CUSTOMERS C
JOIN
(
    SELECT CUSTOMER_ID, COUNT(*) AS NO_OF_ORDERS
    FROM ORDERS
    GROUP BY CUSTOMER_ID
) X
ON C.CUSTOMER_ID = X.CUSTOMER_ID
WHERE X.NO_OF_ORDERS > 2;


-- Q57. Find suppliers having more than 3 products.

SELECT S.SUPPLIER_NAME, X.NO_OF_PRODUCTS
FROM SUPPLIERS S
JOIN
(
    SELECT SUPPLIER_ID, COUNT(*) AS NO_OF_PRODUCTS
    FROM PRODUCTS
    GROUP BY SUPPLIER_ID
) X
ON S.SUPPLIER_ID = X.SUPPLIER_ID
WHERE X.NO_OF_PRODUCTS > 3;


-- Q58. Find categories having total stock greater than 500.

SELECT C.CATEGORY_NAME, X.TOTAL_STOCK
FROM CATEGORIES C
JOIN
(
    SELECT CATEGORY_ID, SUM(STOCK) AS TOTAL_STOCK
    FROM PRODUCTS
    GROUP BY CATEGORY_ID
) X
ON C.CATEGORY_ID = X.CATEGORY_ID
WHERE X.TOTAL_STOCK > 500;


-- Q59. Find products with total sales quantity greater than 20.

SELECT P.PRODUCT_NAME, X.TOTAL_SOLD
FROM PRODUCTS P
JOIN
(
    SELECT PRODUCT_ID, SUM(QUANTITY) AS TOTAL_SOLD
    FROM ORDER_ITEMS
    GROUP BY PRODUCT_ID
) X
ON P.PRODUCT_ID = X.PRODUCT_ID
WHERE X.TOTAL_SOLD > 20;


-- Q60. Find products with total purchased quantity greater than 50.

SELECT P.PRODUCT_NAME, X.TOTAL_PURCHASED
FROM PRODUCTS P
JOIN
(
    SELECT PRODUCT_ID, SUM(QUANTITY) AS TOTAL_PURCHASED
    FROM PURCHASES
    GROUP BY PRODUCT_ID
) X
ON P.PRODUCT_ID = X.PRODUCT_ID
WHERE X.TOTAL_PURCHASED > 50;


-- Q61. Find the customer with the highest number of orders.

SELECT *
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


-- Q62. Find the supplier with the highest number of products.

SELECT *
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


-- Q63. Find the category with the highest total stock.

SELECT *
FROM
(
    SELECT C.CATEGORY_NAME,
           SUM(P.STOCK) AS TOTAL_STOCK
    FROM CATEGORIES C
    JOIN PRODUCTS P
    ON C.CATEGORY_ID = P.CATEGORY_ID
    GROUP BY C.CATEGORY_NAME
    ORDER BY TOTAL_STOCK DESC
)
WHERE ROWNUM = 1;


-- Q64. Find the product with the highest total sales quantity.

SELECT *
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


-- Q65. Find the employee who handled the highest number of orders.

SELECT *
FROM
(
    SELECT E.EMP_NAME,
           COUNT(O.ORDER_ID) AS NO_OF_ORDERS
    FROM EMPLOYEES E
    JOIN ORDERS O
    ON E.EMP_ID = O.EMP_ID
    GROUP BY E.EMP_NAME
    ORDER BY NO_OF_ORDERS DESC
)
WHERE ROWNUM = 1;



-- =====================================================
-- LEVEL 7
-- SUBQUERY + GROUP BY + HAVING
-- Q66-Q75
-- =====================================================


-- Q66. Find customers whose order count is greater than 3.

SELECT C.CUSTOMER_NAME,
       COUNT(O.ORDER_ID) AS NO_OF_ORDERS
FROM CUSTOMERS C
JOIN ORDERS O
ON C.CUSTOMER_ID = O.CUSTOMER_ID
GROUP BY C.CUSTOMER_NAME
HAVING COUNT(O.ORDER_ID) > 3;


-- Q67. Find suppliers whose product count is greater than the average supplier product count.

SELECT S.SUPPLIER_NAME,
       COUNT(P.PRODUCT_ID) AS NO_OF_PRODUCTS
FROM SUPPLIERS S
JOIN PRODUCTS P
ON S.SUPPLIER_ID = P.SUPPLIER_ID
GROUP BY S.SUPPLIER_NAME
HAVING COUNT(P.PRODUCT_ID) >
(
    SELECT AVG(PRODUCT_COUNT)
    FROM
    (
        SELECT SUPPLIER_ID, COUNT(*) AS PRODUCT_COUNT
        FROM PRODUCTS
        GROUP BY SUPPLIER_ID
    )
);


-- Q68. Find categories whose total stock is greater than average category stock.

SELECT C.CATEGORY_NAME,
       SUM(P.STOCK) AS TOTAL_STOCK
FROM CATEGORIES C
JOIN PRODUCTS P
ON C.CATEGORY_ID = P.CATEGORY_ID
GROUP BY C.CATEGORY_NAME
HAVING SUM(P.STOCK) >
(
    SELECT AVG(TOTAL_STOCK)
    FROM
    (
        SELECT CATEGORY_ID,
               SUM(STOCK) AS TOTAL_STOCK
        FROM PRODUCTS
        GROUP BY CATEGORY_ID
    )
);


-- Q69. Find products whose total sales quantity is greater than average product sales quantity.

SELECT P.PRODUCT_NAME,
       SUM(OI.QUANTITY) AS TOTAL_SOLD
FROM PRODUCTS P
JOIN ORDER_ITEMS OI
ON P.PRODUCT_ID = OI.PRODUCT_ID
GROUP BY P.PRODUCT_NAME
HAVING SUM(OI.QUANTITY) >
(
    SELECT AVG(TOTAL_SOLD)
    FROM
    (
        SELECT PRODUCT_ID,
               SUM(QUANTITY) AS TOTAL_SOLD
        FROM ORDER_ITEMS
        GROUP BY PRODUCT_ID
    )
);


-- Q70. Find employees whose order count is greater than average employee order count.

SELECT E.EMP_NAME,
       COUNT(O.ORDER_ID) AS NO_OF_ORDERS
FROM EMPLOYEES E
JOIN ORDERS O
ON E.EMP_ID = O.EMP_ID
GROUP BY E.EMP_NAME
HAVING COUNT(O.ORDER_ID) >
(
    SELECT AVG(ORDER_COUNT)
    FROM
    (
        SELECT EMP_ID,
               COUNT(*) AS ORDER_COUNT
        FROM ORDERS
        GROUP BY EMP_ID
    )
);


-- Q71. Find payment modes whose total amount is greater than average payment-mode total.

SELECT PAYMENT_MODE,
       SUM(AMOUNT) AS TOTAL_AMOUNT
FROM PAYMENTS
GROUP BY PAYMENT_MODE
HAVING SUM(AMOUNT) >
(
    SELECT AVG(TOTAL_AMOUNT)
    FROM
    (
        SELECT PAYMENT_MODE,
               SUM(AMOUNT) AS TOTAL_AMOUNT
        FROM PAYMENTS
        GROUP BY PAYMENT_MODE
    )
);


-- Q72. Find categories having more products than the average category product count.

SELECT C.CATEGORY_NAME,
       COUNT(P.PRODUCT_ID) AS NO_OF_PRODUCTS
FROM CATEGORIES C
JOIN PRODUCTS P
ON C.CATEGORY_ID = P.CATEGORY_ID
GROUP BY C.CATEGORY_NAME
HAVING COUNT(P.PRODUCT_ID) >
(
    SELECT AVG(PRODUCT_COUNT)
    FROM
    (
        SELECT CATEGORY_ID,
               COUNT(*) AS PRODUCT_COUNT
        FROM PRODUCTS
        GROUP BY CATEGORY_ID
    )
);


-- Q73. Find customers whose total payment exceeds the average customer payment.

SELECT C.CUSTOMER_NAME,
       SUM(PM.AMOUNT) AS TOTAL_PAID
FROM CUSTOMERS C
JOIN ORDERS O
ON C.CUSTOMER_ID = O.CUSTOMER_ID
JOIN PAYMENTS PM
ON O.ORDER_ID = PM.ORDER_ID
GROUP BY C.CUSTOMER_NAME
HAVING SUM(PM.AMOUNT) >
(
    SELECT AVG(TOTAL_PAID)
    FROM
    (
        SELECT O2.CUSTOMER_ID,
               SUM(P2.AMOUNT) AS TOTAL_PAID
        FROM ORDERS O2
        JOIN PAYMENTS P2
        ON O2.ORDER_ID = P2.ORDER_ID
        GROUP BY O2.CUSTOMER_ID
    )
);


-- Q74. Find suppliers whose total purchase quantity exceeds average supplier purchase quantity.

SELECT S.SUPPLIER_NAME,
       SUM(PU.QUANTITY) AS TOTAL_PURCHASED
FROM SUPPLIERS S
JOIN PURCHASES PU
ON S.SUPPLIER_ID = PU.SUPPLIER_ID
GROUP BY S.SUPPLIER_NAME
HAVING SUM(PU.QUANTITY) >
(
    SELECT AVG(TOTAL_PURCHASED)
    FROM
    (
        SELECT SUPPLIER_ID,
               SUM(QUANTITY) AS TOTAL_PURCHASED
        FROM PURCHASES
        GROUP BY SUPPLIER_ID
    )
);


-- Q75. Find designations whose average salary is greater than the overall average salary.

SELECT DESIGNATION,
       AVG(SALARY) AS AVG_SALARY
FROM EMPLOYEES
GROUP BY DESIGNATION
HAVING AVG(SALARY) >
(
    SELECT AVG(SALARY)
    FROM EMPLOYEES
);



-- =====================================================
-- LEVEL 8
-- CASE + SUBQUERIES + ADVANCED CONDITIONS
-- Q76-Q82
-- =====================================================


-- Q76. Classify each product as ABOVE AVERAGE or BELOW AVERAGE based on price.

SELECT PRODUCT_NAME,
       PRICE,
       CASE
           WHEN PRICE > (SELECT AVG(PRICE) FROM PRODUCTS)
           THEN 'ABOVE AVERAGE'
           ELSE 'BELOW AVERAGE'
       END AS PRICE_CATEGORY
FROM PRODUCTS;


-- Q77. Classify employees based on whether their salary is above or below average.

SELECT EMP_NAME,
       SALARY,
       CASE
           WHEN SALARY > (SELECT AVG(SALARY) FROM EMPLOYEES)
           THEN 'ABOVE AVERAGE'
           ELSE 'BELOW AVERAGE'
       END AS SALARY_CATEGORY
FROM EMPLOYEES;


-- Q78. Classify products based on whether their stock is above total average stock.

SELECT PRODUCT_NAME,
       STOCK,
       CASE
           WHEN STOCK > (SELECT AVG(STOCK) FROM PRODUCTS)
           THEN 'HIGH STOCK'
           ELSE 'LOW STOCK'
       END AS STOCK_CATEGORY
FROM PRODUCTS;


-- Q79. Display each customer and classify them based on order count.

SELECT C.CUSTOMER_NAME,
       CASE
           WHEN
           (
               SELECT COUNT(*)
               FROM ORDERS O
               WHERE O.CUSTOMER_ID = C.CUSTOMER_ID
           ) >= 5
           THEN 'HIGH VALUE'
           WHEN
           (
               SELECT COUNT(*)
               FROM ORDERS O
               WHERE O.CUSTOMER_ID = C.CUSTOMER_ID
           ) >= 2
           THEN 'REGULAR'
           ELSE 'LOW ACTIVITY'
       END AS CUSTOMER_CATEGORY
FROM CUSTOMERS C;


-- Q80. Classify products based on whether they have ever been sold.

SELECT P.PRODUCT_NAME,
       CASE
           WHEN EXISTS
           (
               SELECT 1
               FROM ORDER_ITEMS OI
               WHERE OI.PRODUCT_ID = P.PRODUCT_ID
           )
           THEN 'SOLD'
           ELSE 'NOT SOLD'
       END AS SALES_STATUS
FROM PRODUCTS P;


-- Q81. Classify products based on whether they have been purchased.

SELECT P.PRODUCT_NAME,
       CASE
           WHEN EXISTS
           (
               SELECT 1
               FROM PURCHASES PU
               WHERE PU.PRODUCT_ID = P.PRODUCT_ID
           )
           THEN 'PURCHASED'
           ELSE 'NOT PURCHASED'
       END AS PURCHASE_STATUS
FROM PRODUCTS P;


-- Q82. Classify orders based on whether payment exists.

SELECT O.ORDER_ID,
       CASE
           WHEN EXISTS
           (
               SELECT 1
               FROM PAYMENTS PM
               WHERE PM.ORDER_ID = O.ORDER_ID
           )
           THEN 'PAID'
           ELSE 'UNPAID'
       END AS PAYMENT_STATUS
FROM ORDERS O;



-- =====================================================
-- LEVEL 9
-- SET OPERATORS
-- Q83-Q90
-- =====================================================


-- Q83. Display IDs that appear as both customer IDs and employee IDs.

SELECT CUSTOMER_ID AS ID
FROM CUSTOMERS
INTERSECT
SELECT EMP_ID AS ID
FROM EMPLOYEES;


-- Q84. Display IDs that appear in customers but not employees.

SELECT CUSTOMER_ID AS ID
FROM CUSTOMERS
MINUS
SELECT EMP_ID AS ID
FROM EMPLOYEES;


-- Q85. Display IDs that appear in employees but not customers.

SELECT EMP_ID AS ID
FROM EMPLOYEES
MINUS
SELECT CUSTOMER_ID AS ID
FROM CUSTOMERS;


-- Q86. Combine customer names and supplier names using UNION.

SELECT CUSTOMER_NAME AS NAME
FROM CUSTOMERS
UNION
SELECT SUPPLIER_NAME AS NAME
FROM SUPPLIERS;


-- Q87. Combine customer names and supplier names using UNION ALL.

SELECT CUSTOMER_NAME AS NAME
FROM CUSTOMERS
UNION ALL
SELECT SUPPLIER_NAME AS NAME
FROM SUPPLIERS;


-- Q88. Find names appearing in both customers and suppliers.

SELECT CUSTOMER_NAME AS NAME
FROM CUSTOMERS
INTERSECT
SELECT SUPPLIER_NAME AS NAME
FROM SUPPLIERS;


-- Q89. Find customer names that do not appear as supplier names.

SELECT CUSTOMER_NAME AS NAME
FROM CUSTOMERS
MINUS
SELECT SUPPLIER_NAME AS NAME
FROM SUPPLIERS;


-- Q90. Combine employee names and customer names and sort alphabetically.

SELECT CUSTOMER_NAME AS NAME
FROM CUSTOMERS
UNION
SELECT EMP_NAME AS NAME
FROM EMPLOYEES
ORDER BY NAME;



-- =====================================================
-- LEVEL 10
-- ADVANCED REPORTING / INTERVIEW QUESTIONS
-- Q91-Q100
-- =====================================================


-- Q91. Find customers who have orders but none of their orders have payments.

SELECT C.CUSTOMER_NAME
FROM CUSTOMERS C
WHERE EXISTS
(
    SELECT 1
    FROM ORDERS O
    WHERE O.CUSTOMER_ID = C.CUSTOMER_ID
)
AND NOT EXISTS
(
    SELECT 1
    FROM ORDERS O
    JOIN PAYMENTS PM
    ON O.ORDER_ID = PM.ORDER_ID
    WHERE O.CUSTOMER_ID = C.CUSTOMER_ID
);


-- Q92. Find products that have been purchased but never sold.

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


-- Q93. Find products that have been sold but never purchased.

SELECT P.PRODUCT_NAME
FROM PRODUCTS P
WHERE EXISTS
(
    SELECT 1
    FROM ORDER_ITEMS OI
    WHERE OI.PRODUCT_ID = P.PRODUCT_ID
)
AND NOT EXISTS
(
    SELECT 1
    FROM PURCHASES PU
    WHERE PU.PRODUCT_ID = P.PRODUCT_ID
);


-- Q94. Find products where total quantity purchased is greater than total quantity sold.

SELECT P.PRODUCT_NAME,
       NVL(
           (
               SELECT SUM(PU.QUANTITY)
               FROM PURCHASES PU
               WHERE PU.PRODUCT_ID = P.PRODUCT_ID
           ), 0
       ) AS TOTAL_PURCHASED,
       NVL(
           (
               SELECT SUM(OI.QUANTITY)
               FROM ORDER_ITEMS OI
               WHERE OI.PRODUCT_ID = P.PRODUCT_ID
           ), 0
       ) AS TOTAL_SOLD
FROM PRODUCTS P
WHERE NVL(
          (
              SELECT SUM(PU.QUANTITY)
              FROM PURCHASES PU
              WHERE PU.PRODUCT_ID = P.PRODUCT_ID
          ), 0
      )
      >
      NVL(
          (
              SELECT SUM(OI.QUANTITY)
              FROM ORDER_ITEMS OI
              WHERE OI.PRODUCT_ID = P.PRODUCT_ID
          ), 0
      );


-- Q95. Find products where total sales value is greater than 50000.

SELECT P.PRODUCT_NAME,
       (
           SELECT SUM(OI.QUANTITY * OI.PRICE)
           FROM ORDER_ITEMS OI
           WHERE OI.PRODUCT_ID = P.PRODUCT_ID
       ) AS TOTAL_SALES_VALUE
FROM PRODUCTS P
WHERE
(
    SELECT SUM(OI.QUANTITY * OI.PRICE)
    FROM ORDER_ITEMS OI
    WHERE OI.PRODUCT_ID = P.PRODUCT_ID
) > 50000;


-- Q96. Find the customer with the highest total payment.

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
)
WHERE TOTAL_PAID =
(
    SELECT MAX(TOTAL_PAID)
    FROM
    (
        SELECT O.CUSTOMER_ID,
               SUM(PM.AMOUNT) AS TOTAL_PAID
        FROM ORDERS O
        JOIN PAYMENTS PM
        ON O.ORDER_ID = PM.ORDER_ID
        GROUP BY O.CUSTOMER_ID
    )
);


-- Q97. Find the employee who handled the highest number of orders.

SELECT EMP_NAME,
       NO_OF_ORDERS
FROM
(
    SELECT E.EMP_NAME,
           COUNT(O.ORDER_ID) AS NO_OF_ORDERS
    FROM EMPLOYEES E
    JOIN ORDERS O
    ON E.EMP_ID = O.EMP_ID
    GROUP BY E.EMP_NAME
)
WHERE NO_OF_ORDERS =
(
    SELECT MAX(NO_OF_ORDERS)
    FROM
    (
        SELECT EMP_ID,
               COUNT(*) AS NO_OF_ORDERS
        FROM ORDERS
        GROUP BY EMP_ID
    )
);


-- Q98. Find the category with the highest total sales value.

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
)
WHERE TOTAL_SALES =
(
    SELECT MAX(TOTAL_SALES)
    FROM
    (
        SELECT P.CATEGORY_ID,
               SUM(OI.QUANTITY * OI.PRICE) AS TOTAL_SALES
        FROM PRODUCTS P
        JOIN ORDER_ITEMS OI
        ON P.PRODUCT_ID = OI.PRODUCT_ID
        GROUP BY P.CATEGORY_ID
    )
);


-- Q99. Find employees who handled orders in every distinct order status.

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


-- Q100. Find products whose total sales quantity is greater than their current stock.

SELECT P.PRODUCT_NAME,
       P.STOCK,
       (
           SELECT SUM(OI.QUANTITY)
           FROM ORDER_ITEMS OI
           WHERE OI.PRODUCT_ID = P.PRODUCT_ID
       ) AS TOTAL_SOLD
FROM PRODUCTS P
WHERE
(
    SELECT NVL(SUM(OI.QUANTITY), 0)
    FROM ORDER_ITEMS OI
    WHERE OI.PRODUCT_ID = P.PRODUCT_ID
) > P.STOCK;



-- =====================================================
-- PRACTICE ORDER
-- =====================================================

-- Q01-Q15   : Single-row subqueries
-- Q16-Q25   : IN / NOT IN / ANY / ALL
-- Q26-Q35   : EXISTS / NOT EXISTS
-- Q36-Q45   : Correlated subqueries
-- Q46-Q55   : Scalar subqueries
-- Q56-Q65   : Inline views
-- Q66-Q75   : Subquery + GROUP BY / HAVING
-- Q76-Q82   : CASE + subqueries
-- Q83-Q90   : Set operators
-- Q91-Q100  : Advanced reporting / interview questions


-- =====================================================
-- IMPORTANT PROJECT RELATIONSHIPS
-- =====================================================

-- CATEGORIES
-- CATEGORY_ID -> PRODUCTS.CATEGORY_ID

-- SUPPLIERS
-- SUPPLIER_ID -> PRODUCTS.SUPPLIER_ID

-- CUSTOMERS
-- CUSTOMER_ID -> ORDERS.CUSTOMER_ID

-- EMPLOYEES
-- EMP_ID -> ORDERS.EMP_ID

-- ORDERS
-- ORDER_ID -> ORDER_ITEMS.ORDER_ID
-- ORDER_ID -> PAYMENTS.ORDER_ID

-- PRODUCTS
-- PRODUCT_ID -> ORDER_ITEMS.PRODUCT_ID
-- PRODUCT_ID -> PURCHASES.PRODUCT_ID
-- PRODUCT_ID -> INVENTORY_LOG.PRODUCT_ID

-- =====================================================
-- IMPORTANT ACTUAL COLUMNS
-- =====================================================

-- CATEGORIES
-- CATEGORY_ID
-- CATEGORY_NAME

-- CUSTOMERS
-- CUSTOMER_ID
-- CUSTOMER_NAME
-- PHONE
-- EMAIL
-- ADDRESS
-- CITY

-- EMPLOYEES
-- EMP_ID
-- EMP_NAME
-- DESIGNATION
-- SALARY

-- INVENTORY_LOG
-- LOG_ID
-- PRODUCT_ID
-- OLD_STOCK
-- NEW_STOCK
-- UPDATED_DATE

-- ORDER_ITEMS
-- ORDER_ITEM_ID
-- ORDER_ID
-- PRODUCT_ID
-- QUANTITY
-- PRICE

-- ORDERS
-- ORDER_ID
-- CUSTOMER_ID
-- EMP_ID
-- ORDER_DATE
-- STATUS

-- PAYMENTS
-- PAYMENT_ID
-- ORDER_ID
-- PAYMENT_MODE
-- PAYMENT_DATE
-- AMOUNT

-- PRODUCTS
-- PRODUCT_ID
-- PRODUCT_NAME
-- CATEGORY_ID
-- SUPPLIER_ID
-- PRICE
-- STOCK

-- PURCHASES
-- PURCHASE_ID
-- SUPPLIER_ID
-- PRODUCT_ID
-- QUANTITY
-- PURCHASE_DATE

-- SUPPLIERS
-- SUPPLIER_ID
-- SUPPLIER_NAME
-- PHONE
-- EMAIL


-- =====================================================
-- ADVANCED SQL CHECKLIST
-- =====================================================

-- [ ] Single-row subquery
-- [ ] Multi-row subquery
-- [ ] IN
-- [ ] NOT IN
-- [ ] ANY
-- [ ] ALL
-- [ ] EXISTS
-- [ ] NOT EXISTS
-- [ ] Correlated subquery
-- [ ] Scalar subquery
-- [ ] Inline view
-- [ ] Subquery in SELECT
-- [ ] Subquery in WHERE
-- [ ] Subquery in HAVING
-- [ ] Subquery in FROM
-- [ ] JOIN + subquery
-- [ ] CASE + subquery
-- [ ] Anti-join
-- [ ] Semi-join
-- [ ] UNION
-- [ ] UNION ALL
-- [ ] INTERSECT
-- [ ] MINUS
-- [ ] Top-N + subquery
-- [ ] Aggregate + subquery
-- [ ] EXISTS + NOT EXISTS
-- [ ] Advanced business queries


-- =====================================================
-- END OF 13_ADVANCED_SQL PRACTICE
-- =====================================================

SPOOL OFF