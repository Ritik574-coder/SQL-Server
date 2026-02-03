/*
================================================================================
100 JOIN PRACTICE QUESTIONS - ADVENTUREWORKS DATABASE
================================================================================

INSTRUCTIONS:
- Work through these questions IN ORDER (they progress from basic to advanced)
- Uncomment each question and write your solution below it
- Test your query and verify the results make sense
- Move to the next question only after completing the current one

DATABASES USED:
- AdventureWorks2022
- AdventureWorksLT2022
- AdventureWorksDW2022

TIP: Use Ctrl+K, Ctrl+U to uncomment a block
     Use Ctrl+K, Ctrl+C to comment a block

Good luck! 🚀
================================================================================
*/

-- ============================================================================
-- LEVEL 1: BASIC INNER JOINS (Questions 1-20)
-- Master the fundamentals of joining two tables
-- ============================================================================

/*
QUESTION 1: List all products along with their subcategory names
Database: AdventureWorks2022
Tables: Production.Product, Production.ProductSubcategory
Join Column: ProductSubcategoryID
*/

USE AdventureWorks2022;
GO

-- Write your query here:



GO

/*
QUESTION 2: Display all employees with their job titles
Database: AdventureWorks2022
Tables: HumanResources.Employee, Person.Person
Join Column: BusinessEntityID
*/

-- Write your query here:



GO

/*
QUESTION 3: Show all sales orders with customer names
Database: AdventureWorksLT2022
Tables: SalesLT.SalesOrderHeader, SalesLT.Customer
Join Column: CustomerID
*/

USE AdventureWorksLT2022;
GO

-- Write your query here:



GO

/*
QUESTION 4: List all products with their product model names
Database: AdventureWorks2022
Tables: Production.Product, Production.ProductModel
Join Column: ProductModelID
*/

USE AdventureWorks2022;
GO

-- Write your query here:



GO

/*
QUESTION 5: Display all addresses with their address type description
Database: AdventureWorks2022
Tables: Person.BusinessEntityAddress, Person.AddressType
Join Column: AddressTypeID
*/

-- Write your query here:



GO

/*
QUESTION 6: Show all sales order details with product names
Database: AdventureWorksLT2022
Tables: SalesLT.SalesOrderDetail, SalesLT.Product
Join Column: ProductID
*/

USE AdventureWorksLT2022;
GO

-- Write your query here:



GO

/*
QUESTION 7: List all products with their category names (requires joining 2 tables)
Database: AdventureWorks2022
Tables: Production.Product, Production.ProductSubcategory, Production.ProductCategory
Chain: Product → ProductSubcategory → ProductCategory
*/

USE AdventureWorks2022;
GO

-- Write your query here:



GO

/*
QUESTION 8: Display all employees with their department names
Database: AdventureWorks2022
Tables: HumanResources.Employee, HumanResources.EmployeeDepartmentHistory, HumanResources.Department
Chain: Employee → EmployeeDepartmentHistory → Department
Note: Use EndDate IS NULL for current department
*/

-- Write your query here:



GO

/*
QUESTION 9: Show all products with their vendor names
Database: AdventureWorks2022
Tables: Purchasing.ProductVendor, Purchasing.Vendor
Join Column: BusinessEntityID
*/

-- Write your query here:



GO

/*
QUESTION 10: List all sales orders with sales person names
Database: AdventureWorks2022
Tables: Sales.SalesOrderHeader, Sales.SalesPerson, Person.Person
Chain: SalesOrderHeader → SalesPerson → Person
Join Column: SalesPersonID and BusinessEntityID
*/

-- Write your query here:



GO

/*
QUESTION 11: Display all products with their unit of measure descriptions
Database: AdventureWorks2022
Tables: Production.Product, Production.UnitMeasure
Join Column: WeightUnitMeasureCode or SizeUnitMeasureCode
*/

-- Write your query here:



GO

/*
QUESTION 12: Show all purchase order headers with vendor names
Database: AdventureWorks2022
Tables: Purchasing.PurchaseOrderHeader, Purchasing.Vendor
Join Column: VendorID (which is BusinessEntityID)
*/

-- Write your query here:



GO

/*
QUESTION 13: List all customers with their address information
Database: AdventureWorksLT2022
Tables: SalesLT.Customer, SalesLT.CustomerAddress, SalesLT.Address
Chain: Customer → CustomerAddress → Address
*/

USE AdventureWorksLT2022;
GO

