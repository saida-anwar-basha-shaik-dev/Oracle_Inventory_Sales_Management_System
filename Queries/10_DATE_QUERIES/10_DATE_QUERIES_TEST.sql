-- =====================================================
-- ORACLE SQL DATE QUERIES - RULES, SYNTAX & 100 QUESTIONS
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
COLUMN ORDER_DATE     FORMAT A12
COLUMN STATUS         FORMAT A20

COLUMN PAYMENT_ID     FORMAT 999999
COLUMN PAYMENT_MODE   FORMAT A20
COLUMN PAYMENT_DATE   FORMAT A12
COLUMN AMOUNT         FORMAT 99999999.99

COLUMN PURCHASE_ID    FORMAT 999999
COLUMN PURCHASE_DATE  FORMAT A12
COLUMN QUANTITY       FORMAT 999999

COLUMN LOG_ID         FORMAT 999999
COLUMN OLD_STOCK      FORMAT 999999
COLUMN NEW_STOCK      FORMAT 999999
COLUMN UPDATED_DATE   FORMAT A12


-- =====================================================
-- SPOOL OUTPUT
-- =====================================================

SPOOL 'F:\Exploring Technologies\OrcaleSqlPlusExploring\Oracle_Inventory_Sales_Management_System\Queries\10_DATE_QUERIES\10_DATE_QUERIES_TEST_OUTPUT.txt'


-- ============================================================
-- ORACLE SQL 11g
-- DATE QUERIES — COMPLETE TEST
-- ============================================================
-- Total Questions : 100
-- Difficulty      : Basic -> Intermediate -> Advanced
--
-- Topics Covered:
-- 1. SYSDATE
-- 2. Date literals
-- 3. TO_DATE
-- 4. TO_CHAR with dates
-- 5. Date arithmetic
-- 6. Date comparisons
-- 7. Date ranges
-- 8. ADD_MONTHS
-- 9. MONTHS_BETWEEN
-- 10. NEXT_DAY
-- 11. LAST_DAY
-- 12. TRUNC
-- 13. ROUND
-- 14. EXTRACT
-- 15. Date + CASE
-- 16. Date + GROUP BY
-- 17. Date + aggregate functions
-- 18. Date + JOIN
-- 19. Date calculations
-- 20. Interview-style date queries
-- =====================================================


-- =====================================================
-- DATE FUNCTIONS
-- =====================================================

-- SYSDATE
-- Returns the current database server date and time.

-- TO_DATE
-- Converts character data into DATE.

-- TO_CHAR
-- Converts DATE into character format.

-- ADD_MONTHS
-- Adds or subtracts months from a date.

-- MONTHS_BETWEEN
-- Returns the number of months between two dates.

-- NEXT_DAY
-- Returns the next specified weekday after a date.

-- LAST_DAY
-- Returns the last day of the month.

-- TRUNC
-- Removes time/date components depending on the format.

-- ROUND
-- Rounds a date to a specified unit.

-- EXTRACT
-- Extracts YEAR, MONTH, DAY, etc. from a date.


-- =====================================================
-- BASIC SYNTAX
-- =====================================================

-- SELECT SYSDATE FROM DUAL;

-- SELECT TO_DATE('22-08-2026','DD-MM-YYYY') FROM DUAL;

-- SELECT TO_CHAR(ORDER_DATE,'DD-MM-YYYY') FROM ORDERS;

-- SELECT ORDER_DATE + 7 FROM ORDERS;

-- SELECT ORDER_DATE - 7 FROM ORDERS;

-- SELECT ADD_MONTHS(ORDER_DATE,3) FROM ORDERS;

-- SELECT MONTHS_BETWEEN(SYSDATE,ORDER_DATE) FROM ORDERS;

-- SELECT NEXT_DAY(ORDER_DATE,'MONDAY') FROM ORDERS;

-- SELECT LAST_DAY(ORDER_DATE) FROM ORDERS;

-- SELECT TRUNC(ORDER_DATE,'MONTH') FROM ORDERS;

-- SELECT ROUND(ORDER_DATE,'MONTH') FROM ORDERS;

-- SELECT EXTRACT(YEAR FROM ORDER_DATE) FROM ORDERS;


-- =====================================================
-- DATE RULES
-- =====================================================

