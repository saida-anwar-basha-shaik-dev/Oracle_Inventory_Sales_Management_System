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

SPOOL 'F:\Exploring Technologies\OrcaleSqlPlusExploring\Oracle_Inventory_Sales_Management_System\Queries\02_Operators\02_SPECIAL_OPERATORS_OUTPUT.txt'
-- =====================================================
-- 02_SPECIAL_OPERATORS [IN, NOT IN, LIKE, NOT LIKE]
-- Oracle 11g / SQL*Plus
-- Questions: Q137–Q180
-- =====================================================


-- =====================================================
-- CONCEPT 1 — IN OPERATOR
-- =====================================================

-- Q137. Display products whose PRODUCT_ID is 1, 3, or 5.

SELECT * FROM PRODUCTS WHERE PRODUCT_ID IN(1,3,5);

-- Q138. Display products whose CATEGORY_ID is 1, 2, or 3.

SELECT * FROM PRODUCTS WHERE CATEGORY_ID IN(1,2,3);

-- Q139. Display customers whose CITY is 'HYDERABAD', 'GUNTUR', or 'VIJAYAWADA'.

SELECT * FROM CUSTOMERS WHERE UPPER(CITY) IN('HYDERABAD','GUNTUR','VIJAYAWADA');

-- Q140. Display employees whose EMP_ID is 1, 2, or 3.

SELECT * FROM EMPLOYEES WHERE EMP_ID IN(1,2,3);

-- Q141. Display orders whose STATUS is 'PENDING', 'PROCESSING', or 'COMPLETED'.

SELECT * FROM ORDERS WHERE UPPER(STATUS) IN('PENDING','PROCESSING','COMPLETED');

-- Q142. Display payments whose PAYMENT_MODE is 'CASH', 'CARD', or 'UPI'.

SELECT * FROM PAYMENTS WHERE UPPER(PAYMENT_MODE) IN('CASH','CARD','UPI');

-- =====================================================
-- CONCEPT 2 — NOT IN OPERATOR
-- =====================================================

-- Q143. Display products whose PRODUCT_ID is NOT 1, 3, or 5.

SELECT * FROM PRODUCTS WHERE PRODUCT_ID NOT IN(1,3,5);

-- Q144. Display products whose CATEGORY_ID is NOT 1, 2, or 3.

SELECT * FROM PRODUCTS WHERE CATEGORY_ID NOT IN(1,2,3);

-- Q145. Display customers whose CITY is NOT 'HYDERABAD', 'GUNTUR', or 'VIJAYAWADA'.

SELECT * FROM CUSTOMERS WHERE UPPER(CITY) NOT IN('HYDERABAD','GUNTUR','VIJAYAWADA');

-- Q146. Display employees whose EMP_ID is NOT 1, 2, or 3.

SELECT * FROM EMPLOYEES WHERE EMP_ID NOT IN(1,2,3);

-- Q147. Display orders whose STATUS is NOT 'PENDING', 'PROCESSING', or 'CANCELLED'.

SELECT * FROM ORDERS WHERE UPPER(STATUS) NOT IN('PENDING','PROCESSING','CANCELLED');

-- Q148. Display payments whose PAYMENT_MODE is NOT 'CASH', 'CARD', or 'UPI'.

SELECT * FROM PAYMENTS WHERE UPPER(PAYMENT_MODE) NOT IN('CASH','CARD','UPI');

-- =====================================================
-- CONCEPT 3 — LIKE OPERATOR
-- =====================================================

-- Q149. Display customers whose CUSTOMER_NAME starts with 'A'.

SELECT * FROM CUSTOMERS WHERE CUSTOMER_NAME LIKE 'A%';

-- Q150. Display customers whose CUSTOMER_NAME ends with 'A'.

SELECT * FROM CUSTOMERS WHERE CUSTOMER_NAME LIKE '%A';

-- Q151. Display customers whose CUSTOMER_NAME contains 'AN'.

SELECT * FROM CUSTOMERS WHERE CUSTOMER_NAME LIKE '%AN%';

-- Q152. Display products whose PRODUCT_NAME starts with 'S'.

SELECT * FROM PRODUCTS WHERE PRODUCT_NAME LIKE 'S%';

-- Q153. Display products whose PRODUCT_NAME ends with 'E'.

SELECT * FROM PRODUCTS WHERE PRODUCT_NAME LIKE '%E';

-- Q154. Display products whose PRODUCT_NAME contains 'PHONE'.

SELECT * FROM PRODUCTS WHERE PRODUCT_NAME LIKE '%PHONE%';

-- Q155. Display employees whose EMP_NAME starts with 'R'.

SELECT * FROM EMPLOYEES WHERE EMP_NAME LIKE 'R%';

-- Q156. Display suppliers whose SUPPLIER_NAME contains 'TECH'.

SELECT * FROM SUPPLIERS WHERE SUPPLIER_NAME LIKE '%TECH%';

-- Q157. Display customers whose CITY starts with 'H'.

SELECT * FROM CUSTOMERS WHERE UPPER(CITY) LIKE 'H%';

-- Q158. Display products whose PRODUCT_NAME has exactly 5 characters.

SELECT * FROM PRODUCTS WHERE UPPER(PRODUCT_NAME) LIKE '_____';

-- Q159. Display customers whose CUSTOMER_NAME has exactly 6 characters.