-- Write your query here:



GO

/*
QUESTION 14: Display all products with their inventory locations
Database: AdventureWorks2022
Tables: Production.ProductInventory, Production.Location
Join Column: LocationID
*/

USE AdventureWorks2022;
GO

-- Write your query here:



GO

/*
QUESTION 15: Show all work orders with product names
Database: AdventureWorks2022
Tables: Production.WorkOrder, Production.Product
Join Column: ProductID
*/

-- Write your query here:



GO

/*
QUESTION 16: List all sales territories with their region information
Database: AdventureWorks2022
Tables: Sales.SalesTerritory, Person.CountryRegion
Join Column: CountryRegionCode
*/

-- Write your query here:



GO

/*
QUESTION 17: Display all employees with their pay rate history
Database: AdventureWorks2022
Tables: HumanResources.Employee, HumanResources.EmployeePayHistory
Join Column: BusinessEntityID
*/

-- Write your query here:



GO

/*
QUESTION 18: Show all products with their bill of materials components
Database: AdventureWorks2022
Tables: Production.BillOfMaterials, Production.Product
Join Column: ComponentID
Note: This shows which components make up products
*/

-- Write your query here:



GO

/*
QUESTION 19: List all credit cards with customer names
Database: AdventureWorks2022
Tables: Sales.PersonCreditCard, Person.Person
Join Column: BusinessEntityID
*/

-- Write your query here:



GO

/*
QUESTION 20: Display all shipping methods used in sales orders
Database: AdventureWorks2022
Tables: Sales.SalesOrderHeader, Purchasing.ShipMethod
Join Column: ShipMethodID
*/

-- Write your query here:



GO

-- ============================================================================
-- LEVEL 2: LEFT/RIGHT OUTER JOINS (Questions 21-35)
-- Learn to include unmatched records
-- ============================================================================

/*
QUESTION 21: List all products including those without a subcategory
Database: AdventureWorks2022
Tables: Production.Product, Production.ProductSubcategory
Use: LEFT JOIN
Look for NULL in subcategory columns
*/

-- Write your query here:



GO

/*
QUESTION 22: Show all customers including those who have never placed an order
Database: AdventureWorksLT2022
Tables: SalesLT.Customer, SalesLT.SalesOrderHeader
Use: LEFT JOIN
Filter: WHERE SalesOrderID IS NULL for customers with no orders
*/

USE AdventureWorksLT2022;
GO

-- Write your query here:



GO

/*
QUESTION 23: Display all products including those that have never been ordered
Database: AdventureWorks2022
Tables: Production.Product, Sales.SalesOrderDetail
Use: LEFT JOIN
Look for products where SalesOrderDetailID IS NULL
*/

USE AdventureWorks2022;
GO

-- Write your query here:



GO

/*
QUESTION 24: List all employees including those not currently assigned to any department
Database: AdventureWorks2022
Tables: HumanResources.Employee, HumanResources.EmployeeDepartmentHistory
Use: LEFT JOIN
Consider: EndDate IS NULL for current assignments
*/

-- Write your query here:



GO

/*
QUESTION 25: Show all product subcategories including those with no products
Database: AdventureWorks2022
Tables: Production.ProductSubcategory, Production.Product
Use: RIGHT JOIN or LEFT JOIN (depending on table order)
*/

-- Write your query here:



GO

/*
QUESTION 26: Display all vendors including those who have never been used in purchase orders
Database: AdventureWorks2022
Tables: Purchasing.Vendor, Purchasing.PurchaseOrderHeader
Use: LEFT JOIN
Filter for NULL PurchaseOrderID to find unused vendors
*/

-- Write your query here:



GO

/*
QUESTION 27: List all sales territories including those with no assigned sales people
Database: AdventureWorks2022
Tables: Sales.SalesTerritory, Sales.SalesPerson
Use: LEFT JOIN
*/

-- Write your query here:



GO

/*
QUESTION 28: Show all products with their reviews, including products with no reviews
Database: AdventureWorks2022
Tables: Production.Product, Production.ProductReview
Use: LEFT JOIN
*/

-- Write your query here:



GO

/*
QUESTION 29: Display all customers with their sales orders, showing customers even if they have no orders
Database: AdventureWorks2022
Tables: Sales.Customer, Sales.SalesOrderHeader
Use: LEFT JOIN
*/

-- Write your query here:



GO

