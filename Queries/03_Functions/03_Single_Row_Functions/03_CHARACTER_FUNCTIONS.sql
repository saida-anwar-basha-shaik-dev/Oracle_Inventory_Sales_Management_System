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

SPOOL 'F:\Exploring Technologies\OrcaleSqlPlusExploring\Oracle_Inventory_Sales_Management_System\Queries\03_Functions\03_Single_Row_Functions\03_CHARACTER_FUNCTIONS_OUTPUT.txt'

-- =====================================================
-- LEVEL 3 — SINGLE ROW FUNCTIONS
-- 03_CHARACTER_FUNCTIONS
-- Oracle 11g / SQL*Plus
-- Questions: Q181–Q305
-- =====================================================


-- =====================================================
-- CONCEPT 1 — UPPER()
-- =====================================================

-- WHAT IT DOES:
-- Converts all alphabetic characters in a string to uppercase.

-- SYNTAX:
-- UPPER(string)

-- PARAMETERS:
-- 1 parameter
-- string = character value/expression to convert

-- WHERE TO USE:
-- SELECT      -> to display uppercase data
-- WHERE       -> to perform case-insensitive comparison
-- ORDER BY    -> to sort consistently by uppercase values
-- Other functions -> can be nested with other character functions

-- EXAMPLE 1:
-- UPPER('hello') → HELLO

-- EXAMPLE 2:
-- UPPER(CUSTOMER_NAME) → converts CUSTOMER_NAME to uppercase


-- Q181. Display CUSTOMER_NAME in uppercase.

SELECT UPPER(CUSTOMER_NAME) FROM CUSTOMERS;

-- Q182. Display CITY in uppercase.

SELECT UPPER(CITY) FROM CUSTOMERS;

-- Q183. Display EMAIL in uppercase.

SELECT UPPER(EMAIL) FROM CUSTOMERS;

-- Q184. Display CUSTOMER_NAME and CITY both in uppercase.

SELECT UPPER(CUSTOMER_NAME),UPPER(CITY) FROM CUSTOMERS;

-- Q185. Display customers whose CITY is 'HYDERABAD' using UPPER().

SELECT * FROM CUSTOMERS WHERE UPPER(CITY)='HYDERABAD';
-- =====================================================
-- CONCEPT 2 — LOWER()
-- =====================================================

-- WHAT IT DOES:
-- Converts all alphabetic characters in a string to lowercase.

-- SYNTAX:
-- LOWER(string)

-- PARAMETERS:
-- 1 parameter
-- string = character value/expression to convert

-- WHERE TO USE:
-- SELECT      -> to display lowercase data
-- WHERE       -> for case-insensitive comparisons
-- ORDER BY    -> to sort text consistently
-- Other functions -> can be nested with other character functions

-- EXAMPLE 1:
-- LOWER('HELLO') → hello

-- EXAMPLE 2:
-- LOWER(EMAIL) → converts EMAIL to lowercase


-- Q186. Display CUSTOMER_NAME in lowercase.

SELECT LOWER(CUSTOMER_NAME) FROM CUSTOMERS;

-- Q187. Display CITY in lowercase.

SELECT LOWER(CITY) FROM CUSTOMERS;

-- Q188. Display EMAIL in lowercase.

SELECT LOWER(EMAIL) FROM CUSTOMERS;

-- Q189. Display CUSTOMER_NAME and EMAIL both in lowercase.

SELECT LOWER(CUSTOMER_NAME),LOWER(EMAIL) FROM CUSTOMERS;

-- Q190. Display customers whose EMAIL contains 'gmail' using LOWER().

SELECT * FROM CUSTOMERS WHERE LOWER(EMAIL) LIKE '%gmail%';

-- =====================================================
-- CONCEPT 3 — INITCAP()
-- =====================================================

-- WHAT IT DOES:
-- Converts the first letter of each word to uppercase
-- and the remaining letters to lowercase.

-- SYNTAX:
-- INITCAP(string)

-- PARAMETERS:
-- 1 parameter
-- string = character value/expression

-- WHERE TO USE:
-- SELECT -> to display names in proper/title case
-- Reports -> to make names easier to read
-- Formatting -> useful for customer names, cities, etc.

-- EXAMPLE 1:
-- INITCAP('SAIDA ANWAR') → Saida Anwar

-- EXAMPLE 2:
-- INITCAP(CITY) → Hyderabad


-- Q191. Display CUSTOMER_NAME using INITCAP().

SELECT INITCAP(CUSTOMER_NAME) FROM CUSTOMERS;

-- Q192. Display CITY using INITCAP().

SELECT INITCAP(CITY) FROM CUSTOMERS;

-- Q193. Display CUSTOMER_NAME and CITY using INITCAP().

SELECT INITCAP(CUSTOMER_NAME),INITCAP(CITY) FROM CUSTOMERS;

-- Q194. Display PRODUCT_NAME using INITCAP().