SELECT * FROM CUSTOMERS WHERE UPPER(CUSTOMER_NAME) LIKE '______';

-- Q160. Display employees whose EMP_NAME has 'A' as the second character.

SELECT * FROM EMPLOYEES WHERE UPPER(EMP_NAME) LIKE '_A%';

-- =====================================================
-- CONCEPT 4 — NOT LIKE OPERATOR
-- =====================================================

-- Q161. Display customers whose CUSTOMER_NAME does NOT start with 'A'.

SELECT * FROM CUSTOMERS WHERE CUSTOMER_NAME NOT LIKE 'A%';

-- Q162. Display customers whose CUSTOMER_NAME does NOT end with 'A'.

SELECT * FROM CUSTOMERS WHERE CUSTOMER_NAME NOT LIKE '%A';

-- Q163. Display customers whose CUSTOMER_NAME does NOT contain 'AN'.

SELECT * FROM CUSTOMERS WHERE CUSTOMER_NAME NOT LIKE '%AN%';

-- Q164. Display products whose PRODUCT_NAME does NOT start with 'S'.

SELECT * FROM PRODUCTS WHERE PRODUCT_NAME NOT LIKE 'S%';

-- Q165. Display products whose PRODUCT_NAME does NOT end with 'E'.

SELECT * FROM PRODUCTS WHERE PRODUCT_NAME NOT LIKE '%E';

-- Q166. Display products whose PRODUCT_NAME does NOT contain 'PHONE'.

SELECT * FROM PRODUCTS WHERE PRODUCT_NAME NOT LIKE '%PHONE%';

-- Q167. Display employees whose EMP_NAME does NOT start with 'R'.

SELECT * FROM EMPLOYEES WHERE EMP_NAME NOT LIKE 'R%';

-- Q168. Display suppliers whose SUPPLIER_NAME does NOT contain 'TECH'.

SELECT * FROM SUPPLIERS WHERE SUPPLIER_NAME NOT LIKE '%TECH%';

-- Q169. Display customers whose CITY does NOT start with 'H'.

SELECT * FROM CUSTOMERS WHERE UPPER(CITY) NOT LIKE 'H%';

-- Q170. Display products whose PRODUCT_NAME does NOT have exactly 5 characters.

SELECT * FROM PRODUCTS WHERE UPPER(PRODUCT_NAME) NOT LIKE '_____';

-- =====================================================
-- CONCEPT 5 — IN WITH NUMERIC CONDITIONS
-- =====================================================

-- Q171. Display products whose PRICE is greater than 500
-- and whose CATEGORY_ID is 1, 2, or 3.

SELECT * FROM PRODUCTS WHERE PRICE>500 AND CATEGORY_ID IN(1,2,3);

-- Q172. Display products whose STOCK is greater than 20
-- and whose CATEGORY_ID is 1 or 2.

SELECT * FROM PRODUCTS WHERE STOCK>20 AND CATEGORY_ID IN(1,2);

-- Q173. Display order items whose QUANTITY is greater than 5
-- and whose PRODUCT_ID is 1, 2, or 3.

SELECT * FROM ORDER_ITEMS WHERE QUANTITY>5 AND PRODUCT_ID IN(1,2,3);

-- Q174. Display payments whose AMOUNT is greater than 5000
-- and whose PAYMENT_MODE is 'CASH' or 'CARD'.

SELECT * FROM PAYMENTS WHERE AMOUNT>5000 AND UPPER(PAYMENT_MODE) IN('CASH','CARD');


-- =====================================================
-- CONCEPT 6 — NOT IN WITH NUMERIC CONDITIONS
-- =====================================================

-- Q175. Display products whose PRICE is greater than 500
-- and whose CATEGORY_ID is NOT 1, 2, or 3.

SELECT * FROM PRODUCTS WHERE PRICE>500 AND CATEGORY_ID NOT IN(1,2,3);

-- Q176. Display products whose STOCK is greater than 20
-- and whose CATEGORY_ID is NOT 1 or 2.

SELECT * FROM PRODUCTS WHERE STOCK>20 AND CATEGORY_ID NOT IN(1,2);

-- Q177. Display order items whose QUANTITY is greater than 5
-- and whose PRODUCT_ID is NOT 1, 2, or 3.

SELECT * FROM ORDER_ITEMS WHERE QUANTITY>5 AND PRODUCT_ID NOT IN(1,2,3);

-- Q178. Display payments whose AMOUNT is greater than 5000
-- and whose PAYMENT_MODE is NOT 'CASH' or 'CARD'.

SELECT * FROM PAYMENTS WHERE AMOUNT>5000 AND UPPER(PAYMENT_MODE) NOT IN('CASH','CARD');


-- =====================================================
-- CONCEPT 7 — LIKE WITH AND / OR
-- =====================================================

-- Q179. Display products whose PRODUCT_NAME starts with 'S'
-- AND PRICE is greater than 500.

SELECT * FROM PRODUCTS WHERE UPPER(PRODUCT_NAME) LIKE 'S%' AND PRICE>500; 

-- Q180. Display customers whose CITY starts with 'H'
-- OR CUSTOMER_NAME starts with 'A'.

SELECT * FROM CUSTOMERS WHERE UPPER(CITY) LIKE 'H%' OR CUSTOMER_NAME LIKE 'A%'; 

-- =====================================================
-- END OF 02_SPECIAL_OPERATORS
-- =====================================================
SPOOL OFF