/*
QUESTION 30: List all employees with their sales quota history, including employees with no quota history
Database: AdventureWorks2022
Tables: HumanResources.Employee, Sales.SalesPersonQuotaHistory
Use: LEFT JOIN
Join on: BusinessEntityID
*/

-- Write your query here:



GO

/*
QUESTION 31: Show all products with their special offers, including products with no special offers
Database: AdventureWorks2022
Tables: Production.Product, Sales.SpecialOfferProduct
Use: LEFT JOIN
*/

-- Write your query here:



GO

/*
QUESTION 32: Display all addresses including those not linked to any customer
Database: AdventureWorksLT2022
Tables: SalesLT.Address, SalesLT.CustomerAddress
Use: LEFT JOIN
*/

USE AdventureWorksLT2022;
GO

-- Write your query here:



GO

/*
QUESTION 33: List all product models including those with no actual products
Database: AdventureWorks2022
Tables: Production.ProductModel, Production.Product
Use: LEFT JOIN
*/

USE AdventureWorks2022;
GO

-- Write your query here:



GO

/*
QUESTION 34: Show all departments including those with no employees currently assigned
Database: AdventureWorks2022
Tables: HumanResources.Department, HumanResources.EmployeeDepartmentHistory
Use: LEFT JOIN
Consider: EndDate IS NULL for current employees
*/

-- Write your query here:



GO

/*
QUESTION 35: Display all currencies including those never used in sales orders
Database: AdventureWorks2022
Tables: Sales.Currency, Sales.SalesOrderHeader
Use: LEFT JOIN
Join on: CurrencyRateID might need intermediate table
*/

-- Write your query here:



GO

-- ============================================================================
-- LEVEL 3: MULTIPLE TABLE JOINS (Questions 36-50)
-- Join 3 or more tables in a single query
-- ============================================================================

/*
QUESTION 36: List all sales orders with customer name, product name, and order quantity
Database: AdventureWorksLT2022
Tables: SalesLT.SalesOrderHeader, SalesLT.SalesOrderDetail, SalesLT.Customer, SalesLT.Product
Join Path: Header → Detail → Product AND Header → Customer
*/

USE AdventureWorksLT2022;
GO

-- Write your query here:



GO

/*
QUESTION 37: Show all employees with their full name, department name, and job title
Database: AdventureWorks2022
Tables: HumanResources.Employee, Person.Person, HumanResources.EmployeeDepartmentHistory, HumanResources.Department
Chain through multiple tables
*/

USE AdventureWorks2022;
GO

-- Write your query here:



GO

/*
QUESTION 38: Display all products with category name, subcategory name, and model name
Database: AdventureWorks2022
Tables: Production.Product, Production.ProductSubcategory, Production.ProductCategory, Production.ProductModel
Multiple join paths
*/

-- Write your query here:



GO

/*
QUESTION 39: List all purchase orders with vendor name, employee name who ordered, and ship method
Database: AdventureWorks2022
Tables: Purchasing.PurchaseOrderHeader, Purchasing.Vendor, HumanResources.Employee, Person.Person, Purchasing.ShipMethod
Join on: VendorID, EmployeeID, ShipMethodID
*/

-- Write your query here:



GO

/*
QUESTION 40: Show all sales orders with customer name, salesperson name, and territory name
Database: AdventureWorks2022
Tables: Sales.SalesOrderHeader, Sales.Customer, Person.Person (for customer), Sales.SalesPerson, Person.Person (for salesperson), Sales.SalesTerritory
Note: Person table used twice - need aliases!
*/

-- Write your query here:



GO

/*
QUESTION 41: Display all products with their vendor name, vendor contact person, and price
Database: AdventureWorks2022
Tables: Production.Product, Purchasing.ProductVendor, Purchasing.Vendor, Person.Person
Chain: Product → ProductVendor → Vendor → Person
*/

-- Write your query here:



GO

/*
QUESTION 42: List all work orders with product name, location name, and scrap reason
Database: AdventureWorks2022
Tables: Production.WorkOrder, Production.Product, Production.Location, Production.ScrapReason
Note: ScrapReasonID might be NULL
*/

-- Write your query here:



GO

/*
QUESTION 43: Show all employees with their manager's name and department name
Database: AdventureWorks2022
Tables: HumanResources.Employee (twice - self join!), Person.Person (twice), HumanResources.EmployeeDepartmentHistory, HumanResources.Department
Self-join on: OrganizationNode or ManagerID
*/

-- Write your query here:



GO

