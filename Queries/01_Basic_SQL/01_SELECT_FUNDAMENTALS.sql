SPOOL 'F:\Exploring Technologies\OrcaleSqlPlusExploring\Oracle_Inventory_Sales_Management_System\Queries\01_Basic_SQL\01_SELECT_FUNDAMENTALS_OUTPUT.txt'

SET LINESIZE 200
SET PAGESIZE 100
SET WRAP OFF
SET TAB OFF
SET NUMWIDTH 12
SET FEEDBACK ON
SET HEADING ON
SET COLSEP ' | '

COLUMN CUSTOMER_NAME FORMAT A30
COLUMN PRODUCT_NAME FORMAT A35
COLUMN EMP_NAME FORMAT A25
COLUMN EMAIL FORMAT A30
COLUMN CITY FORMAT A15
COLUMN PRICE FORMAT 99999999.99
COLUMN SALARY FORMAT 99999999.99
COLUMN AMOUNT FORMAT 99999999.99

-- =====================================================
-- LEVEL 1 — BASIC SELECT & FILTERING
-- Oracle 11g / SQL*Plus
-- =====================================================

--=====================================================
--CONCEPT 1 — SELECT *
--=====================================================

--Q001. Display all records from CATEGORIES.

SELECT * FROM CATEGORIES;

--Q002. Display all records from CUSTOMERS.

SELECT * FROM CUSTOMERS;

--Q003. Display all records from EMPLOYEES.

SELECT * FROM EMPLOYEES;

--Q004. Display all records from INVENTORY_LOG.

SELECT * FROM INVENTORY_LOG;

--Q005. Display all records from ORDER_ITEMS.

SELECT * FROM ORDER_ITEMS;

--Q006. Display all records from ORDERS.

SELECT * FROM ORDERS;

--Q007. Display all records from PAYMENTS.

SELECT * FROM PAYMENTS;

--Q008. Display all records from PRODUCTS.

SELECT * FROM PRODUCTS;

--Q009. Display all records from PURCHASES.

SELECT * FROM PURCHASES;

--Q010. Display all records from SUPPLIERS.

SELECT * FROM SUPPLIERS;

--=====================================================
--CONCEPT 2 — SPECIFIC COLUMN SELECTION
--=====================================================

--Q011. Display CATEGORY_ID and CATEGORY_NAME from CATEGORIES.

SELECT CATEGORY_ID,CATEGORY_NAME FROM CATEGORIES;

--Q012. Display CUSTOMER_ID, CUSTOMER_NAME and CITY from CUSTOMERS.

SELECT CUSTOMER_ID,CUSTOMER_NAME,CITY FROM CUSTOMERS;

--Q013. Display CUSTOMER_NAME, PHONE and EMAIL from CUSTOMERS.

SELECT CUSTOMER_NAME,PHONE,EMAIL FROM CUSTOMERS;

--Q014. Display EMP_ID, EMP_NAME and DESIGNATION from EMPLOYEES.

SELECT EMP_ID,EMP_NAME,DESIGNATION FROM EMPLOYEES ;

--Q015. Display EMP_NAME and SALARY from EMPLOYEES.

SELECT EMP_NAME,SALARY FROM EMPLOYEES;

--Q016. Display PRODUCT_ID, PRODUCT_NAME and PRICE from PRODUCTS.

SELECT PRODUCT_ID,PRODUCT_NAME,PRICE FROM PRODUCTS;

--Q017. Display PRODUCT_NAME, PRICE and STOCK from PRODUCTS.

SELECT PRODUCT_NAME,PRICE,STOCK FROM PRODUCTS;

--Q018. Display ORDER_ID, CUSTOMER_ID and ORDER_DATE from ORDERS.

SELECT ORDER_ID,CUSTOMER_ID,ORDER_DATE FROM ORDERS;

--Q019. Display ORDER_ID, EMP_ID and STATUS from ORDERS.

SELECT ORDER_ID,EMP_ID,STATUS FROM ORDERS;

--Q020. Display PAYMENT_ID, ORDER_ID and AMOUNT from PAYMENTS.

SELECT PAYMENT_ID,ORDER_ID,AMOUNT FROM PAYMENTS;

--Q021. Display PAYMENT_MODE, PAYMENT_DATE and AMOUNT from PAYMENTS.

SELECT PAYMENT_MODE,PAYMENT_DATE,AMOUNT FROM PAYMENTS;

--Q022. Display PURCHASE_ID, PRODUCT_ID and QUANTITY from PURCHASES.

SELECT PURCHASE_ID,PRODUCT_ID,QUANTITY FROM PURCHASES;

