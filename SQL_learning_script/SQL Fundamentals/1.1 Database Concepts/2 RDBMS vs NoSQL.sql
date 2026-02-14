/*
--========================================================================================================================
RDBMS vs  NoSQL
--========================================================================================================================
### RDBMS

RDBMS (Relational Database Management System) stores data in structured tables (rows and columns) with a fixed schema and strong 
relationships between tables. It ensures high data accuracy and consistency using SQL and ACID transactions.

### NoSQL

NoSQL databases store data in flexible formats (documents, key-value, graph, column-based) with schema-less design,
optimized for high scalability and performance rather than strict structure.
--========================================================================================================================

##  Core Idea (1 line)

* **RDBMS** → Structured, rule-based, table-centric
* **NoSQL** → Flexible, schema-less, scale-centric

--========================================================================================================================
### RDBMS = **Bank Locker System**

* Fixed lockers
* Strict rules
* Everything must follow a format
* Accuracy is critical

### NoSQL = **Warehouse Storage**

* Any box size
* Flexible placement
* Fast expansion
* Speed > strict structure
--========================================================================================================================

##  RDBMS vs NoSQL (Side-by-Side)

| Feature        | **RDBMS**                 | **NoSQL**                    |
| -------------- | ------------------------- | ---------------------------- |
| Data Structure | Tables (rows & columns)   | Documents, Key-Value, Graph  |
| Schema         | Fixed schema              | Flexible / schema-less       |
| Query Language | SQL                       | No standard (varies)         |
| Relationships  | Strong (JOINs)            | Weak or handled in app       |
| Transactions   | Strong (ACID)             | Usually eventual consistency |
| Scaling        | Vertical (bigger machine) | Horizontal (more machines)   |
| Data Integrity | Very high                 | Medium                       |
| Performance    | Stable & predictable      | High for large-scale         |
| Learning Curve | Easier conceptually       | Depends on model             |

--========================================================================================================================

##  Examples of Databases

### RDBMS (SQL)

* MySQL
* PostgreSQL
* SQL Server
* Oracle
--========================================================================================================================
### NoSQL

* MongoDB (Document)
* Redis (Key-Value)
* Cassandra (Wide-column)
* Neo4j (Graph)
--========================================================================================================================
*/
