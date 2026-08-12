-- =====================================================================================================================================================================
-- LEVEL 2 — OPERATORS
-- Oracle 11g / SQL*Plus
-- Questions: Q071–Q130
-- Arithmetic Operators (+, -, *, /) | Comparison Operators (=, !=, <>, >, <, >=, <=) | Logical Operators (AND, OR, NOT) | NULL Conditions (IS NULL, IS NOT NULL) |
-- Range Operators (BETWEEN, NOT BETWEEN) | Parentheses ( )
-- ========================================================================================================================================================================
SPOOL 'F:\Exploring Technologies\OrcaleSqlPlusExploring\Oracle_Inventory_Sales_Management_System\Queries\02_Operators\02_OPERATORS_OUTPUT.txt'


-- =====================================================
-- SQL*PLUS DISPLAY FORMATTING
-- =====================================================

SET LINESIZE 200
SET PAGESIZE 100
SET WRAP OFF
SET TAB OFF
SET HEADING ON
SET FEEDBACK ON
SET COLSEP ' | '
SET NUMWIDTH 12


-- =====================================================
-- COLUMN FORMATTING
-- =====================================================

COLUMN CATEGORY_NAME FORMAT A25

COLUMN CUSTOMER_NAME FORMAT A30
COLUMN PHONE FORMAT A15
COLUMN EMAIL FORMAT A30
COLUMN ADDRESS FORMAT A30
COLUMN CITY FORMAT A15

COLUMN EMP_NAME FORMAT A25
COLUMN DESIGNATION FORMAT A20
COLUMN SALARY FORMAT 99999999.99

COLUMN PRODUCT_NAME FORMAT A35
COLUMN PRICE FORMAT 99999999.99
COLUMN STOCK FORMAT 99999999

COLUMN STATUS FORMAT A15

COLUMN PAYMENT_MODE FORMAT A15
COLUMN AMOUNT FORMAT 99999999.99

COLUMN OLD_STOCK FORMAT 99999999
COLUMN NEW_STOCK FORMAT 99999999
COLUMN QUANTITY FORMAT 99999999


-- =======================================================================================================================================================
-- CONCEPT 1 — ARITHMETIC OPERATORS
-- ========================================================================================================================================================

-- Q071. Display PRODUCT_NAME, PRICE and calculate PRICE + 100 for every product.


SELECT PRODUCT_NAME,PRICE,PRICE+100 AS INCR_BY_100_RS FROM PRODUCTS;


-- Q072. Display PRODUCT_NAME, PRICE and calculate PRICE - 50 for every product.

SELECT PRODUCT_NAME,PRICE,PRICE-50 AS DECR_BY_50_RS FROM PRODUCTS;



-- Q073. Display PRODUCT_NAME, PRICE and calculate PRICE * 2 for every product.

SELECT PRODUCT_NAME,PRICE,PRICE*2 AS INCR_BY_DOUBLE FROM PRODUCTS;



-- Q074. Display PRODUCT_NAME, PRICE and calculate PRICE / 2 for every product.

SELECT PRODUCT_NAME,PRICE,PRICE/2 AS DECR_BY_HALF FROM PRODUCTS;



-- Q075. Display PRODUCT_NAME, STOCK and calculate STOCK + 10 for every product.

SELECT PRODUCT_NAME,STOCK,STOCK+10 AS STOCK_INCR_BY_10_UNI FROM PRODUCTS;



-- Q076. Display PRODUCT_NAME, STOCK and calculate STOCK - 5 for every product.

SELECT PRODUCT_NAME,STOCK,STOCK-5 AS STOCK_DECR_BY_5_UNI FROM PRODUCTS;



-- Q077. Display PRODUCT_NAME, PRICE and calculate the price after adding 18% GST.

SELECT PRODUCT_NAME,PRICE,PRICE*1.18 AS GST_ADDED_BY_18_PER FROM PRODUCTS;



-- Q078. Display EMP_NAME, SALARY and calculate salary after deducting 10%.

SELECT EMP_NAME,SALARY,SALARY*0.90 AS SALARY_DEDUCTED_BY_10_PER FROM EMPLOYEES;


-- =========================================================================================================================================================
-- CONCEPT 2 — RELATIONAL / COMPARISON OPERATORS
-- ===========================================================================================================================================================

-- Q079. Display products whose PRICE is greater than 1000.

SELECT * FROM PRODUCTS WHERE PRICE>1000; 



-- Q080. Display products whose PRICE is less than 500.

SELECT * FROM PRODUCTS WHERE PRICE<500; 



-- Q081. Display products whose PRICE is greater than or equal to 1000.

SELECT * FROM PRODUCTS WHERE PRICE>=1000;



-- Q082. Display products whose PRICE is less than or equal to 1000.

SELECT * FROM PRODUCTS WHERE PRICE<=1000;



-- Q083. Display products whose PRICE is equal to 500.

SELECT * FROM PRODUCTS WHERE PRICE=500;



-- Q084. Display products whose PRICE is not equal to 500.


SELECT * FROM PRODUCTS WHERE PRICE!=500;


-- Q085. Display employees whose SALARY is greater than 30000.

SELECT * FROM EMPLOYEES WHERE SALARY>30000;



-- Q086. Display employees whose SALARY is less than 25000.

SELECT * FROM EMPLOYEES WHERE SALARY<25000;


-- Q087. Display employees whose SALARY is greater than or equal to 40000.

SELECT * FROM EMPLOYEES WHERE SALARY>=40000;


-- Q088. Display payments whose AMOUNT is less than or equal to 5000.

SELECT * FROM PAYMENTS WHERE AMOUNT<=5000;


-- =====================================================
-- CONCEPT 3 — EQUALITY / INEQUALITY WITH TEXT
-- =====================================================

-- Q089. Display customers whose CITY is 'HYDERABAD'.

SELECT * FROM CUSTOMERS WHERE UPPER(CITY)='HYDERABAD';



-- Q090. Display customers whose CITY is not 'HYDERABAD'.

SELECT * FROM CUSTOMERS WHERE UPPER(CITY)!='HYDERABAD';


-- Q091. Display orders whose STATUS is 'PENDING'.

SELECT * FROM ORDERS WHERE UPPER(STATUS)='PENDING';



-- Q092. Display orders whose STATUS is not 'PENDING'.

SELECT * FROM ORDERS WHERE UPPER(STATUS)!='PENDING';



-- Q093. Display employees whose DESIGNATION is 'MANAGER'.

SELECT * FROM EMPLOYEES WHERE UPPER(DESIGNATION)='MANAGER';



-- Q094. Display payments whose PAYMENT_MODE is 'CASH'.

SELECT * FROM PAYMENTS WHERE UPPER(PAYMENT_MODE)='CASH';



-- ===============================================================================================================================================
-- CONCEPT 4 — AND OPERATOR
-- ===============================================================================================================================================

-- Q095. Display products whose PRICE is greater than 500 AND STOCK is greater than 20.

SELECT * FROM PRODUCTS WHERE PRICE>500 AND STOCK>20;



-- Q096. Display products whose PRICE is less than 1000 AND STOCK is less than 50.

SELECT * FROM PRODUCTS WHERE PRICE<1000 AND STOCK<50;



-- Q097. Display employees whose SALARY is greater than 30000 AND DESIGNATION is 'MANAGER'.

SELECT * FROM EMPLOYEES WHERE SALARY>30000 AND UPPER(DESIGNATION)='MANAGER';



-- Q098. Display employees whose SALARY is greater than 25000 AND SALARY is less than 50000.


SELECT * FROM EMPLOYEES WHERE SALARY>25000 AND SALARY<50000;


-- Q099. Display payments whose AMOUNT is greater than 5000 AND PAYMENT_MODE is 'CASH'.


SELECT * FROM PAYMENTS WHERE AMOUNT>5000 AND UPPER(PAYMENT_MODE)='CASH';


-- Q100. Display order items whose QUANTITY is greater than 5 AND PRICE is greater than 1000.

SELECT * FROM ORDER_ITEMS WHERE QUANTITY>5 AND PRICE>1000;

-- ====================================================================================================================================================
-- CONCEPT 5 — OR OPERATOR
-- ====================================================================================================================================================

-- Q101. Display products whose PRICE is less than 500 OR STOCK is less than 10.

SELECT * FROM PRODUCTS WHERE PRICE<500 OR STOCK<10;



-- Q102. Display products whose PRICE is greater than 2000 OR STOCK is greater than 100.


SELECT * FROM PRODUCTS WHERE PRICE>2000 OR STOCK>100;


-- Q103. Display employees whose DESIGNATION is 'MANAGER' OR DESIGNATION is 'SUPERVISOR'.

SELECT * FROM EMPLOYEES WHERE UPPER(DESIGNATION)='MANAGER' OR UPPER(DESIGNATION)='SUPERVISOR';

-- Q104. Display orders whose STATUS is 'PENDING' OR STATUS is 'PROCESSING'.

SELECT * FROM ORDERS WHERE UPPER(STATUS)='PENDING' OR UPPER(STATUS)='PROCESSING';



-- Q105. Display payments whose PAYMENT_MODE is 'CASH' OR PAYMENT_MODE is 'CARD'.

SELECT * FROM PAYMENTS WHERE UPPER(PAYMENT_MODE)='CASH' OR UPPER(PAYMENT_MODE)='CARD';


-- Q106. Display customers whose CITY is 'HYDERABAD' OR CITY is 'GUNTUR'.

SELECT * FROM CUSTOMERS WHERE UPPER(CITY)='HYDERABAD' OR UPPER(CITY)='GUNTUR';


-- =================================================================================================================================================================
-- CONCEPT 6 — NOT OPERATOR
-- =================================================================================================================================================================

-- Q107. Display products whose PRICE is NOT equal to 1000.

SELECT * FROM PRODUCTS WHERE NOT PRICE=1000;



-- Q108. Display employees whose DESIGNATION is NOT 'MANAGER'.

SELECT * FROM EMPLOYEES WHERE NOT UPPER(DESIGNATION)='MANAGER';


-- Q109. Display orders whose STATUS is NOT 'CANCELLED'.

SELECT * FROM ORDERS WHERE NOT UPPER(STATUS)='CANCELLED';



-- Q110. Display customers whose CITY is NOT 'HYDERABAD'.

SELECT * FROM CUSTOMERS WHERE NOT UPPER(CITY)='HYDERABAD';



-- =================================================================================================================================================
-- CONCEPT 7 — COMBINING AND + OR
-- =================================================================================================================================================

-- Q111. Display products whose PRICE is greater than 1000 AND STOCK is greater than 20 OR PRICE is less than 500.

SELECT * FROM PRODUCTS WHERE PRICE>1000 AND (STOCK>20 OR PRICE<500)



-- Q112. Display employees whose SALARY is greater than 30000
-- AND DESIGNATION is 'MANAGER'
-- OR DESIGNATION is 'SUPERVISOR'.

SELECT * FROM EMPLOYEES WHERE SALARY>30000 AND (UPPER(DESIGNATION)='MANAGER' OR UPPER(DESIGNATION)='SUPERVISOR');



-- Q113. Display orders whose STATUS is 'PENDING'
-- OR STATUS is 'PROCESSING'
-- AND CUSTOMER_ID is not NULL.

SELECT * FROM ORDERS WHERE (UPPER(STATUS)='PENDING' OR UPPER(STATUS)='PROCESSING') AND CUSTOMER_ID IS NOT NULL;



-- Q114. Display payments whose AMOUNT is greater than 5000
-- AND PAYMENT_MODE is 'CASH'
-- OR PAYMENT_MODE is 'CARD'.

SELECT * FROM PAYMENTS WHERE AMOUNT>5000 AND (UPPER(PAYMENT_MODE)='CASH' OR UPPER(PAYMENT_MODE)='CARD');



-- =====================================================
-- CONCEPT 8 — PARENTHESES WITH OPERATORS
-- =====================================================

-- Q115. Display products whose PRICE is greater than 1000
-- AND either STOCK is less than 20 or STOCK is greater than 100.

SELECT * FROM PRODUCTS WHERE PRICE>1000 AND (STOCK<20 OR STOCK>100);



-- Q116. Display employees whose SALARY is greater than 30000
-- AND either DESIGNATION is 'MANAGER' or 'SUPERVISOR'.

SELECT * FROM EMPLOYEES WHERE SALARY>30000 AND (UPPER(DESIGNATION)='MANAGER' OR UPPER(DESIGNATION)='SUPERVISOR');



-- Q117. Display orders whose STATUS is either 'PENDING'
-- or 'PROCESSING' and CUSTOMER_ID is greater than 100.


SELECT * FROM ORDERS WHERE CUSTOMER_ID>100 AND (UPPER(STATUS)='PENDING' OR UPPER(STATUS)='PROCESSING');


-- Q118. Display payments whose AMOUNT is greater than 5000
-- and PAYMENT_MODE is either 'CASH' or 'CARD'.


SELECT * FROM PAYMENTS WHERE AMOUNT>5000 AND (UPPER(PAYMENT_MODE)='CASH' OR UPPER(PAYMENT_MODE)='CARD');


-- =====================================================
-- CONCEPT 9 — NULL OPERATOR
-- =====================================================

-- Q119. Display customers whose PHONE is NULL.

SELECT * FROM CUSTOMERS WHERE PHONE IS NULL;



-- Q120. Display customers whose EMAIL is NULL.

SELECT * FROM CUSTOMERS WHERE EMAIL IS NULL;



-- Q121. Display customers whose PHONE is NOT NULL.

SELECT * FROM CUSTOMERS WHERE PHONE IS NOT NULL;



-- Q122. Display customers whose EMAIL is NOT NULL.

SELECT * FROM CUSTOMERS WHERE EMAIL IS NOT NULL;



-- Q123. Display products whose CATEGORY_ID is NULL.

SELECT * FROM PRODUCTS WHERE CATEGORY_ID IS NULL;



-- Q124. Display products whose SUPPLIER_ID is NOT NULL.


SELECT * FROM PRODUCTS WHERE SUPPLIER_ID IS NOT NULL;


-- Q125. Display orders whose EMP_ID is NULL.

SELECT * FROM ORDERS WHERE EMP_ID IS NULL;



-- Q126. Display payments whose PAYMENT_MODE is NULL.

SELECT * FROM PAYMENTS WHERE PAYMENT_MODE IS NULL;



-- =====================================================
-- CONCEPT 10 — BETWEEN OPERATOR
-- =====================================================

-- Q127. Display products whose PRICE is between 500 and 1500.

SELECT * FROM PRODUCTS WHERE PRICE BETWEEN 500 AND 1500;



-- Q128. Display employees whose SALARY is between 25000 and 50000.

SELECT * FROM EMPLOYEES WHERE SALARY BETWEEN 25000 AND 50000;



-- Q129. Display order items whose QUANTITY is between 2 and 10.

SELECT * FROM ORDER_ITEMS WHERE QUANTITY BETWEEN 2 AND 10;



-- Q130. Display payments whose AMOUNT is between 1000 and 10000.

SELECT * FROM PAYMENTS WHERE AMOUNT BETWEEN 1000 AND 10000;

--======================================================================================================================================================================
-- CONCEPT 11 - <> NOT EQUAL OPERATOR
--=======================================================================================================================================================================
-- Q131. Display products whose PRICE is not equal to 1000
-- using the <> comparison operator.

SELECT * FROM PRODUCTS WHERE PRICE<>1000;



-- Q132. Display employees whose SALARY is not equal to 30000
-- using the <> comparison operator.

SELECT * FROM EMPLOYEES WHERE SALARY<>30000;



-- Q133. Display orders whose STATUS is not equal to 'CANCELLED'
-- using the <> comparison operator.

SELECT * FROM ORDERS WHERE UPPER(STATUS)<>'CANCELLED';



-- Q134. Display customers whose CITY is not equal to 'HYDERABAD'
-- using the <> comparison operator.

SELECT * FROM CUSTOMERS WHERE UPPER(CITY)<>'HYDERABAD';



-- =====================================================
-- CONCEPT 12 — NOT BETWEEN OPERATOR
-- =====================================================

-- Q135. Display products whose PRICE is NOT between 500 and 1500.

SELECT * FROM PRODUCTS WHERE PRICE NOT BETWEEN 500 AND 1500;



-- Q136. Display employees whose SALARY is NOT between 25000 and 50000.


SELECT * FROM EMPLOYEES WHERE SALARY NOT BETWEEN 25000 AND 50000;



-- =====================================================
-- END OF LEVEL 2 — OPERATORS
-- =====================================================

SPOOL OFF