-- RULE 01: Oracle DATE stores date and time information.
-- RULE 02: SYSDATE returns the current database server date/time.
-- RULE 03: DATE + NUMBER adds days.
-- RULE 04: DATE - NUMBER subtracts days.
-- RULE 05: DATE - DATE returns the difference in days.
-- RULE 06: Use TO_DATE when converting strings into dates.
-- RULE 07: Use TO_CHAR when displaying dates in a specific format.
-- RULE 08: Always specify the format mask with TO_DATE when possible.
-- RULE 09: ADD_MONTHS is used to add or subtract months.
-- RULE 10: MONTHS_BETWEEN returns the difference in months.
-- RULE 11: LAST_DAY returns the last day of a month.
-- RULE 12: NEXT_DAY returns the next occurrence of a weekday.
-- RULE 13: TRUNC(date,'MONTH') returns the first day of the month.
-- RULE 14: TRUNC(date,'YEAR') returns the first day of the year.
-- RULE 15: EXTRACT can retrieve year, month and day.
-- RULE 16: BETWEEN is inclusive at both ends.
-- RULE 17: SYSDATE is useful for relative date filtering.
-- RULE 18: Date literals use DATE 'YYYY-MM-DD'.
-- RULE 19: Avoid comparing DATE values with ambiguous character strings.
-- RULE 20: For date/time ranges, understand that Oracle DATE includes time.


-- =====================================================
-- LEVEL 1: SYSDATE & BASIC DATE OPERATIONS
-- Q01-Q15
-- =====================================================

-- Q01. Display the current database date.
SELECT SYSDATE AS CURRENT_DATE
FROM DUAL;


-- Q02. Display the current date and time.
SELECT SYSDATE AS CURRENT_DATE_TIME
FROM DUAL;


-- Q03. Display today's date in DD-MM-YYYY format.
SELECT TO_CHAR(SYSDATE,'DD-MM-YYYY') AS TODAY
FROM DUAL;


-- Q04. Display the current year.
SELECT TO_CHAR(SYSDATE,'YYYY') AS CURRENT_YEAR
FROM DUAL;


-- Q05. Display the current month number.
SELECT TO_CHAR(SYSDATE,'MM') AS CURRENT_MONTH
FROM DUAL;


-- Q06. Display the current month name.
SELECT TO_CHAR(SYSDATE,'MONTH') AS MONTH_NAME
FROM DUAL;


-- Q07. Display the current day name.
SELECT TO_CHAR(SYSDATE,'DAY') AS DAY_NAME
FROM DUAL;


-- Q08. Display today's date and the date after 7 days.
SELECT SYSDATE AS TODAY,
       SYSDATE + 7 AS AFTER_7_DAYS
FROM DUAL;


-- Q09. Display today's date and the date before 7 days.
SELECT SYSDATE AS TODAY,
       SYSDATE - 7 AS BEFORE_7_DAYS
FROM DUAL;


-- Q10. Display the date after 30 days.
SELECT SYSDATE + 30 AS AFTER_30_DAYS
FROM DUAL;


-- Q11. Display the date before 30 days.
SELECT SYSDATE - 30 AS BEFORE_30_DAYS
FROM DUAL;


-- Q12. Display the date after 1 year.
SELECT ADD_MONTHS(SYSDATE,12) AS AFTER_1_YEAR
FROM DUAL;


-- Q13. Display the date before 1 year.
SELECT ADD_MONTHS(SYSDATE,-12) AS BEFORE_1_YEAR
FROM DUAL;


-- Q14. Display today's date and the last day of this month.
SELECT SYSDATE AS TODAY,
       LAST_DAY(SYSDATE) AS MONTH_END
FROM DUAL;


-- Q15. Display the first day and last day of the current month.
SELECT TRUNC(SYSDATE,'MONTH') AS MONTH_START,
       LAST_DAY(SYSDATE) AS MONTH_END
FROM DUAL;


-- =====================================================
-- LEVEL 2: TO_DATE / TO_CHAR
-- Q16-Q30
-- =====================================================

-- Q16. Convert 15-01-2025 into an Oracle DATE.
SELECT TO_DATE('15-01-2025','DD-MM-YYYY') AS CONVERTED_DATE
FROM DUAL;


-- Q17. Convert 25-12-2025 into an Oracle DATE.
SELECT TO_DATE('25-12-2025','DD-MM-YYYY') AS CHRISTMAS_DATE
FROM DUAL;


-- Q18. Display order date in DD-MM-YYYY format.
SELECT ORDER_ID,
       TO_CHAR(ORDER_DATE,'DD-MM-YYYY') AS FORMATTED_DATE
FROM ORDERS;


-- Q19. Display order date in DD-MON-YYYY format.
SELECT ORDER_ID,
       TO_CHAR(ORDER_DATE,'DD-MON-YYYY') AS FORMATTED_DATE
FROM ORDERS;


-- Q20. Display order date with month name.
SELECT ORDER_ID,
       TO_CHAR(ORDER_DATE,'DD MONTH YYYY') AS FORMATTED_DATE
