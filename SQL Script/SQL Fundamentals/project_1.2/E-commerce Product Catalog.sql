/*=====================================================================================
Project 1.2: E-commerce Product Catalog
Description: Build a product database

Tables:

products (product_id, name, description, price, stock_quantity, category)
categories (category_id, category_name, description)
suppliers (supplier_id, name, contact, country)
Queries to Write:

All products under $50
      show all table data
      Products sorted by price (highest to lowest)
      Top 10 most expensive products
      Products with stock less than 10 units

Author : Ritik__
=======================================================================================*/
-- SWITCH DATABASE TO MASTER 
USE master ;
GO 
  
-- SAFTY CHECK 
IF DB_NAME() NOT IN ('master') 
BEGIN
    RISERROR('Run these script for master only' ,16,1) ;
    RETUNR ;
END ;
GO 

  -- CREATING DATABASE PRODUCT
  
IF NOT EXISTS(SELECT 1 FROM sys.database WHERE name = 'product')
BEGIN 
    CREATE DATABASE product ;
END ;
GO 

-- CREATING CATEGORIES TABLE
CREATE TABLE categories (
    category_id INT IDENTITY(1,1) PRIMARY KEY,
    category_name NVARCHAR(100) NOT NULL,
    description NVARCHAR(255) NULL,
    
    CONSTRAINT UQ_categories_category_name UNIQUE (category_name)
);

-- CREATING SUPPLIER TABLE
CREATE TABLE suppliers (
    supplier_id INT IDENTITY(1,1) PRIMARY KEY,
    name NVARCHAR(150) NOT NULL,
    contact NVARCHAR(150) NULL,
    country NVARCHAR(100) NOT NULL,

    CONSTRAINT UQ_suppliers_name UNIQUE (name)
);


-- CREATING PRODUCTS TABLE 
CREATE TABLE products (
    product_id INT IDENTITY(1,1) PRIMARY KEY,
    name NVARCHAR(150) NOT NULL,
    description NVARCHAR(500) NULL,
    price DECIMAL(10,2) NOT NULL CHECK (price >= 0),
    stock_quantity INT NOT NULL CHECK (stock_quantity >= 0),
    category_id INT NOT NULL,

    CONSTRAINT FK_products_category
        FOREIGN KEY (category_id)
        REFERENCES categories(category_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

--categories data
INSERT INTO categories (category_name, description) VALUES
    ('Electronics', 'Electronic gadgets and devices'),
    ('Clothing', 'Apparel and garments'),
    ('Books', 'Educational and entertainment books'),
    ('Home Appliances', 'Appliances for household use'),
    ('Sports', 'Sports and fitness equipment');

--suppliers
INSERT INTO suppliers (name, contact, country) VALUES
    ('TechSource Ltd', 'techsource@email.com', 'USA'),
    ('FashionHub', 'fashionhub@email.com', 'India'),
    ('BookWorld Distributors', 'books@email.com', 'UK'),
    ('HomeNeeds Corp', 'homeneeds@email.com', 'Germany'),
    ('Sportify Global', 'sportify@email.com', 'China');

-- products 
INSERT INTO products (name, description, price, stock_quantity, category_id) VALUES
    ('Smartphone X', 'Latest 5G smartphone', 699.99, 50, 1),
    ('Men T-Shirt', 'Cotton round neck T-shirt', 19.99, 200, 2),
    ('Data Engineering Book', 'Advanced SQL and Data Pipeline concepts', 49.50, 75, 3),
    ('Microwave Oven', '800W kitchen microwave', 120.00, 30, 4),
    ('Cricket Bat', 'Professional grade wooden bat', 85.75, 60, 5);


--show all table data
SELECT * FROM products ;
SELECT * FROM categories ;
SELECT * FROM suppliers ;

--All products under $50
SELECT 
      name ,
      description ,
      price 
FROM products 
WHERE price > 50 ; 

--Products sorted by price (highest to lowest)
SELECT 
      name, 
      description, 
      price, 
      stock_quantity, 
      category_id
FROM product 
ORDER BY price DESC ; 

--Top 10 most expensive products
SELECT TOP 10
      name, 
      description, 
      price, 
      stock_quantity, 
      category_id
FROM product 
ORDER BY price DESC ; 

--Products with stock less than 10 units
SELECT 
      name ,
      description ,
      price ,
      stock_quantity
FROM products 
WHERE stock_quantity > 10 ; 