/*
QUESTION 44: Display all sales orders with billing address and shipping address details
Database: AdventureWorks2022
Tables: Sales.SalesOrderHeader, Person.Address (twice - for billing and shipping)
Join on: BillToAddressID and ShipToAddressID
Need table aliases for Address table used twice
*/

-- Write your query here:



GO

/*
QUESTION 45: List all products with their culture-specific descriptions
Database: AdventureWorks2022
Tables: Production.Product, Production.ProductModel, Production.ProductModelProductDescriptionCulture, Production.ProductDescription, Production.Culture
Long chain of joins through multiple tables
*/

-- Write your query here:



GO

/*
QUESTION 46: Show all sales orders with product name, category, and subcategory
Database: AdventureWorks2022
Tables: Sales.SalesOrderDetail, Production.Product, Production.ProductSubcategory, Production.ProductCategory
Chain through hierarchy
*/

-- Write your query here:



GO

/*
QUESTION 47: Display all employees with their current and previous department history
Database: AdventureWorks2022
Tables: HumanResources.Employee, HumanResources.EmployeeDepartmentHistory, HumanResources.Department
Consider: Joining history table multiple times for current vs previous
*/

-- Write your query here:



GO

/*
QUESTION 48: List all credit card transactions with customer name, card type, and order details
Database: AdventureWorks2022
Tables: Sales.SalesOrderHeader, Sales.PersonCreditCard, Sales.CreditCard, Person.Person
Join path through credit card information
*/

-- Write your query here:



GO

/*
QUESTION 49: Show all products with their bill of materials component names and quantities
Database: AdventureWorks2022
Tables: Production.BillOfMaterials, Production.Product (twice - for parent and component)
Self-join: ProductID and ComponentID both reference Product table
*/

-- Write your query here:



GO

/*
QUESTION 50: Display complete customer information: name, addresses (all types), phone numbers
Database: AdventureWorks2022
Tables: Person.Person, Person.BusinessEntityAddress, Person.Address, Person.AddressType, Person.PersonPhone, Person.PhoneNumberType
Multiple relationships from Person
*/

-- Write your query here:



GO

-- ============================================================================
-- LEVEL 4: SELF JOINS & COMPLEX SCENARIOS (Questions 51-65)
-- Master joining tables to themselves and complex relationships
-- ============================================================================

/*
QUESTION 51: List all employees with their manager's name (self join)
Database: AdventureWorks2022
Tables: HumanResources.Employee (aliased twice), Person.Person (aliased twice)
Self-join on: ManagerID = BusinessEntityID
Use LEFT JOIN to include employees with no manager
*/

-- Write your query here:



GO

/*
QUESTION 52: Show the organizational hierarchy showing each employee and their manager's manager
Database: AdventureWorks2022
Tables: HumanResources.Employee (aliased 3 times), Person.Person (aliased 3 times)
Multiple levels of self-join
*/

-- Write your query here:



GO

/*
QUESTION 53: Display all products that share the same product model
Database: AdventureWorks2022
Tables: Production.Product (self-joined)
Self-join on: ProductModelID
Exclude: Where product doesn't match itself (ProductID <> ProductID)
*/

-- Write your query here:



GO

/*
QUESTION 54: List all employees who work in the same department
Database: AdventureWorks2022
Tables: HumanResources.EmployeeDepartmentHistory (self-joined), Person.Person (twice)
Self-join on: DepartmentID
Filter: Current employees only (EndDate IS NULL)
Exclude: Same person
*/

-- Write your query here:



GO

/*
QUESTION 55: Show all products from the same category but different subcategories
Database: AdventureWorks2022
Tables: Production.Product (twice), Production.ProductSubcategory (twice)
Join: Match on CategoryID but different SubcategoryID
*/

-- Write your query here:



GO

/*
QUESTION 56: Display all customers from the same city
Database: AdventureWorksLT2022
Tables: SalesLT.Customer (twice), SalesLT.CustomerAddress (twice), SalesLT.Address (twice)
Self-join on: City
Exclude: Same customer
*/

USE AdventureWorksLT2022;
GO

-- Write your query here:



GO

/*
QUESTION 57: List all products with similar names (using LIKE for pattern matching)
Database: AdventureWorks2022
Tables: Production.Product (self-joined)
Join: ON p1.Name LIKE p2.Name + '%' or similar pattern
Exclude: Exact same product
*/

USE AdventureWorks2022;
GO

