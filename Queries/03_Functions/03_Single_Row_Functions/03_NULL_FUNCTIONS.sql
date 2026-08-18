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
SET COLSEP ' | '

-- =====================================================
-- COLUMN FORMATTING
-- =====================================================

-- =========================
-- CATEGORIES
-- =========================

COLUMN CATEGORY_ID   FORMAT 999999
COLUMN CATEGORY_NAME FORMAT A25


-- =========================
-- CUSTOMERS
-- =========================

COLUMN CUSTOMER_ID   FORMAT 999999
COLUMN CUSTOMER_NAME FORMAT A30
COLUMN PHONE         FORMAT A15
COLUMN EMAIL         FORMAT A30
COLUMN ADDRESS       FORMAT A30
COLUMN CITY          FORMAT A20


-- =========================
-- EMPLOYEES
-- =========================

COLUMN EMP_ID       FORMAT 999999
COLUMN EMP_NAME     FORMAT A30
COLUMN DESIGNATION  FORMAT A20
COLUMN SALARY       FORMAT 99999999.99


-- =========================
-- PRODUCTS
-- =========================

COLUMN PRODUCT_ID   FORMAT 999999
COLUMN PRODUCT_NAME FORMAT A35
COLUMN SUPPLIER_ID  FORMAT 999999
COLUMN PRICE        FORMAT 99999999.99
COLUMN STOCK        FORMAT 999999


-- =========================
-- ORDERS
-- =========================

COLUMN ORDER_ID     FORMAT 999999
COLUMN CUSTOMER_ID  FORMAT 999999
COLUMN EMP_ID       FORMAT 999999
COLUMN ORDER_DATE   FORMAT A12
COLUMN STATUS       FORMAT A20


-- =========================
-- ORDER_ITEMS
-- =========================

COLUMN ORDER_ITEM_ID FORMAT 999999
COLUMN ORDER_ID      FORMAT 999999
COLUMN PRODUCT_ID    FORMAT 999999
COLUMN QUANTITY      FORMAT 999999


-- =========================
-- PAYMENTS
-- =========================

COLUMN PAYMENT_ID   FORMAT 999999
COLUMN ORDER_ID     FORMAT 999999
COLUMN PAYMENT_DATE FORMAT A12
COLUMN PAYMENT_MODE FORMAT A20
COLUMN AMOUNT       FORMAT 99999999.99


-- =========================
-- PURCHASES
-- =========================

COLUMN PURCHASE_ID  FORMAT 999999
COLUMN SUPPLIER_ID  FORMAT 999999
COLUMN PURCHASE_DATE FORMAT A12


-- =========================
-- INVENTORY_LOG
-- =========================

COLUMN LOG_ID       FORMAT 999999
COLUMN PRODUCT_ID   FORMAT 999999
COLUMN OLD_STOCK    FORMAT 999999
COLUMN NEW_STOCK    FORMAT 999999
COLUMN LOG_DATE     FORMAT A20

COLUMN CUSTOMER_NAME FORMAT A30
COLUMN PHONE         FORMAT A15
COLUMN EMAIL         FORMAT A30
COLUMN CITY          FORMAT A20

COLUMN PRODUCT_NAME  FORMAT A35
COLUMN CATEGORY_ID   FORMAT 999999
COLUMN SUPPLIER_ID   FORMAT 999999
COLUMN STOCK         FORMAT 999999

COLUMN EMP_NAME      FORMAT A30
COLUMN SALARY        FORMAT 99999999.99

COLUMN PAYMENT_MODE  FORMAT A20
COLUMN AMOUNT        FORMAT 99999999.99

-- =====================================================
-- SPOOL OUTPUT
-- =====================================================

SPOOL 'F:\Exploring Technologies\OrcaleSqlPlusExploring\Oracle_Inventory_Sales_Management_System\Queries\03_Functions\03_Single_Row_Functions\03_NULL_FUNCTIONS_OUTPUT.txt'


-- =====================================================
-- 03_NULL_FUNCTIONS
-- Oracle 11g / SQL*Plus
-- Questions: Q421–Q470
-- =====================================================


-- =====================================================
-- CONCEPT 1 — NVL()
-- Syntax: NVL(expression, replacement_value)
-- Use: Replaces NULL with a specified value.
-- Parameters: 2
-- =====================================================

-- Q421. Display CUSTOMER_NAME and replace NULL PHONE with 'NOT AVAILABLE'.

SELECT CUSTOMER_NAME,NVL(PHONE,'NOT AVAILABLE') FROM CUSTOMERS;