--Q023. Display SUPPLIER_ID, QUANTITY and PURCHASE_DATE from PURCHASES.

SELECT SUPPLIER_ID,QUANTITY,PURCHASE_DATE FROM PURCHASES;

--Q024. Display ORDER_ITEM_ID, ORDER_ID and PRODUCT_ID from ORDER_ITEMS.

SELECT ORDER_ITEM_ID,ORDER_ID,PRODUCT_ID FROM ORDER_ITEMS;

--Q025. Display LOG_ID, PRODUCT_ID and UPDATED_DATE from INVENTORY_LOG.

SELECT LOG_ID,PRODUCT_ID,UPDATED_DATE FROM INVENTORY_LOG;

--=====================================================
--CONCEPT 3 — DISTINCT
--=====================================================

--Q026. Display all unique cities from CUSTOMERS.

SELECT DISTINCT CITY FROM CUSTOMERS;

--Q027. Display all unique employee designations from EMPLOYEES.

SELECT DISTINCT DESIGNATION FROM EMPLOYEES;

--Q028. Display all unique payment modes from PAYMENTS.

SELECT DISTINCT PAYMENT_MODE FROM PAYMENTS;

--Q029. Display all unique order statuses from ORDERS.

SELECT DISTINCT STATUS FROM ORDERS;

--Q030. Display all unique supplier phone numbers from SUPPLIERS.

SELECT DISTINCT PHONE FROM SUPPLIERS;

--=====================================================
CONCEPT 4 — COLUMN ALIASES
--=====================================================

--Q031. Display PRODUCT_NAME with the heading PRODUCT.

SELECT PRODUCT_NAME AS PRODUCT FROM PRODUCTS;

--Q032. Display PRICE with the heading PRODUCT_PRICE.

SELECT PRICE AS PRODUCT_PRICE FROM PRODUCTS;

--Q033. Display CUSTOMER_NAME with the heading CUSTOMER.

SELECT CUSTOMER_NAME AS CUSTOMER FROM CUSTOMERS;

--Q034. Display SALARY with the heading EMPLOYEE_SALARY.

SELECT SALARY AS EMPLOYEE_SALARY FROM EMPLOYEES;

--Q035. Display ORDER_DATE with the heading DATE_OF_ORDER.

SELECT ORDER_DATE AS DATE_OF_ORDER FROM ORDERS;

--=================================================================================================================================================
CONCEPT 5 — ARITHMETIC EXPRESSIONS
--==================================================================================================================================================

--Q036. Display PRODUCT_NAME and calculate the price after a 10% increase.

SELECT PRODUCT_NAME AS PRODUCT,PRICE,PRICE * 1.10 AS PRICE_AFTER_INCREASE FROM PRODUCTS;

--Q037. Display PRODUCT_NAME and calculate the price after a 20% increase.

SELECT PRODUCT_NAME AS PRODUCT,PRICE,PRICE * 1.20 AS PRICE_AFTER_INCREASE FROM PRODUCTS;

--Q038. Display QUANTITY, PRICE and calculate the total item value as QUANTITY × PRICE from ORDER_ITEMS.

SELECT QUANTITY,PRICE,QUANTITY*PRICE AS TOTAL_ITEM_VALUE FROM ORDER_ITEMS;

--Q039. Display PRODUCT_NAME, STOCK and PRICE and calculate the total inventory value as STOCK × PRICE.

SELECT PRODUCT_NAME,STOCK,PRICE,STOCK*PRICE AS TOTAL_INVENTORY_VALUE FROM PRODUCTS;

--Q040. Display EMP_NAME and calculate the salary after a 10% increment.

SELECT EMP_NAME,SALARY,SALARY*1.10 AS INCREMENT_SALARY_10_PER FROM EMPLOYEES;

--Q041. Display EMP_NAME and calculate the salary after a 15% increment.

SELECT EMP_NAME,SALARY,SALARY*1.15 AS INCREMENT_SALARY_15_PER FROM EMPLOYEES;

--Q042. Display PAYMENT_ID, AMOUNT and calculate a 5% processing charge.

SELECT PAYMENT_ID,AMOUNT,AMOUNT*0.05 AS PROCESSING_5_PER_CHARGE FROM PAYMENTS;

--Q043. Display PAYMENT_ID, AMOUNT and calculate the payment amount after adding a 5% processing charge.

SELECT PAYMENT_ID,AMOUNT,AMOUNT*1.05 AS AMOUNT_WITH_5_PER_CHARGE FROM PAYMENTS;

--==============================================================================================================================================================================
--CONCEPT 6 — WHERE
--==============================================================================================================================================================================

--Q044. Display all products whose PRICE is greater than 1000.

