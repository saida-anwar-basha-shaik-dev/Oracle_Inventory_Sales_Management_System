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

SPOOL 'F:\Exploring Technologies\OrcaleSqlPlusExploring\Oracle_Inventory_Sales_Management_System\Queries\03_Functions\03_Single_Row_Functions\03_DATE_FUNCTIONS_OUTPUT.txt'


-- =====================================================
-- 03_DATE_FUNCTIONS
-- Oracle 11g / SQL*Plus
-- Questions: Q331–Q380
-- =====================================================


-- =====================================================
-- CONCEPT 1 — SYSDATE
-- Syntax: SYSDATE
-- Use: Returns the current database server date and time.
-- Parameters: 0
-- =====================================================

-- Q331. Display the current system date.

SELECT SYSDATE FROM DUAL;

-- Q332. Display the current system date along with ORDER_ID.

SELECT SYSDATE,ORDER_ID FROM ORDERS;

-- Q333. Display ORDER_ID, ORDER_DATE and current system date.

SELECT ORDER_ID,ORDER_DATE,SYSDATE FROM ORDERS;

-- Q334. Display employees along with the current system date.

SELECT EMPLOYEES.*,SYSDATE FROM EMPLOYEES;

-- Q335. Display the current system date ordered by ORDER_DATE.

SELECT SYSDATE,ORDER_DATE FROM ORDERS ORDER BY ORDER_DATE ASC;

-- =====================================================
-- CONCEPT 2 — DATE ARITHMETIC
-- =====================================================

-- Q336. Display ORDER_DATE plus 7 days.

SELECT ORDER_DATE,ORDER_DATE+7 AS PLUS_7_DAYS FROM ORDERS;

-- Q337. Display ORDER_DATE minus 7 days.

SELECT ORDER_DATE,ORDER_DATE-7 AS MIN_7_DAYS FROM ORDERS;

-- Q338. Display PAYMENT_DATE plus 30 days.

SELECT PAYMENT_DATE,PAYMENT_DATE+30 AS PLUS_30_DAYS FROM PAYMENTS;

-- Q339. Display PURCHASE_DATE minus 15 days.

SELECT PURCHASE_DATE,PURCHASE_DATE-15 AS PUR_MIN_15 FROM PURCHASES;

-- Q340. Display ORDER_ID and the number of days since ORDER_DATE.

SELECT ORDER_ID,SYSDATE-ORDER_DATE AS NO_OF_DATES FROM ORDERS;

-- =====================================================
-- CONCEPT 3 — ADD_MONTHS()
-- Syntax: ADD_MONTHS(date, number_of_months)
-- Use: Adds months to a date.
-- Parameters: 2
-- =====================================================

-- Q341. Display ORDER_DATE after adding 1 month.

SELECT ORDER_DATE,ADD_MONTHS(ORDER_DATE,1) AS ADDING_1_MONTH FROM ORDERS;

-- Q342. Display ORDER_DATE after adding 3 months.

SELECT ORDER_DATE,ADD_MONTHS(ORDER_DATE,3) AS ADDING_3_MONTHS FROM ORDERS;

-- Q343. Display ORDER_ID and ORDER_DATE with 6 months added.

SELECT ORDER_ID,ADD_MONTHS(ORDER_DATE,6) AS ADDING_6_MONTHS FROM ORDERS;

-- Q344. Display orders whose ORDER_DATE plus 1 month is after the current date.

SELECT * FROM ORDERS WHERE ADD_MONTHS(ORDER_DATE,1)>SYSDATE;

-- Q345. Display PURCHASE_DATE after adding 12 months.

SELECT ADD_MONTHS(PURCHASE_DATE,12) AS ADDING_12_MONTHS FROM PURCHASES;

-- =====================================================
-- CONCEPT 4 — MONTHS_BETWEEN()
-- Syntax: MONTHS_BETWEEN(date1, date2)
-- Use: Returns the number of months between two dates.
-- Parameters: 2
-- =====================================================