SELECT INITCAP(PRODUCT_NAME) FROM PRODUCTS;

-- Q195. Display customers whose CITY is 'hyderabad'
-- using INITCAP() in the output.

SELECT INITCAP(CITY) FROM CUSTOMERS WHERE INITCAP(CITY)='Hyderabad';

-- =====================================================
-- CONCEPT 4 — LENGTH()
-- =====================================================

-- WHAT IT DOES:
-- Returns the number of characters in a string.

-- SYNTAX:
-- LENGTH(string)

-- PARAMETERS:
-- 1 parameter
-- string = character value/expression

-- WHERE TO USE:
-- SELECT -> to display string length
-- WHERE  -> to filter based on string length
-- ORDER BY -> to sort by string length
-- Validation -> to check minimum/maximum text length

-- EXAMPLE 1:
-- LENGTH('ORACLE') → 6

-- EXAMPLE 2:
-- LENGTH(CUSTOMER_NAME) → returns the number of characters


-- Q196. Display CUSTOMER_NAME and its length.

SELECT CUSTOMER_NAME,LENGTH(CUSTOMER_NAME) FROM CUSTOMERS;

-- Q197. Display PRODUCT_NAME and its length.

SELECT PRODUCT_NAME,LENGTH(PRODUCT_NAME) FROM PRODUCTS;

-- Q198. Display EMP_NAME and its length.

SELECT EMP_NAME,LENGTH(EMP_NAME) FROM EMPLOYEES;

-- Q199. Display customers whose CUSTOMER_NAME contains more than 5 characters.

SELECT CUSTOMER_NAME FROM CUSTOMERS WHERE LENGTH(CUSTOMER_NAME)>5;

-- Q200. Display products whose PRODUCT_NAME contains exactly 5 characters.

SELECT PRODUCT_NAME FROM PRODUCTS WHERE LENGTH(PRODUCT_NAME)=5;

-- Q201. Display CUSTOMER_NAME and CITY along with the length of each.

SELECT CUSTOMER_NAME,LENGTH(CUSTOMER_NAME) AS LENGTH_OF_NAME,CITY,LENGTH(CITY) AS LENGTH_OF_CITY FROM CUSTOMERS;

-- Q202. Display the customer having the longest CUSTOMER_NAME.

SELECT * FROM CUSTOMERS WHERE LENGTH(CUSTOMER_NAME)=(SELECT MAX(LENGTH(CUSTOMER_NAME)) FROM CUSTOMERS);

-- Q203. Display the product having the shortest PRODUCT_NAME.

SELECT * FROM PRODUCTS WHERE LENGTH(PRODUCT_NAME)=(SELECT MIN(LENGTH(PRODUCT_NAME)) FROM PRODUCTS);


-- =====================================================
-- CONCEPT 5 — SUBSTR()
-- =====================================================

-- WHAT IT DOES:
-- Extracts a portion of a string.

-- SYNTAX:
-- SUBSTR(string, start_position)
-- SUBSTR(string, start_position, length)

-- PARAMETERS:
-- Minimum: 2 parameters
-- Maximum: 3 parameters

-- Parameter 1:
-- string = source character value

-- Parameter 2:
-- start_position = position from which extraction starts

-- Parameter 3:
-- length = number of characters to extract (optional)

-- WHERE TO USE:
-- SELECT -> to extract part of a string
-- WHERE  -> to check characters at specific positions
-- Data extraction -> extract prefixes/suffixes/codes
-- Formatting -> extract names, IDs, codes, etc.

-- EXAMPLE 1:
-- SUBSTR('ORACLE',1,3) → ORA

-- EXAMPLE 2:
-- SUBSTR('ORACLE',4) → CLE

--O R A C L E
--1 2 3 4 5 6     → positive
---6 -5 -4 -3 -2 -1 → negative

--SUBSTR(NAME,1,3)     -- first 3
--SUBSTR(NAME,-3,3)    -- last 3
--SUBSTR(NAME,3)       -- from 3rd to end
--SUBSTR(NAME,2,1)     -- 2nd character

-- Q204. Display the first 3 characters of CUSTOMER_NAME.

SELECT SUBSTR(CUSTOMER_NAME,1,3) FROM CUSTOMERS;

-- Q205. Display the first 5 characters of PRODUCT_NAME.

SELECT SUBSTR(PRODUCT_NAME,1,5) FROM PRODUCTS;

-- Q206. Display the last 3 characters of CUSTOMER_NAME using SUBSTR().

SELECT SUBSTR(CUSTOMER_NAME,-3,3) FROM CUSTOMERS;

-- Q207. Display characters 2 through 5 of PRODUCT_NAME.

SELECT SUBSTR(PRODUCT_NAME,2,4) FROM PRODUCTS;

-- Q208. Display the first character of every CUSTOMER_NAME.

SELECT SUBSTR(CUSTOMER_NAME,1,1) FROM CUSTOMERS;