FROM ORDERS;


-- Q21. Display order date with day name.
SELECT ORDER_ID,
       TO_CHAR(ORDER_DATE,'DD-MM-YYYY DAY') AS ORDER_DAY
FROM ORDERS;


-- Q22. Display payment date in DD-MM-YYYY format.
SELECT PAYMENT_ID,
       TO_CHAR(PAYMENT_DATE,'DD-MM-YYYY') AS PAYMENT_DATE
FROM PAYMENTS;


-- Q23. Display purchase date with month name.
SELECT PURCHASE_ID,
       TO_CHAR(PURCHASE_DATE,'DD MONTH YYYY') AS PURCHASE_DATE
FROM PURCHASES;


-- Q24. Display inventory update date with day name.
SELECT LOG_ID,
       TO_CHAR(UPDATED_DATE,'DD-MM-YYYY DAY') AS UPDATED_DATE
FROM INVENTORY_LOG;


-- Q25. Display order year.
SELECT ORDER_ID,
       TO_CHAR(ORDER_DATE,'YYYY') AS ORDER_YEAR
FROM ORDERS;


-- Q26. Display order month number.
SELECT ORDER_ID,
       TO_CHAR(ORDER_DATE,'MM') AS ORDER_MONTH
FROM ORDERS;


-- Q27. Display order month name.
SELECT ORDER_ID,
       TO_CHAR(ORDER_DATE,'MONTH') AS ORDER_MONTH
FROM ORDERS;


-- Q28. Display order day number.
SELECT ORDER_ID,
       TO_CHAR(ORDER_DATE,'DD') AS ORDER_DAY
FROM ORDERS;


-- Q29. Display order quarter.
SELECT ORDER_ID,
       TO_CHAR(ORDER_DATE,'Q') AS ORDER_QUARTER
FROM ORDERS;


-- Q30. Display order date in YYYY/MM/DD format.
SELECT ORDER_ID,
       TO_CHAR(ORDER_DATE,'YYYY/MM/DD') AS ORDER_DATE
FROM ORDERS;


-- =====================================================
-- LEVEL 3: DATE ARITHMETIC
-- Q31-Q45
-- =====================================================

-- Q31. Display orders and the date 10 days after each order.
SELECT ORDER_ID,
       ORDER_DATE,
       ORDER_DATE + 10 AS AFTER_10_DAYS
FROM ORDERS;


-- Q32. Display orders and the date 10 days before each order.
SELECT ORDER_ID,
       ORDER_DATE,
       ORDER_DATE - 10 AS BEFORE_10_DAYS
FROM ORDERS;


-- Q33. Find how many days have passed since each order.
SELECT ORDER_ID,
       ORDER_DATE,
       SYSDATE - ORDER_DATE AS DAYS_PASSED
FROM ORDERS;


-- Q34. Find how many days have passed since each payment.
SELECT PAYMENT_ID,
       PAYMENT_DATE,
       SYSDATE - PAYMENT_DATE AS DAYS_PASSED
FROM PAYMENTS;


-- Q35. Find how many days have passed since each purchase.
SELECT PURCHASE_ID,
       PURCHASE_DATE,
       SYSDATE - PURCHASE_DATE AS DAYS_PASSED
FROM PURCHASES;


-- Q36. Display expected date 30 days after each order.
SELECT ORDER_ID,
       ORDER_DATE,
       ORDER_DATE + 30 AS EXPECTED_DATE
FROM ORDERS;


-- Q37. Display payment due date as 15 days after order date.
SELECT ORDER_ID,
       ORDER_DATE,
       ORDER_DATE + 15 AS PAYMENT_DUE_DATE
FROM ORDERS;


-- Q38. Display order date and 3 months after order date.
SELECT ORDER_ID,
       ORDER_DATE,
       ADD_MONTHS(ORDER_DATE,3) AS AFTER_3_MONTHS
FROM ORDERS;


-- Q39. Display order date and 6 months before order date.
SELECT ORDER_ID,
       ORDER_DATE,
       ADD_MONTHS(ORDER_DATE,-6) AS BEFORE_6_MONTHS
FROM ORDERS;


-- Q40. Display purchase date and one year after purchase.
SELECT PURCHASE_ID,
       PURCHASE_DATE,
       ADD_MONTHS(PURCHASE_DATE,12) AS NEXT_YEAR
FROM PURCHASES;


-- Q41. Display payment date and one month after payment.
SELECT PAYMENT_ID,
       PAYMENT_DATE,
       ADD_MONTHS(PAYMENT_DATE,1) AS NEXT_MONTH
FROM PAYMENTS;


-- Q42. Calculate the number of days between order date and payment date.
SELECT O.ORDER_ID,
       O.ORDER_DATE,
       P.PAYMENT_DATE,
       P.PAYMENT_DATE - O.ORDER_DATE AS DAYS_TO_PAYMENT
FROM ORDERS O
JOIN PAYMENTS P
ON O.ORDER_ID = P.ORDER_ID;


-- Q43. Calculate the number of days between purchase date and today.
SELECT PURCHASE_ID,
       PURCHASE_DATE,
       SYSDATE - PURCHASE_DATE AS DAYS_SINCE_PURCHASE
FROM PURCHASES;


-- Q44. Find the number of days between inventory update and today.
SELECT LOG_ID,
       UPDATED_DATE,
       SYSDATE - UPDATED_DATE AS DAYS_SINCE_UPDATE
FROM INVENTORY_LOG;


-- Q45. Display an order date and its 90-day follow-up date.
SELECT ORDER_ID,
       ORDER_DATE,
       ORDER_DATE + 90 AS FOLLOW_UP_DATE
FROM ORDERS;


-- =====================================================
-- LEVEL 4: DATE COMPARISON & FILTERING
-- Q46-Q60
-- =====================================================

-- Q46. Find orders placed after 01-01-2025.
SELECT ORDER_ID,
       ORDER_DATE
FROM ORDERS
WHERE ORDER_DATE > TO_DATE('01-01-2025','DD-MM-YYYY');


-- Q47. Find orders placed before 01-01-2025.
SELECT ORDER_ID,
       ORDER_DATE
FROM ORDERS
WHERE ORDER_DATE < TO_DATE('01-01-2025','DD-MM-YYYY');


-- Q48. Find orders placed on or after 01-01-2025.
SELECT ORDER_ID,
       ORDER_DATE
FROM ORDERS
WHERE ORDER_DATE >= TO_DATE('01-01-2025','DD-MM-YYYY');


-- Q49. Find orders placed between 01-01-2025 and 31-12-2025.
SELECT ORDER_ID,
       ORDER_DATE
FROM ORDERS
WHERE ORDER_DATE BETWEEN
      TO_DATE('01-01-2025','DD-MM-YYYY')
      AND
      TO_DATE('31-12-2025','DD-MM-YYYY');


-- Q50. Find payments made after 01-01-2025.
SELECT PAYMENT_ID,
       PAYMENT_DATE,
       AMOUNT
FROM PAYMENTS
WHERE PAYMENT_DATE > TO_DATE('01-01-2025','DD-MM-YYYY');


-- Q51. Find purchases made during 2025.
SELECT PURCHASE_ID,
       PURCHASE_DATE
FROM PURCHASES
WHERE PURCHASE_DATE BETWEEN
      TO_DATE('01-01-2025','DD-MM-YYYY')
      AND
      TO_DATE('31-12-2025','DD-MM-YYYY');


-- Q52. Find orders from the current year.
SELECT ORDER_ID,
       ORDER_DATE
FROM ORDERS
WHERE EXTRACT(YEAR FROM ORDER_DATE) =
      EXTRACT(YEAR FROM SYSDATE);


-- Q53. Find orders from the current month.
SELECT ORDER_ID,
       ORDER_DATE
FROM ORDERS
WHERE EXTRACT(YEAR FROM ORDER_DATE) =
      EXTRACT(YEAR FROM SYSDATE)
AND EXTRACT(MONTH FROM ORDER_DATE) =
      EXTRACT(MONTH FROM SYSDATE);


-- Q54. Find orders from January.
SELECT ORDER_ID,
       ORDER_DATE
FROM ORDERS
WHERE EXTRACT(MONTH FROM ORDER_DATE) = 1;


-- Q55. Find orders placed on Sunday.
SELECT ORDER_ID,
       ORDER_DATE
FROM ORDERS
WHERE TO_CHAR(ORDER_DATE,'DAY','NLS_DATE_LANGUAGE=ENGLISH')
      LIKE 'SUNDAY%';


-- Q56. Find orders placed on Monday.
SELECT ORDER_ID,
       ORDER_DATE
FROM ORDERS
WHERE TO_CHAR(ORDER_DATE,'DAY','NLS_DATE_LANGUAGE=ENGLISH')
      LIKE 'MONDAY%';


-- Q57. Find payments made in the current year.
SELECT PAYMENT_ID,
       PAYMENT_DATE,
       AMOUNT
FROM PAYMENTS
WHERE EXTRACT(YEAR FROM PAYMENT_DATE) =
      EXTRACT(YEAR FROM SYSDATE);


-- Q58. Find purchases made in the current year.
SELECT PURCHASE_ID,
       PURCHASE_DATE,
       QUANTITY
FROM PURCHASES
WHERE EXTRACT(YEAR FROM PURCHASE_DATE) =
      EXTRACT(YEAR FROM SYSDATE);


-- Q59. Find inventory logs updated in the current year.
SELECT LOG_ID,
       UPDATED_DATE
FROM INVENTORY_LOG
WHERE EXTRACT(YEAR FROM UPDATED_DATE) =
      EXTRACT(YEAR FROM SYSDATE);


-- Q60. Find orders placed in the last 30 days.
SELECT ORDER_ID,
       ORDER_DATE
FROM ORDERS
WHERE ORDER_DATE >= SYSDATE - 30;


-- =====================================================
-- LEVEL 5: ADD_MONTHS / MONTHS_BETWEEN
-- Q61-Q70
-- =====================================================

-- Q61. Display three months after every order date.
SELECT ORDER_ID,
       ORDER_DATE,
       ADD_MONTHS(ORDER_DATE,3) AS AFTER_3_MONTHS
FROM ORDERS;


-- Q62. Display six months after every purchase date.
SELECT PURCHASE_ID,
       PURCHASE_DATE,
       ADD_MONTHS(PURCHASE_DATE,6) AS AFTER_6_MONTHS
FROM PURCHASES;


-- Q63. Display one year after every payment date.
SELECT PAYMENT_ID,
       PAYMENT_DATE,
       ADD_MONTHS(PAYMENT_DATE,12) AS AFTER_1_YEAR
FROM PAYMENTS;


-- Q64. Display three months before every order date.
SELECT ORDER_ID,
       ORDER_DATE,
       ADD_MONTHS(ORDER_DATE,-3) AS BEFORE_3_MONTHS
FROM ORDERS;


-- Q65. Find the number of months between each order and today.
SELECT ORDER_ID,
       ORDER_DATE,
       MONTHS_BETWEEN(SYSDATE,ORDER_DATE) AS MONTHS_PASSED
FROM ORDERS;


-- Q66. Find the number of months between purchase date and today.
SELECT PURCHASE_ID,
       PURCHASE_DATE,
       MONTHS_BETWEEN(SYSDATE,PURCHASE_DATE) AS MONTHS_PASSED
FROM PURCHASES;


-- Q67. Find the number of months between payment date and today.
SELECT PAYMENT_ID,
       PAYMENT_DATE,
       MONTHS_BETWEEN(SYSDATE,PAYMENT_DATE) AS MONTHS_PASSED
FROM PAYMENTS;


-- Q68. Find orders older than 6 months.
SELECT ORDER_ID,
       ORDER_DATE
FROM ORDERS
WHERE MONTHS_BETWEEN(SYSDATE,ORDER_DATE) > 6;


-- Q69. Find purchases older than 12 months.
SELECT PURCHASE_ID,
       PURCHASE_DATE
FROM PURCHASES
WHERE MONTHS_BETWEEN(SYSDATE,PURCHASE_DATE) > 12;


-- Q70. Find orders placed within the last 12 months.
SELECT ORDER_ID,
       ORDER_DATE
FROM ORDERS
WHERE MONTHS_BETWEEN(SYSDATE,ORDER_DATE) BETWEEN 0 AND 12;


-- =====================================================
-- LEVEL 6: LAST_DAY / NEXT_DAY / TRUNC / ROUND
-- Q71-Q80
-- =====================================================

-- Q71. Find the last day of the month for every order.
SELECT ORDER_ID,
       ORDER_DATE,
       LAST_DAY(ORDER_DATE) AS MONTH_END
FROM ORDERS;


-- Q72. Find the first day of the month for every order.
SELECT ORDER_ID,
       ORDER_DATE,
       TRUNC(ORDER_DATE,'MONTH') AS MONTH_START
FROM ORDERS;


-- Q73. Find the first day of the year for every order.
SELECT ORDER_ID,
       ORDER_DATE,
       TRUNC(ORDER_DATE,'YEAR') AS YEAR_START
FROM ORDERS;


-- Q74. Find the last day of the month for every payment.
SELECT PAYMENT_ID,
       PAYMENT_DATE,
       LAST_DAY(PAYMENT_DATE) AS MONTH_END
FROM PAYMENTS;


-- Q75. Find the first day of the month for every purchase.
SELECT PURCHASE_ID,
       PURCHASE_DATE,
       TRUNC(PURCHASE_DATE,'MONTH') AS MONTH_START
FROM PURCHASES;


-- Q76. Find the next Monday after each order.
SELECT ORDER_ID,
       ORDER_DATE,
       NEXT_DAY(ORDER_DATE,'MONDAY') AS NEXT_MONDAY
FROM ORDERS;


-- Q77. Find the next Sunday after each order.
SELECT ORDER_ID,
       ORDER_DATE,
       NEXT_DAY(ORDER_DATE,'SUNDAY') AS NEXT_SUNDAY
FROM ORDERS;


-- Q78. Round order dates to the nearest month.
SELECT ORDER_ID,
       ORDER_DATE,
       ROUND(ORDER_DATE,'MONTH') AS ROUNDED_MONTH
FROM ORDERS;


-- Q79. Round order dates to the nearest year.
SELECT ORDER_ID,
       ORDER_DATE,
       ROUND(ORDER_DATE,'YEAR') AS ROUNDED_YEAR
FROM ORDERS;


-- Q80. Find orders from the current month using TRUNC.
SELECT ORDER_ID,
       ORDER_DATE
FROM ORDERS
WHERE ORDER_DATE >= TRUNC(SYSDATE,'MONTH')
AND ORDER_DATE < ADD_MONTHS(TRUNC(SYSDATE,'MONTH'),1);


-- =====================================================
-- LEVEL 7: EXTRACT / DATE PARTS
-- Q81-Q88
-- =====================================================

-- Q81. Display order year and month.
SELECT ORDER_ID,
       EXTRACT(YEAR FROM ORDER_DATE) AS ORDER_YEAR,
       EXTRACT(MONTH FROM ORDER_DATE) AS ORDER_MONTH
FROM ORDERS;


-- Q82. Display order year, month and day.
SELECT ORDER_ID,
       EXTRACT(YEAR FROM ORDER_DATE) AS ORDER_YEAR,
       EXTRACT(MONTH FROM ORDER_DATE) AS ORDER_MONTH,
       EXTRACT(DAY FROM ORDER_DATE) AS ORDER_DAY
FROM ORDERS;


-- Q83. Count orders by year.
SELECT EXTRACT(YEAR FROM ORDER_DATE) AS ORDER_YEAR,
       COUNT(*) AS ORDER_COUNT
FROM ORDERS
GROUP BY EXTRACT(YEAR FROM ORDER_DATE)
ORDER BY ORDER_YEAR;


-- Q84. Count orders by month number.
SELECT EXTRACT(MONTH FROM ORDER_DATE) AS ORDER_MONTH,
       COUNT(*) AS ORDER_COUNT
FROM ORDERS
GROUP BY EXTRACT(MONTH FROM ORDER_DATE)
ORDER BY ORDER_MONTH;


-- Q85. Find total payment amount by year.
SELECT EXTRACT(YEAR FROM PAYMENT_DATE) AS PAYMENT_YEAR,
       SUM(AMOUNT) AS TOTAL_AMOUNT
FROM PAYMENTS
GROUP BY EXTRACT(YEAR FROM PAYMENT_DATE)
ORDER BY PAYMENT_YEAR;


-- Q86. Find total purchase quantity by year.
SELECT EXTRACT(YEAR FROM PURCHASE_DATE) AS PURCHASE_YEAR,
       SUM(QUANTITY) AS TOTAL_QUANTITY
FROM PURCHASES
GROUP BY EXTRACT(YEAR FROM PURCHASE_DATE)
ORDER BY PURCHASE_YEAR;


-- Q87. Find the number of orders placed on each day of the month.
SELECT EXTRACT(DAY FROM ORDER_DATE) AS ORDER_DAY,
       COUNT(*) AS ORDER_COUNT
FROM ORDERS
GROUP BY EXTRACT(DAY FROM ORDER_DATE)
ORDER BY ORDER_DAY;


-- Q88. Find total payments by month.
SELECT EXTRACT(MONTH FROM PAYMENT_DATE) AS PAYMENT_MONTH,
       SUM(AMOUNT) AS TOTAL_AMOUNT
FROM PAYMENTS
GROUP BY EXTRACT(MONTH FROM PAYMENT_DATE)
ORDER BY PAYMENT_MONTH;


-- =====================================================
-- LEVEL 8: DATE + CASE
-- Q89-Q94
-- =====================================================

-- Q89. Classify orders as OLD or RECENT based on order date.
SELECT ORDER_ID,
       ORDER_DATE,
       CASE
           WHEN ORDER_DATE >= SYSDATE - 30 THEN 'RECENT'
           ELSE 'OLD'
       END AS ORDER_AGE
FROM ORDERS;


-- Q90. Classify orders by age.
SELECT ORDER_ID,
       ORDER_DATE,
       CASE
           WHEN SYSDATE - ORDER_DATE <= 30 THEN '0-30 DAYS'
           WHEN SYSDATE - ORDER_DATE <= 90 THEN '31-90 DAYS'
           WHEN SYSDATE - ORDER_DATE <= 180 THEN '91-180 DAYS'
           ELSE '180+ DAYS'
       END AS ORDER_AGE
FROM ORDERS;


-- Q91. Classify payments as recent or old.
SELECT PAYMENT_ID,
       PAYMENT_DATE,
       CASE
           WHEN PAYMENT_DATE >= SYSDATE - 30 THEN 'RECENT'
           ELSE 'OLD'
       END AS PAYMENT_AGE
FROM PAYMENTS;


-- Q92. Classify purchases based on age.
SELECT PURCHASE_ID,
       PURCHASE_DATE,
       CASE
           WHEN PURCHASE_DATE >= SYSDATE - 30 THEN 'RECENT'
           WHEN PURCHASE_DATE >= SYSDATE - 90 THEN 'MEDIUM'
           ELSE 'OLD'
       END AS PURCHASE_AGE
FROM PURCHASES;


-- Q93. Classify inventory logs based on update age.
SELECT LOG_ID,
       UPDATED_DATE,
       CASE
           WHEN UPDATED_DATE >= SYSDATE - 7 THEN 'RECENT'
           WHEN UPDATED_DATE >= SYSDATE - 30 THEN 'OLD'
           ELSE 'VERY OLD'
       END AS LOG_AGE
FROM INVENTORY_LOG;


-- Q94. Classify orders by quarter.
SELECT ORDER_ID,
       ORDER_DATE,
       CASE
           WHEN EXTRACT(MONTH FROM ORDER_DATE) BETWEEN 1 AND 3
           THEN 'Q1'
           WHEN EXTRACT(MONTH FROM ORDER_DATE) BETWEEN 4 AND 6
           THEN 'Q2'
           WHEN EXTRACT(MONTH FROM ORDER_DATE) BETWEEN 7 AND 9
           THEN 'Q3'
           ELSE 'Q4'
       END AS ORDER_QUARTER
FROM ORDERS;


-- =====================================================
-- LEVEL 9: DATE + JOIN + GROUP BY
-- Q95-Q98
-- =====================================================

-- Q95. Find total sales by order year.
SELECT EXTRACT(YEAR FROM O.ORDER_DATE) AS ORDER_YEAR,
       SUM(OI.QUANTITY * OI.PRICE) AS TOTAL_SALES
FROM ORDERS O
JOIN ORDER_ITEMS OI
ON O.ORDER_ID = OI.ORDER_ID
GROUP BY EXTRACT(YEAR FROM O.ORDER_DATE)
ORDER BY ORDER_YEAR;


-- Q96. Find total orders by customer and order year.
SELECT C.CUSTOMER_NAME,
       EXTRACT(YEAR FROM O.ORDER_DATE) AS ORDER_YEAR,
       COUNT(O.ORDER_ID) AS TOTAL_ORDERS
FROM CUSTOMERS C
JOIN ORDERS O
ON C.CUSTOMER_ID = O.CUSTOMER_ID
GROUP BY C.CUSTOMER_NAME,
         EXTRACT(YEAR FROM O.ORDER_DATE)
ORDER BY C.CUSTOMER_NAME,
         ORDER_YEAR;


-- Q97. Find total payment amount by customer and payment year.
SELECT C.CUSTOMER_NAME,
       EXTRACT(YEAR FROM PM.PAYMENT_DATE) AS PAYMENT_YEAR,
       SUM(PM.AMOUNT) AS TOTAL_PAID
FROM CUSTOMERS C
JOIN ORDERS O
ON C.CUSTOMER_ID = O.CUSTOMER_ID
JOIN PAYMENTS PM
ON O.ORDER_ID = PM.ORDER_ID
GROUP BY C.CUSTOMER_NAME,
         EXTRACT(YEAR FROM PM.PAYMENT_DATE)
ORDER BY C.CUSTOMER_NAME,
         PAYMENT_YEAR;


-- Q98. Find monthly sales value.
SELECT TRUNC(O.ORDER_DATE,'MONTH') AS SALES_MONTH,
       SUM(OI.QUANTITY * OI.PRICE) AS TOTAL_SALES
FROM ORDERS O
JOIN ORDER_ITEMS OI
ON O.ORDER_ID = OI.ORDER_ID
GROUP BY TRUNC(O.ORDER_DATE,'MONTH')
ORDER BY SALES_MONTH;