-- Q422. Display CUSTOMER_NAME and replace NULL EMAIL with 'NO EMAIL'.

SELECT CUSTOMER_NAME,NVL(EMAIL,'NO EMAIL') FROM CUSTOMERS;

-- Q423. Display PRODUCT_NAME and replace NULL CATEGORY_ID with 0.

SELECT PRODUCT_NAME,NVL(CATEGORY_ID,0) AS CATEGORY_ID FROM PRODUCTS;

-- Q424. Display PRODUCT_NAME and replace NULL SUPPLIER_ID with 0.

SELECT PRODUCT_NAME,NVL(SUPPLIER_ID,0) AS SUPPLIER_ID FROM PRODUCTS;

-- Q425. Display PAYMENT_MODE and replace NULL values with 'UNKNOWN'.

SELECT NVL(PAYMENT_MODE,'UNKNOWN') AS PAYMENT_MODE FROM PAYMENTS;

-- Q426. Display EMP_NAME and SALARY, replacing NULL SALARY with 0.

SELECT EMP_NAME,NVL(SALARY,0) AS SALARY FROM EMPLOYEES;

-- Q427. Display products whose CATEGORY_ID, after NVL(), is 0.

SELECT * FROM PRODUCTS WHERE NVL(CATEGORY_ID,0)=0;

-- Q428. Display customers with PHONE replaced by 'NOT PROVIDED'
-- and EMAIL replaced by 'NOT PROVIDED'.

SELECT * FROM CUSTOMERS WHERE NVL(PHONE,'NOT PROVIDED')='NOT PROVIDED' AND NVL(EMAIL,'NOT PROVIDED')='NOT PROVIDED';

-- =====================================================
-- CONCEPT 2 — NVL() WITH ARITHMETIC
-- =====================================================

-- Q429. Display PRICE plus 100, treating NULL PRICE as 0.

SELECT NVL(PRICE,0)+100 AS PRICE FROM PRODUCTS;

-- Q430. Display SALARY plus 5000, treating NULL SALARY as 0.

SELECT NVL(SALARY,0)+5000 AS SALARY FROM EMPLOYEES;

-- Q431. Display AMOUNT multiplied by 2, treating NULL AMOUNT as 0.

SELECT NVL(AMOUNT,0)*2 AS AMOUNT FROM PAYMENTS;

-- Q432. Display STOCK plus 10, treating NULL STOCK as 0.

SELECT NVL(STOCK,0)+10 AS STOCK FROM PRODUCTS;

-- Q433. Display PRODUCT_NAME and PRICE after replacing NULL PRICE with 0.

SELECT PRODUCT_NAME,NVL(PRICE,0) AS PRICE FROM PRODUCTS;

-- =====================================================
-- CONCEPT 3 — NVL2()
-- Syntax: NVL2(expression, value_if_not_null, value_if_null)
-- Use: Returns one value when expression is NOT NULL
--      and another value when expression is NULL.
-- Parameters: 3
-- =====================================================

-- Q434. Display CUSTOMER_NAME and 'AVAILABLE'
-- if PHONE is not NULL, otherwise 'NOT AVAILABLE'.

SELECT CUSTOMER_NAME,NVL2(PHONE,'AVAILABLE','NOT_AVAILABLE') FROM CUSTOMERS;

-- Q435. Display CUSTOMER_NAME and 'EMAIL AVAILABLE'
-- if EMAIL is not NULL, otherwise 'NO EMAIL'.

SELECT CUSTOMER_NAME,NVL2(EMAIL,'EMAIL_AVAILABLE','NO_EMAIL') AS EMAIL_STATUS FROM CUSTOMERS;

-- Q436. Display PRODUCT_NAME and 'SUPPLIER ASSIGNED'
-- if SUPPLIER_ID is not NULL, otherwise 'NO SUPPLIER'.

SELECT PRODUCT_NAME,NVL2(SUPPLIER_ID,'SUPPLIER_ASSIGNED','NO_SUPPLIER') AS SUPPLIER_STATUS FROM PRODUCTS;

-- Q437. Display ORDER_ID and 'EMPLOYEE ASSIGNED'
-- if EMP_ID is not NULL, otherwise 'NO EMPLOYEE'.

SELECT ORDER_ID,NVL2(EMP_ID,'EMPLOYEE_ASSIGNED','NO_EMPLOYEE') AS EMPLOYEE_STATUS FROM ORDERS;