-- Q209. Display the last character of every PRODUCT_NAME.

SELECT SUBSTR(PRODUCT_NAME,-1,1) FROM PRODUCTS;

-- Q210. Display CUSTOMER_NAME starting from the 3rd character until the end.

SELECT SUBSTR(CUSTOMER_NAME,3) FROM CUSTOMERS;

-- Q211. Display the last 4 characters of EMP_NAME.

SELECT SUBSTR(EMP_NAME,-4,4) FROM EMPLOYEES;

-- Q212. Display customers whose CUSTOMER_NAME starts with 'A' using SUBSTR().

SELECT * FROM CUSTOMERS WHERE SUBSTR(CUSTOMER_NAME,1,1)='A';

-- Q213. Display employees whose EMP_NAME has 'A' as the second character using SUBSTR().

SELECT * FROM EMPLOYEES WHERE SUBSTR(EMP_NAME,2,1)='A';

-- Q214. Display PRODUCT_NAME and extract its first 3 characters.

SELECT PRODUCT_NAME,SUBSTR(PRODUCT_NAME,1,3) AS FIRST_3_CHAR FROM PRODUCTS;
-- =====================================================
-- CONCEPT 6 — INSTR()
-- =====================================================

-- WHAT IT DOES:
-- Returns the position of a substring inside a string.

-- SYNTAX:
-- INSTR(string, search_string)
-- INSTR(string, search_string, start_position)
-- INSTR(string, search_string, start_position, occurrence)

-- PARAMETERS:
-- Minimum: 2 parameters
-- Maximum: 4 parameters

-- Parameter 1:
-- string = source string

-- Parameter 2:
-- search_string = string to search for

-- Parameter 3:
-- start_position = position from which search starts (optional)

-- Parameter 4:
-- occurrence = occurrence to search for (optional)

-- WHERE TO USE:
-- SELECT -> to find character/string position
-- WHERE  -> to check whether a substring exists
-- Email processing -> locate @ or .
-- Data validation -> check whether required characters exist
-- String extraction -> commonly combined with SUBSTR()

-- EXAMPLE 1:
-- INSTR('ORACLE','A') → 3

-- EXAMPLE 2:
-- INSTR('BANANA','A',1,2) → 4


-- Q215. Display CUSTOMER_NAME and the position of the first occurrence of 'A'.

SELECT INSTR(CUSTOMER_NAME,'A',1) FROM CUSTOMERS;

-- Q216. Display PRODUCT_NAME and the position of the first occurrence of 'E'.

SELECT INSTR(PRODUCT_NAME,'E',1) FROM PRODUCTS;

-- Q217. Display CUSTOMER_NAME and the position of the first occurrence of 'N'.

SELECT INSTR(CUSTOMER_NAME,'N',1) FROM CUSTOMERS;

-- Q218. Display EMAIL and the position of '@'.

SELECT INSTR(EMAIL,'@',1) FROM CUSTOMERS;

-- Q219. Display EMAIL and the position of '.'.

SELECT INSTR(EMAIL,'.',1) FROM CUSTOMERS;

-- Q220. Display customers whose CUSTOMER_NAME contains the letter 'A' using INSTR().

SELECT * FROM CUSTOMERS WHERE INSTR(CUSTOMER_NAME,'A',1)>0;

-- Q221. Display products whose PRODUCT_NAME contains the word 'PHONE' using INSTR().

SELECT * FROM PRODUCTS WHERE INSTR(PRODUCT_NAME,'PHONE',1)>0;

-- Q222. Display CUSTOMER_NAME and find the position of the second occurrence of 'A'.

SELECT CUSTOMER_NAME,INSTR(UPPER(CUSTOMER_NAME),'A',2) AS POSITION_OF_SECOND_A FROM CUSTOMERS;

-- Q223. Display EMAIL and find the position of '@' starting from the 5th character.

SELECT EMAIL,INSTR(EMAIL,'@',5) AS POSITION_OF_AT FROM CUSTOMERS;

-- =====================================================
-- CONCEPT 7 — CONCAT()
-- =====================================================

-- WHAT IT DOES:
-- Concatenates two character values into one string.

-- SYNTAX:
-- CONCAT(string1, string2)

-- PARAMETERS:
-- Exactly 2 parameters

-- Parameter 1:
-- string1 = first string

-- Parameter 2:
-- string2 = second string

-- IMPORTANT:
-- CONCAT() accepts only TWO arguments.
-- For more than two values, use || or nest CONCAT().

-- WHERE TO USE:
-- SELECT -> combine two values
-- Reports -> create readable output
-- Formatting -> combine names, labels, etc.

-- EXAMPLE 1:
-- CONCAT('SQL','PLUS') → SQLPLUS

-- EXAMPLE 2:
-- CONCAT(CUSTOMER_NAME,CITY) → combines two columns


