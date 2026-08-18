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

COLUMN CATEGORY_ID FORMAT 999999
COLUMN CATEGORY_NAME FORMAT A25

COLUMN CUSTOMER_ID FORMAT 999999
COLUMN CUSTOMER_NAME FORMAT A30
COLUMN PHONE FORMAT A15
COLUMN EMAIL FORMAT A30
COLUMN ADDRESS FORMAT A30
COLUMN CITY FORMAT A20

COLUMN EMP_ID FORMAT 999999
COLUMN EMP_NAME FORMAT A30
COLUMN DESIGNATION FORMAT A20
COLUMN SALARY FORMAT 99999999.99

COLUMN PRODUCT_ID FORMAT 999999
COLUMN PRODUCT_NAME FORMAT A35
COLUMN SUPPLIER_ID FORMAT 999999
COLUMN PRICE FORMAT 99999999.99
COLUMN STOCK FORMAT 999999

COLUMN ORDER_ID FORMAT 999999
COLUMN ORDER_ITEM_ID FORMAT 999999
COLUMN QUANTITY FORMAT 999999
COLUMN STATUS FORMAT A20

COLUMN PAYMENT_ID FORMAT 999999
COLUMN PAYMENT_MODE FORMAT A20
COLUMN AMOUNT FORMAT 99999999.99

COLUMN PURCHASE_ID FORMAT 999999

COLUMN LOG_ID FORMAT 999999
COLUMN OLD_STOCK FORMAT 999999
COLUMN NEW_STOCK FORMAT 999999

-- =====================================================
-- SPOOL OUTPUT
-- =====================================================

SPOOL 'F:\Exploring Technologies\OrcaleSqlPlusExploring\Oracle_Inventory_Sales_Management_System\Queries\03_Functions\03_Single_Row_Functions\03_NUMBER_FUNCTIONS_OUTPUT.txt'


-- =====================================================
-- 03_NUMBER_FUNCTIONS
-- Oracle 11g / SQL*Plus
-- Questions: Q281–Q330
-- =====================================================


-- =====================================================
-- CONCEPT 1 — ROUND()
-- Syntax: ROUND(number [, decimal_places])
-- Use: Rounds a number to the specified number of decimal places.
-- Parameters: 1 or 2
-- =====================================================

-- Q281. Display PRICE rounded to the nearest whole number.

SELECT ROUND(PRICE) FROM ORDER_ITEMS;

-- Q282. Display PRICE rounded to 2 decimal places.

SELECT ROUND(PRICE,2) FROM ORDER_ITEMS;

-- Q283. Display PRICE rounded to 1 decimal place.

SELECT ROUND(PRICE,1) FROM ORDER_ITEMS;

-- Q284. Display PRODUCT_ID and PRICE rounded to the nearest whole number.

SELECT PRODUCT_ID,ROUND(PRICE) FROM ORDER_ITEMS;

-- Q285. Display products whose PRICE rounded to the nearest whole number is greater than 1000.

SELECT * FROM ORDER_ITEMS WHERE ROUND(PRICE)>1000;

-- =====================================================
-- CONCEPT 2 — TRUNC()
-- Syntax: TRUNC(number [, decimal_places])
-- Use: Removes decimal digits without rounding.
-- Parameters: 1 or 2
-- =====================================================

-- Q286. Display PRICE truncated to the nearest whole number.

SELECT TRUNC(PRICE) FROM PRODUCTS;

-- Q287. Display PRICE truncated to 2 decimal places.

SELECT TRUNC(PRICE,2) FROM PRODUCTS;

-- Q288. Display PRICE truncated to 1 decimal place.

SELECT TRUNC(PRICE,1) FROM PRODUCTS;

-- Q289. Display PRODUCT_NAME and PRICE truncated to 2 decimal places.

SELECT PRODUCT_NAME,TRUNC(PRICE,2) FROM PRODUCTS;

-- Q290. Display products whose PRICE truncated to the nearest whole number is greater than 500.

SELECT * FROM PRODUCTS WHERE TRUNC(PRICE)>500;

-- =====================================================
-- CONCEPT 3 — CEIL()
-- Syntax: CEIL(number)
-- Use: Returns the smallest integer greater than or equal to the number.
-- Parameters: 1
-- =====================================================