-- Q438. Display PAYMENT_ID and 'PAYMENT MODE AVAILABLE'
-- if PAYMENT_MODE is not NULL, otherwise 'PAYMENT MODE MISSING'.

SELECT PAYMENT_ID,NVL2(PAYMENT_MODE,'PAYMENT_MODE_AVAILABLE','PAYMENT_MODE_MISSING') AS PAYMENT_MODE_STATUS FROM PAYMENTS;

-- =====================================================
-- CONCEPT 4 — NULLIF()
-- Syntax: NULLIF(expression1, expression2)
-- Use: Returns NULL when both expressions are equal;
--      otherwise returns expression1.
-- Parameters: 2
-- =====================================================

-- Q439. Display NULLIF(PRICE,1000) for all products.

SELECT PRODUCT_ID,
       PRODUCT_NAME,
       NULLIF(PRICE,1000) AS PRICE
FROM PRODUCTS;

-- Q440. Display NULLIF(STOCK,0) for all products.

SELECT PRODUCT_ID,
       PRODUCT_NAME,
       NULLIF(STOCK,0) AS STOCK
FROM PRODUCTS;

-- Q441. Display PRODUCT_ID and NULLIF(PRODUCT_ID,1).

SELECT PRODUCT_ID,
       NULLIF(PRODUCT_ID,1) AS NULLIF_PRODUCT_ID
FROM PRODUCTS;

-- Q442. Display EMP_ID and NULLIF(EMP_ID,1).

SELECT EMP_ID,
       NULLIF(EMP_ID,1) AS NULLIF_EMP_ID
FROM EMPLOYEES;

-- Q443. Display PAYMENT_MODE and NULLIF(PAYMENT_MODE,'CASH').

SELECT PAYMENT_MODE,
       NULLIF(PAYMENT_MODE,'CASH') AS NULLIF_PAYMENT_MODE
FROM PAYMENTS;

-- =====================================================
-- CONCEPT 5 — COALESCE()
-- Syntax: COALESCE(expression1, expression2, ...)
-- Use: Returns the first non-NULL expression.
-- Parameters: 2 or more
-- =====================================================

-- Q444. Display CUSTOMER_NAME and first available value
-- among PHONE and EMAIL.

SELECT CUSTOMER_NAME,COALESCE(PHONE,EMAIL) FROM CUSTOMERS;

-- Q445. Display CUSTOMER_NAME and first available value
-- among EMAIL and PHONE.

SELECT CUSTOMER_NAME,COALESCE(EMAIL,PHONE) FROM CUSTOMERS;

-- Q446. Display PRODUCT_NAME and first available value
-- among CATEGORY_ID and SUPPLIER_ID.

SELECT PRODUCT_NAME,COALESCE(CATEGORY_ID,SUPPLIER_ID) FROM PRODUCTS;

-- Q447. Display ORDER_ID and first available value
-- among EMP_ID and CUSTOMER_ID.

SELECT ORDER_ID,COALESCE(EMP_ID,CUSTOMER_ID) FROM ORDERS;

-- Q448. Display CUSTOMER_NAME and first non-NULL value
-- among PHONE, EMAIL and CITY.

SELECT CUSTOMER_NAME,COALESCE(PHONE,EMAIL,CITY) FROM CUSTOMERS;

-- =====================================================
-- CONCEPT 6 — IS NULL
-- Syntax: expression IS NULL
-- Use: Tests whether a value is NULL.
-- Parameters: 1 expression
-- =====================================================

-- Q449. Display customers whose PHONE is NULL.

SELECT * FROM CUSTOMERS WHERE PHONE IS NULL;

-- Q450. Display customers whose EMAIL is NULL.

SELECT * FROM CUSTOMERS WHERE EMAIL IS NULL;

-- Q451. Display products whose CATEGORY_ID is NULL.

SELECT * FROM PRODUCTS WHERE CATEGORY_ID IS NULL;

-- Q452. Display products whose SUPPLIER_ID is NULL.

SELECT * FROM PRODUCTS WHERE SUPPLIER_ID IS NULL;

-- Q453. Display orders whose EMP_ID is NULL.

SELECT * FROM ORDERS WHERE EMP_ID IS NULL;

-- =====================================================
-- CONCEPT 7 — IS NOT NULL
-- Syntax: expression IS NOT NULL
-- Use: Tests whether a value is NOT NULL.
-- Parameters: 1 expression
-- =====================================================

-- Q454. Display customers whose PHONE is NOT NULL.

SELECT * FROM CUSTOMERS WHERE PHONE IS NOT NULL;

-- Q455. Display customers whose EMAIL is NOT NULL.

SELECT * FROM CUSTOMERS WHERE EMAIL IS NOT NULL;

-- Q456. Display products whose CATEGORY_ID is NOT NULL.

SELECT * FROM PRODUCTS WHERE CATEGORY_ID IS NOT NULL;

-- Q457. Display products whose SUPPLIER_ID is NOT NULL.

SELECT * FROM PRODUCTS WHERE SUPPLIER_ID IS NOT NULL;

-- Q458. Display orders whose EMP_ID is NOT NULL.

SELECT * FROM ORDERS WHERE EMP_ID IS NOT NULL;

-- =====================================================
-- CONCEPT 8 — NULL FUNCTIONS WITH CLAUSES
-- =====================================================

-- Q459. Display customers with NULL PHONE replaced by 'NOT PROVIDED'
-- and order them by CUSTOMER_NAME.

SELECT CUSTOMER_ID,CUSTOMER_NAME,NVL(PHONE,'NOT PROVIDED') AS PHONE,EMAIL,ADDRESS,CITY FROM CUSTOMERS ORDER BY CUSTOMER_NAME ASC; 

-- Q460. Display products with NULL CATEGORY_ID replaced by 0
-- and order them by CATEGORY_ID.

SELECT PRODUCT_ID,PRODUCT_NAME,NVL(CATEGORY_ID,0) AS CATEGORY_ID FROM PRODUCTS ORDER BY NVL(CATEGORY_ID,0) ASC;

-- Q461. Display payments with NULL PAYMENT_MODE replaced by 'UNKNOWN'
-- and order them by PAYMENT_MODE.

SELECT PAYMENT_ID,PAYMENT_DATE,NVL(PAYMENT_MODE,'UNKNOWN') AS PAYMENT_MODE FROM PAYMENTS ORDER BY NVL(PAYMENT_MODE,'UNKNOWN') ASC;

-- Q462. Display customers having NULL EMAIL
-- and order them by CUSTOMER_NAME.

SELECT CUSTOMER_ID,CUSTOMER_NAME,NVL(EMAIL,'NOT PROVIDED') AS EMAIL_STATUS FROM CUSTOMERS WHERE EMAIL IS NULL ORDER BY CUSTOMER_NAME;

-- Q463. Display products having NULL SUPPLIER_ID
-- and order them by PRODUCT_NAME.

SELECT PRODUCT_ID,PRODUCT_NAME,NVL(SUPPLIER_ID,0) AS SUPPLIER_ID_STATUS FROM PRODUCTS WHERE SUPPLIER_ID IS NULL ORDER BY PRODUCT_NAME ASC;

-- Q464. Display employees with NULL SALARY replaced by 0
-- and order them by salary in descending order.

SELECT EMP_ID,EMP_NAME,DESIGNATION,NVL(SALARY,0) AS SALARY FROM EMPLOYEES ORDER BY NVL(SALARY,0) DESC;

-- Q465. Display customers whose PHONE is NULL
-- OR EMAIL is NULL.

SELECT * FROM CUSTOMERS WHERE PHONE IS NULL OR EMAIL IS NULL;

-- Q466. Display products whose CATEGORY_ID is NULL
-- OR SUPPLIER_ID is NULL.

SELECT * FROM PRODUCTS WHERE CATEGORY_ID IS NULL OR SUPPLIER_ID IS NULL;

-- Q467. Display customers whose PHONE is NOT NULL
-- AND EMAIL is NOT NULL.

SELECT * FROM CUSTOMERS WHERE PHONE IS NOT NULL AND EMAIL IS NOT NULL;

-- Q468. Display products whose CATEGORY_ID is NOT NULL
-- AND SUPPLIER_ID is NOT NULL.

SELECT * FROM PRODUCTS WHERE CATEGORY_ID IS NOT NULL AND SUPPLIER_ID IS NOT NULL;

-- Q469. Display CUSTOMER_NAME and use COALESCE()
-- to show PHONE, EMAIL or CITY as the first available value.

SELECT CUSTOMER_NAME,COALESCE(PHONE,EMAIL,CITY) FROM CUSTOMERS;

-- Q470. Display PRODUCT_NAME and use NVL()
-- to replace NULL STOCK with 0.

SELECT PRODUCT_NAME,NVL(STOCK,0) AS STOCK FROM PRODUCTS;

--=======================================================================================================================================================================
--END OF NULL_FUNCTIONS
--=======================================================================================================================================================================

SPOOL OFF