-- Write your query here:



GO

/*
QUESTION 58: Show employees who have the same job title and hire date year
Database: AdventureWorks2022
Tables: HumanResources.Employee (self-joined), Person.Person (twice)
Join on: JobTitle AND YEAR(HireDate)
Exclude: Same person
*/

-- Write your query here:



GO

/*
QUESTION 59: Display all vendors that supply the same products
Database: AdventureWorks2022
Tables: Purchasing.ProductVendor (self-joined), Purchasing.Vendor (twice)
Join on: ProductID
Different vendors (BusinessEntityID)
*/

-- Write your query here:



GO

/*
QUESTION 60: List all products that have been in the same sales order
Database: AdventureWorks2022
Tables: Sales.SalesOrderDetail (self-joined), Production.Product (twice)
Join on: SalesOrderID
Different products (ProductID)
*/

-- Write your query here:



GO

/*
QUESTION 61: Show all employees who report to the same manager
Database: AdventureWorks2022
Tables: HumanResources.Employee (self-joined), Person.Person (twice)
Join on: OrganizationNode or ManagerID
Exclude: Same employee
Show: Employee pairs with common manager
*/

-- Write your query here:



GO

/*
QUESTION 62: Display product pairs frequently bought together (same order)
Database: AdventureWorks2022
Tables: Sales.SalesOrderDetail (self-joined twice)
Join on: SalesOrderID
WHERE: p1.ProductID < p2.ProductID (avoid duplicates)
Consider: GROUP BY and COUNT for frequency
*/

-- Write your query here:



GO

/*
QUESTION 63: List all addresses in the same state and city but different street addresses
Database: AdventureWorks2022
Tables: Person.Address (self-joined)
Join on: StateProvinceID AND City
WHERE: Different AddressLine1
*/

-- Write your query here:



GO

/*
QUESTION 64: Show employees with the same pay rate but different job titles
Database: AdventureWorks2022
Tables: HumanResources.Employee (twice), HumanResources.EmployeePayHistory (twice), Person.Person (twice)
Join on: Current Rate (max RateChangeDate)
Different: JobTitle
*/

-- Write your query here:



GO

/*
QUESTION 65: Display all product models that have products in multiple categories
Database: AdventureWorks2022
Tables: Production.Product (self-joined), Production.ProductSubcategory (twice), Production.ProductCategory (twice)
Join on: ProductModelID
WHERE: Different ProductCategoryID
Use DISTINCT
*/

-- Write your query here:



GO

-- ============================================================================
-- LEVEL 5: CROSS JOINS & SPECIAL CASES (Questions 66-75)
-- Cartesian products and special joining scenarios
-- ============================================================================

/*
QUESTION 66: Create a complete matrix of all products and all sales territories
Database: AdventureWorks2022
Tables: Production.Product CROSS JOIN Sales.SalesTerritory
Use: CROSS JOIN
Result: Every product paired with every territory
*/

-- Write your query here:



GO

/*
QUESTION 67: Generate all possible combinations of product colors and sizes
Database: AdventureWorks2022
Query: SELECT DISTINCT Color, Size FROM Production.Product
Then: CROSS JOIN these results
Filter: WHERE Color IS NOT NULL AND Size IS NOT NULL
*/

-- Write your query here:



GO

/*
QUESTION 68: Create a calendar of all months for each sales territory
Database: AdventureWorks2022
Create: Number series 1-12 (use CTE or master..spt_values)
CROSS JOIN with: Sales.SalesTerritory
Display: Territory + Month combinations
*/

-- Write your query here:



GO

/*
QUESTION 69: Show all possible employee-department combinations (not just current assignments)
Database: AdventureWorks2022
Tables: HumanResources.Employee CROSS JOIN HumanResources.Department
Compare with actual assignments using LEFT JOIN
*/

-- Write your query here:



GO

/*
QUESTION 70: Generate all possible product-vendor combinations for procurement analysis
Database: AdventureWorks2022
Tables: Production.Product CROSS JOIN Purchasing.Vendor
Filter: WHERE Product.MakeFlag = 0 (purchased items)
*/

-- Write your query here:



GO

/*
QUESTION 71: Create a matrix showing which customers could theoretically buy which products
Database: AdventureWorksLT2022
Tables: SalesLT.Customer CROSS JOIN SalesLT.Product
Consider: Filtering by product category or customer type
*/

USE AdventureWorksLT2022;
GO

-- Write your query here:



GO

/*
QUESTION 72: List all date combinations between order date and ship date for analysis
Database: AdventureWorks2022
Tables: Self-join Sales.SalesOrderHeader
CROSS JOIN: To create date pairs
Filter: Reasonable date ranges
*/

USE AdventureWorks2022;
GO

-- Write your query here:



GO

/*
QUESTION 73: Generate all possible shift-location combinations for work scheduling
Database: AdventureWorks2022
Tables: HumanResources.Shift CROSS JOIN Production.Location
Result: Every shift at every location
*/

-- Write your query here:



GO

/*
QUESTION 74: Show all combinations of product categories and sales reasons
Database: AdventureWorks2022
Tables: Production.ProductCategory CROSS JOIN Sales.SalesReason
Use case: Marketing campaign planning
*/

-- Write your query here:



GO

/*
QUESTION 75: Create all possible employee pairs for team assignments
Database: AdventureWorks2022
Tables: HumanResources.Employee CROSS JOIN HumanResources.Employee
Filter: WHERE e1.BusinessEntityID < e2.BusinessEntityID
Avoid: Pairing employee with themselves
*/

-- Write your query here:



GO

-- ============================================================================
-- LEVEL 6: ADVANCED JOIN TECHNIQUES (Questions 76-90)
-- Complex conditions, multiple join types, subqueries in joins
-- ============================================================================

/*
QUESTION 76: List products that have never been sold but have inventory
Database: AdventureWorks2022
Tables: Production.Product, Production.ProductInventory, Sales.SalesOrderDetail
Use: INNER JOIN with ProductInventory, LEFT JOIN with SalesOrderDetail
WHERE: SalesOrderDetail IS NULL
*/

-- Write your query here:



GO

/*
QUESTION 77: Show employees who have changed departments more than once
Database: AdventureWorks2022
Tables: HumanResources.Employee, HumanResources.EmployeeDepartmentHistory
Use: JOIN with GROUP BY and HAVING COUNT > 2
*/

-- Write your query here:



GO

/*
QUESTION 78: Display customers who have ordered products from multiple categories
Database: AdventureWorks2022
Tables: Sales.Customer, Sales.SalesOrderHeader, Sales.SalesOrderDetail, Production.Product, Production.ProductSubcategory, Production.ProductCategory
Use: Multiple joins + GROUP BY + HAVING COUNT(DISTINCT CategoryID) > 1
*/

-- Write your query here:



GO

/*
QUESTION 79: List vendors who supply products in at least 3 different subcategories
Database: AdventureWorks2022
Tables: Purchasing.Vendor, Purchasing.ProductVendor, Production.Product, Production.ProductSubcategory
GROUP BY: VendorID
HAVING: COUNT(DISTINCT ProductSubcategoryID) >= 3
*/

-- Write your query here:



GO

/*
QUESTION 80: Show sales orders where the total is greater than the average order total for that customer
Database: AdventureWorks2022
Tables: Sales.SalesOrderHeader (joined to itself or subquery)
JOIN: Customer's average in subquery
WHERE: TotalDue > (customer's average)
*/

-- Write your query here:



GO

/*
QUESTION 81: Display products sold in quantities greater than their average sale quantity
Database: AdventureWorks2022
Tables: Sales.SalesOrderDetail joined with subquery for averages
Subquery: AVG(OrderQty) per ProductID
WHERE: OrderQty > average
*/

-- Write your query here:



GO

/*
QUESTION 82: List employees whose pay rate is higher than the average for their job title
Database: AdventureWorks2022
Tables: HumanResources.Employee, HumanResources.EmployeePayHistory
Subquery: AVG(Rate) per JobTitle
JOIN: ON JobTitle
WHERE: Rate > average
*/

-- Write your query here:



GO

/*
QUESTION 83: Show products that are more expensive than all products in a specific category
Database: AdventureWorks2022
Tables: Production.Product (twice), Production.ProductSubcategory
Subquery: MAX(ListPrice) for specific category
WHERE: ListPrice > (subquery result)
*/

-- Write your query here:



GO

/*
QUESTION 84: Display customers who have spent more than the average customer in their territory
Database: AdventureWorks2022
Tables: Sales.Customer, Sales.SalesOrderHeader
Subquery: AVG(TotalDue) per TerritoryID
GROUP BY: CustomerID
HAVING: SUM(TotalDue) > territory average
*/

-- Write your query here:



GO

