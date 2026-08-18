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
-- ORACLE SQL*PLUS 11g
-- SINGLE ROW FUNCTIONS TEST
-- COLUMN FORMATTING
-- Q1–Q120
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

SPOOL 'F:\Exploring Technologies\OrcaleSqlPlusExploring\Oracle_Inventory_Sales_Management_System\Queries\03_Functions\03_SINGLE_ROW_FUNCTIONS_TEST_OUTPUT.txt'



-- ============================================================
-- ORACLE SQL 11g
-- SINGLE ROW FUNCTIONS — COMPLETE TEST
-- ============================================================
-- Total Questions : 120
-- Difficulty      : Basic → Intermediate → Advanced → Interview
--
-- Topics Covered:
-- 1. Character Functions
-- 2. Number Functions
-- 3. Date Functions
-- 4. Conversion Functions
-- 5. NULL Functions
-- 6. CASE / Conditional Expressions
-- 7. Functions with WHERE
-- 8. Functions with ORDER BY
-- 9. Multiple Functions in One Query
-- 10. Interview-Style Mixed Problems
--
-- IMPORTANT:
-- Do NOT use the function name from memory just because of the
-- question pattern. First understand what the question asks.
-- ============================================================


-- ============================================================
-- LEVEL 1 — BASIC FUNCTION RECOGNITION
-- Q1–Q30
-- ============================================================


-- Q1. Display CUSTOMER_NAME in uppercase.

SELECT UPPER(CUSTOMER_NAME) AS CUSTOMER_NAME FROM CUSTOMERS;


-- Q2. Display CUSTOMER_NAME in lowercase.

SELECT LOWER(CUSTOMER_NAME) AS CUSTOMER_NAME FROM CUSTOMERS;

-- Q3. Display CUSTOMER_NAME with the first letter uppercase
-- and the remaining letters lowercase.

SELECT INITCAP(CUSTOMER_NAME) AS CUSTOMER_NAME FROM CUSTOMERS;

-- Q4. Display CUSTOMER_NAME and its number of characters.

SELECT CUSTOMER_NAME,LENGTH(CUSTOMER_NAME) AS NO_OF_CHARACTERS FROM CUSTOMERS;

-- Q5. Display the first 5 characters of CUSTOMER_NAME.

SELECT SUBSTR(CUSTOMER_NAME,1,5) AS FIRST_5_CHARACTERS FROM CUSTOMERS;

-- Q6. Display the last 5 characters of CUSTOMER_NAME.

SELECT SUBSTR(CUSTOMER_NAME,-5,5) AS LAST_5_CHARACTERS FROM CUSTOMERS;

-- Q7. Display characters 2 TO 6 of CUSTOMER_NAME.

SELECT SUBSTR(CUSTOMER_NAME,2,5) AS CUSTOMER_NAME_2_TO_6 FROM CUSTOMERS;

-- Q8. Display CUSTOMER_NAME after removing leading spaces. LTRIM

SELECT LTRIM(CUSTOMER_NAME) AS CUSTOMER_NAME FROM CUSTOMERS;

-- Q9. Display CUSTOMER_NAME after removing trailing spaces. RTRIM

SELECT RTRIM(CUSTOMER_NAME) AS CUSTOMER_NAME FROM CUSTOMERS;

-- Q10. Display CUSTOMER_NAME after removing both leading TRIM
-- and trailing spaces.

SELECT TRIM(CUSTOMER_NAME) AS CUSTOMER_NAME FROM CUSTOMERS;

-- Q11. Display CUSTOMER_NAME padded on the left to 30 characters
-- using '*'.

SELECT LPAD(CUSTOMER_NAME,30,'*') AS CUSTOMER_NAME FROM CUSTOMERS;

-- Q12. Display CUSTOMER_NAME padded on the right to 30 characters
-- using '-'.

SELECT RPAD(CUSTOMER_NAME,30,'-') AS CUSTOMER_NAME FROM CUSTOMERS;