-- Q291. Display PRICE using CEIL().

SELECT CEIL(PRICE) FROM ORDER_ITEMS;

-- Q292. Display SALARY using CEIL().

SELECT CEIL(SALARY) FROM EMPLOYEES;

-- Q293. Display PRODUCT_NAME, PRICE and CEIL(PRICE).

SELECT PRODUCT_NAME,PRICE,CEIL(PRICE) FROM PRODUCTS;

-- Q294. Display products whose CEIL(PRICE) is greater than 1000.

SELECT * FROM PRODUCTS WHERE CEIL(PRICE)>1000;

-- Q295. Display employees whose CEIL(SALARY) is greater than 30000.

SELECT * FROM EMPLOYEES WHERE CEIL(SALARY)>30000;

-- =====================================================
-- CONCEPT 4 — FLOOR()
-- Syntax: FLOOR(number)
-- Use: Returns the largest integer less than or equal to the number.
-- Parameters: 1
-- =====================================================

-- Q296. Display PRICE using FLOOR().

SELECT FLOOR(PRICE) FROM PRODUCTS;

-- Q297. Display SALARY using FLOOR().

SELECT FLOOR(SALARY) FROM EMPLOYEES;

-- Q298. Display PRODUCT_NAME, PRICE and FLOOR(PRICE).

SELECT PRODUCT_NAME,PRICE,FLOOR(PRICE) FROM PRODUCTS;

-- Q299. Display products whose FLOOR(PRICE) is greater than 500.

SELECT * FROM PRODUCTS WHERE FLOOR(PRICE)>500;

-- Q300. Display employees whose FLOOR(SALARY) is greater than 25000.

SELECT * FROM EMPLOYEES WHERE FLOOR(SALARY)>25000;

-- =====================================================
-- CONCEPT 5 — MOD()
-- Syntax: MOD(number, divisor)
-- Use: Returns the remainder after division.
-- Parameters: 2
-- =====================================================

-- Q301. Display PRODUCT_ID and its remainder when divided by 2.

SELECT PRODUCT_ID,MOD(PRODUCT_ID,2) AS DIV_BY_2 FROM PRODUCTS;

-- Q302. Display PRODUCT_ID and its remainder when divided by 3.

SELECT PRODUCT_ID,MOD(PRODUCT_ID,3) AS DIV_BY_3 FROM PRODUCTS;

-- Q303. Display products whose PRODUCT_ID is even using MOD().

SELECT PRODUCT_ID,MOD(PRODUCT_ID,2) AS EVEN FROM PRODUCTS;

-- Q304. Display products whose PRODUCT_ID is odd using MOD().

SELECT PRODUCT_ID,MOD(PRODUCT_ID,3) AS ODD FROM PRODUCTS;

-- Q305. Display employees whose EMP_ID is divisible by 2.

SELECT EMP_ID,MOD(EMP_ID,2) AS DIV_BY_2 FROM EMPLOYEES;

-- =====================================================
-- CONCEPT 6 — ABS()
-- Syntax: ABS(number)
-- Use: Returns the absolute/positive value of a number.
-- Parameters: 1
-- =====================================================

-- Q306. Display the absolute value of PRICE - 1000.

SELECT ABS(PRICE-1000) FROM PRODUCTS;

-- Q307. Display PRODUCT_NAME and the absolute difference between PRICE and 1000.

SELECT PRODUCT_NAME,ABS(PRICE-1000) AS DIFFERENCE FROM PRODUCTS;

-- Q308. Display employees and the absolute difference between SALARY and 30000.

SELECT EMPLOYEES.*,ABS(SALARY-30000) AS DIFFERENCE_SAL_30000 FROM EMPLOYEES;

-- Q309. Display products whose absolute difference between PRICE and 1000 is less than 500.

SELECT * FROM PRODUCTS WHERE ABS(PRICE-1000)<500;

-- Q310. Display payments and the absolute difference between AMOUNT and 5000.

SELECT PAYMENTS.*,ABS(AMOUNT-5000) FROM PAYMENTS;