/*
QUESTION 85: List products that have been ordered with every possible special offer
Database: AdventureWorks2022
Tables: Production.Product, Sales.SpecialOfferProduct, Sales.SpecialOffer
Use: COUNT(DISTINCT SpecialOfferID) = total number of special offers
Advanced: Relational division problem
*/

-- Write your query here:



GO

/*
QUESTION 86: Show employees who have worked in every department
Database: AdventureWorks2022
Tables: HumanResources.Employee, HumanResources.EmployeeDepartmentHistory, HumanResources.Department
COUNT(DISTINCT DepartmentID) per employee = total departments
Relational division
*/

-- Write your query here:



GO

/*
QUESTION 87: Display vendors who supply products that are in the top 10% by price
Database: AdventureWorks2022
Tables: Purchasing.Vendor, Purchasing.ProductVendor, Production.Product
Subquery: PERCENTILE_CONT(0.9) or TOP 10 PERCENT
WHERE: Product.ListPrice in top range
*/

-- Write your query here:



GO

/*
QUESTION 88: List sales orders that contain products from at least 5 different subcategories
Database: AdventureWorks2022
Tables: Sales.SalesOrderHeader, Sales.SalesOrderDetail, Production.Product, Production.ProductSubcategory
GROUP BY: SalesOrderID
HAVING: COUNT(DISTINCT ProductSubcategoryID) >= 5
*/

-- Write your query here:



GO

/*
QUESTION 89: Show products whose standard cost has increased over time (requires multiple rows in ProductCostHistory)
Database: AdventureWorks2022
Tables: Production.Product, Production.ProductCostHistory (self-joined)
Self-join: h1.EndDate < h2.StartDate
WHERE: h2.StandardCost > h1.StandardCost
*/

-- Write your query here:



GO

/*
QUESTION 90: Display customers who have purchased products that no other customer in their territory has purchased
Database: AdventureWorks2022
Tables: Sales.Customer, Sales.SalesOrderHeader, Sales.SalesOrderDetail
Subquery: Products purchased by other customers in same territory
Use: NOT EXISTS or NOT IN with correlated subquery
*/

-- Write your query here:



GO

-- ============================================================================
-- LEVEL 7: DATA WAREHOUSE JOINS (Questions 91-100)
-- Using AdventureWorksDW2022 - dimensional modeling joins
-- ============================================================================

/*
QUESTION 91: List all internet sales with customer and product details
Database: AdventureWorksDW2022
Tables: dbo.FactInternetSales, dbo.DimCustomer, dbo.DimProduct
Join on: CustomerKey, ProductKey
*/

USE AdventureWorksDW2022;
GO

-- Write your query here:



GO

/*
QUESTION 92: Show all reseller sales with reseller name, product name, and sales territory
Database: AdventureWorksDW2022
Tables: dbo.FactResellerSales, dbo.DimReseller, dbo.DimProduct, dbo.DimSalesTerritory
Multiple dimension joins
*/

-- Write your query here:



GO

/*
QUESTION 93: Display internet sales with full date information (year, quarter, month)
Database: AdventureWorksDW2022
Tables: dbo.FactInternetSales, dbo.DimDate
Join on: OrderDateKey
Date table has: CalendarYear, CalendarQuarter, MonthNumberOfYear, etc.
*/

-- Write your query here:



GO

/*
QUESTION 94: List all products with their current price and currency
Database: AdventureWorksDW2022
Tables: dbo.DimProduct, dbo.FactProductInventory, dbo.DimCurrency
Join through: CurrencyKey
*/

-- Write your query here:



GO

/*
QUESTION 95: Show sales performance by employee and territory
Database: AdventureWorksDW2022
Tables: dbo.FactResellerSales, dbo.DimEmployee, dbo.DimSalesTerritory
Join on: EmployeeKey, SalesTerritoryKey
Aggregate: SUM(SalesAmount)
*/

-- Write your query here:



GO

/*
QUESTION 96: Display internet sales by product category and subcategory
Database: AdventureWorksDW2022
Tables: dbo.FactInternetSales, dbo.DimProduct, dbo.DimProductSubcategory, dbo.DimProductCategory
Chain: Product → Subcategory → Category
*/

-- Write your query here:



GO

/*
QUESTION 97: List customer demographics with their purchase behavior
Database: AdventureWorksDW2022
Tables: dbo.DimCustomer, dbo.FactInternetSales, dbo.DimGeography
Join on: CustomerKey, GeographyKey
Include: Customer demographics fields
*/

