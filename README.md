# 🗄️ SQL Learning Roadmap for Data Science & Data Engineering

> **Created for:** Ritik Kumar  
> **Focus Areas:** Data Science, Data Engineering, Analytics  
> **Current Level:** Intermediate (Based on GitHub profile)  
> **Goal:** Master SQL for building data warehouses, complex analytics, and production systems

---

## 📋 Table of Contents

1. [Roadmap Overview](#roadmap-overview)
2. [Phase 1: SQL Fundamentals](#phase-1-sql-fundamentals)
3. [Phase 2: Data Manipulation & Filtering](#phase-2-data-manipulation--filtering)
4. [Phase 3: Joins & Relationships](#phase-3-joins--relationships)
5. [Phase 4: Aggregations & Grouping](#phase-4-aggregations--grouping)
6. [Phase 5: Subqueries & CTEs](#phase-5-subqueries--ctes)
7. [Phase 6: Advanced SQL Functions](#phase-6-advanced-sql-functions)
8. [Phase 7: Window Functions](#phase-7-window-functions)
9. [Phase 8: Data Modeling & Design](#phase-8-data-modeling--design)
10. [Phase 9: Indexes & Performance Optimization](#phase-9-indexes--performance-optimization)
11. [Phase 10: Transactions & Concurrency](#phase-10-transactions--concurrency)
12. [Phase 11: Data Warehousing Concepts](#phase-11-data-warehousing-concepts)
13. [Phase 12: Advanced Analytics with SQL](#phase-12-advanced-analytics-with-sql)
14. [Phase 13: Database Administration Basics](#phase-13-database-administration-basics)
15. [Phase 14: Cloud Databases & Modern SQL](#phase-14-cloud-databases--modern-sql)
16. [Progress Tracking Template](#progress-tracking-template)

---

## 🎯 Roadmap Overview

### Learning Path Structure
```
Foundations (3-4 weeks) → Intermediate (4-6 weeks) → Advanced (6-8 weeks) → Expert (Ongoing)
```

### Time Commitment
- **Beginner**: 8-12 hours/week
- **Intermediate**: 12-15 hours/week  
- **Advanced**: 15-20 hours/week

### Database Systems Covered
- PostgreSQL (Primary focus)
- MySQL
- SQL Server (T-SQL)
- SQLite (Practice)
- Cloud databases (BigQuery, Snowflake, Redshift)

### Assessment Methods
- ✅ Complete SQL challenges (LeetCode, HackerRank)
- ✅ Build database projects
- ✅ Optimize query performance
- ✅ Design data models

---

## Phase 1: SQL Fundamentals
**Duration:** 2-3 weeks | **Level:** Beginner

### 📚 Topics to Cover

#### 1.1 Database Concepts
- [DONE] What is a database?
- [DONE] RDBMS vs NoSQL
- [DONE] Database vs Spreadsheet
- [DONE] Tables, rows, columns
- [DONE] Primary keys and foreign keys
- [DONE] Database schema
- [DONE] ACID properties

#### 1.2 SQL Basics
- [DONE] SQL syntax rules
- [DONE] Case sensitivity
- [DONE] Comments (single-line and multi-line)
- [DONE] SQL statement types (DDL, DML, DCL, TCL)
- [DONE] Semicolons and statement terminators

#### 1.3 Setting Up Environment
- [DONE] Installing PostgreSQL
- [DONE] Installing MySQL
- [DONE] SQL clients (pgAdmin, DBeaver, MySQL Workbench)
- [DONE] Command-line tools (psql, mysql)
- [DONE] Creating your first database

#### 1.4 Data Types
- [DONE] Numeric types (INTEGER, BIGINT, DECIMAL, FLOAT)
- [DONE] Character types (CHAR, VARCHAR, TEXT)
- [DONE] Date/Time types (DATE, TIME, TIMESTAMP)
- [DONE] Boolean type
- [DONE] JSON and JSONB (PostgreSQL)
- [DONE] Arrays (PostgreSQL)
- [DONE] NULL values

#### 1.5 Creating Tables (DDL)
- [DONE] CREATE TABLE syntax
- [DONE] Column definitions
- [DONE] Constraints (NOT NULL, UNIQUE, CHECK)
- [DONE] Primary keys
- [DONE] Foreign keys
- [DONE] Default values
- [DONE] AUTO_INCREMENT / SERIAL
- [DONE] ALTER TABLE (add, modify, drop columns)
- [DONE] DROP TABLE
- [DONE] TRUNCATE TABLE

#### 1.6 Basic SELECT Queries
- [DONE] SELECT statement syntax
- [DONE] Selecting all columns (*)
- [DONE] Selecting specific columns
- [DONE] Column aliases (AS)
- [DONE] DISTINCT keyword
- [DONE] LIMIT / TOP / FETCH FIRST
- [DONE] ORDER BY (ASC, DESC)
- [DONE] Ordering by multiple columns

### 🎯 Projects

#### Project 1.1: Library Database  - DONE
**Description:** Create a simple library management system

**Tasks:**
1. Create all three tables with proper constraints
2. Insert sample data (10+ books, 5+ members)
3. Write queries to:
   - List all books
   - Find books by author
   - Show available books only
   - List members who joined this year

#### Project 1.2: E-commerce Product Catalog - DONE
**Description:** Build a product database

**Tables:**
- products (product_id, name, description, price, stock_quantity, category)
- categories (category_id, category_name, description)
- suppliers (supplier_id, name, contact, country)

**Queries to Write:**
- All products under $50
- Products sorted by price (highest to lowest)
- Top 10 most expensive products
- Products with stock less than 10 units

#### Project 1.3: Employee Directory - DONE
**Description:** Create an employee management database

**Schema Design:**
- employees (employee_id, first_name, last_name, email, hire_date, salary, department)
- Write basic queries to explore the data

---

## Phase 2: Data Manipulation & Filtering - PROGRESS
**Duration:** 2-3 weeks | **Level:** Beginner

### 📚 Topics to Cover

#### 2.1 WHERE Clause
- [DONE] Filtering rows with WHERE
- [DONE] Comparison operators (=, !=, <, >, <=, >=)
- [DONE] BETWEEN operator
- [DONE] IN operator
- [ ] NOT IN operator
- [ ] IS NULL and IS NOT NULL
- [ ] LIKE and ILIKE (pattern matching)
- [ ] Wildcards (%, _)

#### 2.2 Logical Operators
- [ ] AND operator
- [ ] OR operator
- [ ] NOT operator
- [ ] Combining multiple conditions
- [ ] Operator precedence
- [ ] Using parentheses

#### 2.3 INSERT Statements (DML)
- [ ] INSERT INTO syntax
- [ ] Inserting single row
- [ ] Inserting multiple rows
- [ ] INSERT with column specification
- [ ] INSERT with DEFAULT values
- [ ] INSERT ... SELECT
- [ ] RETURNING clause (PostgreSQL)

#### 2.4 UPDATE Statements
- [ ] UPDATE syntax
- [ ] Updating single column
- [ ] Updating multiple columns
- [ ] UPDATE with WHERE clause
- [ ] UPDATE with calculations
- [ ] UPDATE with subqueries
- [ ] RETURNING clause

#### 2.5 DELETE Statements
- [ ] DELETE syntax
- [ ] DELETE with WHERE clause
- [ ] DELETE all rows (careful!)
- [ ] DELETE with subqueries
- [ ] Soft deletes (best practice)

#### 2.6 String Functions
- [ ] UPPER() and LOWER()
- [ ] LENGTH() / CHAR_LENGTH()
- [ ] CONCAT() / || operator
- [ ] SUBSTRING() / SUBSTR()
- [ ] TRIM(), LTRIM(), RTRIM()
- [ ] REPLACE()
- [ ] LEFT() and RIGHT()
- [ ] POSITION() / STRPOS()

### 🎯 Projects

#### Project 2.1: Customer Data Cleaning
**Description:** Clean and standardize customer data

**Sample Data Issues:**
- Mixed case names
- Phone numbers in different formats
- Email addresses with spaces
- Duplicate records

**SQL Tasks:**
```sql
-- Standardize names to title case
UPDATE customers 
SET first_name = INITCAP(LOWER(first_name)),
    last_name = INITCAP(LOWER(last_name));

-- Clean phone numbers (remove special characters)
UPDATE customers
SET phone = REGEXP_REPLACE(phone, '[^0-9]', '', 'g');

-- Trim email addresses
UPDATE customers
SET email = LOWER(TRIM(email));

-- Find potential duplicates
SELECT email, COUNT(*) as count
FROM customers
GROUP BY email
HAVING COUNT(*) > 1;
```

**Deliverables:**
- Before/after data quality report
- Cleaning script
- Data validation queries

#### Project 2.2: Product Inventory Management
**Description:** Manage product stock and updates

**Operations:**
- Add new products
- Update stock quantities
- Apply bulk price increases
- Mark discontinued products
- Find low-stock items

**Sample Queries:**
```sql
-- Add new product
INSERT INTO products (name, price, stock, category_id)
VALUES ('Wireless Mouse', 29.99, 150, 3);

-- Update stock after sale
UPDATE products
SET stock = stock - 5
WHERE product_id = 101;

-- Apply 10% discount to winter items
UPDATE products
SET price = price * 0.9
WHERE category = 'Winter'
AND season_end < CURRENT_DATE;

-- Find products to reorder
SELECT product_id, name, stock, reorder_level
FROM products
WHERE stock < reorder_level
ORDER BY stock ASC;
```

#### Project 2.3: Sales Transaction System
**Description:** Build transaction recording system

**Features:**
- Record sales transactions
- Update inventory automatically
- Handle returns
- Apply discounts
- Validate data before insert

---

## Phase 3: Joins & Relationships
**Duration:** 3-4 weeks | **Level:** Intermediate

### 📚 Topics to Cover

#### 3.1 Join Fundamentals
- [ ] What are joins?
- [ ] Join conditions
- [ ] Table aliases
- [ ] Multi-table joins
- [ ] Self-joins
- [ ] Join performance considerations

#### 3.2 INNER JOIN
- [ ] INNER JOIN syntax
- [ ] Joining two tables
- [ ] Joining on multiple columns
- [ ] Filtering joined results
- [ ] USING clause
- [ ] Natural joins (and why to avoid them)

#### 3.3 OUTER JOINs
- [ ] LEFT JOIN / LEFT OUTER JOIN
- [ ] RIGHT JOIN / RIGHT OUTER JOIN
- [ ] FULL OUTER JOIN
- [ ] Understanding NULL values in joins
- [ ] Filtering in WHERE vs ON clause

#### 3.4 CROSS JOIN
- [ ] Cartesian product
- [ ] Use cases for CROSS JOIN
- [ ] Generating combinations

#### 3.5 UNION Operations
- [ ] UNION vs UNION ALL
- [ ] Combining result sets
- [ ] Column matching requirements
- [ ] INTERSECT
- [ ] EXCEPT / MINUS

#### 3.6 Relationships
- [ ] One-to-One relationships
- [ ] One-to-Many relationships
- [ ] Many-to-Many relationships
- [ ] Junction/Bridge tables
- [ ] Referential integrity

### 🎯 Projects

#### Project 3.1: E-commerce Order System
**Description:** Build comprehensive order tracking system

**Schema:**
```sql
-- Customers
CREATE TABLE customers (
    customer_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100) UNIQUE,
    registration_date DATE DEFAULT CURRENT_DATE
);

-- Products
CREATE TABLE products (
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10, 2),
    stock INT
);

-- Orders
CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES customers(customer_id),
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    total_amount DECIMAL(10, 2),
    status VARCHAR(20)
);

-- Order Items (Many-to-Many between Orders and Products)
CREATE TABLE order_items (
    order_item_id SERIAL PRIMARY KEY,
    order_id INT REFERENCES orders(order_id),
    product_id INT REFERENCES products(product_id),
    quantity INT,
    unit_price DECIMAL(10, 2),
    subtotal DECIMAL(10, 2)
);
```

**Analysis Queries:**
```sql
-- 1. Customer order history
SELECT 
    c.customer_id,
    c.first_name || ' ' || c.last_name AS customer_name,
    o.order_id,
    o.order_date,
    o.total_amount,
    o.status
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
ORDER BY c.customer_id, o.order_date DESC;

-- 2. Product sales summary
SELECT 
    p.product_id,
    p.product_name,
    p.category,
    COUNT(DISTINCT oi.order_id) AS orders_count,
    SUM(oi.quantity) AS total_quantity_sold,
    SUM(oi.subtotal) AS total_revenue
FROM products p
LEFT JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY p.product_id, p.product_name, p.category
ORDER BY total_revenue DESC;

-- 3. Detailed order information
SELECT 
    o.order_id,
    c.first_name || ' ' || c.last_name AS customer,
    o.order_date,
    p.product_name,
    oi.quantity,
    oi.unit_price,
    oi.subtotal
FROM orders o
INNER JOIN customers c ON o.customer_id = c.customer_id
INNER JOIN order_items oi ON o.order_id = oi.order_id
INNER JOIN products p ON oi.product_id = p.product_id
WHERE o.order_date >= CURRENT_DATE - INTERVAL '30 days'
ORDER BY o.order_date DESC, o.order_id;

-- 4. Customers who never ordered
SELECT c.customer_id, c.first_name, c.last_name, c.email
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;
```

#### Project 3.2: HR Database - Employee Relationships
**Description:** Complex employee hierarchy and department relationships

**Schema:**
```sql
-- Departments
CREATE TABLE departments (
    department_id SERIAL PRIMARY KEY,
    department_name VARCHAR(50),
    location VARCHAR(100)
);

-- Employees
CREATE TABLE employees (
    employee_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    hire_date DATE,
    salary DECIMAL(10, 2),
    department_id INT REFERENCES departments(department_id),
    manager_id INT REFERENCES employees(employee_id)
);

-- Projects
CREATE TABLE projects (
    project_id SERIAL PRIMARY KEY,
    project_name VARCHAR(100),
    start_date DATE,
    end_date DATE,
    budget DECIMAL(12, 2)
);

-- Employee-Project assignment (Many-to-Many)
CREATE TABLE employee_projects (
    employee_id INT REFERENCES employees(employee_id),
    project_id INT REFERENCES projects(project_id),
    role VARCHAR(50),
    allocation_percentage INT,
    PRIMARY KEY (employee_id, project_id)
);
```

**Queries:**
```sql
-- Self-join: Employee with their manager
SELECT 
    e.employee_id,
    e.first_name || ' ' || e.last_name AS employee,
    e.salary,
    m.first_name || ' ' || m.last_name AS manager
FROM employees e
LEFT JOIN employees m ON e.manager_id = m.employee_id;

-- Department headcount and average salary
SELECT 
    d.department_name,
    COUNT(e.employee_id) AS employee_count,
    AVG(e.salary) AS avg_salary,
    MIN(e.salary) AS min_salary,
    MAX(e.salary) AS max_salary
FROM departments d
LEFT JOIN employees e ON d.department_id = e.department_id
GROUP BY d.department_id, d.department_name;

-- Project assignments with employee details
SELECT 
    p.project_name,
    e.first_name || ' ' || e.last_name AS employee,
    d.department_name,
    ep.role,
    ep.allocation_percentage
FROM projects p
INNER JOIN employee_projects ep ON p.project_id = ep.project_id
INNER JOIN employees e ON ep.employee_id = e.employee_id
INNER JOIN departments d ON e.department_id = d.department_id
WHERE p.end_date >= CURRENT_DATE
ORDER BY p.project_name, e.last_name;
```

#### Project 3.3: Student Course Enrollment System
**Description:** University database with complex relationships

**Tables:**
- students
- courses
- instructors
- enrollments (bridge table)
- grades

**Queries to Build:**
- Student course history
- Course enrollment statistics
- Instructor workload
- Grade distribution by course

---

## Phase 4: Aggregations & Grouping
**Duration:** 2-3 weeks | **Level:** Intermediate

### 📚 Topics to Cover

#### 4.1 Aggregate Functions
- [ ] COUNT() and COUNT(*)
- [ ] SUM()
- [ ] AVG()
- [ ] MIN() and MAX()
- [ ] COUNT(DISTINCT)
- [ ] Handling NULL in aggregates
- [ ] String aggregation (STRING_AGG, GROUP_CONCAT)

#### 4.2 GROUP BY Clause
- [ ] GROUP BY syntax
- [ ] Grouping by single column
- [ ] Grouping by multiple columns
- [ ] GROUP BY with expressions
- [ ] GROUP BY with DISTINCT
- [ ] Order of execution

#### 4.3 HAVING Clause
- [ ] HAVING vs WHERE
- [ ] Filtering grouped results
- [ ] HAVING with aggregate functions
- [ ] Combining WHERE and HAVING

#### 4.4 Advanced Grouping
- [ ] ROLLUP
- [ ] CUBE
- [ ] GROUPING SETS
- [ ] Grouping functions (GROUPING)
- [ ] NULL values in grouping

#### 4.5 Date/Time Functions
- [ ] CURRENT_DATE, CURRENT_TIME, CURRENT_TIMESTAMP
- [ ] EXTRACT() / DATE_PART()
- [ ] DATE_TRUNC()
- [ ] AGE()
- [ ] Date arithmetic
- [ ] Formatting dates (TO_CHAR)
- [ ] Parsing dates (TO_DATE)

### 🎯 Projects

#### Project 4.1: Sales Analytics Dashboard (SQL)
**Description:** Generate business intelligence reports using SQL

**Reports to Build:**

**1. Daily Sales Summary:**
```sql
SELECT 
    DATE(order_date) AS sale_date,
    COUNT(DISTINCT order_id) AS total_orders,
    COUNT(DISTINCT customer_id) AS unique_customers,
    SUM(total_amount) AS daily_revenue,
    AVG(total_amount) AS avg_order_value,
    MIN(total_amount) AS min_order,
    MAX(total_amount) AS max_order
FROM orders
WHERE order_date >= CURRENT_DATE - INTERVAL '30 days'
GROUP BY DATE(order_date)
ORDER BY sale_date DESC;
```

**2. Monthly Revenue Trend:**
```sql
SELECT 
    DATE_TRUNC('month', order_date) AS month,
    COUNT(*) AS orders_count,
    SUM(total_amount) AS monthly_revenue,
    AVG(total_amount) AS avg_order_value,
    COUNT(DISTINCT customer_id) AS unique_customers
FROM orders
GROUP BY DATE_TRUNC('month', order_date)
ORDER BY month DESC;
```

**3. Category Performance:**
```sql
SELECT 
    p.category,
    COUNT(DISTINCT oi.order_id) AS orders,
    SUM(oi.quantity) AS items_sold,
    SUM(oi.subtotal) AS category_revenue,
    AVG(oi.subtotal) AS avg_order_value
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY p.category
ORDER BY category_revenue DESC;
```

**4. Customer Segments (RFM Analysis - Simple Version):**
```sql
SELECT 
    customer_id,
    MAX(order_date) AS last_order_date,
    COUNT(order_id) AS frequency,
    SUM(total_amount) AS monetary_value,
    CURRENT_DATE - MAX(order_date) AS days_since_last_order
FROM orders
GROUP BY customer_id
ORDER BY monetary_value DESC;
```

**5. High-Value Customers:**
```sql
SELECT 
    c.customer_id,
    c.first_name || ' ' || c.last_name AS customer_name,
    COUNT(o.order_id) AS total_orders,
    SUM(o.total_amount) AS lifetime_value,
    AVG(o.total_amount) AS avg_order_value
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, customer_name
HAVING SUM(o.total_amount) > 1000
ORDER BY lifetime_value DESC
LIMIT 20;
```

#### Project 4.2: Website Traffic Analysis
**Description:** Analyze web logs data

**Schema:**
```sql
CREATE TABLE page_views (
    view_id SERIAL PRIMARY KEY,
    user_id INT,
    session_id VARCHAR(50),
    page_url VARCHAR(200),
    view_timestamp TIMESTAMP,
    referrer VARCHAR(200),
    device_type VARCHAR(20),
    country VARCHAR(50)
);
```

**Analysis Queries:**
- Daily/hourly traffic patterns
- Most visited pages
- Average session duration
- User retention (returning visitors)
- Traffic by device type
- Geographic distribution

#### Project 4.3: Employee Performance Metrics
**Description:** HR analytics for employee assessment

**Metrics:**
- Headcount by department
- Salary statistics
- Tenure analysis
- Department budget utilization
- Promotion trends
- Hiring trends over time

---

## Phase 5: Subqueries & CTEs
**Duration:** 3-4 weeks | **Level:** Intermediate to Advanced

### 📚 Topics to Cover

#### 5.1 Subquery Basics
- [ ] What are subqueries?
- [ ] Subqueries in WHERE clause
- [ ] Subqueries in FROM clause
- [ ] Subqueries in SELECT clause
- [ ] Scalar vs row vs table subqueries
- [ ] Correlated subqueries

#### 5.2 Subquery Operators
- [ ] IN and NOT IN with subqueries
- [ ] EXISTS and NOT EXISTS
- [ ] ANY and ALL operators
- [ ] Comparison operators with subqueries

#### 5.3 Common Table Expressions (CTEs)
- [ ] WITH clause syntax
- [ ] Single CTE
- [ ] Multiple CTEs
- [ ] Recursive CTEs
- [ ] CTE vs subqueries (when to use)
- [ ] Performance considerations

#### 5.4 Derived Tables
- [ ] Inline views
- [ ] Temporary result sets
- [ ] Joining derived tables

#### 5.5 Advanced Patterns
- [ ] Subqueries in UPDATE
- [ ] Subqueries in DELETE
- [ ] Subqueries in INSERT
- [ ] Complex filtering logic

### 🎯 Projects

#### Project 5.1: Advanced Sales Analysis
**Description:** Complex sales analytics using subqueries and CTEs

**Query 1: Customers who spent above average**
```sql
-- Using subquery
SELECT 
    c.customer_id,
    c.first_name || ' ' || c.last_name AS customer_name,
    SUM(o.total_amount) AS total_spent
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, customer_name
HAVING SUM(o.total_amount) > (
    SELECT AVG(total_spent)
    FROM (
        SELECT SUM(total_amount) AS total_spent
        FROM orders
        GROUP BY customer_id
    ) AS customer_totals
);

-- Using CTE (cleaner)
WITH customer_spending AS (
    SELECT 
        customer_id,
        SUM(total_amount) AS total_spent
    FROM orders
    GROUP BY customer_id
),
avg_spending AS (
    SELECT AVG(total_spent) AS avg_spend
    FROM customer_spending
)
SELECT 
    c.customer_id,
    c.first_name || ' ' || c.last_name AS customer_name,
    cs.total_spent
FROM customers c
JOIN customer_spending cs ON c.customer_id = cs.customer_id
CROSS JOIN avg_spending
WHERE cs.total_spent > avg_spending.avg_spend
ORDER BY cs.total_spent DESC;
```

**Query 2: Top 3 products in each category**
```sql
WITH ranked_products AS (
    SELECT 
        p.category,
        p.product_name,
        SUM(oi.subtotal) AS revenue,
        ROW_NUMBER() OVER (
            PARTITION BY p.category 
            ORDER BY SUM(oi.subtotal) DESC
        ) AS rank
    FROM products p
    JOIN order_items oi ON p.product_id = oi.product_id
    GROUP BY p.category, p.product_name
)
SELECT category, product_name, revenue
FROM ranked_products
WHERE rank <= 3
ORDER BY category, rank;
```

**Query 3: Month-over-Month Growth**
```sql
WITH monthly_sales AS (
    SELECT 
        DATE_TRUNC('month', order_date) AS month,
        SUM(total_amount) AS revenue
    FROM orders
    GROUP BY DATE_TRUNC('month', order_date)
)
SELECT 
    month,
    revenue,
    LAG(revenue) OVER (ORDER BY month) AS prev_month_revenue,
    revenue - LAG(revenue) OVER (ORDER BY month) AS revenue_change,
    ROUND(
        ((revenue - LAG(revenue) OVER (ORDER BY month)) / 
        LAG(revenue) OVER (ORDER BY month) * 100), 2
    ) AS growth_percentage
FROM monthly_sales
ORDER BY month;
```

#### Project 5.2: Recursive Organizational Chart
**Description:** Build employee hierarchy using recursive CTE

```sql
-- Find all employees reporting to a manager (direct and indirect)
WITH RECURSIVE employee_hierarchy AS (
    -- Base case: top-level manager
    SELECT 
        employee_id,
        first_name,
        last_name,
        manager_id,
        1 AS level,
        ARRAY[employee_id] AS path
    FROM employees
    WHERE manager_id IS NULL
    
    UNION ALL
    
    -- Recursive case: employees reporting to current level
    SELECT 
        e.employee_id,
        e.first_name,
        e.last_name,
        e.manager_id,
        eh.level + 1,
        eh.path || e.employee_id
    FROM employees e
    INNER JOIN employee_hierarchy eh ON e.manager_id = eh.employee_id
)
SELECT 
    employee_id,
    REPEAT('  ', level - 1) || first_name || ' ' || last_name AS employee,
    level,
    path
FROM employee_hierarchy
ORDER BY path;
```

**Output:**
```
employee_id | employee              | level | path
------------|-----------------------|-------|-------------
1           | John Doe              | 1     | {1}
2           |   Jane Smith          | 2     | {1,2}
5           |     Bob Johnson       | 3     | {1,2,5}
3           |   Mike Brown          | 2     | {1,3}
```

#### Project 5.3: Product Recommendation Engine (SQL-based)
**Description:** Find frequently bought together products

```sql
-- Products frequently purchased together
WITH order_pairs AS (
    SELECT 
        oi1.product_id AS product_a,
        oi2.product_id AS product_b,
        COUNT(DISTINCT oi1.order_id) AS times_bought_together
    FROM order_items oi1
    JOIN order_items oi2 
        ON oi1.order_id = oi2.order_id 
        AND oi1.product_id < oi2.product_id
    GROUP BY oi1.product_id, oi2.product_id
)
SELECT 
    p1.product_name AS product_1,
    p2.product_name AS product_2,
    op.times_bought_together,
    ROUND(
        op.times_bought_together * 100.0 / (
            SELECT COUNT(DISTINCT order_id) FROM order_items WHERE product_id = op.product_a
        ), 2
    ) AS percentage
FROM order_pairs op
JOIN products p1 ON op.product_a = p1.product_id
JOIN products p2 ON op.product_b = p2.product_id
WHERE op.times_bought_together >= 5
ORDER BY op.times_bought_together DESC;
```

---

## Phase 6: Advanced SQL Functions
**Duration:** 3-4 weeks | **Level:** Advanced

### 📚 Topics to Cover

#### 6.1 Mathematical Functions
- [ ] ROUND(), FLOOR(), CEILING()
- [ ] ABS(), SIGN()
- [ ] POWER(), SQRT()
- [ ] MOD() (modulo)
- [ ] RANDOM()
- [ ] GREATEST(), LEAST()

#### 6.2 Conditional Logic
- [ ] CASE expressions (simple and searched)
- [ ] COALESCE()
- [ ] NULLIF()
- [ ] CAST() and type conversion
- [ ] Nested CASE statements

#### 6.3 JSON Functions (PostgreSQL)
- [ ] JSON data type
- [ ] JSONB data type
- [ ] JSON creation functions
- [ ] JSON extraction (->>, ->)
- [ ] JSON aggregation
- [ ] JSON array functions

#### 6.4 Array Functions (PostgreSQL)
- [ ] Array creation
- [ ] Array operations
- [ ] UNNEST()
- [ ] Array aggregation
- [ ] Array operators

#### 6.5 Text Search
- [ ] Full-text search (PostgreSQL)
- [ ] tsvector and tsquery
- [ ] Ranking search results
- [ ] Text search configuration

### 🎯 Projects

#### Project 6.1: Dynamic Pricing Engine
**Description:** Calculate dynamic prices based on multiple factors

```sql
SELECT 
    product_id,
    product_name,
    base_price,
    stock,
    CASE 
        WHEN stock < 10 THEN base_price * 1.2  -- Low stock premium
        WHEN stock > 100 THEN base_price * 0.9  -- High stock discount
        ELSE base_price
    END AS stock_adjusted_price,
    CASE 
        WHEN EXTRACT(DOW FROM CURRENT_DATE) IN (0, 6) THEN 0.95  -- Weekend discount
        WHEN EXTRACT(HOUR FROM CURRENT_TIMESTAMP) BETWEEN 22 AND 6 THEN 0.98  -- Night discount
        ELSE 1.0
    END AS time_multiplier,
    ROUND(
        CASE 
            WHEN stock < 10 THEN base_price * 1.2
            WHEN stock > 100 THEN base_price * 0.9
            ELSE base_price
        END * 
        CASE 
            WHEN EXTRACT(DOW FROM CURRENT_DATE) IN (0, 6) THEN 0.95
            WHEN EXTRACT(HOUR FROM CURRENT_TIMESTAMP) BETWEEN 22 AND 6 THEN 0.98
            ELSE 1.0
        END, 2
    ) AS final_price
FROM products;
```

#### Project 6.2: Customer Segmentation with CASE
**Description:** Segment customers based on behavior

```sql
WITH customer_metrics AS (
    SELECT 
        c.customer_id,
        c.first_name || ' ' || c.last_name AS customer_name,
        COUNT(o.order_id) AS order_count,
        SUM(o.total_amount) AS total_spent,
        MAX(o.order_date) AS last_order_date,
        CURRENT_DATE - MAX(o.order_date) AS days_since_last_order
    FROM customers c
    LEFT JOIN orders o ON c.customer_id = o.customer_id
    GROUP BY c.customer_id, customer_name
)
SELECT 
    customer_id,
    customer_name,
    order_count,
    total_spent,
    last_order_date,
    days_since_last_order,
    CASE 
        WHEN order_count = 0 THEN 'Never Purchased'
        WHEN days_since_last_order > 365 THEN 'Churned'
        WHEN days_since_last_order > 180 THEN 'At Risk'
        WHEN days_since_last_order > 90 THEN 'Needs Attention'
        ELSE 'Active'
    END AS engagement_status,
    CASE 
        WHEN total_spent >= 10000 THEN 'VIP'
        WHEN total_spent >= 5000 THEN 'Gold'
        WHEN total_spent >= 1000 THEN 'Silver'
        WHEN total_spent > 0 THEN 'Bronze'
        ELSE 'New'
    END AS tier,
    CASE 
        WHEN order_count >= 20 AND total_spent >= 5000 THEN 'Champion'
        WHEN order_count >= 10 AND days_since_last_order <= 90 THEN 'Loyal'
        WHEN total_spent >= 2000 AND order_count <= 3 THEN 'Big Spender'
        WHEN order_count >= 5 AND days_since_last_order <= 180 THEN 'Potential Loyalist'
        WHEN order_count <= 2 AND days_since_last_order <= 90 THEN 'New Customer'
        ELSE 'Other'
    END AS segment
FROM customer_metrics
ORDER BY total_spent DESC;
```

#### Project 6.3: Store JSON Data Analysis
**Description:** Work with JSON product attributes

```sql
-- Create table with JSON column
CREATE TABLE products_with_specs (
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    specifications JSONB
);

-- Insert sample data
INSERT INTO products_with_specs (product_name, category, specifications)
VALUES 
('Gaming Laptop', 'Electronics', 
 '{"brand": "TechPro", "processor": "Intel i7", "ram": "16GB", "storage": "512GB SSD", "screen": "15.6 inch"}'),
('Smartphone', 'Electronics',
 '{"brand": "PhoneX", "os": "Android", "storage": "128GB", "camera": "48MP", "battery": "5000mAh"}');

-- Query JSON data
SELECT 
    product_name,
    specifications->>'brand' AS brand,
    specifications->>'processor' AS processor,
    specifications->>'ram' AS ram
FROM products_with_specs
WHERE specifications->>'brand' = 'TechPro';

-- Update JSON field
UPDATE products_with_specs
SET specifications = specifications || '{"warranty": "2 years"}'::jsonb
WHERE category = 'Electronics';

-- Aggregate JSON data
SELECT 
    specifications->>'brand' AS brand,
    COUNT(*) AS product_count,
    json_agg(product_name) AS products
FROM products_with_specs
GROUP BY specifications->>'brand';
```

---

## Phase 7: Window Functions
**Duration:** 3-4 weeks | **Level:** Advanced

### 📚 Topics to Cover

#### 7.1 Window Function Basics
- [ ] What are window functions?
- [ ] OVER clause
- [ ] PARTITION BY
- [ ] ORDER BY in windows
- [ ] Window frames (ROWS, RANGE)
- [ ] Window functions vs GROUP BY

#### 7.2 Ranking Functions
- [ ] ROW_NUMBER()
- [ ] RANK()
- [ ] DENSE_RANK()
- [ ] NTILE()
- [ ] Percent ranking (PERCENT_RANK, CUME_DIST)

#### 7.3 Aggregate Window Functions
- [ ] SUM() OVER
- [ ] AVG() OVER
- [ ] COUNT() OVER
- [ ] MIN() and MAX() OVER
- [ ] Running totals
- [ ] Moving averages

#### 7.4 Value Window Functions
- [ ] LAG() and LEAD()
- [ ] FIRST_VALUE() and LAST_VALUE()
- [ ] NTH_VALUE()

#### 7.5 Advanced Window Techniques
- [ ] Multiple window specifications
- [ ] Named windows (WINDOW clause)
- [ ] Frame specifications
- [ ] EXCLUDE clause

### 🎯 Projects

#### Project 7.1: Sales Performance Dashboard
**Description:** Advanced sales analytics using window functions

**Query 1: Running Total and Moving Average**
```sql
SELECT 
    DATE(order_date) AS sale_date,
    COUNT(*) AS daily_orders,
    SUM(total_amount) AS daily_revenue,
    SUM(SUM(total_amount)) OVER (
        ORDER BY DATE(order_date)
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS cumulative_revenue,
    AVG(SUM(total_amount)) OVER (
        ORDER BY DATE(order_date)
        ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
    ) AS moving_avg_7day,
    SUM(total_amount) - LAG(SUM(total_amount)) OVER (ORDER BY DATE(order_date)) AS day_over_day_change
FROM orders
GROUP BY DATE(order_date)
ORDER BY sale_date;
```

**Query 2: Top N per Category**
```sql
SELECT 
    category,
    product_name,
    total_revenue,
    rank
FROM (
    SELECT 
        p.category,
        p.product_name,
        SUM(oi.subtotal) AS total_revenue,
        RANK() OVER (PARTITION BY p.category ORDER BY SUM(oi.subtotal) DESC) AS rank
    FROM products p
    JOIN order_items oi ON p.product_id = oi.product_id
    GROUP BY p.category, p.product_name
) ranked
WHERE rank <= 5
ORDER BY category, rank;
```

**Query 3: Percentile Analysis**
```sql
SELECT 
    customer_id,
    customer_name,
    total_spent,
    NTILE(4) OVER (ORDER BY total_spent) AS quartile,
    PERCENT_RANK() OVER (ORDER BY total_spent) AS percentile,
    CASE 
        WHEN PERCENT_RANK() OVER (ORDER BY total_spent) >= 0.95 THEN 'Top 5%'
        WHEN PERCENT_RANK() OVER (ORDER BY total_spent) >= 0.75 THEN 'Top 25%'
        WHEN PERCENT_RANK() OVER (ORDER BY total_spent) >= 0.50 THEN 'Top 50%'
        ELSE 'Bottom 50%'
    END AS tier
FROM (
    SELECT 
        c.customer_id,
        c.first_name || ' ' || c.last_name AS customer_name,
        COALESCE(SUM(o.total_amount), 0) AS total_spent
    FROM customers c
    LEFT JOIN orders o ON c.customer_id = o.customer_id
    GROUP BY c.customer_id, customer_name
) customer_spending;
```

#### Project 7.2: Time Series Analysis
**Description:** Analyze trends over time

**Gap Detection:**
```sql
-- Find gaps in daily sales
WITH daily_sales AS (
    SELECT 
        DATE(order_date) AS sale_date,
        SUM(total_amount) AS revenue
    FROM orders
    GROUP BY DATE(order_date)
)
SELECT 
    sale_date,
    revenue,
    sale_date - LAG(sale_date) OVER (ORDER BY sale_date) AS days_gap,
    CASE 
        WHEN sale_date - LAG(sale_date) OVER (ORDER BY sale_date) > 1 
        THEN 'Gap Detected'
        ELSE 'Normal'
    END AS status
FROM daily_sales
ORDER BY sale_date;
```

**Cohort Analysis:**
```sql
-- Customer cohort retention
WITH customer_cohorts AS (
    SELECT 
        customer_id,
        DATE_TRUNC('month', MIN(order_date)) AS cohort_month
    FROM orders
    GROUP BY customer_id
),
order_months AS (
    SELECT 
        customer_id,
        DATE_TRUNC('month', order_date) AS order_month
    FROM orders
)
SELECT 
    cc.cohort_month,
    om.order_month,
    COUNT(DISTINCT cc.customer_id) AS customers,
    (om.order_month - cc.cohort_month) / 30 AS months_since_first_order
FROM customer_cohorts cc
JOIN order_months om ON cc.customer_id = om.customer_id
GROUP BY cc.cohort_month, om.order_month
ORDER BY cc.cohort_month, om.order_month;
```

#### Project 7.3: Employee Analytics
**Description:** HR metrics using window functions

```sql
-- Salary percentiles within departments
SELECT 
    e.employee_id,
    e.first_name || ' ' || e.last_name AS employee_name,
    d.department_name,
    e.salary,
    AVG(e.salary) OVER (PARTITION BY e.department_id) AS dept_avg_salary,
    e.salary - AVG(e.salary) OVER (PARTITION BY e.department_id) AS diff_from_avg,
    PERCENT_RANK() OVER (PARTITION BY e.department_id ORDER BY e.salary) AS salary_percentile,
    RANK() OVER (PARTITION BY e.department_id ORDER BY e.salary DESC) AS dept_salary_rank,
    FIRST_VALUE(e.first_name || ' ' || e.last_name) OVER (
        PARTITION BY e.department_id 
        ORDER BY e.salary DESC
    ) AS highest_paid_in_dept
FROM employees e
JOIN departments d ON e.department_id = d.department_id;
```

---

## Phase 8: Data Modeling & Design
**Duration:** 4-5 weeks | **Level:** Advanced

### 📚 Topics to Cover

#### 8.1 Database Design Principles
- [ ] Normalization (1NF, 2NF, 3NF, BCNF)
- [ ] Denormalization (when and why)
- [ ] Entity-Relationship Diagrams (ERD)
- [ ] Cardinality
- [ ] Business rules to schema

#### 8.2 Schema Design Patterns
- [ ] Star schema (data warehousing)
- [ ] Snowflake schema
- [ ] Fact and dimension tables
- [ ] Slowly Changing Dimensions (SCD)
- [ ] Bridge/Junction tables
- [ ] Surrogate vs natural keys

#### 8.3 Constraints & Integrity
- [ ] Primary key constraints
- [ ] Foreign key constraints
- [ ] Unique constraints
- [ ] Check constraints
- [ ] NOT NULL constraints
- [ ] Default values
- [ ] Referential actions (CASCADE, SET NULL)

#### 8.4 Views
- [ ] Creating views
- [ ] Updatable views
- [ ] Materialized views
- [ ] View dependencies
- [ ] Security with views

#### 8.5 Sequences & Identity
- [ ] SERIAL / IDENTITY columns
- [ ] Sequence objects
- [ ] GENERATED ALWAYS AS IDENTITY

### 🎯 Projects

#### Project 8.1: Data Warehouse Star Schema
**Description:** Design dimensional model for retail analytics

**Schema Design:**
```sql
-- Dimension Tables

-- Date Dimension
CREATE TABLE dim_date (
    date_key INT PRIMARY KEY,
    full_date DATE NOT NULL,
    day_of_week INT,
    day_name VARCHAR(10),
    day_of_month INT,
    day_of_year INT,
    week_of_year INT,
    month INT,
    month_name VARCHAR(10),
    quarter INT,
    year INT,
    is_weekend BOOLEAN,
    is_holiday BOOLEAN
);

-- Product Dimension (SCD Type 2)
CREATE TABLE dim_product (
    product_key SERIAL PRIMARY KEY,
    product_id INT NOT NULL,  -- Natural key
    product_name VARCHAR(100),
    category VARCHAR(50),
    subcategory VARCHAR(50),
    brand VARCHAR(50),
    unit_price DECIMAL(10, 2),
    valid_from DATE NOT NULL,
    valid_to DATE,
    is_current BOOLEAN DEFAULT TRUE
);

-- Customer Dimension (SCD Type 2)
CREATE TABLE dim_customer (
    customer_key SERIAL PRIMARY KEY,
    customer_id INT NOT NULL,  -- Natural key
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    city VARCHAR(50),
    state VARCHAR(50),
    country VARCHAR(50),
    customer_segment VARCHAR(20),
    valid_from DATE NOT NULL,
    valid_to DATE,
    is_current BOOLEAN DEFAULT TRUE
);

-- Store Dimension
CREATE TABLE dim_store (
    store_key SERIAL PRIMARY KEY,
    store_id INT NOT NULL,
    store_name VARCHAR(100),
    city VARCHAR(50),
    state VARCHAR(50),
    region VARCHAR(50),
    store_type VARCHAR(30),
    opening_date DATE
);

-- Fact Table
CREATE TABLE fact_sales (
    sales_key BIGSERIAL PRIMARY KEY,
    date_key INT REFERENCES dim_date(date_key),
    product_key INT REFERENCES dim_product(product_key),
    customer_key INT REFERENCES dim_customer(customer_key),
    store_key INT REFERENCES dim_store(store_key),
    quantity INT,
    unit_price DECIMAL(10, 2),
    discount_amount DECIMAL(10, 2),
    tax_amount DECIMAL(10, 2),
    total_amount DECIMAL(10, 2),
    cost_amount DECIMAL(10, 2),
    profit_amount DECIMAL(10, 2)
);

-- Indexes for performance
CREATE INDEX idx_fact_sales_date ON fact_sales(date_key);
CREATE INDEX idx_fact_sales_product ON fact_sales(product_key);
CREATE INDEX idx_fact_sales_customer ON fact_sales(customer_key);
CREATE INDEX idx_fact_sales_store ON fact_sales(store_key);
```

**SCD Type 2 Implementation:**
```sql
-- Insert new product version (SCD Type 2)
CREATE OR REPLACE FUNCTION update_product_scd2(
    p_product_id INT,
    p_product_name VARCHAR,
    p_category VARCHAR,
    p_unit_price DECIMAL
)
RETURNS VOID AS $$
BEGIN
    -- Expire current record
    UPDATE dim_product
    SET valid_to = CURRENT_DATE,
        is_current = FALSE
    WHERE product_id = p_product_id
    AND is_current = TRUE;
    
    -- Insert new record
    INSERT INTO dim_product (
        product_id, product_name, category, unit_price,
        valid_from, valid_to, is_current
    )
    VALUES (
        p_product_id, p_product_name, p_category, p_unit_price,
        CURRENT_DATE, NULL, TRUE
    );
END;
$$ LANGUAGE plpgsql;
```

**Analytics Queries:**
```sql
-- Sales by category and month
SELECT 
    dd.year,
    dd.month_name,
    dp.category,
    SUM(fs.total_amount) AS revenue,
    SUM(fs.profit_amount) AS profit,
    COUNT(*) AS transactions,
    AVG(fs.total_amount) AS avg_transaction_value
FROM fact_sales fs
JOIN dim_date dd ON fs.date_key = dd.date_key
JOIN dim_product dp ON fs.product_key = dp.product_key
WHERE dd.year = 2024
GROUP BY dd.year, dd.month, dd.month_name, dp.category
ORDER BY dd.month, revenue DESC;
```

#### Project 8.2: Normalized Database Design
**Description:** Design fully normalized database for university

**Schema:**
```sql
-- Students (1NF, 2NF, 3NF)
CREATE TABLE students (
    student_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    date_of_birth DATE,
    enrollment_date DATE DEFAULT CURRENT_DATE,
    major_id INT,
    CONSTRAINT fk_major FOREIGN KEY (major_id) REFERENCES majors(major_id)
);

-- Majors
CREATE TABLE majors (
    major_id SERIAL PRIMARY KEY,
    major_name VARCHAR(100) UNIQUE NOT NULL,
    department_id INT,
    CONSTRAINT fk_department FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

-- Departments
CREATE TABLE departments (
    department_id SERIAL PRIMARY KEY,
    department_name VARCHAR(100) UNIQUE NOT NULL,
    building VARCHAR(50),
    budget DECIMAL(12, 2)
);

-- Courses
CREATE TABLE courses (
    course_id SERIAL PRIMARY KEY,
    course_code VARCHAR(10) UNIQUE NOT NULL,
    course_name VARCHAR(100) NOT NULL,
    credits INT NOT NULL CHECK (credits > 0),
    department_id INT,
    CONSTRAINT fk_dept FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

-- Instructors
CREATE TABLE instructors (
    instructor_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    department_id INT,
    hire_date DATE,
    CONSTRAINT fk_instructor_dept FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

-- Course Sections (a course can have multiple sections)
CREATE TABLE course_sections (
    section_id SERIAL PRIMARY KEY,
    course_id INT,
    instructor_id INT,
    semester VARCHAR(20),
    year INT,
    room VARCHAR(20),
    schedule VARCHAR(50),
    max_enrollment INT DEFAULT 30,
    CONSTRAINT fk_course FOREIGN KEY (course_id) REFERENCES courses(course_id),
    CONSTRAINT fk_instructor FOREIGN KEY (instructor_id) REFERENCES instructors(instructor_id),
    CONSTRAINT uk_section UNIQUE (course_id, semester, year, section_id)
);

-- Enrollments (Many-to-Many between Students and Course Sections)
CREATE TABLE enrollments (
    enrollment_id SERIAL PRIMARY KEY,
    student_id INT,
    section_id INT,
    enrollment_date DATE DEFAULT CURRENT_DATE,
    grade VARCHAR(2),
    status VARCHAR(20) DEFAULT 'enrolled',
    CONSTRAINT fk_student FOREIGN KEY (student_id) REFERENCES students(student_id),
    CONSTRAINT fk_section FOREIGN KEY (section_id) REFERENCES course_sections(section_id),
    CONSTRAINT uk_enrollment UNIQUE (student_id, section_id),
    CONSTRAINT chk_grade CHECK (grade IN ('A', 'A-', 'B+', 'B', 'B-', 'C+', 'C', 'C-', 'D+', 'D', 'F', NULL))
);

-- Prerequisites (Many-to-Many self-referencing)
CREATE TABLE course_prerequisites (
    course_id INT,
    prerequisite_course_id INT,
    PRIMARY KEY (course_id, prerequisite_course_id),
    CONSTRAINT fk_course_prereq FOREIGN KEY (course_id) REFERENCES courses(course_id),
    CONSTRAINT fk_prereq FOREIGN KEY (prerequisite_course_id) REFERENCES courses(course_id),
    CONSTRAINT chk_not_self CHECK (course_id != prerequisite_course_id)
);
```

#### Project 8.3: Create Analytical Views
**Description:** Build reusable views for common queries

```sql
-- View: Current enrollment summary
CREATE VIEW vw_current_enrollments AS
SELECT 
    s.student_id,
    s.first_name || ' ' || s.last_name AS student_name,
    m.major_name,
    cs.semester,
    cs.year,
    c.course_code,
    c.course_name,
    c.credits,
    i.first_name || ' ' || i.last_name AS instructor_name,
    e.grade,
    e.status
FROM enrollments e
JOIN students s ON e.student_id = s.student_id
JOIN course_sections cs ON e.section_id = cs.section_id
JOIN courses c ON cs.course_id = c.course_id
JOIN instructors i ON cs.instructor_id = i.instructor_id
LEFT JOIN majors m ON s.major_id = m.major_id
WHERE e.status = 'enrolled';

-- Materialized view: Student GPA calculation
CREATE MATERIALIZED VIEW mv_student_gpa AS
SELECT 
    s.student_id,
    s.first_name || ' ' || s.last_name AS student_name,
    COUNT(*) AS courses_taken,
    SUM(c.credits) AS total_credits,
    AVG(
        CASE e.grade
            WHEN 'A' THEN 4.0
            WHEN 'A-' THEN 3.7
            WHEN 'B+' THEN 3.3
            WHEN 'B' THEN 3.0
            WHEN 'B-' THEN 2.7
            WHEN 'C+' THEN 2.3
            WHEN 'C' THEN 2.0
            WHEN 'C-' THEN 1.7
            WHEN 'D+' THEN 1.3
            WHEN 'D' THEN 1.0
            WHEN 'F' THEN 0.0
        END
    ) AS gpa
FROM students s
JOIN enrollments e ON s.student_id = e.student_id
JOIN course_sections cs ON e.section_id = cs.section_id
JOIN courses c ON cs.course_id = c.course_id
WHERE e.grade IS NOT NULL
GROUP BY s.student_id, student_name;

-- Refresh materialized view
REFRESH MATERIALIZED VIEW mv_student_gpa;
```

---

## Phase 9: Indexes & Performance Optimization
**Duration:** 3-4 weeks | **Level:** Advanced

### 📚 Topics to Cover

#### 9.1 Index Fundamentals
- [ ] What are indexes?
- [ ] B-tree indexes
- [ ] Hash indexes
- [ ] Bitmap indexes
- [ ] GiST and GIN indexes
- [ ] Covering indexes
- [ ] Index-only scans

#### 9.2 Creating Indexes
- [ ] CREATE INDEX syntax
- [ ] Single-column indexes
- [ ] Multi-column (composite) indexes
- [ ] Partial indexes
- [ ] Expression indexes
- [ ] Unique indexes
- [ ] Index naming conventions

#### 9.3 Query Optimization
- [ ] EXPLAIN and EXPLAIN ANALYZE
- [ ] Reading execution plans
- [ ] Sequential scans vs index scans
- [ ] Join algorithms (nested loop, hash, merge)
- [ ] Query rewriting techniques
- [ ] Avoiding functions on indexed columns
- [ ] Statistics and cardinality

#### 9.4 Performance Best Practices
- [ ] Appropriate data types
- [ ] Avoiding SELECT *
- [ ] Using LIMIT
- [ ] Batch operations
- [ ] Connection pooling
- [ ] Query result caching
- [ ] Partitioning strategies

#### 9.5 Database Maintenance
- [ ] VACUUM and ANALYZE
- [ ] REINDEX
- [ ] Monitoring table bloat
- [ ] Statistics updates
- [ ] Autovacuum tuning

### 🎯 Projects

#### Project 9.1: Performance Optimization Challenge
**Description:** Optimize slow queries in production-like database

**Setup: Create large dataset**
```sql
-- Create tables with millions of rows
CREATE TABLE large_orders (
    order_id SERIAL PRIMARY KEY,
    customer_id INT,
    order_date TIMESTAMP,
    total_amount DECIMAL(10, 2),
    status VARCHAR(20),
    region VARCHAR(50)
);

-- Generate 5 million orders
INSERT INTO large_orders (customer_id, order_date, total_amount, status, region)
SELECT 
    (random() * 100000)::INT,
    CURRENT_DATE - (random() * 1000)::INT,
    (random() * 1000 + 10)::DECIMAL(10, 2),
    (ARRAY['pending', 'shipped', 'delivered', 'cancelled'])[floor(random() * 4 + 1)],
    (ARRAY['North', 'South', 'East', 'West', 'Central'])[floor(random() * 5 + 1)]
FROM generate_series(1, 5000000);
```

**Slow Query (No Index):**
```sql
-- This will be slow
EXPLAIN ANALYZE
SELECT customer_id, SUM(total_amount) AS total_spent
FROM large_orders
WHERE order_date >= '2024-01-01'
AND status = 'delivered'
GROUP BY customer_id
HAVING SUM(total_amount) > 1000
ORDER BY total_spent DESC
LIMIT 100;
```

**Optimization Steps:**
```sql
-- Step 1: Add indexes
CREATE INDEX idx_orders_date_status ON large_orders(order_date, status);
CREATE INDEX idx_orders_customer ON large_orders(customer_id);

-- Step 2: Rewrite query if needed
-- Check execution plan
EXPLAIN ANALYZE
SELECT customer_id, SUM(total_amount) AS total_spent
FROM large_orders
WHERE order_date >= '2024-01-01'
AND status = 'delivered'
GROUP BY customer_id
HAVING SUM(total_amount) > 1000
ORDER BY total_spent DESC
LIMIT 100;

-- Step 3: Create covering index
CREATE INDEX idx_orders_covering ON large_orders(order_date, status, customer_id, total_amount);

-- Step 4: Update statistics
ANALYZE large_orders;
```

**Comparison Report:**
```sql
-- Before optimization: ~5000ms
-- After index: ~200ms
-- Performance improvement: 25x faster
```

#### Project 9.2: Index Strategy Document
**Description:** Design indexing strategy for existing database

**Analysis Queries:**
```sql
-- Find missing indexes
SELECT 
    schemaname,
    tablename,
    attname,
    n_distinct,
    correlation
FROM pg_stats
WHERE schemaname = 'public'
ORDER BY abs(correlation) DESC;

-- Identify slow queries
SELECT 
    query,
    calls,
    total_time,
    mean_time,
    min_time,
    max_time
FROM pg_stat_statements
ORDER BY mean_time DESC
LIMIT 20;

-- Check index usage
SELECT 
    schemaname,
    tablename,
    indexname,
    idx_scan,
    idx_tup_read,
    idx_tup_fetch
FROM pg_stat_user_indexes
WHERE idx_scan = 0
ORDER BY pg_relation_size(indexrelid) DESC;

-- Unused indexes (consider dropping)
SELECT 
    schemaname,
    tablename,
    indexname,
    pg_size_pretty(pg_relation_size(indexrelid)) AS index_size
FROM pg_stat_user_indexes
WHERE idx_scan < 10
AND indexrelname NOT LIKE '%_pkey'
ORDER BY pg_relation_size(indexrelid) DESC;
```

#### Project 9.3: Query Tuning Workshop
**Description:** Transform slow queries into fast ones

**Exercise 1: JOIN optimization**
```sql
-- Slow: Multiple subqueries
SELECT 
    c.customer_id,
    c.first_name,
    (SELECT COUNT(*) FROM orders WHERE customer_id = c.customer_id) AS order_count,
    (SELECT SUM(total_amount) FROM orders WHERE customer_id = c.customer_id) AS total_spent
FROM customers c
WHERE c.registration_date >= '2024-01-01';

-- Fast: Single JOIN with aggregation
SELECT 
    c.customer_id,
    c.first_name,
    COUNT(o.order_id) AS order_count,
    COALESCE(SUM(o.total_amount), 0) AS total_spent
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
WHERE c.registration_date >= '2024-01-01'
GROUP BY c.customer_id, c.first_name;
```

**Exercise 2: Avoid functions on indexed columns**
```sql
-- Slow: Function prevents index usage
SELECT * FROM orders
WHERE EXTRACT(YEAR FROM order_date) = 2024;

-- Fast: Index-friendly
SELECT * FROM orders
WHERE order_date >= '2024-01-01'
AND order_date < '2025-01-01';
```

---

## Phase 10: Transactions & Concurrency
**Duration:** 2-3 weeks | **Level:** Advanced

### 📚 Topics to Cover

#### 10.1 Transaction Basics
- [ ] BEGIN, COMMIT, ROLLBACK
- [ ] ACID properties
- [ ] Savepoints
- [ ] Transaction isolation levels
- [ ] Autocommit mode

#### 10.2 Isolation Levels
- [ ] READ UNCOMMITTED
- [ ] READ COMMITTED
- [ ] REPEATABLE READ
- [ ] SERIALIZABLE
- [ ] Choosing isolation level

#### 10.3 Concurrency Issues
- [ ] Dirty reads
- [ ] Non-repeatable reads
- [ ] Phantom reads
- [ ] Lost updates
- [ ] Deadlocks

#### 10.4 Locking
- [ ] Row-level locks
- [ ] Table-level locks
- [ ] Lock types (shared, exclusive)
- [ ] SELECT FOR UPDATE
- [ ] NOWAIT and SKIP LOCKED
- [ ] Lock monitoring

### 🎯 Projects

#### Project 10.1: Banking Transaction System
**Description:** Implement safe money transfers

```sql
-- Create accounts table
CREATE TABLE accounts (
    account_id SERIAL PRIMARY KEY,
    account_number VARCHAR(20) UNIQUE,
    customer_name VARCHAR(100),
    balance DECIMAL(12, 2) CHECK (balance >= 0),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create transactions log
CREATE TABLE transactions (
    transaction_id SERIAL PRIMARY KEY,
    from_account_id INT REFERENCES accounts(account_id),
    to_account_id INT REFERENCES accounts(account_id),
    amount DECIMAL(12, 2) CHECK (amount > 0),
    transaction_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status VARCHAR(20),
    description TEXT
);

-- Safe money transfer function
CREATE OR REPLACE FUNCTION transfer_money(
    p_from_account INT,
    p_to_account INT,
    p_amount DECIMAL
)
RETURNS BOOLEAN AS $$
DECLARE
    v_from_balance DECIMAL;
BEGIN
    -- Start transaction (implicit in function)
    
    -- Lock the from_account row to prevent concurrent modifications
    SELECT balance INTO v_from_balance
    FROM accounts
    WHERE account_id = p_from_account
    FOR UPDATE;
    
    -- Check sufficient funds
    IF v_from_balance < p_amount THEN
        RAISE EXCEPTION 'Insufficient funds';
        RETURN FALSE;
    END IF;
    
    -- Deduct from source account
    UPDATE accounts
    SET balance = balance - p_amount
    WHERE account_id = p_from_account;
    
    -- Add to destination account
    UPDATE accounts
    SET balance = balance + p_amount
    WHERE account_id = p_to_account;
    
    -- Log transaction
    INSERT INTO transactions (from_account_id, to_account_id, amount, status)
    VALUES (p_from_account, p_to_account, p_amount, 'completed');
    
    RETURN TRUE;
END;
$$ LANGUAGE plpgsql;

-- Test transfer
BEGIN;
SELECT transfer_money(1, 2, 100.00);
COMMIT;
```

#### Project 10.2: Inventory Management with Locking
**Description:** Handle concurrent product reservations

```sql
-- Reserve product with proper locking
CREATE OR REPLACE FUNCTION reserve_product(
    p_product_id INT,
    p_quantity INT,
    p_customer_id INT
)
RETURNS BOOLEAN AS $$
DECLARE
    v_available INT;
BEGIN
    -- Lock the product row
    SELECT stock INTO v_available
    FROM products
    WHERE product_id = p_product_id
    FOR UPDATE NOWAIT;  -- Fail immediately if locked
    
    IF v_available < p_quantity THEN
        RAISE EXCEPTION 'Insufficient stock. Available: %', v_available;
    END IF;
    
    -- Reserve stock
    UPDATE products
    SET stock = stock - p_quantity,
        reserved_stock = reserved_stock + p_quantity
    WHERE product_id = p_product_id;
    
    -- Create reservation record
    INSERT INTO reservations (product_id, customer_id, quantity, expires_at)
    VALUES (p_product_id, p_customer_id, p_quantity, CURRENT_TIMESTAMP + INTERVAL '15 minutes');
    
    RETURN TRUE;
    
EXCEPTION
    WHEN lock_not_available THEN
        RAISE NOTICE 'Product is currently locked by another transaction';
        RETURN FALSE;
END;
$$ LANGUAGE plpgsql;
```

---

## Phase 11: Data Warehousing Concepts
**Duration:** 4-5 weeks | **Level:** Advanced

### 📚 Topics to Cover

#### 11.1 Data Warehouse Architecture
- [ ] OLTP vs OLAP
- [ ] Data warehouse vs data lake
- [ ] ETL vs ELT
- [ ] Staging area
- [ ] Data marts

#### 11.2 Dimensional Modeling
- [ ] Star schema design
- [ ] Snowflake schema
- [ ] Fact tables (additive, semi-additive, non-additive)
- [ ] Dimension tables
- [ ] Conformed dimensions
- [ ] Junk dimensions
- [ ] Degenerate dimensions

#### 11.3 Slowly Changing Dimensions
- [ ] SCD Type 0 (retain original)
- [ ] SCD Type 1 (overwrite)
- [ ] SCD Type 2 (add new row)
- [ ] SCD Type 3 (add new column)
- [ ] SCD Type 4 (history table)
- [ ] SCD Type 6 (hybrid)

#### 11.4 Fact Table Patterns
- [ ] Transaction fact tables
- [ ] Periodic snapshot fact tables
- [ ] Accumulating snapshot fact tables
- [ ] Factless fact tables

#### 11.5 Aggregates & Summaries
- [ ] Pre-aggregated tables
- [ ] Aggregate navigation
- [ ] Rollup tables
- [ ] Summary tables

### 🎯 Projects

#### Project 11.1: Complete Data Warehouse (Covered in Phase 8.1)

#### Project 11.2: ETL Process Implementation
**Description:** Build ETL process for data warehouse

```sql
-- Staging tables (temporary landing zone)
CREATE TABLE stg_sales (
    transaction_id VARCHAR(50),
    transaction_date VARCHAR(20),
    customer_id VARCHAR(20),
    product_id VARCHAR(20),
    quantity VARCHAR(10),
    amount VARCHAR(20),
    load_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- ETL Process

-- Step 1: Extract (Load data into staging)
COPY stg_sales (transaction_id, transaction_date, customer_id, product_id, quantity, amount)
FROM '/path/to/sales_data.csv'
WITH (FORMAT CSV, HEADER);

-- Step 2: Transform and Load into dimensions

-- Load dim_date
INSERT INTO dim_date (date_key, full_date, day_of_week, day_name, month, year)
SELECT DISTINCT
    TO_CHAR(TO_DATE(transaction_date, 'YYYY-MM-DD'), 'YYYYMMDD')::INT,
    TO_DATE(transaction_date, 'YYYY-MM-DD'),
    EXTRACT(DOW FROM TO_DATE(transaction_date, 'YYYY-MM-DD')),
    TO_CHAR(TO_DATE(transaction_date, 'YYYY-MM-DD'), 'Day'),
    EXTRACT(MONTH FROM TO_DATE(transaction_date, 'YYYY-MM-DD')),
    EXTRACT(YEAR FROM TO_DATE(transaction_date, 'YYYY-MM-DD'))
FROM stg_sales
WHERE NOT EXISTS (
    SELECT 1 FROM dim_date 
    WHERE date_key = TO_CHAR(TO_DATE(stg_sales.transaction_date, 'YYYY-MM-DD'), 'YYYYMMDD')::INT
);

-- Load fact_sales
INSERT INTO fact_sales (date_key, product_key, customer_key, quantity, total_amount)
SELECT 
    TO_CHAR(TO_DATE(s.transaction_date, 'YYYY-MM-DD'), 'YYYYMMDD')::INT,
    dp.product_key,
    dc.customer_key,
    s.quantity::INT,
    s.amount::DECIMAL(10, 2)
FROM stg_sales s
JOIN dim_product dp ON s.product_id = dp.product_id AND dp.is_current = TRUE
JOIN dim_customer dc ON s.customer_id = dc.customer_id AND dc.is_current = TRUE;

-- Step 3: Data quality checks
SELECT 
    COUNT(*) AS total_rows,
    COUNT(*) FILTER (WHERE transaction_id IS NULL) AS null_transaction_ids,
    COUNT(*) FILTER (WHERE quantity::INT < 0) AS negative_quantities,
    COUNT(*) FILTER (WHERE amount::DECIMAL < 0) AS negative_amounts
FROM stg_sales;

-- Step 4: Clean staging table
TRUNCATE TABLE stg_sales;
```

#### Project 11.3: Aggregation Tables
**Description:** Create and maintain aggregate tables

```sql
-- Daily sales aggregates
CREATE TABLE agg_daily_sales (
    date_key INT,
    product_category VARCHAR(50),
    region VARCHAR(50),
    total_quantity INT,
    total_revenue DECIMAL(12, 2),
    total_cost DECIMAL(12, 2),
    total_profit DECIMAL(12, 2),
    order_count INT,
    customer_count INT,
    PRIMARY KEY (date_key, product_category, region)
);

-- Populate aggregates
INSERT INTO agg_daily_sales
SELECT 
    dd.date_key,
    dp.category,
    dst.region,
    SUM(fs.quantity) AS total_quantity,
    SUM(fs.total_amount) AS total_revenue,
    SUM(fs.cost_amount) AS total_cost,
    SUM(fs.profit_amount) AS total_profit,
    COUNT(DISTINCT fs.sales_key) AS order_count,
    COUNT(DISTINCT fs.customer_key) AS customer_count
FROM fact_sales fs
JOIN dim_date dd ON fs.date_key = dd.date_key
JOIN dim_product dp ON fs.product_key = dp.product_key
JOIN dim_store dst ON fs.store_key = dst.store_key
GROUP BY dd.date_key, dp.category, dst.region;

-- Incremental update (add new day's data)
CREATE OR REPLACE FUNCTION update_daily_aggregates(p_date DATE)
RETURNS VOID AS $$
BEGIN
    DELETE FROM agg_daily_sales 
    WHERE date_key = TO_CHAR(p_date, 'YYYYMMDD')::INT;
    
    INSERT INTO agg_daily_sales
    SELECT 
        dd.date_key,
        dp.category,
        dst.region,
        SUM(fs.quantity),
        SUM(fs.total_amount),
        SUM(fs.cost_amount),
        SUM(fs.profit_amount),
        COUNT(DISTINCT fs.sales_key),
        COUNT(DISTINCT fs.customer_key)
    FROM fact_sales fs
    JOIN dim_date dd ON fs.date_key = dd.date_key
    JOIN dim_product dp ON fs.product_key = dp.product_key
    JOIN dim_store dst ON fs.store_key = dst.store_key
    WHERE dd.full_date = p_date
    GROUP BY dd.date_key, dp.category, dst.region;
END;
$$ LANGUAGE plpgsql;
```

---

## Phase 12: Advanced Analytics with SQL
**Duration:** 3-4 weeks | **Level:** Expert

### 📚 Topics to Cover

#### 12.1 Statistical Functions
- [ ] STDDEV(), VARIANCE()
- [ ] CORR() (correlation)
- [ ] REGR_* functions (regression)
- [ ] Percentile functions
- [ ] Mode and median

#### 12.2 Advanced Analytical Queries
- [ ] Cohort analysis
- [ ] Funnel analysis
- [ ] Retention analysis
- [ ] Churn analysis
- [ ] RFM analysis
- [ ] Time series analysis

#### 12.3 Pivoting Data
- [ ] PIVOT (SQL Server)
- [ ] crosstab() (PostgreSQL)
- [ ] CASE-based pivoting
- [ ] Dynamic pivoting

#### 12.4 Text Analytics
- [ ] String aggregation
- [ ] Pattern matching
- [ ] Text similarity
- [ ] N-gram analysis

### 🎯 Projects

#### Project 12.1: Customer Analytics Suite
**Description:** Comprehensive customer behavior analysis

**1. Cohort Retention Analysis:**
```sql
WITH cohorts AS (
    -- Assign each customer to their first purchase month
    SELECT 
        customer_id,
        DATE_TRUNC('month', MIN(order_date)) AS cohort_month
    FROM orders
    GROUP BY customer_id
),
cohort_activity AS (
    -- Track activity by cohort and month
    SELECT 
        c.cohort_month,
        DATE_TRUNC('month', o.order_date) AS activity_month,
        COUNT(DISTINCT o.customer_id) AS active_customers
    FROM cohorts c
    JOIN orders o ON c.customer_id = o.customer_id
    GROUP BY c.cohort_month, DATE_TRUNC('month', o.order_date)
),
cohort_sizes AS (
    -- Get initial cohort size
    SELECT 
        cohort_month,
        COUNT(DISTINCT customer_id) AS cohort_size
    FROM cohorts
    GROUP BY cohort_month
)
SELECT 
    ca.cohort_month,
    ca.activity_month,
    ca.active_customers,
    cs.cohort_size,
    ROUND(100.0 * ca.active_customers / cs.cohort_size, 2) AS retention_rate,
    EXTRACT(MONTH FROM AGE(ca.activity_month, ca.cohort_month)) AS months_since_cohort
FROM cohort_activity ca
JOIN cohort_sizes cs ON ca.cohort_month = cs.cohort_month
ORDER BY ca.cohort_month, ca.activity_month;
```

**2. RFM (Recency, Frequency, Monetary) Segmentation:**
```sql
WITH rfm_calc AS (
    SELECT 
        customer_id,
        CURRENT_DATE - MAX(order_date) AS recency,
        COUNT(*) AS frequency,
        SUM(total_amount) AS monetary
    FROM orders
    WHERE order_date >= CURRENT_DATE - INTERVAL '1 year'
    GROUP BY customer_id
),
rfm_scores AS (
    SELECT 
        customer_id,
        recency,
        frequency,
        monetary,
        NTILE(5) OVER (ORDER BY recency DESC) AS r_score,
        NTILE(5) OVER (ORDER BY frequency) AS f_score,
        NTILE(5) OVER (ORDER BY monetary) AS m_score
    FROM rfm_calc
)
SELECT 
    customer_id,
    recency,
    frequency,
    monetary,
    r_score,
    f_score,
    m_score,
    CONCAT(r_score, f_score, m_score) AS rfm_segment,
    CASE 
        WHEN r_score >= 4 AND f_score >= 4 AND m_score >= 4 THEN 'Champions'
        WHEN r_score >= 3 AND f_score >= 3 THEN 'Loyal Customers'
        WHEN r_score >= 4 AND f_score <= 2 THEN 'New Customers'
        WHEN r_score >= 3 AND m_score >= 4 THEN 'Big Spenders'
        WHEN r_score <= 2 AND f_score >= 3 THEN 'At Risk'
        WHEN r_score <= 2 AND f_score <= 2 THEN 'Lost'
        ELSE 'Other'
    END AS customer_segment
FROM rfm_scores
ORDER BY monetary DESC;
```

**3. Purchase Funnel Analysis:**
```sql
WITH funnel_steps AS (
    SELECT 'Product View' AS step, 1 AS step_order, COUNT(DISTINCT user_id) AS users
    FROM page_views WHERE page_type = 'product'
    
    UNION ALL
    
    SELECT 'Add to Cart', 2, COUNT(DISTINCT user_id)
    FROM cart_events WHERE action = 'add'
    
    UNION ALL
    
    SELECT 'Checkout Started', 3, COUNT(DISTINCT user_id)
    FROM checkout_events WHERE step = 'start'
    
    UNION ALL
    
    SELECT 'Payment Info Entered', 4, COUNT(DISTINCT user_id)
    FROM checkout_events WHERE step = 'payment'
    
    UNION ALL
    
    SELECT 'Purchase Completed', 5, COUNT(DISTINCT order_id)
    FROM orders
)
SELECT 
    step,
    users,
    LAG(users) OVER (ORDER BY step_order) AS previous_step_users,
    ROUND(100.0 * users / FIRST_VALUE(users) OVER (ORDER BY step_order), 2) AS overall_conversion_rate,
    ROUND(100.0 * users / LAG(users) OVER (ORDER BY step_order), 2) AS step_conversion_rate,
    ROUND(100.0 * (LAG(users) OVER (ORDER BY step_order) - users) / LAG(users) OVER (ORDER BY step_order), 2) AS drop_off_rate
FROM funnel_steps
ORDER BY step_order;
```

#### Project 12.2: Time Series Analysis
**Description:** Trend analysis and forecasting prep

```sql
-- Moving averages and trends
WITH daily_metrics AS (
    SELECT 
        DATE(order_date) AS date,
        COUNT(*) AS orders,
        SUM(total_amount) AS revenue
    FROM orders
    GROUP BY DATE(order_date)
)
SELECT 
    date,
    orders,
    revenue,
    AVG(revenue) OVER (
        ORDER BY date 
        ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
    ) AS moving_avg_7day,
    AVG(revenue) OVER (
        ORDER BY date 
        ROWS BETWEEN 29 PRECEDING AND CURRENT ROW
    ) AS moving_avg_30day,
    revenue - LAG(revenue, 7) OVER (ORDER BY date) AS week_over_week_change,
    ROUND(
        100.0 * (revenue - LAG(revenue, 7) OVER (ORDER BY date)) / 
        LAG(revenue, 7) OVER (ORDER BY date), 2
    ) AS week_over_week_pct
FROM daily_metrics
ORDER BY date DESC;
```

---

## Phase 13: Database Administration Basics
**Duration:** 2-3 weeks | **Level:** Advanced

### 📚 Topics to Cover

#### 13.1 User Management
- [ ] CREATE USER / CREATE ROLE
- [ ] GRANT and REVOKE
- [ ] Role hierarchies
- [ ] Password policies
- [ ] Row-level security (RLS)

#### 13.2 Backup & Recovery
- [ ] pg_dump / pg_dumpall
- [ ] pg_restore
- [ ] Point-in-time recovery (PITR)
- [ ] WAL archiving
- [ ] Backup strategies

#### 13.3 Monitoring
- [ ] System catalog views
- [ ] pg_stat_* views
- [ ] Slow query log
- [ ] Lock monitoring
- [ ] Disk space monitoring

#### 13.4 Partitioning
- [ ] Range partitioning
- [ ] List partitioning
- [ ] Hash partitioning
- [ ] Partition pruning
- [ ] Partition management

### 🎯 Projects

#### Project 13.1: Database Security Audit
**Description:** Implement security best practices

```sql
-- Create roles with specific privileges
CREATE ROLE analyst_role;
CREATE ROLE developer_role;
CREATE ROLE admin_role;

-- Grant SELECT only to analysts
GRANT SELECT ON ALL TABLES IN SCHEMA public TO analyst_role;

-- Grant more privileges to developers
GRANT SELECT, INSERT, UPDATE ON ALL TABLES IN SCHEMA public TO developer_role;

-- Full access to admins
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO admin_role;

-- Create users and assign roles
CREATE USER john_analyst WITH PASSWORD 'secure_password';
GRANT analyst_role TO john_analyst;

-- Row-level security
ALTER TABLE orders ENABLE ROW LEVEL SECURITY;

CREATE POLICY orders_policy ON orders
    FOR SELECT
    TO analyst_role
    USING (customer_id = current_setting('app.current_user_id')::INT);
```

#### Project 13.2: Automated Monitoring Dashboard
**Description:** SQL queries for monitoring

```sql
-- Table sizes
SELECT 
    schemaname,
    tablename,
    pg_size_pretty(pg_total_relation_size(schemaname||'.'||tablename)) AS total_size,
    pg_size_pretty(pg_relation_size(schemaname||'.'||tablename)) AS table_size,
    pg_size_pretty(pg_total_relation_size(schemaname||'.'||tablename) - 
                   pg_relation_size(schemaname||'.'||tablename)) AS indexes_size
FROM pg_tables
WHERE schemaname = 'public'
ORDER BY pg_total_relation_size(schemaname||'.'||tablename) DESC;

-- Active connections
SELECT 
    datname,
    count(*) AS connections,
    max(age(clock_timestamp(), query_start)) AS oldest_query_age
FROM pg_stat_activity
GROUP BY datname;

-- Long-running queries
SELECT 
    pid,
    now() - query_start AS duration,
    state,
    query
FROM pg_stat_activity
WHERE state != 'idle'
AND now() - query_start > interval '5 minutes'
ORDER BY duration DESC;

-- Cache hit ratio
SELECT 
    'cache hit rate' AS metric,
    sum(heap_blks_hit) / (sum(heap_blks_hit) + sum(heap_blks_read)) AS ratio
FROM pg_statio_user_tables;
```

---

## Phase 14: Cloud Databases & Modern SQL
**Duration:** 3-4 weeks | **Level:** Expert

### 📚 Topics to Cover

#### 14.1 Cloud Databases
- [ ] Amazon RDS
- [ ] Amazon Redshift
- [ ] Google BigQuery
- [ ] Azure SQL Database
- [ ] Snowflake
- [ ] Cloud-specific features

#### 14.2 BigQuery (Google)
- [ ] BigQuery syntax differences
- [ ] Partitioned tables
- [ ] Clustered tables
- [ ] Nested and repeated fields
- [ ] BigQuery ML

#### 14.3 Snowflake
- [ ] Snowflake architecture
- [ ] Zero-copy cloning
- [ ] Time travel
- [ ] Snowflake-specific SQL
- [ ] Data sharing

#### 14.4 Modern SQL Patterns
- [ ] SQL in data pipelines
- [ ] SQL for ML feature engineering
- [ ] SQL with APIs
- [ ] SQL notebooks (Databricks, Hex)

### 🎯 Projects

#### Project 14.1: BigQuery Analytics
**Description:** Large-scale analytics on BigQuery

```sql
-- Use BigQuery public datasets
-- Analyze Wikipedia pageviews

SELECT 
    DATE(datehour) AS date,
    title,
    SUM(views) AS total_views
FROM `bigquery-public-data.wikipedia.pageviews_*`
WHERE _TABLE_SUFFIX BETWEEN '202401' AND '202412'
AND wiki = 'en'
GROUP BY date, title
HAVING total_views > 1000000
ORDER BY total_views DESC
LIMIT 100;

-- Partitioned table example
CREATE TABLE dataset.partitioned_sales
PARTITION BY DATE(order_date)
CLUSTER BY customer_id, product_id
AS
SELECT * FROM dataset.sales;
```

#### Project 14.2: Snowflake Data Pipeline
**Description:** Build data pipeline in Snowflake

```sql
-- Create transient table (lower cost)
CREATE TRANSIENT TABLE staging_sales (
    sale_id NUMBER,
    sale_date TIMESTAMP,
    customer_id NUMBER,
    amount NUMBER(10, 2)
);

-- Load from S3
COPY INTO staging_sales
FROM 's3://bucket/sales/'
FILE_FORMAT = (TYPE = CSV FIELD_OPTIONALLY_ENCLOSED_BY = '"')
ON_ERROR = 'CONTINUE';

-- Use time travel
SELECT * FROM sales AT(TIMESTAMP => '2024-01-01 00:00:00'::TIMESTAMP);

-- Zero-copy clone
CREATE TABLE sales_dev CLONE sales;
```

---

## 📊 Progress Tracking Template

### Weekly Review Checklist

```markdown
## Week: [Week Number]

### Topics Covered
- [ ] Topic 1
- [ ] Topic 2
- [ ] Topic 3

### SQL Challenges Completed
- [ ] LeetCode: [Problem Name]
- [ ] HackerRank: [Problem Name]
- [ ] Custom challenge: [Description]

### Projects
- [ ] Project Name:
  - Status: ✅ Complete / 🔄 In Progress / ⏸️ Paused
  - Key Learnings:
  - GitHub Repo: [link]

### Skills Acquired
- Technical:
  - Skill 1
  - Skill 2
- Concepts Mastered:
  - Concept 1

### Challenges Faced
1. Challenge:
   - Solution:

### Next Week Goals
- [ ] Goal 1
- [ ] Goal 2

### Practice Statistics
- Queries Written: X
- Tables Created: X
- Lines of SQL: X
- Execution Time Improved: X%
```

---

## 🎯 Learning Resources

### 📚 Recommended Books
1. **SQL Performance Explained** - Markus Winand
2. **The Data Warehouse Toolkit** - Ralph Kimball
3. **SQL Antipatterns** - Bill Karwin
4. **PostgreSQL: Up and Running** - Regina Obe & Leo Hsu
5. **High Performance MySQL** - Schwartz, Zaitsev, Tkachenko

### 🎓 Online Platforms
1. **Mode Analytics SQL Tutorial** - Free, excellent for analytics
2. **LeetCode Database** - SQL coding challenges
3. **HackerRank SQL** - Practice problems
4. **SQLZoo** - Interactive SQL tutorial
5. **PostgreSQL Tutorial** - PostgreSQLTutorial.com

### 🌐 Practice Platforms
- **LeetCode** - Database section (200+ problems)
- **HackerRank** - SQL domain
- **DataLemur** - SQL interview questions
- **SQLPad** - Online SQL playground
- **DB Fiddle** - Test queries online

### 🔧 Tools
- **DBeaver** - Universal database tool
- **pgAdmin** - PostgreSQL management
- **DataGrip** - JetBrains SQL IDE
- **TablePlus** - Modern database client

---

## ✅ Completion Criteria

### Beginner Level ✅
- [ ] Complete Phase 1-4
- [ ] Write 100+ queries
- [ ] Understand JOINs and aggregations
- [ ] Create basic database schemas

### Intermediate Level ✅
- [ ] Complete Phase 5-8
- [ ] Master subqueries and CTEs
- [ ] Design normalized databases
- [ ] Optimize query performance

### Advanced Level ✅
- [ ] Complete Phase 9-12
- [ ] Build data warehouses
- [ ] Implement complex analytics
- [ ] Tune for performance

### Expert Level ✅
- [ ] Complete Phase 13-14
- [ ] Work with cloud databases
- [ ] Mentor others in SQL
- [ ] Contribute to SQL community

---

## 🚀 Next Steps After Completion

1. **Certifications**:
   - Microsoft SQL Server Certification
   - PostgreSQL Certification
   - AWS Database Specialty
   - Google Cloud Professional Data Engineer

2. **Advanced Topics**:
   - Graph databases (Neo4j, Cypher)
   - NoSQL databases
   - Distributed SQL (CockroachDB, YugabyteDB)
   - Time-series databases

3. **Specializations**:
   - Data warehouse architect
   - Database administrator
   - Analytics engineer
   - Data platform engineer

---

## 📝 Notes

- **Practice daily**: 30 minutes minimum
- **Write SQL by hand**: Don't just copy-paste
- **Understand execution**: Use EXPLAIN ANALYZE
- **Read documentation**: Official docs are best
- **Join communities**: Stack Overflow, Reddit
- **Build portfolio**: GitHub with well-documented projects

---

**Created by:** Claude AI  
**For:** Ritik Kumar - SQL Mastery Journey  
**Last Updated:** January 2026  
**Version:** 1.0

**Happy Querying! 🗄️**