-- =====================================================
-- LEVEL 10: INTERVIEW-STYLE DATE QUERIES
-- Q99-Q100
-- =====================================================

-- Q99. Find the latest order date.
SELECT MAX(ORDER_DATE) AS LATEST_ORDER_DATE
FROM ORDERS;


-- Q100. Find the customer who placed the most recent order.
SELECT C.CUSTOMER_ID,
       C.CUSTOMER_NAME,
       O.ORDER_ID,
       O.ORDER_DATE
FROM CUSTOMERS C
JOIN ORDERS O
ON C.CUSTOMER_ID = O.CUSTOMER_ID
WHERE O.ORDER_DATE =
      (SELECT MAX(ORDER_DATE)
       FROM ORDERS);


-- =====================================================
-- PRACTICE ORDER
-- =====================================================

-- Q01-Q15   : SYSDATE & BASIC DATE OPERATIONS
-- Q16-Q30   : TO_DATE / TO_CHAR
-- Q31-Q45   : DATE ARITHMETIC
-- Q46-Q60   : DATE COMPARISON & FILTERING
-- Q61-Q70   : ADD_MONTHS / MONTHS_BETWEEN
-- Q71-Q80   : LAST_DAY / NEXT_DAY / TRUNC / ROUND
-- Q81-Q88   : EXTRACT / DATE PARTS
-- Q89-Q94   : DATE + CASE
-- Q95-Q98   : DATE + JOIN + GROUP BY
-- Q99-Q100  : INTERVIEW-STYLE DATE QUERIES


-- =====================================================
-- IMPORTANT DATE FORMULAS
-- =====================================================

-- CURRENT DATE
-- SYSDATE


-- CONVERT STRING TO DATE
-- TO_DATE('22-08-2026','DD-MM-YYYY')


-- CONVERT DATE TO STRING
-- TO_CHAR(ORDER_DATE,'DD-MM-YYYY')


-- ADD DAYS
-- ORDER_DATE + 10


-- SUBTRACT DAYS
-- ORDER_DATE - 10


-- DIFFERENCE BETWEEN TWO DATES
-- DATE1 - DATE2


-- ADD MONTHS
-- ADD_MONTHS(ORDER_DATE,3)


-- SUBTRACT MONTHS
-- ADD_MONTHS(ORDER_DATE,-3)


-- MONTH DIFFERENCE
-- MONTHS_BETWEEN(SYSDATE,ORDER_DATE)


-- FIRST DAY OF MONTH
-- TRUNC(ORDER_DATE,'MONTH')


-- LAST DAY OF MONTH
-- LAST_DAY(ORDER_DATE)


-- FIRST DAY OF YEAR
-- TRUNC(ORDER_DATE,'YEAR')


-- NEXT WEEKDAY
-- NEXT_DAY(ORDER_DATE,'MONDAY')


-- EXTRACT YEAR
-- EXTRACT(YEAR FROM ORDER_DATE)


-- EXTRACT MONTH
-- EXTRACT(MONTH FROM ORDER_DATE)


-- EXTRACT DAY
-- EXTRACT(DAY FROM ORDER_DATE)


-- CURRENT MONTH RANGE
-- ORDER_DATE >= TRUNC(SYSDATE,'MONTH')
-- AND ORDER_DATE < ADD_MONTHS(TRUNC(SYSDATE,'MONTH'),1)


-- LAST 30 DAYS
-- ORDER_DATE >= SYSDATE - 30


-- LAST 90 DAYS
-- ORDER_DATE >= SYSDATE - 90


-- =====================================================
-- IMPORTANT ORACLE DATE NOTES
-- =====================================================

-- 1. DATE stores both date and time.
-- 2. SYSDATE depends on the database server's date/time.
-- 3. DATE + 1 means one day later.
-- 4. DATE - 1 means one day earlier.
-- 5. DATE1 - DATE2 gives the difference in days.
-- 6. Use TO_DATE for string-to-date conversion.
-- 7. Use TO_CHAR for date formatting.
-- 8. Use DATE 'YYYY-MM-DD' for ANSI date literals.
-- 9. BETWEEN includes both boundary dates.
-- 10. TRUNC(date,'MONTH') gives the first day of the month.
-- 11. LAST_DAY(date) gives the final day of the month.
-- 12. ADD_MONTHS handles month arithmetic.
-- 13. MONTHS_BETWEEN calculates month difference.
-- 14. EXTRACT is useful for year/month/day analysis.
-- 15. For date ranges containing time, prefer >= start
--     AND < next_period rather than BETWEEN when appropriate.


-- =====================================================
-- END OF DATE QUERIES PRACTICE
-- =====================================================

SPOOL OFF