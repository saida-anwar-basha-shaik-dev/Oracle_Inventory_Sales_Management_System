# Oracle Inventory & Sales Management System

![Oracle](https://img.shields.io/badge/Database-Oracle-red?logo=oracle&logoColor=white)
![GitHub repo size](https://img.shields.io/github/repo-size/saida-anwar-basha-shaik-dev/Oracle_Inventory_Sales_Management_System)
![GitHub last commit](https://img.shields.io/github/last-commit/saida-anwar-basha-shaik-dev/Oracle_Inventory_Sales_Management_System)
![GitHub stars](https://img.shields.io/github/stars/saida-anwar-basha-shaik-dev/Oracle_Inventory_Sales_Management_System?style=social)
![License](https://img.shields.io/badge/License-MIT-green)

---

## 📌 Project Overview

The **Oracle Inventory & Sales Management System** is a practical relational database project developed using **Oracle Database 11g and SQL*Plus**.

The project is designed to manage and analyze business data related to:

- Customers
- Suppliers
- Categories
- Products
- Employees
- Orders
- Order Items
- Payments
- Purchases
- Inventory

The project also contains a structured SQL practice collection covering concepts from **Basic SQL to Advanced SQL and Real-World Interview SQL Problems**.

The main objective is to develop strong practical SQL skills by working with a realistic **Inventory and Sales Management System**.

---

## 🛠️ Technologies Used

- Oracle Database 11g
- Oracle SQL
- SQL*Plus
- Git
- GitHub
- Relational Database Concepts
- SQL DDL
- SQL DML
- SQL DQL

---

## 📂 Project Structure

```text
Oracle_Inventory_Sales_Management_System
│
├── Data
│   └── Sample_Inserts.sql
│
├── Queries
│   │
│   ├── 01_Basic_SQL
│   │   └── 01_SELECT_FUNDAMENTALS.sql
│   │
│   ├── 02_Operators
│   │   ├── 02_OPERATORS.sql
│   │   └── 02_Special_Operators.sql
│   │
│   ├── 03_Functions
│   │   │
│   │   ├── 03_Single_Row_Functions
│   │   │   ├── 03_CHARACTER_FUNCTIONS.sql
│   │   │   ├── 03_CONVERSIONS_FUNCTIONS.sql
│   │   │   ├── 03_DATE_FUNCTIONS.sql
│   │   │   ├── 03_NULL_FUNCTIONS.sql
│   │   │   └── 03_NUMBER_FUNCTIONS.sql
│   │   │
│   │   └── 03_SINGLE_ROW_FUNCTIONS_TEST.sql
│   │
│   ├── 04_Aggregate_Functions
│   │   └── 04_AGGREGATE_FUNCTIONS_TEST.sql
│   │
│   ├── 05_GROUP_BY_HAVING
│   │   └── 05_GROUP_BY_HAVING.sql
│   │
│   ├── 06_JOINS
│   │   └── 06_JOINS_TEST.sql
│   │
│   ├── 07_SUBQUERIES
│   │   └── 07_SUBQUERIES_TEST.sql
│   │
│   ├── 08_SET_OPERATORS
│   │   └── 08_SET_OPERATORS_TEST.sql
│   │
│   ├── 09_CASE_DECODE
│   │   └── 09_CASE_DECODE_TEST.sql
│   │
│   ├── 10_DATE_QUERIES
│   │   └── 10_DATE_QUERIES_TEST.sql
│   │
│   ├── 11_ROWNUM_TOP_N
│   │   └── 11_ROWNUM_TOP_N_TEST.sql
│   │
│   ├── 12_ANALYTICAL_FUNCTIONS
│   │   └── 12_ANALYTICAL_FUNCTIONS_TEST.sql
│   │
│   ├── 13_ADVANCED_SQL
│   │   └── 13_ADVANCED_SQL_TEST.sql
│   │
│   ├── 14_REAL_WORLD_INTERVIEW
│   │   └── 14_REAL_WORLD_INTERVIEW.sql
│   │
│   └── Reporting_Queries.sql
│
├── Tables
│   ├── Customers_Table_Schema.sql
│   ├── Suppliers_Table_Schema.sql
│   ├── Categories_Table_Schema.sql
│   ├── Products_Table_Schema.sql
│   ├── Employees_Table_Schema.sql
│   ├── Orders_Table_Schema.sql
│   ├── Order_Items_Table_Schema.sql
│   ├── Payments_Table_Schema.sql
│   ├── Purchases_Table_Schema.sql
│   └── Inventory_Log_Table_Schema.sql
│
├── Views
│   ├── Complete_Inventory_Sales_View.sql
│   └── Complete_Inventory_Sales_Full_View.sql
│
├── .gitignore
├── LICENSE
└── README.md
```

---

## 📑 Database Tables

The system contains the following main tables:

| Table Name | Purpose |
|------------|---------|
| CUSTOMERS | Stores customer information |
| SUPPLIERS | Stores supplier information |
| CATEGORIES | Stores product categories |
| PRODUCTS | Stores product details, price and stock |
| EMPLOYEES | Stores employee information |
| ORDERS | Stores customer orders |
| ORDER_ITEMS | Stores products included in orders |
| PAYMENTS | Stores order payment information |
| PURCHASES | Stores supplier purchase information |
| INVENTORY_LOG | Tracks inventory stock changes |

---

## 🔗 Database Relationships

```text
CATEGORIES
     │
     └──── PRODUCTS
                │
                ├──── SUPPLIERS
                │
                ├──── ORDER_ITEMS ──── ORDERS ──── CUSTOMERS
                │                         │
                │                         └──── EMPLOYEES
                │
                ├──── PURCHASES ───── SUPPLIERS
                │
                └──── INVENTORY_LOG

ORDERS
   │
   └──── PAYMENTS
```

---

## 🔑 Important Foreign Key Relationships

```text
PRODUCTS.CATEGORY_ID
        ↓
CATEGORIES.CATEGORY_ID

PRODUCTS.SUPPLIER_ID
        ↓
SUPPLIERS.SUPPLIER_ID

ORDERS.CUSTOMER_ID
        ↓
CUSTOMERS.CUSTOMER_ID

ORDERS.EMP_ID
        ↓
EMPLOYEES.EMP_ID

ORDER_ITEMS.ORDER_ID
        ↓
ORDERS.ORDER_ID

ORDER_ITEMS.PRODUCT_ID
        ↓
PRODUCTS.PRODUCT_ID

PAYMENTS.ORDER_ID
        ↓
ORDERS.ORDER_ID

PURCHASES.SUPPLIER_ID
        ↓
SUPPLIERS.SUPPLIER_ID

PURCHASES.PRODUCT_ID
        ↓
PRODUCTS.PRODUCT_ID

INVENTORY_LOG.PRODUCT_ID
        ↓
PRODUCTS.PRODUCT_ID
```

---

## 📚 SQL Practice Progression

The SQL practice section follows a structured progression from basic SQL concepts to advanced and interview-oriented SQL.

```text
01_Basic_SQL
      ↓
02_Operators
      ↓
03_Functions
      │
      └── 03_Single_Row_Functions
            ├── Character Functions
            ├── Conversion Functions
            ├── Date Functions
            ├── NULL Functions
            └── Number Functions
      ↓
04_Aggregate_Functions
      ↓
05_GROUP_BY_HAVING
      ↓
06_JOINS
      ↓
07_SUBQUERIES
      ↓
08_SET_OPERATORS
      ↓
09_CASE_DECODE
      ↓
10_DATE_QUERIES
      ↓
11_ROWNUM_TOP_N
      ↓
12_ANALYTICAL_FUNCTIONS
      ↓
13_ADVANCED_SQL
      ↓
14_REAL_WORLD_INTERVIEW
```

---

## 📖 SQL Concepts Covered

### 01. Basic SQL

- SELECT
- FROM
- DISTINCT
- Column Selection
- Column Aliases
- Arithmetic Expressions
- Concatenation
- ORDER BY
- Basic Data Retrieval

### 02. Operators

- Arithmetic Operators
- Comparison Operators
- Logical Operators
- IN
- NOT IN
- BETWEEN
- NOT BETWEEN
- LIKE
- NOT LIKE
- IS NULL
- IS NOT NULL
- Special Operators

### 03. Functions

#### Single Row Functions

- Character Functions
- Number Functions
- Date Functions
- Conversion Functions
- NULL Functions

#### Character Functions

- UPPER()
- LOWER()
- INITCAP()
- LENGTH()
- SUBSTR()
- INSTR()
- LPAD()
- RPAD()
- TRIM()
- LTRIM()
- RTRIM()
- REPLACE()

#### Number Functions

- ROUND()
- TRUNC()
- MOD()
- CEIL()
- FLOOR()
- ABS()
- POWER()

#### Date Functions

- SYSDATE
- ADD_MONTHS()
- MONTHS_BETWEEN()
- LAST_DAY()
- NEXT_DAY()
- ROUND()
- TRUNC()

#### Conversion Functions

- TO_CHAR()
- TO_DATE()
- TO_NUMBER()

#### NULL Functions

- NVL()
- NVL2()
- NULLIF()
- COALESCE()

### 04. Aggregate Functions

- COUNT()
- SUM()
- AVG()
- MIN()
- MAX()
- Total Sales
- Total Quantity
- Average Price
- Number of Orders
- Maximum Salary
- Minimum Price
- Total Stock
- Total Payments

### 05. GROUP BY & HAVING

- GROUP BY
- Multiple Column GROUP BY
- Aggregate Functions with GROUP BY
- HAVING
- GROUP BY with JOINs
- HAVING with Aggregate Conditions
- Grouped Business Analysis
- Conditional Aggregation

### 06. JOINS

- INNER JOIN
- LEFT OUTER JOIN
- RIGHT OUTER JOIN
- FULL OUTER JOIN
- SELF JOIN
- CROSS JOIN
- Multi-Table JOINs
- JOIN with WHERE
- JOIN with GROUP BY
- JOIN with HAVING
- JOIN with Aggregate Functions
- Anti-Join Concepts

### 07. SUBQUERIES

- Single-Row Subqueries
- Multiple-Row Subqueries
- Nested Subqueries
- Correlated Subqueries
- Scalar Subqueries
- EXISTS
- NOT EXISTS
- IN
- NOT IN
- Subqueries with Aggregate Functions
- Subqueries with JOINs

### 08. SET OPERATORS

- UNION
- UNION ALL
- INTERSECT
- MINUS

### 09. CASE & DECODE

- Simple CASE
- Searched CASE
- CASE with Conditions
- CASE with Aggregate Functions
- CASE with JOINs
- Conditional Calculations
- Data Classification
- DECODE
- DECODE with Multiple Conditions
- Business Condition Analysis

### 10. DATE QUERIES

- SYSDATE
- Date Arithmetic
- Date Comparison
- Date Filtering
- ADD_MONTHS()
- MONTHS_BETWEEN()
- LAST_DAY()
- NEXT_DAY()
- TRUNC()
- ROUND()
- EXTRACT()
- Date Grouping
- Monthly Analysis
- Yearly Analysis
- Date-Based Business Analysis

### 11. ROWNUM & TOP-N QUERIES

- ROWNUM
- Top-N Queries
- Bottom-N Queries
- Top 5 Records
- Top 10 Records
- Top Customers
- Top Products
- Top Employees
- Ranking-Based Filtering
- Pagination Concepts
- ORDER BY with ROWNUM
- Nested Queries with ROWNUM

### 12. ANALYTICAL FUNCTIONS

- ROW_NUMBER()
- RANK()
- DENSE_RANK()
- PARTITION BY
- ORDER BY
- Running Totals
- Ranking Within Groups
- Group-Wise Ranking
- Previous Row Analysis
- Next Row Analysis
- Comparative Analysis

### 13. ADVANCED SQL

- Complex JOINs
- Nested Subqueries
- Correlated Subqueries
- Conditional Aggregation
- EXISTS / NOT EXISTS
- Multi-Level Aggregation
- Advanced Filtering
- Complex Business Logic
- Advanced Data Analysis
- Multiple-Table Analysis

### 14. REAL-WORLD INTERVIEW SQL

The project contains interview-oriented SQL problems based on real-world business scenarios.

Examples include:

- Top Customers
- Highest-Selling Products
- Total Sales
- Monthly Sales
- Customer Order Analysis
- Supplier Analysis
- Product Performance
- Employee Performance
- Inventory Analysis
- Payment Analysis
- Products Never Sold
- Customers Without Orders
- Unpaid Orders
- Top-N Analysis
- Ranking Problems
- Sales vs Purchase Comparison
- Business Performance Analysis
- Customer Spending Analysis
- Supplier Performance Analysis
- Inventory Stock Analysis

---

## 📊 Business Areas Covered

### 👥 Customer Management

- Customer Information
- Customer Orders
- Customer Spending
- Customer City Analysis
- Customers Without Orders
- Top Customers
- Customer Payment Analysis

### 📦 Product Management

- Product Details
- Product Categories
- Product Suppliers
- Product Prices
- Product Stock
- Product Sales
- Product Performance

### 🛒 Sales Management

- Orders
- Order Items
- Sales Quantity
- Sales Value
- Customer Orders
- Product Performance
- Category Sales
- Employee Order Handling

### 💰 Payment Management

- Payment Amount
- Payment Mode
- Customer Payments
- Order Payment Status
- Unpaid Orders
- Payment Analysis

### 🚚 Supplier Management

- Supplier Information
- Supplier Products
- Purchase Quantities
- Supplier Performance
- Supplier Product Analysis

### 📦 Inventory Management

- Current Stock
- Stock Changes
- Inventory Logs
- Purchased Quantity
- Sold Quantity
- Stock Analysis
- Product Inventory Comparison

---

## 👁️ Views

The project contains reporting views for combining information from multiple tables.

### Complete_Inventory_Sales_View

Provides combined business information related to:

- Customers
- Products
- Categories
- Orders
- Order Items
- Sales information

### Complete_Inventory_Sales_Full_View

Provides a more comprehensive business reporting view combining information from:

- Customers
- Suppliers
- Categories
- Products
- Employees
- Orders
- Order Items
- Payments
- Purchases
- Inventory

These views are also used for practicing advanced SQL and real-world business queries.

---

## ▶️ How to Run

### Step 1: Connect to Oracle SQL*Plus

```sql
SQL> CONNECT username/password
```

### Step 2: Create Tables

Navigate to the project root directory and execute the table scripts.

```sql
@Tables/Customers_Table_Schema.sql
@Tables/Suppliers_Table_Schema.sql
@Tables/Categories_Table_Schema.sql
@Tables/Products_Table_Schema.sql
@Tables/Employees_Table_Schema.sql
@Tables/Orders_Table_Schema.sql
@Tables/Order_Items_Table_Schema.sql
@Tables/Payments_Table_Schema.sql
@Tables/Purchases_Table_Schema.sql
@Tables/Inventory_Log_Table_Schema.sql
```

### Step 3: Insert Sample Data

```sql
@Data/Sample_Inserts.sql
```

### Step 4: Create Views

```sql
@Views/Complete_Inventory_Sales_View.sql
@Views/Complete_Inventory_Sales_Full_View.sql
```

### Step 5: Execute SQL Practice Queries

Example:

```sql
@Queries/01_Basic_SQL/01_SELECT_FUNDAMENTALS.sql
```

```sql
@Queries/04_Aggregate_Functions/04_AGGREGATE_FUNCTIONS_TEST.sql
```

```sql
@Queries/06_JOINS/06_JOINS_TEST.sql
```

```sql
@Queries/14_REAL_WORLD_INTERVIEW/14_REAL_WORLD_INTERVIEW.sql
```

### Step 6: Execute Reporting Queries

```sql
@Queries/Reporting_Queries.sql
```

---

## 💻 SQL*Plus Formatting

The project uses SQL*Plus formatting commands to produce clean and readable output.

Example:

```sql
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
```

Date formatting can be configured where required:

```sql
ALTER SESSION SET NLS_DATE_FORMAT = 'DD-MM-YYYY';
```

---

## 🔍 Sample SQL Query

Example of a multi-table business query:

```sql
SELECT
    c.customer_name,
    p.product_name,
    o.order_id,
    pay.amount
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
JOIN order_items oi
    ON o.order_id = oi.order_id
JOIN products p
    ON oi.product_id = p.product_id
JOIN payments pay
    ON o.order_id = pay.order_id;
```

This query demonstrates:

- INNER JOIN
- Multiple table relationships
- Customer information
- Product information
- Order information
- Payment information

---

## 📁 Query File Structure

Each SQL practice folder contains dedicated SQL scripts covering:

- Concept Explanation
- Rules
- Syntax
- Important Notes
- Practice Questions
- SQL Answers
- SQL*Plus Formatting
- Output Configuration
- Real-World Business Scenarios

The query collection progresses from foundational SQL to advanced SQL and interview-level problems.

---

## 🧪 SQL Practice Coverage

The project provides structured SQL practice for:

- Data Retrieval
- Data Filtering
- Sorting
- Operators
- Single Row Functions
- Aggregate Functions
- Data Grouping
- HAVING Conditions
- Multi-Table JOINs
- Subqueries
- Set Operators
- CASE Expressions
- DECODE
- Date Queries
- ROWNUM
- Top-N Queries
- Analytical Functions
- Advanced SQL
- Real-World Business Queries
- Interview SQL Problems

---

## 🎯 Project Objectives

The main objectives of this project are:

1. Understand relational database concepts.
2. Design and work with an Oracle database.
3. Understand primary keys and foreign keys.
4. Understand relationships between database tables.
5. Practice SQL using real-world business data.
6. Perform inventory and sales analysis.
7. Practice intermediate and advanced SQL.
8. Improve SQL problem-solving skills.
9. Prepare for SQL technical interviews.
10. Develop practical database skills.
11. Build a portfolio-ready Oracle SQL project.

---

## 🚀 Skills Demonstrated

- Oracle Database 11g
- Oracle SQL
- SQL*Plus
- DDL
- DML
- DQL
- Database Constraints
- Primary Keys
- Foreign Keys
- Aggregate Functions
- GROUP BY
- HAVING
- Joins
- Subqueries
- Set Operators
- CASE
- DECODE
- Date Functions
- ROWNUM
- Top-N Queries
- Analytical Functions
- Advanced SQL
- Real-World SQL
- Business Data Analysis
- SQL*Plus Formatting
- SPOOL
- Git
- GitHub

---

## 📈 Real-World Business Analysis

The project demonstrates how SQL can be used to solve practical business problems such as:

- Finding top customers
- Finding top-selling products
- Calculating total sales
- Calculating total purchase value
- Analyzing customer spending
- Analyzing employee performance
- Analyzing supplier performance
- Tracking inventory
- Finding low-stock products
- Finding products that were never sold
- Finding customers without orders
- Finding unpaid orders
- Comparing sales and purchases
- Performing monthly sales analysis
- Performing category-wise sales analysis
- Performing product-wise sales analysis
- Performing customer-wise sales analysis
- Performing inventory analysis

---

## 📝 Important Notes

- Developed using Oracle Database 11g and SQL*Plus.
- Uses primary keys and foreign keys to maintain data relationships.
- Uses SQL JOINs for multi-table analysis.
- Uses aggregate functions for business calculations.
- Uses subqueries for advanced filtering and analysis.
- Uses analytical functions for ranking and comparative analysis.
- Uses views for simplified reporting.
- SQL scripts are organized into separate folders based on concepts.
- The project is designed for SQL learning, practice, portfolio development, and interview preparation.
- SQL*Plus formatting commands are included for clean output.
- Git and GitHub are used for version control.

---

## 📌 Project Status

**Status: Completed and Continuously Improving**

The project can be extended with additional:

- SQL Queries
- Business Scenarios
- Analytical Problems
- Interview Questions
- Reports
- Performance Optimization Examples
- Advanced Oracle SQL Concepts
- Additional Inventory Analysis
- Additional Sales Analysis

---

## 👨‍💻 Author

**Saida Anwar Basha**

**Oracle SQL Developer**

Oracle SQL | SQL*Plus | Database Development |