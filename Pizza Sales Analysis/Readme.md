# 🍕 IDC Pizza Analytics Challenge — SQL Mini Project

A complete SQL analysis project based on the **IDC Pizza** dataset.  
This project is part of the **SQL With IDC (Indian Data Club)** learning series.  
It covers SQL concepts from **Day 1 to Day 15**, including filtering, joins, grouping, and data cleaning.

---

## 📘 Table of Contents
- [Overview](#overview)
- [Tech Stack](#tech-stack)
- [Dataset Description](#dataset-description)
- [Database Setup](#database-setup)
- [Project Tasks](#project-tasks)
- [SQL Solutions](#sql-solutions)
- [Submission Format](#submission-format)
- [Author](#author)

---

## 📌 Overview

You are the data analyst for **IDC Pizza**, responsible for analyzing pizza sales and answering key business questions using SQL.  
This project transforms raw sales data into actionable insights.

**Key skills demonstrated:**

- Database creation & schema understanding  
- Filtering & conditional queries  
- Aggregations (`SUM`, `AVG`, `COUNT`)  
- Joins (`INNER`, `LEFT`, `SELF`)  
- Handling NULLs using `COALESCE()`  
- Exploratory data analysis  
- Writing clean, optimized SQL  

---

## 🛠 Tech Stack

| Tool | Purpose |
|------|---------|
| **PostgreSQL** | Database engine |
| **pgAdmin 4** | GUI for database setup & queries |
| **CSV / SQL Scripts** | Dataset import |
| **GitHub** | Documentation & version control |

---

## 📂 Dataset Description

This project includes 4 main tables:

| Table | Description |
|-------|-------------|
| `pizza_types` | Pizza name, category, ingredients |
| `pizzas` | Pizza size, price, and type |
| `orders` | Order timestamps |
| `order_details` | Pizza ID + quantity for each order |

These files may be provided as `.sql`, `.csv`, or `.dump`.

---

## 🗄 Database Setup

### 🔹 Option 1 — Restore the `.dump` file

1. Create a database named `IDC_Pizza`
2. Right-click the DB → **Restore**
3. Select `IDC_Pizza.dump`
4. Set Format → **Custom / Tar**
5. Click **Restore**
6. Verify tables under:  
   `Schemas → public → Tables`

---

### 🔹 Option 2 — Build the Database Manually

Run files in the following order:

1. `Create_Table.sql`  
2. `pizza_types.sql`  
3. `pizzas.sql`  
4. `orders.sql`  
5. `order_details.sql`  

Or import the CSV files using pgAdmin’s **Import/Export Data** option.

---

## 🔍 Project Tasks

### **Phase 1 — Foundation & Inspection**
1. Install database  
2. List unique pizza categories  
3. Display pizza details with `COALESCE()`  
4. Find pizzas with missing prices  

---

### **Phase 2 — Filtering & Exploration**
5. Get all orders from `2015-01-01`  
6. Sort pizzas by price (DESC)  
7. Filter pizzas with sizes `L` or `XL`  
8. Pizzas priced between 15 and 17  
9. Pizzas containing `"Chicken"`  
10. Orders on `2015-02-15` or placed after 8 PM  

---

### **Phase 3 — Sales Performance**
11. Total quantity of pizzas sold  
12. Average pizza price  
13. Total order value per order  
14. Quantity sold by category  
15. Categories selling more than 5,000  
16. Pizzas never ordered  
17. Price difference between sizes (SELF JOIN)  

---

## 🧠 SQL Solutions

All SQL queries are provided separately in a CSV for submission, following the challenge rules.

A structured `.sql` file may be stored inside:

