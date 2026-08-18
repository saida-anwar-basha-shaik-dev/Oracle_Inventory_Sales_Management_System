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

-- =====================================================
-- CATEGORIES
-- =====================================================

COLUMN CATEGORY_ID FORMAT 999999
COLUMN CATEGORY_NAME FORMAT A25


-- =====================================================
-- CUSTOMERS
-- =====================================================

COLUMN CUSTOMER_ID FORMAT 999999
COLUMN CUSTOMER_NAME FORMAT A30
COLUMN PHONE FORMAT A15
COLUMN EMAIL FORMAT A30
COLUMN ADDRESS FORMAT A30
COLUMN CITY FORMAT A20


-- =====================================================
-- EMPLOYEES
-- =====================================================

COLUMN EMP_ID FORMAT 999999
COLUMN EMP_NAME FORMAT A30
COLUMN DESIGNATION FORMAT A20
COLUMN SALARY FORMAT 99999999.99


-- =====================================================
-- PRODUCTS
-- =====================================================

COLUMN PRODUCT_ID FORMAT 999999
COLUMN PRODUCT_NAME FORMAT A35
COLUMN SUPPLIER_ID FORMAT 999999
COLUMN PRICE FORMAT 99999999.99
COLUMN STOCK FORMAT 999999


-- =====================================================
-- ORDERS
-- =====================================================

COLUMN ORDER_ID FORMAT 999999
COLUMN ORDER_ITEM_ID FORMAT 999999
COLUMN QUANTITY FORMAT 999999
COLUMN STATUS FORMAT A20


-- =====================================================
-- PAYMENTS
-- =====================================================

COLUMN PAYMENT_ID FORMAT 999999
COLUMN PAYMENT_MODE FORMAT A20
COLUMN AMOUNT FORMAT 99999999.99


-- =====================================================
-- PURCHASES
-- =====================================================

COLUMN PURCHASE_ID FORMAT 999999


-- =====================================================
-- INVENTORY LOG
-- =====================================================

COLUMN LOG_ID FORMAT 999999
COLUMN OLD_STOCK FORMAT 999999
COLUMN NEW_STOCK FORMAT 999999


-- =====================================================
-- TO_CHAR() NUMBER FORMATTING
-- =====================================================

COLUMN CHARACTER FORMAT A20
COLUMN FORMATTED_PRICE FORMAT A20
COLUMN FORMATTED_SALARY FORMAT A20
COLUMN FORMATTED_AMOUNT FORMAT A20


-- =====================================================
-- TO_CHAR() DATE FORMATTING
-- =====================================================

COLUMN FORMATTED_DATE FORMAT A20
COLUMN FORMATTED_ORDER_DATE FORMAT A20
COLUMN FORMATTED_PAYMENT_DATE FORMAT A20
COLUMN FORMATTED_PURCHASE_DATE FORMAT A20
COLUMN FORMATTED_DATE_AND_TIME FORMAT A35
-- =====================================================
-- SPOOL OUTPUT
-- =====================================================

SPOOL 'F:\Exploring Technologies\OrcaleSqlPlusExploring\Oracle_Inventory_Sales_Management_System\Queries\03_Functions\03_Single_Row_Functions\03_CONVERSIONS_FUNCTIONS_OUTPUT.txt'
-- =====================================================
-- 03_CONVERSION_FUNCTIONS
-- Oracle 11g / SQL*Plus
-- Questions: Q381–Q430
-- =====================================================


-- =====================================================
-- CONCEPT 1 — TO_CHAR(NUMBER)
-- Syntax: TO_CHAR(number [, format_model])
-- Use: Converts NUMBER into character data.
-- Parameters: 1 or 2

--Important format models
--Format	Meaning
--9	      Digit position; leading blanks are allowed
--0	      Forces zero to be displayed
--9,999	      Adds comma grouping
--99,999.99   Commas + 2 decimal places
--L	      Currency symbol based on NLS settings
--$	      Dollar sign
--MI	      Negative sign at the end
--S	      Sign
--FM	      Removes unnecessary leading/trailing blanks

--
--DD,MM,MON,MONTH,YY,YYYY,DAY,DY,HH,HH24,MI,SS,AM,PM,FM

-- =====================================================

-- Q381. Display PRICE as character data.

SELECT PRICE,TO_CHAR(PRICE) AS CHARACTER FROM PRODUCTS;

-- Q382. Display SALARY as character data.

SELECT SALARY,TO_CHAR(SALARY) AS CHARACTER FROM EMPLOYEES;

-- Q383. Display PRICE formatted with two decimal places.

SELECT PRICE,TO_CHAR(PRICE,'99,999.99') FROM PRODUCTS;

-- Q384. Display PRICE with a currency symbol.

SELECT TO_CHAR(PRICE,'L99,999.99'),PRICE FROM PRODUCTS;

-- Q385. Display SALARY with comma separators.