SELECT * FROM PRODUCTS WHERE PRICE>1000;

--Q045. Display all products whose STOCK is less than 50.

SELECT * FROM PRODUCTS WHERE STOCK<50;

--Q046. Display all employees whose SALARY is greater than 30000.

SELECT * FROM EMPLOYEES WHERE SALARY>30000;

--Q047. Display all employees whose SALARY is equal to 30000.

SELECT * FROM EMPLOYEES WHERE SALARY=30000;

--Q048. Display all orders whose STATUS is 'DELIVERED'.

SELECT * FROM ORDERS WHERE STATUS='DELIVERED';

--Q049. Display all orders whose STATUS is 'PENDING'.

SELECT * FROM ORDERS WHERE STATUS='PENDING';

--Q050. Display all payments whose AMOUNT is greater than 5000.

SELECT * FROM PAYMENTS WHERE AMOUNT>5000;

--Q051. Display all order items whose QUANTITY is greater than 5.

SELECT * FROM ORDER_ITEMS WHERE QUANTITY>5;

--Q052. Display all purchases whose QUANTITY is less than 20.

SELECT * FROM PURCHASES WHERE QUANTITY<20;

--Q053. Display the customer whose CUSTOMER_ID is 101.

SELECT * FROM CUSTOMERS WHERE CUSTOMER_ID=101;

--==================================================================================================================================================================
--CONCEPT 7 — COMPARISON OPERATORS
--==================================================================================================================================================================

--Q054. Display products whose PRICE is greater than or equal to 500.

SELECT * FROM PRODUCTS WHERE PRICE>=500;

--Q055. Display products whose STOCK is less than or equal to 10.

SELECT * FROM PRODUCTS WHERE STOCK<=10;

--Q056. Display employees whose SALARY is not equal to 25000.

SELECT * FROM EMPLOYEES WHERE SALARY!=25000;

--Q057. Display orders whose EMP_ID is not equal to 5.

SELECT * FROM ORDERS WHERE EMP_ID!=5;

--Q058. Display payments whose AMOUNT is greater than or equal to 10000.

SELECT * FROM PAYMENTS WHERE AMOUNT>=10000;

--===================================================================================================================================================================
--CONCEPT 8 — LOGICAL OPERATORS
--===================================================================================================================================================================

--Q059. Display products whose PRICE is greater than 500 AND STOCK is greater than 20.

SELECT * FROM PRODUCTS WHERE PRICE>500 AND STOCK>20;

--Q060. Display employees whose SALARY is greater than 30000 AND DESIGNATION is 'MANAGER'.

SELECT * FROM EMPLOYEES WHERE SALARY>30000 AND DESIGNATION ='MANAGER';

--Q061. Display orders whose STATUS is 'PENDING' OR STATUS is 'PROCESSING'.

SELECT * FROM ORDERS WHERE STATUS ='PENDING' OR STATUS ='PROCESSING';

--Q062. Display products whose PRICE is less than 500 OR STOCK is less than 10.

SELECT * FROM PRODUCTS WHERE PRICE<500 OR STOCK<10;

--Q063. Display customers whose CITY is 'Hyderabad' AND EMAIL is not NULL.

SELECT * FROM CUSTOMERS WHERE CITY='HYDERABAD' AND EMAIL IS NOT NULL;

--Q064. Display payments whose AMOUNT is greater than 5000 AND PAYMENT_MODE is 'CASH'.

SELECT * FROM PAYMENTS WHERE AMOUNT>5000 AND PAYMENT_MODE='CASH';

--===========================================================================================================================================================================
--CONCEPT 9 — ORDER BY
--===========================================================================================================================================================================

--Q065. Display all products sorted by PRICE in ascending order.

SELECT * FROM PRODUCTS ORDER BY PRICE ASC;

--Q066. Display all products sorted by PRICE in descending order.

SELECT * FROM PRODUCTS ORDER BY PRICE DESC;

--Q067. Display all employees sorted by SALARY in ascending order.

SELECT * FROM EMPLOYEES ORDER BY SALARY ASC;

--Q068. Display all employees sorted by SALARY in descending order.

SELECT * FROM EMPLOYEES ORDER BY SALARY DESC;

--Q069. Display customers sorted by CUSTOMER_NAME in ascending order.

SELECT * FROM CUSTOMERS ORDER BY CUSTOMER_NAME ASC;

--Q070. Display products sorted by PRODUCT_NAME in descending order.

SELECT * FROM PRODUCTS ORDER BY PRODUCT_NAME DESC;

--========================================================================================================================================================================================
--END — LEVEL 1
--========================================================================================================================================================================================
SPOOL OFF