-- Q224. Display CUSTOMER_NAME and CITY as one combined value using CONCAT().

SELECT CONCAT(CUSTOMER_NAME,CITY) FROM CUSTOMERS;

-- Q225. Display CUSTOMER_NAME followed by the text ' CUSTOMER'.

SELECT CONCAT(CUSTOMER_NAME,' CUSTOMER') FROM CUSTOMERS;

-- Q226. Display PRODUCT_NAME followed by the text ' PRODUCT'.

SELECT CONCAT(PRODUCT_NAME,' IT IS A PRODUCT') FROM PRODUCTS;

-- Q227. Display EMP_NAME followed by the text ' EMPLOYEE'.

SELECT CONCAT(EMP_NAME,'  EMPLOYEE') FROM EMPLOYEES;

-- Q228. Display CUSTOMER_NAME and CITY separated using CONCAT().

SELECT CONCAT(CUSTOMER_NAME,CITY) FROM CUSTOMERS;

-- Q229. Display PRODUCT_NAME and PRICE as a combined value using CONCAT().

SELECT CONCAT(PRODUCT_NAME,PRICE) FROM PRODUCTS;

-- =====================================================
-- CONCEPT 8 — CONCATENATION OPERATOR ||
-- =====================================================

-- WHAT IT DOES:
-- Combines two or more character values into one string.

-- SYNTAX:
-- string1 || string2
-- string1 || string2 || string3

-- PARAMETERS:
-- No fixed parameter limit.
-- It is an operator, not a function.

-- WHERE TO USE:
-- SELECT -> combine multiple columns/values
-- Reports -> create formatted output
-- Labels -> create readable descriptions
-- Formatting -> combine name, city, ID, etc.

-- EXAMPLE 1:
-- 'HELLO' || 'WORLD' → HELLOWORLD

-- EXAMPLE 2:
-- CUSTOMER_NAME || ' - ' || CITY


-- Q230. Display CUSTOMER_NAME and CITY using ||.

SELECT 'MR.//MRS. '||CUSTOMER_NAME||' IS OUR CUSTOMER LIVING IN '||CITY FROM CUSTOMERS;

-- Q231. Display CUSTOMER_NAME followed by the text ' - CUSTOMER'.

SELECT 'MR.//MRS. '||CUSTOMER_NAME||' IS OUR CUSTOMER ' FROM CUSTOMERS;

-- Q232. Display PRODUCT_NAME followed by its PRICE using ||.

SELECT PRODUCT_NAME||' HAVING TOTAL PRICE OF '||PRICE FROM PRODUCTS;

-- Q233. Display EMP_NAME followed by DESIGNATION using ||.

SELECT EMP_NAME||' HAVING IN DESIGNATION OF '||DESIGNATION FROM EMPLOYEES;

-- Q234. Display CUSTOMER_NAME, CITY and EMAIL in a single output column.

SELECT 'OUR CUSTOMER '||CUSTOMER_NAME||' LIVING IN '||CITY||' HAVING EMAIL ADDRESS '||EMAIL FROM CUSTOMERS;

-- Q235. Display PRODUCT_NAME and STOCK in the format: PRODUCT_NAME - STOCK.

SELECT 'THIS PRODUCT '||PRODUCT_NAME||' HAVING STOCK '||STOCK FROM PRODUCTS;


-- =====================================================
-- CONCEPT 9 — REPLACE()
-- =====================================================

-- WHAT IT DOES:
-- Replaces occurrences of one string with another string.

-- SYNTAX:
-- REPLACE(string, search_string)
-- REPLACE(string, search_string, replacement_string)

-- PARAMETERS:
-- Minimum: 2 parameters
-- Maximum: 3 parameters

-- Parameter 1:
-- string = source string

-- Parameter 2:
-- search_string = text to find

-- Parameter 3:
-- replacement_string = text that replaces it (optional)

-- IMPORTANT:
-- If replacement_string is omitted, matching text is removed.

-- WHERE TO USE:
-- SELECT -> modify displayed text
-- Data cleaning -> remove unwanted characters
-- Formatting -> replace separators/symbols
-- Data transformation -> change specific text

-- EXAMPLE 1:
-- REPLACE('ORACLE SQL','SQL','DATABASE') → ORACLE DATABASE

-- EXAMPLE 2:
-- REPLACE('A-B-C','-','/') → A/B/C


-- Q236. Replace the letter 'A' with 'X' in CUSTOMER_NAME.

SELECT REPLACE(CUSTOMER_NAME,'A','X') FROM CUSTOMERS;

-- Q237. Replace the letter 'E' with 'X' in PRODUCT_NAME.

SELECT REPLACE(PRODUCT_NAME,'E','X') FROM PRODUCTS;

-- Q238. Replace 'HYDERABAD' with 'HYD' in CITY.

SELECT REPLACE(UPPER(CITY),'HYDERABAD','HYD') FROM CUSTOMERS;