-- Q346. Display the number of months between the current date and ORDER_DATE.

SELECT MONTHS_BETWEEN(SYSDATE,ORDER_DATE) FROM ORDERS;

-- Q347. Display ORDER_ID and months between current date and ORDER_DATE.

SELECT ORDER_ID,MONTHS_BETWEEN(SYSDATE,ORDER_DATE) FROM ORDERS;

-- Q348. Display payments whose PAYMENT_DATE is more than 1 month old.

SELECT * FROM PAYMENTS WHERE MONTHS_BETWEEN(SYSDATE,PAYMENT_DATE)>1;

-- Q349. Display purchases whose PURCHASE_DATE is more than 3 months old.

SELECT * FROM PURCHASES WHERE MONTHS_BETWEEN(SYSDATE,PURCHASE_DATE)>3;

-- Q350. Display orders ordered by months between current date and ORDER_DATE.

SELECT * FROM ORDERS ORDER BY MONTHS_BETWEEN(SYSDATE,ORDER_DATE) ASC;
-- =====================================================
-- CONCEPT 5 — NEXT_DAY()
-- Syntax: NEXT_DAY(date, weekday)
-- Use: Returns the date of the next specified weekday.
-- Parameters: 2
-- =====================================================

-- Q351. Display the next Monday from ORDER_DATE.

SELECT NEXT_DAY(ORDER_DATE,'MONDAY') FROM ORDERS;

-- Q352. Display the next Sunday from ORDER_DATE.

SELECT NEXT_DAY(ORDER_DATE,'SUNDAY') FROM ORDERS;

-- Q353. Display ORDER_ID and the next Monday after ORDER_DATE.

SELECT ORDER_ID,NEXT_DAY(ORDER_DATE,'MONDAY') FROM ORDERS;

-- Q354. Display PAYMENT_DATE and the next Friday.

SELECT PAYMENT_DATE,NEXT_DAY(PAYMENT_DATE,'FRIDAY') FROM PAYMENTS;

-- Q355. Display PURCHASE_DATE and the next Wednesday.

SELECT PURCHASE_DATE,NEXT_DAY(PURCHASE_DATE,'WEDNESDAY') FROM PURCHASES;

-- =====================================================
-- CONCEPT 6 — LAST_DAY()
-- Syntax: LAST_DAY(date)
-- Use: Returns the last day of the month containing the date.
-- Parameters: 1
-- =====================================================

-- Q356. Display the last day of the month for ORDER_DATE.

SELECT LAST_DAY(ORDER_DATE) FROM ORDERS;

-- Q357. Display the last day of the month for PAYMENT_DATE.

SELECT LAST_DAY(PAYMENT_DATE) FROM PAYMENTS;

-- Q358. Display ORDER_ID and the last day of its order month.

SELECT ORDER_ID,LAST_DAY(ORDER_DATE) FROM ORDERS;

-- Q359. Display orders whose ORDER_DATE is the last day of the month.

SELECT * FROM ORDERS WHERE ORDER_DATE=LAST_DAY(ORDER_DATE);

-- Q360. Display PURCHASE_DATE and its month's last day.

SELECT PURCHASE_DATE,LAST_DAY(PURCHASE_DATE) FROM PURCHASES;
-- =====================================================
-- CONCEPT 7 — ROUND(date)
-- Syntax: ROUND(date [, format]) 'MM','YYYY','YY'
-- Use: Rounds a date to a specified date unit.
-- Parameters: 1 or 2
-- =====================================================

-- Q361. Display ORDER_DATE rounded to the nearest month.

SELECT ORDER_DATE,ROUND(ORDER_DATE,'MM') FROM ORDERS;

-- Q362. Display ORDER_DATE rounded to the nearest year.

SELECT ORDER_DATE,ROUND(ORDER_DATE,'YYYY') FROM ORDERS;

-- Q363. Display PAYMENT_DATE rounded to the nearest month.