-- =====================================================
-- CONCEPT 7 — POWER()
-- Syntax: POWER(number, exponent)
-- Use: Raises a number to a specified power.
-- Parameters: 2
-- =====================================================

-- Q311. Display PRICE raised to the power of 2.

SELECT PRICE,POWER(PRICE,2) AS RAISED_PRICE FROM PRODUCTS;

-- Q312. Display STOCK raised to the power of 2.

SELECT STOCK,POWER(STOCK,2) AS RAISED_STOCK FROM PRODUCTS;

-- Q313. Display PRODUCT_ID and PRODUCT_ID raised to the power of 3.

SELECT PRODUCT_ID,POWER(PRODUCT_ID,3) AS RAISED_ID FROM PRODUCTS;

-- Q314. Display products whose PRICE raised to the power of 2 is greater than 1000000.

SELECT * FROM PRODUCTS WHERE POWER(PRICE,2)>1000000;

-- Q315. Display employees whose EMP_ID raised to the power of 2 is greater than 25.

SELECT * FROM EMPLOYEES WHERE POWER(EMP_ID,2)>25;

-- =====================================================
-- CONCEPT 8 — SQRT()
-- Syntax: SQRT(number)
-- Use: Returns the square root of a number.
-- Parameters: 1
-- =====================================================

-- Q316. Display the square root of PRODUCT_ID.

SELECT SQRT(PRODUCT_ID) FROM PRODUCTS;

-- Q317. Display the square root of STOCK.

SELECT SQRT(STOCK) FROM PRODUCTS;

-- Q318. Display PRODUCT_ID and its square root.

SELECT PRODUCT_ID,SQRT(PRODUCT_ID) FROM PRODUCTS;

-- Q319. Display products whose square root of PRODUCT_ID is greater than 2.

SELECT * FROM PRODUCTS WHERE SQRT(PRODUCT_ID)>2;

-- Q320. Display employees whose square root of EMP_ID is greater than 3.

SELECT * FROM EMPLOYEES WHERE SQRT(EMP_ID)>3;

-- =====================================================
-- CONCEPT 9 — NUMBER FUNCTIONS WITH CLAUSES
-- =====================================================

-- Q321. Display products ordered by rounded PRICE.

SELECT * FROM PRODUCTS ORDER BY ROUND(PRICE) ASC;

-- Q322. Display products ordered by truncated PRICE in descending order.

SELECT * FROM PRODUCTS ORDER BY ROUND(PRICE) DESC;

-- Q323. Display products ordered by CEIL(PRICE).

SELECT * FROM PRODUCTS ORDER BY CEIL(PRICE) ASC;

-- Q324. Display products ordered by FLOOR(PRICE) in descending order.

SELECT * FROM PRODUCTS ORDER BY FLOOR(PRICE) DESC;

-- Q325. Display products whose PRICE is greater than 500
-- and whose rounded PRICE is less than 1000.

SELECT * FROM PRODUCTS WHERE PRICE>500 AND ROUND(PRICE)<1000;

-- Q326. Display products whose PRODUCT_ID is even
-- and PRICE is greater than 500.

SELECT * FROM PRODUCTS WHERE MOD(PRODUCT_ID,2) AND PRICE>500;

-- Q327. Display products whose PRODUCT_ID is odd
-- and STOCK is greater than 20.

SELECT * FROM PRODUCTS WHERE MOD(PRODUCT_ID,3) AND STOCK>20;

-- Q328. Display PRODUCT_NAME, PRICE, rounded PRICE and truncated PRICE.

SELECT PRODUCT_NAME,PRICE,ROUND(PRICE),TRUNC(PRICE) FROM PRODUCTS;

-- Q329. Display PRODUCT_ID, PRODUCT_ID squared and PRODUCT_ID square root.

SELECT PRODUCT_ID,POWER(PRODUCT_ID,2) AS SQUARED,SQRT(PRODUCT_ID) AS SQUARE_ROOT FROM PRODUCTS;

-- Q330. Display products ordered by the absolute difference between PRICE and 1000.

SELECT * FROM PRODUCTS ORDER BY ABS(PRICE-1000);

--=========================================================================================================================================================================
--END OF NUMBER FUNCTIONS
--=========================================================================================================================================================================
SPOOL OFF