-- Q239. Remove '-' from PHONE using REPLACE().

SELECT REPLACE(PHONE,'-','') FROM CUSTOMERS;

-- Q240. Replace spaces in PRODUCT_NAME with '-'.

SELECT REPLACE(PRODUCT_NAME,' ','-') FROM PRODUCTS;

-- Q241. Replace the word 'PHONE' with 'MOBILE' in PRODUCT_NAME.

SELECT REPLACE(PRODUCT_NAME,'PHONE','MOBILE') FROM PRODUCTS;

-- Q242. Display CUSTOMER_NAME after replacing every occurrence of 'A' with 'Z'.

SELECT REPLACE(CUSTOMER_NAME,'A','Z') FROM CUSTOMERS;

-- Q243. Display EMAIL after replacing '@' with '[AT]'.

SELECT REPLACE(EMAIL,'@','[AT]') FROM CUSTOMERS;

-- =====================================================
-- CONCEPT 10 — TRIM()
-- =====================================================

-- WHAT IT DOES:
-- Removes characters from the beginning and/or end of a string.

-- SYNTAX:
-- TRIM(string)
-- TRIM(character FROM string)
-- TRIM(LEADING character FROM string)
-- TRIM(TRAILING character FROM string)
-- TRIM(BOTH character FROM string)

-- PARAMETERS:
-- Basic form: 1 parameter
-- Extended forms: character + string

-- WHERE TO USE:
-- Data cleaning -> remove unwanted spaces
-- SELECT -> display cleaned values
-- WHERE -> compare cleaned text
-- Data import -> clean values received with extra spaces

-- EXAMPLE 1:
-- TRIM('  ORACLE  ') → ORACLE

-- EXAMPLE 2:
-- TRIM('*' FROM '***ORACLE***') → ORACLE


-- Q244. Remove leading and trailing spaces from CUSTOMER_NAME using TRIM().

SELECT TRIM(CUSTOMER_NAME) FROM CUSTOMERS;

-- Q245. Remove leading and trailing spaces from CITY using TRIM().

SELECT TRIM(CITY) FROM CUSTOMERS;

-- Q246. Remove the character '*' from both sides of a string using TRIM().

SELECT TRIM('*' FROM CUSTOMER_NAME) FROM CUSTOMERS;

-- Q247. Display the length of CUSTOMER_NAME before and after TRIM().

SELECT LENGTH(CUSTOMER_NAME) AS BEFORE_TRIM,LENGTH(TRIM(CUSTOMER_NAME)) AS AFTER_TRIM FROM CUSTOMERS;

-- Q248. Display CUSTOMER_NAME after removing surrounding spaces.

SELECT TRIM(CUSTOMER_NAME) FROM CUSTOMERS;
-- =====================================================
-- CONCEPT 11 — LTRIM()
-- =====================================================

-- WHAT IT DOES:
-- Removes characters from the left side of a string.

-- SYNTAX:
-- LTRIM(string)
-- LTRIM(string, set)

-- PARAMETERS:
-- Minimum: 1 parameter
-- Maximum: 2 parameters

-- Parameter 1:
-- string = source string

-- Parameter 2:
-- set = characters to remove from the left side

-- WHERE TO USE:
-- Data cleaning -> remove leading spaces
-- Formatting -> remove unwanted leading characters
-- Imported data -> clean leading characters

-- EXAMPLE 1:
-- LTRIM('   ORACLE') → ORACLE

-- EXAMPLE 2:
-- LTRIM('***ORACLE','*') → ORACLE


-- Q249. Remove leading spaces from CUSTOMER_NAME using LTRIM().

SELECT LTRIM(CUSTOMER_NAME,' ') FROM CUSTOMERS;

-- Q250. Remove leading spaces from CITY using LTRIM().

SELECT LTRIM(CITY,' ') FROM CUSTOMERS;

-- Q251. Remove leading '*' characters from CUSTOMER_NAME using LTRIM().

SELECT LTRIM(CUSTOMER_NAME,'*') FROM CUSTOMERS;

-- Q252. Display CUSTOMER_NAME and its length before and after LTRIM().

SELECT LENGTH(CUSTOMER_NAME) AS BEFORE_TRIM,LENGTH(LTRIM(CUSTOMER_NAME,' ')) AS AFTER_TRIM FROM CUSTOMERS;

-- =====================================================
-- CONCEPT 12 — RTRIM()
-- =====================================================

-- WHAT IT DOES:
-- Removes characters from the right side of a string.

-- SYNTAX:
-- RTRIM(string)
-- RTRIM(string, set)

-- PARAMETERS:
-- Minimum: 1 parameter
-- Maximum: 2 parameters

-- Parameter 1:
-- string = source string

-- Parameter 2:
-- set = characters to remove from the right side

-- WHERE TO USE:
-- Data cleaning -> remove trailing spaces
-- Formatting -> remove unwanted trailing characters
-- Imported data -> clean trailing characters