SELECT PAYMENT_DATE,ROUND(PAYMENT_DATE,'MM') FROM PAYMENTS;

-- Q364. Display ORDER_ID and rounded ORDER_DATE.

SELECT ORDER_ID,ROUND(ORDER_DATE,'MM') AS MONTH,ROUND(ORDER_DATE,'YYYY') AS YEAR FROM ORDERS;

-- Q365. Display PURCHASE_DATE rounded to the nearest year.
SELECT PURCHASE_DATE,ROUND(PURCHASE_DATE,'YYYY') FROM PURCHASES;

-- =====================================================
-- CONCEPT 8 — TRUNC(date)
-- Syntax: TRUNC(date [, format])
-- Use: Removes smaller date/time components.
-- Parameters: 1 or 2
-- =====================================================

-- Q366. Display ORDER_DATE truncated to the month.

SELECT ORDER_DATE,TRUNC(ORDER_DATE,'MM') AS MONTH FROM ORDERS;

-- Q367. Display ORDER_DATE truncated to the year.

SELECT ORDER_DATE,TRUNC(ORDER_DATE,'YYYY') AS YEAR FROM ORDERS;

-- Q368. Display PAYMENT_DATE truncated to the month.

SELECT PAYMENT_DATE,TRUNC(PAYMENT_DATE,'MM') AS MONTH FROM PAYMENTS;

-- Q369. Display ORDER_ID and ORDER_DATE truncated to the month.

SELECT ORDER_ID,ORDER_DATE,TRUNC(ORDER_DATE,'MM') AS MONTH FROM ORDERS;

-- Q370. Display PURCHASE_DATE truncated to the year.

SELECT PURCHASE_DATE,TRUNC(PURCHASE_DATE,'YYYY') AS YEAR FROM PURCHASES;
-- =====================================================
-- CONCEPT 9 — DATE FUNCTIONS WITH WHERE / ORDER BY
-- =====================================================

-- Q371. Display orders placed in the last 30 days.

SELECT * FROM ORDERS WHERE ORDER_DATE>=SYSDATE-30;

-- Q372. Display orders older than 30 days.

SELECT * FROM ORDERS WHERE SYSDATE-ORDER_DATE>30;

-- Q373. Display orders ordered by ORDER_DATE in ascending order.

SELECT * FROM ORDERS ORDER BY ORDER_DATE ASC;

-- Q374. Display orders ordered by ORDER_DATE in descending order.

SELECT * FROM ORDERS ORDER BY ORDER_DATE DESC;

-- Q375. Display orders whose ORDER_DATE is before the current date.

SELECT * FROM ORDERS WHERE ORDER_DATE<=SYSDATE;

-- Q376. Display payments made within the last 7 days.

SELECT * FROM PAYMENTS WHERE PAYMENT_DATE BETWEEN SYSDATE - 7 AND SYSDATE; 

-- Q377. Display purchases made more than 90 days ago.

SELECT * FROM PURCHASES WHERE SYSDATE-PURCHASE_DATE>90;

-- Q378. Display ORDER_ID, ORDER_DATE, LAST_DAY(ORDER_DATE).

SELECT ORDER_ID,ORDER_DATE,LAST_DAY(ORDER_DATE) AS LAST_DAY FROM ORDERS;

-- Q379. Display ORDER_ID, ORDER_DATE and ADD_MONTHS(ORDER_DATE,3).

SELECT ORDER_ID,ORDER_DATE,ADD_MONTHS(ORDER_DATE,3) AS ADDED_3_MONTHS FROM ORDERS;

-- Q380. Display ORDER_ID and number of months between ORDER_DATE and SYSDATE.

SELECT ORDER_ID,ORDER_DATE,MONTHS_BETWEEN(SYSDATE,ORDER_DATE) AS MONTHS_BETWEEN FROM ORDERS;

--=======================================================================================================================================================================
--END OF DATE_FUNCTIONS
--=======================================================================================================================================================================

SPOOL OFF