SELECT TO_CHAR(SALARY, 'FM999,999') AS FORMATTED_SALARY,SALARY FROM EMPLOYEES;
-- =====================================================
-- CONCEPT 2 — TO_CHAR(DATE)
-- Syntax: TO_CHAR(date [, format_model])
-- Use: Converts DATE into formatted character data.
-- Parameters: 1 or 2
-- =====================================================

-- Q386. Display ORDER_DATE in DD-MM-YYYY format.

SELECT ORDER_DATE,TO_CHAR(ORDER_DATE,'DD-MM-YYYY') AS FORMATTED FROM ORDERS;

-- Q387. Display ORDER_DATE in DD/MM/YYYY format.

SELECT ORDER_DATE,TO_CHAR(ORDER_DATE,'DD/MM/YYYY') AS FORMATTED FROM ORDERS;

-- Q388. Display ORDER_DATE in YYYY-MM-DD format.

SELECT ORDER_DATE,TO_CHAR(ORDER_DATE,'YYYY-MM-DD') AS FORMATTED FROM ORDERS;

-- Q389. Display ORDER_DATE with month name.

SELECT ORDER_DATE,TO_CHAR(ORDER_DATE,'MONTH') AS FORMATTED FROM ORDERS;

-- Q390. Display ORDER_DATE with day name and month name.

SELECT ORDER_DATE,TO_CHAR(ORDER_DATE,'DAY,MONTH') AS FORMATTED FROM ORDERS;

-- Q391. Display PAYMENT_DATE in DD-MON-YYYY format.

SELECT PAYMENT_DATE,TO_CHAR(PAYMENT_DATE,'DD-MON-YYYY') AS FORMATTED FROM PAYMENTS;

-- Q392. Display PURCHASE_DATE in YYYY format.

SELECT PURCHASE_DATE,TO_CHAR(PURCHASE_DATE,'YYYY') AS FORMATTED FROM PURCHASES;

-- Q393. Display ORDER_ID and formatted ORDER_DATE.

SELECT ORDER_ID,TO_CHAR(ORDER_DATE,'DD-MM-YYYY') FROM ORDERS;

-- Q394. Display orders ordered by ORDER_DATE
-- but display the date in DD-MON-YYYY format.

SELECT ORDER_ID,CUSTOMER_ID,EMP_ID,TO_CHAR(ORDER_DATE,'DD-MON-YYYY') AS FORMATTED_ORDER_DATE,STATUS FROM ORDERS ORDER BY ORDER_DATE ASC;

-- Q395. Display ORDER_DATE with both date and time.

SELECT ORDER_DATE,TO_CHAR(ORDER_DATE,'DAY,DD-MM-YYYY,HH24:MI:SS') AS FORMATTED_DATE_AND_TIME FROM ORDERS;

-- =====================================================
-- CONCEPT 3 — TO_DATE()
-- Syntax: TO_DATE(character [, format_model])
-- Use: Converts character data into DATE.
-- Parameters: 1 or 2

/*Date
Format	Meaning	Example
DD	Day	17
MM	Month number	08
MON	Short month	AUG
MONTH	Full month	AUGUST
YY	2-digit year	26
YYYY	4-digit year	2026
RR	2-digit year / century handling	26
DY	Short day name	MON
DAY	Full day name	MONDAY
DDD	Day of year	229
Time
Format	Meaning	Example
HH	12-hour	02
HH12	12-hour	02
HH24	24-hour	14
MI	Minutes	35
SS	Seconds	20
AM / PM	AM/PM	PM

*/
-- =====================================================

-- Q396. Convert '15-08-2026' into a DATE.

SELECT TO_DATE('15-08-2026','DD-MM-YYYY') FROM DUAL;

-- Q397. Convert '2026-08-15' into a DATE.

SELECT TO_DATE('2026-08-15','YYYY-MM-DD') FROM DUAL;

-- Q398. Convert '15/08/2026' into a DATE.

SELECT TO_DATE('15/08/2026','DD/MM/YYYY') FROM DUAL;

-- Q399. Convert '15-AUG-2026' into a DATE.

SELECT TO_DATE('15-AUG-2026','DD-MON-YYYY') FROM DUAL;

-- Q400. Display orders whose ORDER_DATE is greater than
-- TO_DATE('01-01-2026','DD-MM-YYYY').

SELECT * FROM ORDERS WHERE ORDER_DATE>TO_DATE('01-01-2026','DD-MM-YYYY');

-- =====================================================
-- CONCEPT 4 — TO_NUMBER()
-- Syntax: TO_NUMBER(character [, format_model])
-- Use: Converts character data into NUMBER.
-- Parameters: 1 or 2
-- =====================================================

-- Q401. Convert '5000' into a number.

SELECT TO_NUMBER('5000') FROM DUAL;

-- Q402. Convert '1250.50' into a number.

SELECT TO_NUMBER('1250.50') FROM DUAL;

-- Q403. Convert '10000' into a number and add 500.