-- EXAMPLE 1:
-- RTRIM('ORACLE   ') → ORACLE

-- EXAMPLE 2:
-- RTRIM('ORACLE***','*') → ORACLE


-- Q253. Remove trailing spaces from CUSTOMER_NAME using RTRIM().

SELECT RTRIM(CUSTOMER_NAME,' ') FROM CUSTOMERS;

-- Q254. Remove trailing spaces from CITY using RTRIM().

SELECT RTRIM(CITY,' ') FROM CUSTOMERS; 

-- Q255. Remove trailing '*' characters from CUSTOMER_NAME using RTRIM().

SELECT RTRIM(CUSTOMER_NAME,'*') FROM CUSTOMERS;

-- Q256. Display CUSTOMER_NAME and its length before and after RTRIM().

SELECT LENGTH(CUSTOMER_NAME) AS BEFORE_TRIM,LENGTH(RTRIM(CUSTOMER_NAME,' ')) AS AFTER_TRIM FROM CUSTOMERS;

-- =====================================================
-- CONCEPT 13 — LPAD()
-- =====================================================

-- WHAT IT DOES:
-- Adds characters to the left side of a string
-- until the specified total length is reached.

-- SYNTAX:
-- LPAD(string, total_length)
-- LPAD(string, total_length, pad_string)

-- PARAMETERS:
-- Minimum: 2 parameters
-- Maximum: 3 parameters

-- Parameter 1:
-- string = source string

-- Parameter 2:
-- total_length = final length

-- Parameter 3:
-- pad_string = character/string used for padding (optional)

-- WHERE TO USE:
-- Reports -> align output
-- IDs -> add leading zeros
-- Formatting -> create fixed-width values
-- Display -> improve SQL*Plus report formatting

-- EXAMPLE 1:
-- LPAD('123',5,'0') → 00123

-- EXAMPLE 2:
-- LPAD('SQL',8,'*') → *****SQL


-- Q257. Display PRODUCT_ID padded with zeros on the left to a total length of 5.

SELECT LPAD(PRODUCT_ID,5,'0') FROM PRODUCTS;

-- Q258. Display PRODUCT_ID padded with '*' on the left to a total length of 8.

SELECT LPAD(PRODUCT_ID,8,'*') FROM PRODUCTS;

-- Q259. Display CUSTOMER_NAME padded with spaces on the left to a total length of 20.

SELECT LPAD(CUSTOMER_NAME,20,' ') FROM CUSTOMERS;

-- Q260. Display EMP_ID padded with zeros on the left to a total length of 5.

SELECT LPAD(EMP_ID,5,'0') FROM EMPLOYEES;

-- Q261. Display PRODUCT_NAME padded with '-' on the left to a total length of 15.

SELECT LPAD(PRODUCT_NAME,15,'-') FROM PRODUCTS;

-- Q262. Display PRODUCT_ID and pad it with zeros on the left to a total length of 6,along with the original PRODUCT_ID.

SELECT PRODUCT_ID,LPAD(PRODUCT_ID,5,'0') FROM PRODUCTS;

-- =====================================================
-- CONCEPT 14 — RPAD()
-- =====================================================

-- WHAT IT DOES:
-- Adds characters to the right side of a string
-- until the specified total length is reached.

-- SYNTAX:
-- RPAD(string, total_length)
-- RPAD(string, total_length, pad_string)

-- PARAMETERS:
-- Minimum: 2 parameters
-- Maximum: 3 parameters

-- Parameter 1:
-- string = source string

-- Parameter 2:
-- total_length = final length

-- Parameter 3:
-- pad_string = character/string used for padding (optional)

-- WHERE TO USE:
-- Reports -> align columns
-- Fixed-width output -> create consistent lengths
-- Formatting -> add trailing characters
-- SQL*Plus reports -> improve readability

-- EXAMPLE 1:
-- RPAD('123',5,'0') → 12300

-- EXAMPLE 2:
-- RPAD('SQL',8,'*') → SQL*****


-- Q263. Display PRODUCT_ID padded with zeros on the right to a total length of 5.

SELECT RPAD(PRODUCT_ID,5,'0') FROM PRODUCTS;

-- Q264. Display PRODUCT_ID padded with '*' on the right to a total length of 8.

SELECT RPAD(PRODUCT_ID,8,'*') FROM PRODUCTS;

-- Q265. Display CUSTOMER_NAME padded with spaces on the right to a total length of 20.

SELECT RPAD(CUSTOMER_NAME,20,' ') FROM CUSTOMERS;

-- Q266. Display EMP_ID padded with zeros on the right to a total length of 5.

SELECT RPAD(EMP_ID,5,'0') FROM EMPLOYEES;

-- Q267. Display PRODUCT_NAME padded with '-' on the right to a total length of 15.

SELECT RPAD(PRODUCT_NAME,15,'-') FROM PRODUCTS;