-- Q13. Display CUSTOMER_NAME after replacing every occurrence
-- of 'A' with '@'.

SELECT REPLACE(UPPER(CUSTOMER_NAME),'A','@') AS REPLACE_CUSTOMER_NAME FROM CUSTOMERS;

-- Q14. Display CUSTOMER_NAME after replacing every occurrence
-- of 'a' with '@'.

SELECT REPLACE(CUSTOMER_NAME,'a','@') AS REPLACE_CUSTOMER_NAME FROM CUSTOMERS;

-- Q15. Display CUSTOMER_NAME after replacing 'AN' with 'XX'.

SELECT REPLACE(UPPER(CUSTOMER_NAME),'AN','XX') AS CUSTOMER_NAME FROM CUSTOMERS;

-- Q16. Display CUSTOMER_NAME and the position of the first
-- occurrence of 'A'.

SELECT CUSTOMER_NAME,INSTR(UPPER(CUSTOMER_NAME),'A') AS POSITION FROM CUSTOMERS;

-- Q17. Display EMAIL and extract its first 10 characters.

SELECT EMAIL,SUBSTR(EMAIL,1,10) AS FIRST_10_CHAR FROM CUSTOMERS;

-- Q18. Display CUSTOMER_NAME concatenated with CITY.

SELECT CUSTOMER_NAME||' , '||CITY FROM CUSTOMERS;

-- Q19. Display CUSTOMER_NAME followed by ' - ' followed by CITY.

SELECT CUSTOMER_NAME||' - '||CITY AS CUSTOMER_INFO FROM CUSTOMERS;

-- Q20. Display PRICE rounded to the nearest whole number.

SELECT ROUND(PRICE,0) AS PRICE FROM ORDER_ITEMS;

-- Q21. Display PRICE rounded to 2 decimal places.

SELECT ROUND(PRICE,2) AS PRICE FROM ORDER_ITEMS;

-- Q22. Display PRICE truncated to the nearest whole number.

SELECT TRUNC(PRICE,0) AS PRICE FROM ORDER_ITEMS;

-- Q23. Display PRICE truncated to 2 decimal places.

SELECT TRUNC(PRICE,2) AS PRICE FROM ORDER_ITEMS;

-- Q24. Display the absolute difference between PRICE and 5000.

SELECT ABS(PRICE-5000) AS ABSOLUTE_PRICE FROM PRODUCTS;

-- Q25. Display PRICE and its ceiling value.

SELECT PRICE,CEIL(PRICE) AS CEIL_PRICE FROM PRODUCTS;

-- Q26. Display PRICE and its floor value.

SELECT PRICE,FLOOR(PRICE) AS FLOOR_PRICE FROM PRODUCTS;

-- Q27. Display SALARY rounded to the nearest thousand.

SELECT ROUND(SALARY,-3) AS SALARY FROM EMPLOYEES;

-- Q28. Display SALARY truncated to the nearest thousand.

SELECT TRUNC(SALARY,-3) AS SALARY FROM EMPLOYEES;

-- Q29. Display SALARY and its remainder when divided by 1000.

SELECT SALARY,MOD(SALARY,1000) AS REMAINDER_SALARY FROM EMPLOYEES;

-- Q30. Display QUANTITY multiplied by PRICE.
-- Use ORDER_ITEMS.

SELECT QUANTITY*PRICE AS NET_WORTH FROM ORDER_ITEMS;

-- ============================================================
-- LEVEL 2 — FUNCTIONS WITH CONDITIONS
-- Q31–Q55
-- ============================================================


-- Q31. Display customers whose CUSTOMER_NAME contains more
-- than 15 characters.

SELECT * FROM CUSTOMERS WHERE LENGTH(CUSTOMER_NAME)>15;


-- Q32. Display customers whose CUSTOMER_NAME starts with 'A'.

SELECT * FROM CUSTOMERS WHERE INSTR(CUSTOMER_NAME,'A')=1;

-- Q33. Display customers whose CUSTOMER_NAME ends with 'A'.

SELECT * FROM CUSTOMERS WHERE SUBSTR(CUSTOMER_NAME,-1)='A';

-- Q34. Display customers whose CUSTOMER_NAME contains 'AN'.

SELECT * FROM CUSTOMERS WHERE INSTR(CUSTOMER_NAME,'AN')>0;

-- Q35. Display products whose PRICE rounded to the nearest
-- whole number is greater than 1000.

SELECT * FROM PRODUCTS WHERE ROUND(PRICE,0)>1000;

-- Q36. Display products whose PRICE rounded to the nearest
-- hundred is greater than 5000.

SELECT * FROM PRODUCTS WHERE ROUND(PRICE,-2)>5000;

-- Q37. Display employees whose SALARY rounded to the nearest
-- thousand is greater than 50000.

SELECT * FROM EMPLOYEES WHERE ROUND(SALARY,-3)>50000;

-- Q38. Display employees whose SALARY truncated to the nearest
-- thousand is less than 50000.

SELECT * FROM EMPLOYEES WHERE TRUNC(SALARY,-3)<50000;

-- Q39. Display products whose PRICE has an absolute difference
-- from 10000 of less than 2000.

SELECT * FROM PRODUCTS WHERE ABS(PRICE-10000)<2000;

-- Q40. Display orders placed more than 30 days ago.

SELECT * FROM ORDERS WHERE SYSDATE-ORDER_DATE>30;

-- Q41. Display orders placed within the last 30 days.

SELECT * FROM ORDERS WHERE ORDER_DATE BETWEEN SYSDATE-30 AND SYSDATE;

-- Q42. Display orders whose ORDER_DATE is before SYSDATE.

SELECT * FROM ORDERS WHERE ORDER_DATE<SYSDATE;

-- Q43. Display payments made within the last 7 days.

SELECT * FROM PAYMENTS WHERE PAYMENT_DATE BETWEEN SYSDATE-7 AND SYSDATE;

-- Q44. Display purchases made more than 90 days ago.

SELECT * FROM PURCHASES WHERE PURCHASE_DATE<SYSDATE-90;

-- Q45. Display customers whose PHONE is NULL.

SELECT * FROM CUSTOMERS WHERE PHONE IS NULL;

-- Q46. Display customers whose EMAIL is NULL.

SELECT * FROM CUSTOMERS WHERE EMAIL IS NULL;

-- Q47. Display customers whose PHONE and EMAIL are both NOT NULL.

SELECT * FROM CUSTOMERS WHERE EMAIL IS NOT NULL AND PHONE IS NOT NULL;

-- Q48. Display products whose CATEGORY_ID is NULL.

SELECT * FROM PRODUCTS WHERE CATEGORY_ID IS NULL;

-- Q49. Display products whose CATEGORY_ID or SUPPLIER_ID is NULL.

SELECT * FROM PRODUCTS WHERE CATEGORY_ID IS NULL OR SUPPLIER_ID IS NULL;

-- Q50. Display employees whose SALARY is NULL.

SELECT * FROM EMPLOYEES WHERE SALARY IS NULL;

-- Q51. Display employees whose SALARY is NOT NULL.

SELECT * FROM EMPLOYEES WHERE SALARY IS NOT NULL;

-- Q52. Display payments whose PAYMENT_MODE is NULL.

SELECT * FROM PAYMENTS WHERE PAYMENT_MODE IS NULL;

-- Q53. Display products whose PRICE is equal to 1000
-- using an appropriate NULL-related function.

SELECT * FROM PRODUCTS WHERE NVL(PRICE,0)=1000;

-- Q54. Display products whose STOCK is 0 using an appropriate
-- NULL-related function.

SELECT * FROM PRODUCTS WHERE NVL(STOCK,0)=0;

-- Q55. Display customers whose first available contact information
-- is PHONE, EMAIL, or CITY.

SELECT CUSTOMER_NAME,COALESCE(PHONE,EMAIL,CITY) AS FIRST_CONTACT_CUSTOMER FROM CUSTOMERS;
-- ============================================================
-- LEVEL 3 — DATE FUNCTIONS
-- Q56–Q75
-- ============================================================


-- Q56. Display the current system date.

SELECT SYSDATE FROM DUAL;

-- Q57. Display ORDER_ID along with the current system date.

SELECT ORDER_ID,SYSDATE AS CURRENT_DATE FROM ORDERS;

-- Q58. Display ORDER_DATE plus 7 days.

SELECT ORDER_DATE+7 AS EXTRA_7_DAYS FROM ORDERS;

-- Q59. Display ORDER_DATE minus 15 days.

SELECT ORDER_DATE-15 AS FASTER_15_DAYS FROM ORDERS;

-- Q60. Display the number of days between SYSDATE and ORDER_DATE.

SELECT ABS(SYSDATE-ORDER_DATE) AS NO_OF_DAYS FROM ORDERS;

-- Q61. Display the number of months between SYSDATE and ORDER_DATE.

SELECT MONTHS_BETWEEN(SYSDATE,ORDER_DATE) AS MONTHS_BETWEEN FROM ORDERS;

-- Q62. Display ORDER_DATE after adding 3 months.

SELECT ADD_MONTHS(ORDER_DATE,3) AS ADDING_3_MONTHS FROM ORDERS;

-- Q63. Display PURCHASE_DATE after adding 12 months.

SELECT ADD_MONTHS(PURCHASE_DATE,12) AS ADDING_12_MONTHS FROM PURCHASES;

-- Q64. Display the next Monday after ORDER_DATE.

SELECT TO_CHAR(ORDER_DATE,'DAY') AS DAY,NEXT_DAY(ORDER_DATE,'MONDAY') AS NEXT_DAY FROM ORDERS;

-- Q65. Display the next Sunday after ORDER_DATE.

SELECT TO_CHAR(ORDER_DATE,'DAY') AS DAY,NEXT_DAY(ORDER_DATE,'SUNDAY') AS NEXT_DAY FROM ORDERS;

-- Q66. Display the last day of the month for ORDER_DATE.

SELECT LAST_DAY(ORDER_DATE) FROM ORDERS;

-- Q67. Display the last day of the month for PAYMENT_DATE.

SELECT LAST_DAY(PAYMENT_DATE) FROM PAYMENTS;

-- Q68. Display orders where ORDER_DATE is the last day
-- of its month.

SELECT * FROM ORDERS WHERE TRUNC(ORDER_DATE)=TRUNC(LAST_DAY(ORDER_DATE));

-- Q69. Display ORDER_DATE rounded to the nearest month.

SELECT ORDER_DATE,ROUND(ORDER_DATE,'MONTH') AS ROUND_TO_MONTH FROM ORDERS;

-- Q70. Display ORDER_DATE rounded to the nearest year.

SELECT ORDER_DATE,ROUND(ORDER_DATE,'YEAR') AS ROUND_TO_YEAR FROM ORDERS;

-- Q71. Display ORDER_DATE truncated to the month.

SELECT ORDER_DATE,TRUNC(ORDER_DATE,'MONTH') AS TRUNC_TO_MONTH FROM ORDERS;

-- Q72. Display ORDER_DATE truncated to the year.

SELECT ORDER_DATE,TRUNC(ORDER_DATE,'YEAR') AS TRUNC_TO_YEAR FROM ORDERS;

-- Q73. Display orders where ORDER_DATE plus one month
-- is after SYSDATE.

SELECT * FROM ORDERS WHERE ADD_MONTHS(ORDER_DATE,1)>SYSDATE;

-- Q74. Display orders ordered by the number of months between
-- ORDER_DATE and SYSDATE.

SELECT * FROM ORDERS ORDER BY MONTHS_BETWEEN(SYSDATE,ORDER_DATE);

-- Q75. Display ORDER_ID, ORDER_DATE, and the last day
-- of the order month.

SELECT ORDER_ID,ORDER_DATE,LAST_DAY(ORDER_DATE) AS LAST_DAY FROM ORDERS;


-- ============================================================
-- LEVEL 4 — CONVERSION FUNCTIONS
-- Q76–Q90
-- ============================================================


-- Q76. Display PRICE as character data.

SELECT PRICE,TO_CHAR(PRICE,'99999') AS CON_PRICE FROM PRODUCTS; 

-- Q77. Display PRICE with exactly two decimal places.

SELECT PRICE,TO_CHAR(PRICE,'99999.00') AS CON_PRICE FROM PRODUCTS; 

-- Q78. Display PRICE with comma separators.

SELECT PRICE,TO_CHAR(PRICE,'99,999') AS CON_PRICE FROM PRODUCTS; 

-- Q79. Display PRICE with the local currency symbol.
--ALTER SESSION SET NLS_CURRENCY = '₹';

SELECT PRICE,TO_CHAR(PRICE,'L99,99,99,990') AS CON_PRICE FROM PRODUCTS;
			
-- Q80. Display SALARY with comma separators and two
-- decimal places.

SELECT SALARY, 'RS. ' ||TO_CHAR(SALARY,'999,999,990.00') AS CON_PRICE FROM EMPLOYEES;

-- Q81. Display ORDER_DATE in DD-MM-YYYY format.

SELECT ORDER_DATE,TO_CHAR(ORDER_DATE,'DD-MM-YYYY') AS FORMATTED FROM ORDERS;

-- Q82. Display ORDER_DATE in DD-MON-YYYY format.

SELECT ORDER_DATE,TO_CHAR(ORDER_DATE,'DD-MON-YYYY') AS FORMATTED FROM ORDERS;

-- Q83. Display ORDER_DATE in YYYY-MM-DD format.

SELECT ORDER_DATE,TO_CHAR(ORDER_DATE,'YYYY-MM-DD') AS FORMATTED FROM ORDERS;

-- Q84. Display ORDER_DATE with the day name and month name.

SELECT ORDER_DATE,TO_CHAR(ORDER_DATE,'DAY,MONTH') AS FORMATTED FROM ORDERS;

-- Q85. Display ORDER_ID and formatted ORDER_DATE.
-- Sort using the actual ORDER_DATE.


SELECT ORDER_ID,TO_CHAR(ORDER_DATE,'DD-MM-YYYY HH24:MI:SS') AS FORMATTED FROM ORDERS ORDER BY ORDER_DATE ASC;


-- Q86. Convert '15-08-2026' into a DATE.

SELECT TO_DATE('15-08-2026','DD-MM-YYYY') AS CONVERTED_DATE FROM DUAL;

-- Q87. Convert '2026-08-15' into a DATE.

SELECT TO_DATE('2026-08-15','YYYY-MM-DD') AS FORMATTED_DATE FROM DUAL;

-- Q88. Convert '15/AUG/2026' into a DATE.

SELECT TO_DATE('15/AUG/2026','DD/MON/YYYY') AS CONVERTED_DATE FROM DUAL;

-- Q89. Display orders placed after 01-01-2026 by converting
-- the character date using TO_DATE().

SELECT * FROM ORDERS WHERE ORDER_DATE>TO_DATE('01-01-2026','DD-MM-YYYY');

-- Q90. Display orders placed on 15-08-2026 by converting
-- the character date using TO_DATE().

SELECT * FROM ORDERS WHERE ORDER_DATE=TO_DATE('15-08-2026','DD-MM-YYYY');

-- ============================================================
-- LEVEL 5 — NUMBER / CONVERSION MIXING
-- Q91–Q100
-- ============================================================


-- Q91. Convert '5000' into a number.

SELECT TO_NUMBER('5000') AS AMOUNT FROM DUAL;

-- Q92. Convert '1250.50' into a number.

SELECT TO_NUMBER('1250.50') AS AMOUNT FROM DUAL;

-- Q93. Convert '10000' into a number and add 500.

SELECT TO_NUMBER('10000')+500 AS AMOUNT FROM DUAL;

-- Q94. Display products whose PRICE is greater than
-- TO_NUMBER('500').

SELECT * FROM PRODUCTS WHERE PRICE>TO_NUMBER('500');

-- Q95. Display payments whose AMOUNT is greater than
-- TO_NUMBER('5000').

SELECT * FROM PAYMENTS WHERE AMOUNT>TO_NUMBER('5000');

-- Q96. Display SALARY divided by 12 and rounded to
-- two decimal places.

SELECT ROUND(SALARY/12,2) AS SALARY FROM EMPLOYEES;

-- Q97. Display QUANTITY * PRICE rounded to two decimal places.

SELECT QUANTITY,PRICE,ROUND(QUANTITY*PRICE,2) AS NET_WORTH FROM ORDER_ITEMS;

-- Q98. Display PRODUCT_NAME, PRICE, and PRICE rounded
-- to the nearest hundred.

SELECT PRODUCT_NAME,PRICE,ROUND(PRICE,-2) AS ROUNDED_PRICE FROM PRODUCTS;

-- Q99. Display PRODUCT_NAME, PRICE, and PRICE truncated
-- to the nearest hundred.

SELECT PRODUCT_NAME,PRICE,TRUNC(PRICE,-2) AS TUNCATED_PRICE FROM PRODUCTS;

-- Q100. Display products ordered by PRICE rounded to
-- the nearest hundred in descending order.

SELECT * FROM PRODUCTS ORDER BY ROUND(PRICE,-2) DESC;

-- ============================================================
-- LEVEL 6 — NULL FUNCTIONS
-- Q101–Q110
-- ============================================================


-- Q101. Display CUSTOMER_NAME and replace NULL PHONE
-- with 'NOT PROVIDED'.

SELECT CUSTOMER_NAME,NVL(PHONE,'NOT PROVIDED') AS PHONE FROM CUSTOMERS;

-- Q102. Display CUSTOMER_NAME and replace NULL EMAIL
-- with 'NO EMAIL'.

SELECT CUSTOMER_NAME,NVL(EMAIL,'NO EMAIL') AS EMAIL FROM CUSTOMERS;

-- Q103. Display PRODUCT_NAME and replace NULL CATEGORY_ID
-- with 0.

SELECT PRODUCT_NAME,NVL(CATEGORY_ID,0) AS CATEGORY_ID FROM PRODUCTS;

-- Q104. Display PRODUCT_NAME and replace NULL SUPPLIER_ID
-- with 0.

SELECT PRODUCT_NAME,NVL(SUPPLIER_ID,0) AS SUPPLIER_ID FROM PRODUCTS;

-- Q105. Display EMP_NAME and replace NULL SALARY with 0.

SELECT EMP_NAME,NVL(SALARY,0) AS SALARY FROM EMPLOYEES;

-- Q106. Display CUSTOMER_NAME and:
-- 'AVAILABLE' when PHONE is NOT NULL
-- 'NOT AVAILABLE' when PHONE is NULL.

SELECT CUSTOMER_NAME,NVL2(PHONE,'AVAILABLE','NOT AVAILABLE') AS PHONE FROM CUSTOMERS;

-- Q107. Display PRODUCT_NAME and:
-- 'SUPPLIER ASSIGNED' when SUPPLIER_ID is NOT NULL
-- 'NO SUPPLIER' when SUPPLIER_ID is NULL.

SELECT PRODUCT_NAME,NVL2(SUPPLIER_ID,'SUPPLIER ASSIGNED','NO SUPPLIER') AS SUPPLIERS FROM PRODUCTS;

-- Q108. Display PAYMENT_ID and:
-- 'PAYMENT MODE AVAILABLE' when PAYMENT_MODE is NOT NULL
-- 'PAYMENT MODE MISSING' when PAYMENT_MODE is NULL.

SELECT PAYMENT_ID,NVL2(PAYMENT_MODE,'PAYMENT_MODE_AVAILABLE','PAYMENT_MODE_MISSING') AS PAYMENT_MODE FROM PAYMENTS;

-- Q109. Display CUSTOMER_NAME and the first non-NULL value
-- among PHONE, EMAIL, and CITY.

SELECT CUSTOMER_NAME,COALESCE(PHONE,EMAIL,CITY) AS FIRST_NON_NULL FROM CUSTOMERS;

-- Q110. Display PRODUCT_NAME and NULLIF(PRICE,1000).

SELECT PRODUCT_NAME,NULLIF(PRICE,1000) AS PRICE FROM PRODUCTS;

-- ============================================================
-- LEVEL 7 — FUNCTIONS WITH ORDER BY
-- Q111–Q115
-- ============================================================


-- Q111. Display customers ordered by CUSTOMER_NAME length
-- from shortest to longest.

SELECT * FROM CUSTOMERS ORDER BY LENGTH(CUSTOMER_NAME) ASC;


-- Q112. Display customers ordered by CUSTOMER_NAME length
-- from longest to shortest.

SELECT * FROM CUSTOMERS ORDER BY LENGTH(CUSTOMER_NAME) DESC;

-- Q113. Display products ordered by rounded PRICE.

SELECT * FROM PRODUCTS ORDER BY ROUND(PRICE) ASC;

-- Q114. Display employees ordered by salary rounded to
-- the nearest thousand in descending order.

SELECT * FROM EMPLOYEES ORDER BY ROUND(SALARY,-3) DESC;

-- Q115. Display orders ordered by the number of days since
-- the order was placed.

SELECT * FROM ORDERS ORDER BY SYSDATE-ORDER_DATE ASC;

-- ============================================================
-- LEVEL 8 — INTERVIEW-STYLE MIXED QUESTIONS
-- Q116–Q120
-- ============================================================


-- Q116. Display CUSTOMER_NAME, uppercase customer name,
-- and its length. Order by length descending.

SELECT CUSTOMER_NAME,UPPER(CUSTOMER_NAME) AS C_NAME,LENGTH(CUSTOMER_NAME) AS LENGTH FROM CUSTOMERS ORDER BY LENGTH(CUSTOMER_NAME) DESC;


-- Q117. Display PRODUCT_NAME, PRICE, rounded PRICE,
-- and truncated PRICE.

SELECT PRODUCT_NAME,PRICE,ROUND(PRICE) AS ROUNDED_PRICE,TRUNC(PRICE) AS TRUNCATED_PRICE FROM PRODUCTS;


-- Q118. Display ORDER_ID, ORDER_DATE, and the number of days
-- since the order was placed. Show only orders older than
-- 30 days.

SELECT ORDER_ID,ORDER_DATE,SYSDATE-ORDER_DATE AS NO_OF_DAYS FROM ORDERS WHERE ORDER_DATE<SYSDATE-30;


-- Q119. Display CUSTOMER_NAME and the first available contact
-- among PHONE, EMAIL, and CITY. Order alphabetically by
-- CUSTOMER_NAME.

SELECT CUSTOMER_NAME,COALESCE(PHONE,EMAIL,CITY) AS FIRST_AVAILABLE_CONTACT FROM CUSTOMERS ORDER BY CUSTOMER_NAME ASC;


-- Q120. Display PRODUCT_NAME, PRICE, and:
-- 'EXPENSIVE' if PRICE > 10000
-- 'MEDIUM' if PRICE is between 5000 and 10000
-- 'CHEAP' otherwise.


SELECT PRODUCT_NAME,
       PRICE,
       CASE
           WHEN PRICE > 10000 THEN 'EXPENSIVE'
           WHEN PRICE BETWEEN 5000 AND 10000 THEN 'MEDIUM'
           ELSE 'CHEAP'
       END AS PRICE_CATEGORY
FROM PRODUCTS;

-- ============================================================
-- END OF SINGLE ROW FUNCTIONS TEST
-- ============================================================

SPOOL OFF