SELECT TO_NUMBER('10000')+500 FROM DUAL;

-- Q404. Convert '2500' into a number and multiply by 2.

SELECT TO_NUMBER('2500')*2 FROM DUAL;

-- Q405. Compare PRICE with TO_NUMBER('1000').

SELECT * FROM PRODUCTS WHERE PRICE>=TO_NUMBER('1000');
-- =====================================================
-- CONCEPT 5 — CONVERSION WITH WHERE
-- =====================================================

-- Q406. Display orders placed on 15-Aug-2026 by converting
-- the character date '15-08-2026' into a DATE using TO_DATE().

SELECT * FROM ORDERS WHERE ORDER_DATE=TO_DATE('15-08-2026','DD-MM-YYYY'); 

-- Q407. Display products whose PRICE is greater than
-- TO_NUMBER('500').

SELECT * FROM PRODUCTS WHERE PRICE>TO_NUMBER('500');

-- Q408. Display payments whose AMOUNT is greater than
-- TO_NUMBER('5000').

SELECT * FROM PAYMENTS WHERE AMOUNT>TO_NUMBER('5000');

-- Q409. Display orders whose ORDER_DATE is after
-- TO_DATE('01-01-2026','DD-MM-YYYY').

SELECT * FROM ORDERS WHERE ORDER_DATE>TO_DATE('01-01-2026','DD-MM-YYYY');

-- Q410. Display purchases whose PURCHASE_DATE is before
-- TO_DATE('01-07-2026','DD-MM-YYYY').

SELECT * FROM PURCHASES WHERE PURCHASE_DATE<TO_DATE('01-07-2026','DD-MM-YYYY');

-- =====================================================
-- CONCEPT 6 — CONVERSION WITH ORDER BY
-- =====================================================

-- Q411. Display orders ordered by ORDER_DATE
-- while displaying ORDER_DATE using TO_CHAR().

SELECT ORDER_ID,EMP_ID,CUSTOMER_ID,TO_CHAR(ORDER_DATE,'DD-MM-YYYY') AS FORMATTED_ORDER_DATE,STATUS FROM ORDERS ORDER BY ORDER_DATE ASC;

-- Q412. Display products ordered by PRICE
-- while displaying PRICE using TO_CHAR().

SELECT PRODUCT_ID,PRODUCT_NAME,CATEGORY_ID,SUPPLIER_ID,TO_CHAR(PRICE,'L99,999') AS FORMATTED_PRICE,STOCK FROM PRODUCTS ORDER BY PRICE ASC;

-- Q413. Display payments ordered by AMOUNT
-- while displaying AMOUNT as formatted character data.

SELECT PAYMENT_ID,ORDER_ID,PAYMENT_MODE,PAYMENT_DATE,TO_NUMBER(AMOUNT) AS FORMATTED_AMOUNT FROM PAYMENTS ORDER BY AMOUNT ASC;

-- Q414. Display employees ordered by SALARY
-- while displaying SALARY using TO_CHAR().

SELECT EMP_ID,EMP_NAME,DESIGNATION,TO_CHAR(SALARY,'L99,999') AS FORMATTED_SALARY  FROM EMPLOYEES ORDER BY SALARY ASC;

-- Q415. Display purchases ordered by PURCHASE_DATE
-- while displaying the date in DD-MON-YYYY format.

SELECT PURCHASE_ID,SUPPLIER_ID,PRODUCT_ID,QUANTITY,TO_DATE(PURCHASE_DATE,'DD-MON-YYYY') AS FORMATTED_PUR_DATE FROM PURCHASES ORDER BY PURCHASE_DATE ASC;

-- =====================================================
-- CONCEPT 7 — EXPLICIT VS IMPLICIT CONVERSION
-- =====================================================

-- Q416. Display products whose PRICE equals numeric value 1000.

SELECT * FROM PRODUCTS WHERE PRICE=1000;

-- Q417. Display products whose PRICE equals TO_NUMBER('1000').

SELECT * FROM PRODUCTS WHERE PRICE=TO_NUMBER('1000');

-- Q418. Display orders whose ORDER_DATE is after
-- TO_DATE('01-01-2026','DD-MM-YYYY').

SELECT * FROM ORDERS WHERE ORDER_DATE>TO_DATE('01-01-2026','DD-MM-YYYY');

-- Q419. Display ORDER_DATE using explicit TO_CHAR() conversion.

SELECT ORDER_DATE,TO_CHAR(ORDER_DATE,'DD-MM-YYYY') AS FORMATTED_DATE FROM ORDERS;

-- Q420. Display PRICE using explicit TO_CHAR() conversion.

SELECT PRICE,TO_CHAR(PRICE,'L99,999') AS FORMATTED_PRICE FROM PRODUCTS;

--=======================================================================================================================================================================
--END OF CONVERSIONS_FUNCTIONS
--=======================================================================================================================================================================

SPOOL OFF