-- Q268. Display PRODUCT_ID and pad it with zeros on the RIGHT to a total length of 6,along with the original PRODUCT_ID.

SELECT PRODUCT_ID,RPAD(PRODUCT_ID,6,'0') FROM PRODUCTS;


-- =====================================================
-- CONCEPT 15 — COMBINING CHARACTER FUNCTIONS
-- =====================================================

-- WHAT IT DOES:
-- Combines two or more character functions to perform
-- multiple string operations in a single expression.

-- GENERAL SYNTAX:
-- FUNCTION1(FUNCTION2(column))

-- PARAMETERS:
-- Depends on the individual functions being combined.

-- WHERE TO USE:
-- Data cleaning
-- Data formatting
-- Reports
-- Complex string extraction
-- Case conversion + extraction
-- Searching + extraction

-- EXAMPLE 1:
-- UPPER(SUBSTR(CUSTOMER_NAME,1,3))

-- EXAMPLE 2:
-- LENGTH(TRIM(CUSTOMER_NAME))


-- Q269. Display CUSTOMER_NAME in uppercase and its length.

SELECT UPPER(CUSTOMER_NAME),LENGTH(CUSTOMER_NAME) FROM CUSTOMERS;

-- Q270. Display CUSTOMER_NAME in lowercase and its length.

SELECT LOWER(CUSTOMER_NAME),LENGTH(CUSTOMER_NAME) FROM CUSTOMERS;

-- Q271. Display CUSTOMER_NAME in INITCAP format and its length.

SELECT INITCAP(CUSTOMER_NAME),LENGTH(CUSTOMER_NAME) FROM CUSTOMERS;

-- Q272. Display the first 3 characters of CUSTOMER_NAME in uppercase.

SELECT UPPER(SUBSTR(CUSTOMER_NAME,1,3)) FROM CUSTOMERS;

-- Q273. Display the first 5 characters of PRODUCT_NAME in lowercase.

SELECT LOWER(SUBSTR(PRODUCT_NAME,1,5)) FROM PRODUCTS;

-- Q274. Display CUSTOMER_NAME after TRIM() and UPPER().

SELECT UPPER(TRIM(CUSTOMER_NAME)) FROM CUSTOMERS;

--Q275. Display PRODUCT_NAME after replacing the character '-' with a space using REPLACE(), and then convert the resulting PRODUCT_NAME to uppercase.

SELECT UPPER(REPLACE(PRODUCT_NAME,'-',' ')) FROM PRODUCTS;

-- Q276. Display CUSTOMER_NAME and the position of 'A'
-- after converting CUSTOMER_NAME to uppercase.

SELECT CUSTOMER_NAME,INSTR(UPPER(CUSTOMER_NAME),'A') FROM CUSTOMERS;

-- Q277. Display EMAIL in lowercase and the position of '@'.

SELECT LOWER(EMAIL),INSTR(LOWER(EMAIL),'@') FROM CUSTOMERS;

-- Q278. Display PRODUCT_NAME, its length and its first 3 characters.

SELECT PRODUCT_NAME,LENGTH(PRODUCT_NAME) AS LENGTH,SUBSTR(PRODUCT_NAME,1,3) FROM PRODUCTS;

-- Q279. Display CUSTOMER_NAME, its length and its last 3 characters.

SELECT CUSTOMER_NAME,LENGTH(CUSTOMER_NAME),SUBSTR(CUSTOMER_NAME,-3,3) FROM CUSTOMERS;

-- Q280. Display CUSTOMER_NAME and CITY combined in uppercase.

SELECT UPPER(CONCAT(CUSTOMER_NAME,CITY)) FROM CUSTOMERS; 

-- Q281. Display CUSTOMER_NAME followed by its length using ||.

SELECT CUSTOMER_NAME||' LENGTH IS '||LENGTH(CUSTOMER_NAME) FROM CUSTOMERS;

-- Q282. Display PRODUCT_NAME followed by its first 3 characters using ||.

SELECT PRODUCT_NAME||' FIRST 3 CHARACTERS '||SUBSTR(PRODUCT_NAME,1,3) FROM PRODUCTS;

-- Q283. Display EMP_NAME followed by DESIGNATION using CONCAT().

SELECT CONCAT(EMP_NAME,DESIGNATION) FROM EMPLOYEES;

-- Q284. Remove leading and trailing spaces from CUSTOMER_NAME using TRIM(), convert it to uppercase using UPPER(), and display the first 5 characters using SUBSTR().

SELECT SUBSTR(UPPER(TRIM(CUSTOMER_NAME)),1,5) FROM CUSTOMERS;

-- Q285. Convert PRODUCT_NAME to lowercase using LOWER(), replace the character '-' with a space using REPLACE(), and display the length of the resulting string using LENGTH().

SELECT LENGTH(LOWER(REPLACE(PRODUCT_NAME,'-',' '))) FROM PRODUCTS;

-- Q286. Display CUSTOMER_NAME padded to 20 characters using LPAD()
-- after converting it to uppercase.

SELECT CUSTOMER_NAME,LPAD(UPPER(CUSTOMER_NAME),20,' ') FROM CUSTOMERS;

-- Q287. Display PRODUCT_NAME padded to 20 characters using RPAD()
-- after converting it to uppercase.

SELECT RPAD(UPPER(PRODUCT_NAME),20,'@') FROM PRODUCTS;

-- Q288. Display EMAIL after converting it to lowercase and
-- replacing '@' with '[AT]'.

SELECT LOWER(REPLACE(EMAIL,'@','[AT]')) FROM CUSTOMERS;

-- Q289. Display CUSTOMER_NAME and CITY in the format:
-- CUSTOMER_NAME - CITY
-- using UPPER() and ||.

SELECT UPPER(CUSTOMER_NAME)||' - '||UPPER(CITY) FROM CUSTOMERS;


-- Q290. Display PRODUCT_NAME in uppercase, its length,
-- first 3 characters and last 3 characters.

SELECT UPPER(PRODUCT_NAME),LENGTH(PRODUCT_NAME),SUBSTR(PRODUCT_NAME,1,3) AS FIRST_3_CHAR,SUBSTR(PRODUCT_NAME,-3,3) AS LAST_3_CHARA FROM PRODUCTS;

-- =====================================================
-- CONCEPT 16 — CHARACTER FUNCTIONS WITH WHERE
-- =====================================================

-- Q291. Display customers whose CITY is 'HYDERABAD' using UPPER().

SELECT * FROM CUSTOMERS WHERE UPPER(CITY)=UPPER('HYDERABAD');

-- Q292. Display customers whose CUSTOMER_NAME starts with 'A'
-- using SUBSTR().

SELECT * FROM CUSTOMERS WHERE SUBSTR(CUSTOMER_NAME,1,1)='A';

-- Q293. Display customers whose CUSTOMER_NAME contains 'AN'
-- using INSTR().

SELECT * FROM CUSTOMERS WHERE INSTR(UPPER(CUSTOMER_NAME),'AN')>0;

-- Q294. Display products whose PRODUCT_NAME contains 'PHONE'
-- using INSTR().

SELECT * FROM PRODUCTS WHERE INSTR(UPPER(PRODUCT_NAME),UPPER('PHONE'))>0;

-- Q295. Display employees whose EMP_NAME has 'A' as the second character
-- using SUBSTR().

SELECT * FROM EMPLOYEES WHERE SUBSTR(EMP_NAME,2,1)='A';

-- Q296. Display customers whose CUSTOMER_NAME has more than 6 characters
-- using LENGTH().

SELECT * FROM CUSTOMERS WHERE LENGTH(CUSTOMER_NAME)>6;

-- Q297. Display products whose PRODUCT_NAME has exactly 5 characters
-- using LENGTH().

SELECT * FROM PRODUCTS WHERE LENGTH(PRODUCT_NAME)=5;

-- Q298. Display customers whose EMAIL contains '@'
-- using INSTR().

SELECT * FROM CUSTOMERS WHERE INSTR(EMAIL,'@')>0;

-- Q299. Display customers whose CITY starts with 'H'
-- using SUBSTR() and UPPER().

SELECT * FROM CUSTOMERS WHERE SUBSTR(UPPER(CITY),1,1)='H';

-- Q300. Display products whose PRODUCT_NAME ends with 'E'
-- using SUBSTR() and UPPER().

SELECT * FROM PRODUCTS WHERE SUBSTR(UPPER(PRODUCT_NAME),-1,1)='E';

-- =====================================================
-- CONCEPT 17 — CHARACTER FUNCTIONS WITH ORDER BY
-- =====================================================

-- Q301. Display customers ordered by CUSTOMER_NAME length.

SELECT * FROM CUSTOMERS ORDER BY LENGTH(CUSTOMER_NAME);

-- Q302. Display products ordered by PRODUCT_NAME length in descending order.

SELECT * FROM PRODUCTS ORDER BY LENGTH(PRODUCT_NAME) DESC;

-- Q303. Display employees ordered alphabetically by UPPER(EMP_NAME).

SELECT * FROM EMPLOYEES ORDER BY UPPER(EMP_NAME) ASC;

-- Q304. Display customers ordered by the position of 'A'
-- in CUSTOMER_NAME.

SELECT * FROM CUSTOMERS ORDER BY INSTR(CUSTOMER_NAME,'A',1) ASC;

-- Q305. Display products ordered by the first 3 characters
-- of PRODUCT_NAME.

SELECT * FROM PRODUCTS ORDER BY SUBSTR(PRODUCT_NAME,1,3) ASC;

-- =====================================================
-- END OF 03_CHARACTER_FUNCTIONS
-- =====================================================

SPOOL OFF