-- Write your query here:



GO

/*
QUESTION 98: Show sales quotas vs actual sales by employee and date
Database: AdventureWorksDW2022
Tables: dbo.FactSalesQuota, dbo.FactResellerSales, dbo.DimEmployee, dbo.DimDate
Join on: EmployeeKey, DateKey
Compare: SalesAmountQuota vs SalesAmount
*/

-- Write your query here:



GO

/*
QUESTION 99: Display product inventory levels across all warehouses with product details
Database: AdventureWorksDW2022
Tables: dbo.FactProductInventory, dbo.DimProduct, dbo.DimDate
Join on: ProductKey, DateKey
Show: Current inventory snapshot
*/

-- Write your query here:



GO

/*
QUESTION 100: Create a complete sales analysis with customer, product, date, territory, and promotion details
Database: AdventureWorksDW2022
Tables: dbo.FactInternetSales (or FactResellerSales)
Join to: DimCustomer, DimProduct, DimDate, DimSalesTerritory, DimPromotion, DimCurrency
This is a "full fact constellation" join
Include: All relevant dimension attributes
The ultimate JOIN challenge!
*/

-- Write your query here:



GO

-- ============================================================================
-- HELPER QUERIES FOR EXPLORATION
-- ============================================================================

/*
-- See all tables in current database
SELECT TABLE_SCHEMA, TABLE_NAME 
FROM INFORMATION_SCHEMA.TABLES 
WHERE TABLE_TYPE = 'BASE TABLE'
ORDER BY TABLE_SCHEMA, TABLE_NAME;

-- See columns in a specific table
SELECT COLUMN_NAME, DATA_TYPE, IS_NULLABLE
FROM INFORMATION_SCHEMA.COLUMNS 
WHERE TABLE_NAME = 'YourTableName'
ORDER BY ORDINAL_POSITION;

-- See foreign key relationships
SELECT 
    fk.name AS ForeignKeyName,
    tp.name AS ParentTable,
    cp.name AS ParentColumn,
    tr.name AS ReferencedTable,
    cr.name AS ReferencedColumn
FROM sys.foreign_keys fk
INNER JOIN sys.tables tp ON fk.parent_object_id = tp.object_id
INNER JOIN sys.tables tr ON fk.referenced_object_id = tr.object_id
INNER JOIN sys.foreign_key_columns fkc ON fk.object_id = fkc.constraint_object_id
INNER JOIN sys.columns cp ON fkc.parent_column_id = cp.column_id AND fkc.parent_object_id = cp.object_id
INNER JOIN sys.columns cr ON fkc.referenced_column_id = cr.column_id AND fkc.referenced_object_id = cr.object_id
WHERE tp.name = 'YourTableName'
ORDER BY fk.name;

-- Count rows in a table
SELECT COUNT(*) FROM SchemaName.TableName;

-- Preview data from a table
SELECT TOP 10 * FROM SchemaName.TableName;
*/

-- ============================================================================
-- PRACTICE TIPS
-- ============================================================================

/*
BEGINNER TIPS (Questions 1-20):
- Start with SELECT * to see all columns
- Then select only the columns you need
- Use table aliases (e.g., p for Product, c for Customer)
- Test each query with TOP 10 first

INTERMEDIATE TIPS (Questions 21-50):
- Draw the relationships on paper before writing the query
- Use LEFT JOIN when you want ALL records from the left table
- Use INNER JOIN when you only want matching records
- Remember: LEFT JOIN keeps left table rows even if no match

ADVANCED TIPS (Questions 51-90):
- Break complex queries into smaller parts
- Test each join separately
- Use CTEs to make queries more readable
- Check execution plans for performance
- Self-joins need different aliases (e.g., e1, e2)

DATA WAREHOUSE TIPS (Questions 91-100):
- Fact tables contain measures (numbers to aggregate)
- Dimension tables contain descriptive attributes
- Star schema: Fact in center, dimensions joined to it
- Always join on the Key columns

DEBUGGING TIPS:
- If you get too many rows: Check for missing join conditions
- If you get too few rows: You might need LEFT JOIN instead of INNER JOIN
- If you get duplicates: Check if you need DISTINCT
- If performance is slow: Check if indexes exist on join columns
*/

-- ============================================================================
-- END OF PRACTICE QUESTIONS
-- Good luck with your JOIN mastery! 🚀
-- ============================================================================
