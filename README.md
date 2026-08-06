# Oracle Inventory Sales Management System

## 📌 Overview

The **Oracle Inventory Sales Management System** is a relational database project developed using **Oracle 11g SQL*Plus**.

The project manages complete business operations including:

- Customer management
- Supplier management
- Product and category tracking
- Inventory management
- Sales order processing
- Purchase management
- Payment tracking
- Reporting using SQL Views

This project demonstrates database design, table relationships, constraints, SQL queries, joins, and views.

---

## 🛠 Technology Used

- Oracle Database 11g
- Oracle SQL*Plus
- SQL (DDL, DML, DQL)
- Database Design
- Relational Database Concepts

---

## 🗂 Project Structure

```
Oracle_Inventory_Sales_Management_System
│
├── tables
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
├── views
│   ├── Complete_Inventory_Sales_View.sql
│   └── Complete_Inventory_Sales_Full_View.sql
│
├── data
│   └── Sample_Inserts.sql
│
└── README.md
```

---

## 📑 Database Tables

The system contains the following tables:

| Table Name | Purpose |
|------------|---------|
| CUSTOMERS | Stores customer details |
| SUPPLIERS | Stores supplier information |
| CATEGORIES | Maintains product categories |
| PRODUCTS | Stores product information |
| EMPLOYEES | Stores employee details |
| ORDERS | Maintains customer orders |
| ORDER_ITEMS | Stores order product details |
| PAYMENTS | Tracks payment transactions |
| PURCHASES | Maintains supplier purchases |
| INVENTORY_LOG | Tracks inventory changes |

---

## 🔗 Database Relationship

```
CATEGORIES
     |
     ↓
PRODUCTS
     |
     ↓
ORDER_ITEMS
     |
     ↓
ORDERS
     |
     ↓
CUSTOMERS
     |
     ↓
PAYMENTS


SUPPLIERS
     |
     ↓
PURCHASES
     |
     ↓
INVENTORY_LOG
```

---

## 👁 Views

The project contains reporting views:

### Complete_Inventory_Sales_View

Provides combined information about:

- Products
- Categories
- Customers
- Orders
- Sales details


### Complete_Inventory_Sales_Full_View

Provides complete business reporting by joining multiple tables:

- Customer details
- Product details
- Sales transactions
- Payments
- Inventory information

---

## ▶️ How to Run

### Step 1: Create Tables

Run table scripts in Oracle SQL*Plus:

```sql
@tables/Customers_Table_Schema.sql
@tables/Suppliers_Table_Schema.sql
@tables/Categories_Table_Schema.sql
@tables/Products_Table_Schema.sql
@tables/Employees_Table_Schema.sql
@tables/Orders_Table_Schema.sql
@tables/Order_Items_Table_Schema.sql
@tables/Payments_Table_Schema.sql
@tables/Purchases_Table_Schema.sql
@tables/Inventory_Log_Table_Schema.sql
```

---

### Step 2: Insert Sample Data

```sql
@data/Sample_Inserts.sql
```

---

### Step 3: Create Views

```sql
@views/Complete_Inventory_Sales_View.sql

@views/Complete_Inventory_Sales_Full_View.sql
```

---

## 🔍 Sample Query

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

---

## 📖 Important Notes

- Developed using Oracle 11g SQL*Plus.
- Uses primary keys and foreign keys for maintaining relationships.
- Uses SQL joins for generating reports.
- Uses views for simplified data access.
- Scripts are separated into modules for easy maintenance and GitHub version control.
- Schema extraction can be performed using:

```sql
SET LONG 100000;

SELECT DBMS_METADATA.GET_DDL('TABLE','TABLE_NAME')
FROM DUAL;
```

---

## 👨‍💻 Author

**Saida Anwar Basha**

Oracle SQL Developer Project