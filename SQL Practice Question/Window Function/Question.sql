/*
================================================================================
100 WINDOW FUNCTION PRACTICE QUESTIONS - ADVENTUREWORKS DATABASE
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

WINDOW FUNCTIONS COVERED:
- ROW_NUMBER(), RANK(), DENSE_RANK(), NTILE()
- SUM(), AVG(), COUNT(), MIN(), MAX() with OVER()
- LEAD(), LAG(), FIRST_VALUE(), LAST_VALUE()
- Frame specifications (ROWS, RANGE)
- Complex partitioning and ordering

TIP: Window functions format: FUNCTION() OVER (PARTITION BY ... ORDER BY ... ROWS/RANGE ...)

Good luck! 🚀
================================================================================
*/

-- ============================================================================
-- LEVEL 1: BASIC RANKING FUNCTIONS (Questions 1-15)
-- Master ROW_NUMBER, RANK, DENSE_RANK, NTILE
-- ============================================================================

/*
QUESTION 1: Assign a sequential row number to all products ordered by name
Database: AdventureWorks2022
Table: Production.Product
Window Function: ROW_NUMBER()
Order By: Name
Hint: ROW_NUMBER() OVER (ORDER BY ...)
*/

USE AdventureWorks2022;
GO

-- Write your query here:



GO

/*
QUESTION 2: Rank all products by their list price (highest to lowest)
Database: AdventureWorks2022
Table: Production.Product
Window Function: RANK()
Order By: ListPrice DESC
Hint: RANK() handles ties differently than ROW_NUMBER()
*/

-- Write your query here:



GO

/*
QUESTION 3: Use DENSE_RANK to rank products by list price
Database: AdventureWorks2022
Table: Production.Product
Window Function: DENSE_RANK()
Order By: ListPrice DESC
Hint: Notice the difference between RANK() and DENSE_RANK() with ties
*/

-- Write your query here:



GO

/*
QUESTION 4: Assign row numbers to employees within each department
Database: AdventureWorks2022
Tables: HumanResources.Employee, HumanResources.EmployeeDepartmentHistory
Window Function: ROW_NUMBER()
Partition By: DepartmentID
Order By: HireDate
Hint: PARTITION BY splits the row numbers by department
Filter: EndDate IS NULL for current department
*/

-- Write your query here:



GO

/*
QUESTION 5: Rank sales orders by total due within each customer
Database: AdventureWorks2022
Table: Sales.SalesOrderHeader
Window Function: RANK()
Partition By: CustomerID
Order By: TotalDue DESC
Hint: Find each customer's highest value orders
*/

-- Write your query here:



GO

/*
QUESTION 6: Divide all products into 4 price quartiles
Database: AdventureWorks2022
Table: Production.Product
Window Function: NTILE(4)
Order By: ListPrice
Hint: NTILE divides rows into equal groups
Filter: WHERE ListPrice > 0
*/

-- Write your query here:



GO

/*
QUESTION 7: Number sales orders sequentially for each sales person
Database: AdventureWorks2022
Table: Sales.SalesOrderHeader
Window Function: ROW_NUMBER()
Partition By: SalesPersonID
Order By: OrderDate
Hint: Shows order sequence per salesperson
*/

-- Write your query here:



GO

/*
QUESTION 8: Rank products by standard cost within each product subcategory
Database: AdventureWorks2022
Table: Production.Product
Window Function: DENSE_RANK()
Partition By: ProductSubcategoryID
Order By: StandardCost DESC
Hint: Find most expensive products in each subcategory
*/

-- Write your query here:



GO

/*
QUESTION 9: Assign row numbers to customers by their total purchases (from SalesOrderHeader)
Database: AdventureWorks2022
Table: Sales.SalesOrderHeader
Window Function: ROW_NUMBER()
Hint: You'll need to aggregate first, then use window function
Order By: Total amount spent DESC
*/

-- Write your query here:



GO

/*
QUESTION 10: Rank employees by their current pay rate
Database: AdventureWorks2022
Table: HumanResources.EmployeePayHistory
Window Function: RANK()
Order By: Rate DESC
Hint: Get most recent pay rate per employee (MAX RateChangeDate)
*/

-- Write your query here:



GO

/*
QUESTION 11: Create 10 equal groups of products based on weight
Database: AdventureWorks2022
Table: Production.Product
Window Function: NTILE(10)
Order By: Weight
Filter: WHERE Weight IS NOT NULL
Hint: Deciles for product weight distribution
*/

-- Write your query here:



GO

/*
QUESTION 12: Rank vendors by the number of products they supply
Database: AdventureWorks2022
Table: Purchasing.ProductVendor
Window Function: DENSE_RANK()
Hint: COUNT products per vendor first, then rank
Order By: Product count DESC
*/

-- Write your query here:



GO

/*
QUESTION 13: Number work orders sequentially within each product
Database: AdventureWorks2022
Table: Production.WorkOrder
Window Function: ROW_NUMBER()
Partition By: ProductID
Order By: StartDate
*/

-- Write your query here:



GO

/*
QUESTION 14: Rank sales territories by total sales amount
Database: AdventureWorksDW2022
Table: dbo.FactResellerSales
Window Function: RANK()
Hint: Join with DimSalesTerritory, aggregate, then rank
Order By: SUM(SalesAmount) DESC
*/

USE AdventureWorksDW2022;
GO

-- Write your query here:



GO

/*
QUESTION 15: Divide customers into 5 groups based on their first order date
Database: AdventureWorksLT2022
Table: SalesLT.Customer with SalesLT.SalesOrderHeader
Window Function: NTILE(5)
Order By: MIN(OrderDate)
Hint: Customer segments by tenure
*/

USE AdventureWorksLT2022;
GO

-- Write your query here:



GO

-- ============================================================================
-- LEVEL 2: BASIC AGGREGATE WINDOW FUNCTIONS (Questions 16-30)
-- SUM, AVG, COUNT, MIN, MAX with OVER clause
-- ============================================================================

/*
QUESTION 16: Show each product with its price and the average price of all products
Database: AdventureWorks2022
Table: Production.Product
Window Function: AVG(ListPrice) OVER()
Hint: No PARTITION BY means aggregate over entire result set
*/

USE AdventureWorks2022;
GO

-- Write your query here:



GO

/*
QUESTION 17: Display running total of sales by order date
Database: AdventureWorks2022
Table: Sales.SalesOrderHeader
Window Function: SUM(TotalDue) OVER(ORDER BY OrderDate)
Hint: Cumulative sum - running total
*/

-- Write your query here:



GO

/*
QUESTION 18: Show each sale with the total sales for that customer
Database: AdventureWorks2022
Table: Sales.SalesOrderHeader
Window Function: SUM(TotalDue) OVER(PARTITION BY CustomerID)
Columns: SalesOrderID, CustomerID, TotalDue, CustomerTotalSales
*/

-- Write your query here:



GO

/*
QUESTION 19: Calculate the average order value per customer alongside each order
Database: AdventureWorks2022
Table: Sales.SalesOrderHeader
Window Function: AVG(TotalDue) OVER(PARTITION BY CustomerID)
Hint: Compare each order to customer's average
*/

-- Write your query here:



GO

/*
QUESTION 20: Count total number of products in each subcategory with each product
Database: AdventureWorks2022
Table: Production.Product
Window Function: COUNT(*) OVER(PARTITION BY ProductSubcategoryID)
Hint: Shows subcategory size with each product
*/

-- Write your query here:



GO

/*
QUESTION 21: Show maximum and minimum list price within each product category
Database: AdventureWorks2022
Tables: Production.Product, Production.ProductSubcategory
Window Functions: MAX(ListPrice) OVER(PARTITION BY ...), MIN(ListPrice) OVER(...)
Hint: Join to get CategoryID, partition by it
*/

-- Write your query here:



GO

/*
QUESTION 22: Display running count of orders by order date
Database: AdventureWorks2022
Table: Sales.SalesOrderHeader
Window Function: COUNT(*) OVER(ORDER BY OrderDate)
Hint: Cumulative count of orders over time
*/

-- Write your query here:



GO

/*
QUESTION 23: Calculate percentage of total sales for each order
Database: AdventureWorks2022
Table: Sales.SalesOrderHeader
Window Function: SUM(TotalDue) OVER()
Formula: (TotalDue / SUM(TotalDue) OVER()) * 100
*/

-- Write your query here:



GO

/*
QUESTION 24: Show each employee's salary vs average department salary
Database: AdventureWorks2022
Tables: HumanResources.Employee, HumanResources.EmployeePayHistory, HumanResources.EmployeeDepartmentHistory
Window Function: AVG(Rate) OVER(PARTITION BY DepartmentID)
Hint: Get current rate and department for each employee
*/

-- Write your query here:



GO

/*
QUESTION 25: Calculate running average of product list prices by name order
Database: AdventureWorks2022
Table: Production.Product
Window Function: AVG(ListPrice) OVER(ORDER BY Name)
Hint: Average of all products up to current row
*/

-- Write your query here:



GO

/*
QUESTION 26: Show total inventory quantity per product across all locations
Database: AdventureWorks2022
Table: Production.ProductInventory
Window Function: SUM(Quantity) OVER(PARTITION BY ProductID)
Hint: Total quantity alongside each location's quantity
*/

-- Write your query here:



GO

/*
QUESTION 27: Display percentage of category sales for each product subcategory
Database: AdventureWorksDW2022
Tables: dbo.FactInternetSales, dbo.DimProduct, dbo.DimProductSubcategory, dbo.DimProductCategory
Window Function: SUM(SalesAmount) partitioned by category
Formula: Subcategory sales / Category sales * 100
*/

USE AdventureWorksDW2022;
GO

-- Write your query here:



GO

/*
QUESTION 28: Calculate cumulative sum of quantities ordered by product
Database: AdventureWorks2022
Table: Sales.SalesOrderDetail
Window Function: SUM(OrderQty) OVER(PARTITION BY ProductID ORDER BY SalesOrderID)
Hint: Running total per product
*/

USE AdventureWorks2022;
GO

-- Write your query here:



GO

/*
QUESTION 29: Show max, min, and average order quantity for each product alongside each sale
Database: AdventureWorks2022
Table: Sales.SalesOrderDetail
Window Functions: MAX(), MIN(), AVG() all OVER(PARTITION BY ProductID)
*/

-- Write your query here:



GO

/*
QUESTION 30: Calculate year-to-date sales running total
Database: AdventureWorks2022
Table: Sales.SalesOrderHeader
Window Function: SUM(TotalDue) OVER(PARTITION BY YEAR(OrderDate) ORDER BY OrderDate)
Hint: Reset running total each year
*/

-- Write your query here:



GO

-- ============================================================================
-- LEVEL 3: LAG and LEAD Functions (Questions 31-45)
-- Access previous and next row values
-- ============================================================================

/*
QUESTION 31: Show each product's price and the previous product's price (by name order)
Database: AdventureWorks2022
Table: Production.Product
Window Function: LAG(ListPrice) OVER(ORDER BY Name)
Hint: LAG gets value from previous row
*/

-- Write your query here:



GO

/*
QUESTION 32: Display each order with the next order date for the same customer
Database: AdventureWorks2022
Table: Sales.SalesOrderHeader
Window Function: LEAD(OrderDate) OVER(PARTITION BY CustomerID ORDER BY OrderDate)
Hint: LEAD gets value from next row
*/

-- Write your query here:



GO

/*
QUESTION 33: Calculate the difference between current and previous order total for each customer
Database: AdventureWorks2022
Table: Sales.SalesOrderHeader
Window Functions: LAG(TotalDue) OVER(PARTITION BY CustomerID ORDER BY OrderDate)
Formula: TotalDue - LAG(TotalDue)
*/

-- Write your query here:



GO

/*
QUESTION 34: Show price changes between consecutive products in the same subcategory
Database: AdventureWorks2022
Table: Production.Product
Window Function: LAG(ListPrice) OVER(PARTITION BY ProductSubcategoryID ORDER BY Name)
Calculate: ListPrice - Previous ListPrice
*/

-- Write your query here:



GO

/*
QUESTION 35: Find days between consecutive orders for each customer
Database: AdventureWorks2022
Table: Sales.SalesOrderHeader
Window Function: LAG(OrderDate) OVER(PARTITION BY CustomerID ORDER BY OrderDate)
Calculate: DATEDIFF(day, LAG(OrderDate), OrderDate)
*/

-- Write your query here:



GO

/*
QUESTION 36: Show each employee's hire date and the hire date of the previously hired employee
Database: AdventureWorks2022
Table: HumanResources.Employee
Window Function: LAG(HireDate) OVER(ORDER BY HireDate)
Join: Person.Person for names
*/

-- Write your query here:



GO

/*
QUESTION 37: Display sales amount growth comparing current month to next month
Database: AdventureWorksDW2022
Table: dbo.FactInternetSales with dbo.DimDate
Window Function: LEAD(SalesAmount) OVER(ORDER BY FullDateAlternateKey)
Group by month first
*/

USE AdventureWorksDW2022;
GO

-- Write your query here:



GO

/*
QUESTION 38: Show previous and next product name for each product (alphabetically)
Database: AdventureWorks2022
Table: Production.Product
Window Functions: LAG(Name), LEAD(Name) both OVER(ORDER BY Name)
*/

USE AdventureWorks2022;
GO

-- Write your query here:



GO

/*
QUESTION 39: Calculate percentage change in sales from previous order for each customer
Database: AdventureWorks2022
Table: Sales.SalesOrderHeader
Window Function: LAG(TotalDue) OVER(PARTITION BY CustomerID ORDER BY OrderDate)
Formula: ((TotalDue - LAG(TotalDue)) / LAG(TotalDue)) * 100
*/

-- Write your query here:



GO

/*
QUESTION 40: Show time gap between consecutive work orders for each product
Database: AdventureWorks2022
Table: Production.WorkOrder
Window Function: LAG(StartDate) OVER(PARTITION BY ProductID ORDER BY StartDate)
Calculate: DATEDIFF(day, LAG(StartDate), StartDate)
*/

-- Write your query here:



GO

/*
QUESTION 41: Find the previous and next purchase order date for each vendor
Database: AdventureWorks2022
Table: Purchasing.PurchaseOrderHeader
Window Functions: LAG(OrderDate), LEAD(OrderDate) OVER(PARTITION BY VendorID ORDER BY OrderDate)
*/

-- Write your query here:



GO

/*
QUESTION 42: Compare each product's weight to the next heavier product
Database: AdventureWorks2022
Table: Production.Product
Window Function: LEAD(Weight) OVER(ORDER BY Weight)
Filter: WHERE Weight IS NOT NULL
*/

-- Write your query here:



GO

/*
QUESTION 43: Show sales quota changes for each employee over time
Database: AdventureWorks2022
Table: Sales.SalesPersonQuotaHistory
Window Function: LAG(SalesQuota) OVER(PARTITION BY BusinessEntityID ORDER BY QuotaDate)
Calculate: SalesQuota - LAG(SalesQuota)
*/

-- Write your query here:



GO

/*
QUESTION 44: Find rate of change in standard cost for products
Database: AdventureWorks2022
Table: Production.ProductCostHistory
Window Function: LAG(StandardCost) OVER(PARTITION BY ProductID ORDER BY StartDate)
Calculate: Difference and percentage change
*/

-- Write your query here:



GO

/*
QUESTION 45: Display 2 previous and 2 next order dates for each customer's orders
Database: AdventureWorks2022
Table: Sales.SalesOrderHeader
Window Functions: LAG(OrderDate, 2), LAG(OrderDate, 1), LEAD(OrderDate, 1), LEAD(OrderDate, 2)
All OVER(PARTITION BY CustomerID ORDER BY OrderDate)
Hint: The second parameter is offset
*/

-- Write your query here:



GO

-- ============================================================================
-- LEVEL 4: FIRST_VALUE and LAST_VALUE (Questions 46-55)
-- Access first and last values in window frames
-- ============================================================================

/*
QUESTION 46: Show each product with the name of the cheapest product overall
Database: AdventureWorks2022
Table: Production.Product
Window Function: FIRST_VALUE(Name) OVER(ORDER BY ListPrice)
Hint: First product when ordered by price
*/

-- Write your query here:



GO

/*
QUESTION 47: Display each order with the customer's first order date
Database: AdventureWorks2022
Table: Sales.SalesOrderHeader
Window Function: FIRST_VALUE(OrderDate) OVER(PARTITION BY CustomerID ORDER BY OrderDate)
Hint: Each customer's first order
*/

-- Write your query here:



GO

/*
QUESTION 48: Show each product with the most expensive product in its subcategory
Database: AdventureWorks2022
Table: Production.Product
Window Function: FIRST_VALUE(Name) OVER(PARTITION BY ProductSubcategoryID ORDER BY ListPrice DESC)
*/

-- Write your query here:



GO

/*
QUESTION 49: Display last order date for each customer with every order
Database: AdventureWorks2022
Table: Sales.SalesOrderHeader
Window Function: LAST_VALUE(OrderDate) OVER(PARTITION BY CustomerID ORDER BY OrderDate ROWS BETWEEN CURRENT ROW AND UNBOUNDED FOLLOWING)
Hint: Need proper frame specification for LAST_VALUE
*/

-- Write your query here:



GO

/*
QUESTION 50: Show highest and lowest price product name in each category
Database: AdventureWorks2022
Tables: Production.Product, Production.ProductSubcategory
Window Functions: FIRST_VALUE(Name) with ORDER BY ListPrice DESC (highest)
                 FIRST_VALUE(Name) with ORDER BY ListPrice ASC (lowest)
Partition by CategoryID
*/

-- Write your query here:



GO

/*
QUESTION 51: Display each employee's hire date and the first hire date in their department
Database: AdventureWorks2022
Tables: HumanResources.Employee, HumanResources.EmployeeDepartmentHistory
Window Function: FIRST_VALUE(HireDate) OVER(PARTITION BY DepartmentID ORDER BY HireDate)
*/

-- Write your query here:



GO

/*
QUESTION 52: Show first and last sale amount for each sales person
Database: AdventureWorks2022
Table: Sales.SalesOrderHeader
Window Functions: FIRST_VALUE(TotalDue), LAST_VALUE(TotalDue)
PARTITION BY SalesPersonID ORDER BY OrderDate
Hint: ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING for LAST_VALUE
*/

-- Write your query here:



GO

/*
QUESTION 53: Find the initial list price for each product (from ProductListPriceHistory)
Database: AdventureWorks2022
Table: Production.ProductListPriceHistory
Window Function: FIRST_VALUE(ListPrice) OVER(PARTITION BY ProductID ORDER BY StartDate)
*/

-- Write your query here:



GO

/*
QUESTION 54: Show the most recent standard cost for each product with all cost history
Database: AdventureWorks2022
Table: Production.ProductCostHistory
Window Function: LAST_VALUE(StandardCost) OVER(PARTITION BY ProductID ORDER BY StartDate ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING)
*/

-- Write your query here:



GO

/*
QUESTION 55: Display first and last product name alphabetically in each subcategory
Database: AdventureWorks2022
Table: Production.Product
Window Functions: FIRST_VALUE(Name) OVER(PARTITION BY ProductSubcategoryID ORDER BY Name)
                 LAST_VALUE(Name) OVER(PARTITION BY ProductSubcategoryID ORDER BY Name ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING)
*/

-- Write your query here:



GO

-- ============================================================================
-- LEVEL 5: Frame Specifications - ROWS and RANGE (Questions 56-70)
-- Master window frames for precise calculations
-- ============================================================================

/*
QUESTION 56: Calculate 3-row moving average of product list prices
Database: AdventureWorks2022
Table: Production.Product
Window Function: AVG(ListPrice) OVER(ORDER BY ProductID ROWS BETWEEN 2 PRECEDING AND CURRENT ROW)
Hint: Current row + 2 previous rows = 3 rows
*/

-- Write your query here:



GO

/*
QUESTION 57: Compute running total of sales for current and all previous rows
Database: AdventureWorks2022
Table: Sales.SalesOrderHeader
Window Function: SUM(TotalDue) OVER(ORDER BY OrderDate ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW)
Hint: This is default behavior for ORDER BY
*/

-- Write your query here:



GO

/*
QUESTION 58: Calculate centered 5-day moving average of sales
Database: AdventureWorks2022
Table: Sales.SalesOrderHeader
Window Function: AVG(TotalDue) OVER(ORDER BY OrderDate ROWS BETWEEN 2 PRECEDING AND 2 FOLLOWING)
Hint: 2 before + current + 2 after = 5 rows
*/

-- Write your query here:



GO

/*
QUESTION 59: Show sum of current row and next 3 rows for order quantities
Database: AdventureWorks2022
Table: Sales.SalesOrderDetail
Window Function: SUM(OrderQty) OVER(ORDER BY SalesOrderDetailID ROWS BETWEEN CURRENT ROW AND 3 FOLLOWING)
*/

-- Write your query here:



GO

/*
QUESTION 60: Calculate running total within each customer, reset for each customer
Database: AdventureWorks2022
Table: Sales.SalesOrderHeader
Window Function: SUM(TotalDue) OVER(PARTITION BY CustomerID ORDER BY OrderDate ROWS UNBOUNDED PRECEDING)
*/

-- Write your query here:



GO

/*
QUESTION 61: Compute 7-period moving average of internet sales
Database: AdventureWorksDW2022
Table: dbo.FactInternetSales
Window Function: AVG(SalesAmount) OVER(ORDER BY OrderDateKey ROWS 6 PRECEDING)
Hint: 6 preceding + current = 7 rows
*/

USE AdventureWorksDW2022;
GO

-- Write your query here:



GO

/*
QUESTION 62: Calculate sum of all rows in partition (full partition sum)
Database: AdventureWorks2022
Table: Sales.SalesOrderDetail
Window Function: SUM(LineTotal) OVER(PARTITION BY SalesOrderID ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING)
Hint: Sum all rows in each order
*/

USE AdventureWorks2022;
GO

-- Write your query here:



GO

/*
QUESTION 63: Find maximum value in a sliding window of 10 rows
Database: AdventureWorks2022
Table: Production.ProductInventory
Window Function: MAX(Quantity) OVER(ORDER BY ProductID ROWS BETWEEN 4 PRECEDING AND 5 FOLLOWING)
*/

-- Write your query here:



GO

/*
QUESTION 64: Calculate cumulative percentage of total sales
Database: AdventureWorks2022
Table: Sales.SalesOrderHeader
Window Functions: SUM(TotalDue) OVER(ORDER BY OrderDate ROWS UNBOUNDED PRECEDING) / 
                 SUM(TotalDue) OVER(ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) * 100
*/

-- Write your query here:



GO

/*
QUESTION 65: Compute moving sum of previous 30 days of sales
Database: AdventureWorks2022
Table: Sales.SalesOrderHeader
Window Function: SUM(TotalDue) OVER(ORDER BY OrderDate RANGE BETWEEN INTERVAL 30 DAY PRECEDING AND CURRENT ROW)
Note: SQL Server doesn't support INTERVAL in RANGE, use ROWS instead or different approach
Alternative: Use ROWS and filter by date logic
*/

-- Write your query here:



GO

/*
QUESTION 66: Calculate standard deviation over a rolling 20-row window
Database: AdventureWorks2022
Table: Sales.SalesOrderDetail
Window Function: STDEV(UnitPrice) OVER(ORDER BY SalesOrderDetailID ROWS 19 PRECEDING)
*/

-- Write your query here:



GO

/*
QUESTION 67: Show cumulative count and percentage within each category
Database: AdventureWorks2022
Table: Production.Product with ProductSubcategory
Window Functions: COUNT(*) OVER(PARTITION BY CategoryID ORDER BY ListPrice ROWS UNBOUNDED PRECEDING)
Calculate percentage of category total
*/

-- Write your query here:



GO

/*
QUESTION 68: Find min and max in sliding window of 50 rows for inventory
Database: AdventureWorks2022
Table: Production.ProductInventory
Window Functions: MIN(Quantity), MAX(Quantity) 
OVER(ORDER BY ProductID ROWS BETWEEN 25 PRECEDING AND 24 FOLLOWING)
*/

-- Write your query here:



GO

/*
QUESTION 69: Calculate exponential moving average approximation
Database: AdventureWorks2022
Table: Sales.SalesOrderHeader
Window Function: AVG(TotalDue) OVER(ORDER BY OrderDate ROWS BETWEEN 9 PRECEDING AND CURRENT ROW)
Hint: Simple moving average as approximation (10 periods)
*/

-- Write your query here:



GO

/*
QUESTION 70: Compute variance over entire partition
Database: AdventureWorks2022
Table: HumanResources.EmployeePayHistory
Window Function: VAR(Rate) OVER(PARTITION BY EmployeeID ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING)
Hint: Variance of all pay rates per employee
*/

-- Write your query here:



GO

-- ============================================================================
-- LEVEL 6: Complex Combinations (Questions 71-85)
-- Multiple window functions, CTEs, and complex scenarios
-- ============================================================================

/*
QUESTION 71: Rank customers by total spent, show running total of top customers
Database: AdventureWorks2022
Table: Sales.SalesOrderHeader
Window Functions: RANK() and SUM() in same query
Steps: 1. Total per customer, 2. Rank, 3. Running total of ranked list
*/

-- Write your query here:



GO

/*
QUESTION 72: Find products with above-average prices in their subcategory
Database: AdventureWorks2022
Table: Production.Product
Window Function: AVG(ListPrice) OVER(PARTITION BY ProductSubcategoryID)
Filter: WHERE ListPrice > avg
*/

-- Write your query here:



GO

/*
QUESTION 73: Show sales rep performance vs territory average
Database: AdventureWorks2022
Table: Sales.SalesOrderHeader
Window Functions: SUM(TotalDue) per salesperson, AVG per territory
Hint: Partition differently for each calculation
*/

-- Write your query here:



GO

/*
QUESTION 74: Calculate percentile rank of products by price
Database: AdventureWorks2022
Table: Production.Product
Window Function: PERCENT_RANK() OVER(ORDER BY ListPrice)
Hint: Returns relative rank (0 to 1)
*/

-- Write your query here:



GO

/*
QUESTION 75: Find top 3 products by sales in each category
Database: AdventureWorks2022
Tables: Sales.SalesOrderDetail, Production.Product, Production.ProductSubcategory
Window Function: ROW_NUMBER() OVER(PARTITION BY CategoryID ORDER BY SUM(LineTotal) DESC)
Filter: WHERE row_number <= 3
*/

-- Write your query here:



GO

/*
QUESTION 76: Show cumulative distribution of order values
Database: AdventureWorks2022
Table: Sales.SalesOrderHeader
Window Function: CUME_DIST() OVER(ORDER BY TotalDue)
Hint: Cumulative distribution function
*/

-- Write your query here:



GO

/*
QUESTION 77: Calculate year-over-year sales growth using LAG
Database: AdventureWorksDW2022
Table: dbo.FactInternetSales with dbo.DimDate
Window Function: LAG(SalesAmount) OVER(PARTITION BY CustomerKey ORDER BY CalendarYear)
Aggregate by year first
*/

USE AdventureWorksDW2022;
GO

-- Write your query here:



GO

/*
QUESTION 78: Find products with largest price jump from previous product
Database: AdventureWorks2022
Table: Production.Product
Window Functions: LAG(ListPrice) OVER(ORDER BY ListPrice)
Calculate: ListPrice - LAG(ListPrice)
Order final results by price jump
*/

USE AdventureWorks2022;
GO

-- Write your query here:



GO

/*
QUESTION 79: Identify customers in top 20% by purchase value
Database: AdventureWorks2022
Table: Sales.SalesOrderHeader
Window Functions: NTILE(5) or PERCENT_RANK()
Group by customer, calculate total, then apply window function
*/

-- Write your query here:



GO

/*
QUESTION 80: Calculate moving correlation between quantity and price
Database: AdventureWorks2022
Table: Sales.SalesOrderDetail
Window Functions: Multiple aggregates over sliding window
Hint: This is complex - calculate components of correlation over 100 rows
*/

-- Write your query here:



GO

/*
QUESTION 81: Show each order's contribution to customer's total with running percentage
Database: AdventureWorks2022
Table: Sales.SalesOrderHeader
Window Functions: SUM() for total, running SUM(), percentage calculations
Partition by CustomerID
*/

-- Write your query here:



GO

/*
QUESTION 82: Find products that rank in top 5 by both price and weight
Database: AdventureWorks2022
Table: Production.Product
Window Functions: RANK() OVER(ORDER BY ListPrice DESC), RANK() OVER(ORDER BY Weight DESC)
Filter: Both ranks <= 5
*/

-- Write your query here:



GO

/*
QUESTION 83: Calculate retention rate using window functions
Database: AdventureWorks2022
Table: Sales.SalesOrderHeader
Window Functions: LEAD() to find next order, date calculations
Show: Customers who ordered again within 90 days
*/

-- Write your query here:



GO

/*
QUESTION 84: Show products with price higher than 80th percentile
Database: AdventureWorks2022
Table: Production.Product
Window Function: PERCENTILE_CONT(0.8) WITHIN GROUP (ORDER BY ListPrice) OVER()
Note: Or use PERCENT_RANK() and filter
*/

-- Write your query here:



GO

/*
QUESTION 85: Identify sales orders that are outliers (>2 std dev from mean)
Database: AdventureWorks2022
Table: Sales.SalesOrderHeader
Window Functions: AVG(TotalDue) OVER(), STDEV(TotalDue) OVER()
Filter: WHERE ABS(TotalDue - avg) > 2 * stdev
*/

-- Write your query here:



GO

-- ============================================================================
-- LEVEL 7: Advanced Analytics & Real-World Scenarios (Questions 86-100)
-- Complex business problems using window functions
-- ============================================================================

/*
QUESTION 86: Create a customer lifetime value calculation with running totals
Database: AdventureWorks2022
Table: Sales.SalesOrderHeader
Window Functions: SUM(TotalDue) OVER(PARTITION BY CustomerID ORDER BY OrderDate)
Also include: Days since first purchase, order frequency
*/

-- Write your query here:



GO

/*
QUESTION 87: Identify seasonal sales patterns using moving averages
Database: AdventureWorksDW2022
Table: dbo.FactInternetSales with dbo.DimDate
Window Function: AVG(SalesAmount) OVER(ORDER BY FullDateAlternateKey ROWS 29 PRECEDING)
Group by month, show 3-month moving average
*/

USE AdventureWorksDW2022;
GO

-- Write your query here:



GO

/*
QUESTION 88: Calculate customer churn risk based on order frequency changes
Database: AdventureWorks2022
Table: Sales.SalesOrderHeader
Window Functions: LAG(OrderDate), AVG(days_between_orders) over last 5 orders
Identify customers with increasing time between orders
*/

USE AdventureWorks2022;
GO

-- Write your query here:



GO

/*
QUESTION 89: Find products with consistent vs volatile pricing
Database: AdventureWorks2022
Table: Production.ProductListPriceHistory
Window Function: STDEV(ListPrice) OVER(PARTITION BY ProductID)
Also: Coefficient of variation = STDEV / AVG
*/

-- Write your query here:



GO

/*
QUESTION 90: Create ABC inventory classification using cumulative percentage
Database: AdventureWorks2022
Tables: Production.ProductInventory, Sales.SalesOrderDetail
Steps: Calculate value (inventory * price), rank, cumulative % of total value
A = 0-80%, B = 80-95%, C = 95-100%
*/

-- Write your query here:



GO

/*
QUESTION 91: Calculate sales momentum (acceleration/deceleration)
Database: AdventureWorks2022
Table: Sales.SalesOrderHeader
Window Functions: Multiple LAG() to get 3 previous periods
Calculate: (Current - Previous) - (Previous - 2nd Previous)
*/

-- Write your query here:



GO

/*
QUESTION 92: Identify cross-sell opportunities (products bought together)
Database: AdventureWorks2022
Table: Sales.SalesOrderDetail
Window Function: STRING_AGG() OVER(PARTITION BY SalesOrderID) or similar
Find products frequently in same orders
*/

-- Write your query here:



GO

/*
QUESTION 93: Calculate employee performance percentile within department
Database: AdventureWorks2022
Tables: HumanResources.Employee, Sales.SalesOrderHeader
Window Function: PERCENT_RANK() OVER(PARTITION BY DepartmentID ORDER BY total_sales)
Show: Each employee's percentile ranking
*/

-- Write your query here:



GO

/*
QUESTION 94: Detect anomalies in product sales using z-score
Database: AdventureWorks2022
Table: Sales.SalesOrderDetail
Window Functions: AVG(OrderQty) OVER(PARTITION BY ProductID),
                 STDEV(OrderQty) OVER(PARTITION BY ProductID)
Calculate: z-score = (OrderQty - avg) / stdev
Flag: ABS(z-score) > 3
*/

-- Write your query here:



GO

/*
QUESTION 95: Create cohort analysis of customers by first purchase month
Database: AdventureWorks2022
Table: Sales.SalesOrderHeader
Window Functions: FIRST_VALUE(OrderDate) for cohort
Calculate: Retention in subsequent months using LAG/LEAD
*/

-- Write your query here:



GO

/*
QUESTION 96: Calculate product affinity scores
Database: AdventureWorks2022
Table: Sales.SalesOrderDetail
Window Functions: COUNT() OVER(PARTITION BY ProductID)
Find: Products with high co-occurrence in orders
*/

-- Write your query here:



GO

/*
QUESTION 97: Identify basket size trends over time
Database: AdventureWorks2022
Tables: Sales.SalesOrderHeader, Sales.SalesOrderDetail
Window Function: AVG(items_per_order) OVER(ORDER BY OrderDate ROWS 999 PRECEDING)
Show: Moving average of basket size (1000 orders)
*/

-- Write your query here:



GO

/*
QUESTION 98: Calculate customer purchase cycle and predict next order
Database: AdventureWorks2022
Table: Sales.SalesOrderHeader
Window Functions: LAG() for previous orders, AVG() of days between orders
Predict: Expected next order date based on average cycle
*/

-- Write your query here:



GO

/*
QUESTION 99: Segment customers using RFM analysis with window functions
Database: AdventureWorks2022
Table: Sales.SalesOrderHeader
Window Functions: NTILE() for Recency, Frequency, Monetary scores
Calculate: R = days since last order, F = order count, M = total value
Create: 5 quintiles for each dimension
*/

-- Write your query here:



GO

/*
QUESTION 100: Master query - Complete sales dashboard with multiple window functions
Database: AdventureWorks2022
Tables: Sales.SalesOrderHeader, Sales.SalesOrderDetail, Production.Product
Window Functions to include:
- Running total of sales
- Rank of products by revenue
- % contribution to total
- Moving average (30 days)
- YoY growth using LAG
- Top 10 products by category
- Customer lifetime value
- Order frequency trends

This combines everything you've learned!
*/

-- Write your query here:



GO

-- ============================================================================
-- HELPER QUERIES & TIPS
-- ============================================================================

/*
-- WINDOW FUNCTION SYNTAX REMINDER:
FUNCTION() OVER (
    [PARTITION BY column1, column2, ...]
    [ORDER BY column1 [ASC|DESC], ...]
    [ROWS | RANGE frame_specification]
)

-- COMMON FRAME SPECIFICATIONS:
ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW    -- Default with ORDER BY
ROWS BETWEEN 5 PRECEDING AND 5 FOLLOWING            -- Sliding window of 11 rows
ROWS BETWEEN CURRENT ROW AND UNBOUNDED FOLLOWING    -- Current to end
ROWS UNBOUNDED PRECEDING                            -- All previous rows
ROWS 10 PRECEDING                                   -- Previous 10 rows + current

-- RANKING FUNCTIONS:
ROW_NUMBER() - Unique sequential number (1, 2, 3, 4, 5...)
RANK()       - Rank with gaps for ties (1, 2, 2, 4, 5...)
DENSE_RANK() - Rank without gaps (1, 2, 2, 3, 4...)
NTILE(n)     - Divide into n groups

-- AGGREGATE WINDOW FUNCTIONS:
SUM(), AVG(), COUNT(), MIN(), MAX()
STDEV(), VAR(), STDEVP(), VARP()

-- OFFSET FUNCTIONS:
LAG(column, offset, default)
LEAD(column, offset, default)
FIRST_VALUE(column)
LAST_VALUE(column)

-- DISTRIBUTION FUNCTIONS:
PERCENT_RANK()    -- Relative rank (0 to 1)
CUME_DIST()       -- Cumulative distribution
PERCENTILE_CONT() -- Continuous percentile
PERCENTILE_DISC() -- Discrete percentile
*/

/*
-- CHECK YOUR WORK:
-- Always verify your window function results make sense
-- Test with small datasets first (TOP 100)
-- Use ORDER BY to see patterns clearly
-- Check partition boundaries
-- Verify frame specifications give expected results
*/

/*
-- PERFORMANCE TIPS:
-- Window functions can be expensive - use appropriate indexes
-- Consider materializing complex calculations in temp tables
-- Partition on indexed columns when possible
-- Limit result sets during development
-- Use OPTION (RECOMPILE) if parameter sniffing is an issue
*/

/*
-- COMMON PATTERNS:

-- 1. TOP N PER GROUP:
WITH RankedData AS (
    SELECT *, ROW_NUMBER() OVER(PARTITION BY GroupColumn ORDER BY ValueColumn DESC) as rn
    FROM TableName
)
SELECT * FROM RankedData WHERE rn <= 3;

-- 2. RUNNING TOTAL:
SELECT *, SUM(Amount) OVER(ORDER BY Date ROWS UNBOUNDED PRECEDING) as RunningTotal
FROM Sales;

-- 3. MOVING AVERAGE:
SELECT *, AVG(Value) OVER(ORDER BY Date ROWS BETWEEN 6 PRECEDING AND CURRENT ROW) as MA_7
FROM TimeSeries;

-- 4. PREVIOUS/NEXT VALUE:
SELECT *, 
    LAG(Value) OVER(ORDER BY Date) as PreviousValue,
    LEAD(Value) OVER(ORDER BY Date) as NextValue
FROM Data;

-- 5. PERCENTAGE OF TOTAL:
SELECT *, 
    Value * 100.0 / SUM(Value) OVER() as PercentOfTotal
FROM Sales;
*/

-- ============================================================================
-- VALIDATION QUERIES
-- ============================================================================

/*
-- Verify understanding of ROW_NUMBER vs RANK vs DENSE_RANK:
SELECT 
    Name,
    ListPrice,
    ROW_NUMBER() OVER(ORDER BY ListPrice DESC) as RowNum,
    RANK() OVER(ORDER BY ListPrice DESC) as Rank,
    DENSE_RANK() OVER(ORDER BY ListPrice DESC) as DenseRank
FROM Production.Product
WHERE ListPrice > 0
ORDER BY ListPrice DESC;

-- Verify frame specification:
SELECT TOP 20
    SalesOrderID,
    OrderDate,
    TotalDue,
    SUM(TotalDue) OVER(ORDER BY OrderDate ROWS UNBOUNDED PRECEDING) as RunningTotal,
    AVG(TotalDue) OVER(ORDER BY OrderDate ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) as MA_3,
    COUNT(*) OVER(ORDER BY OrderDate ROWS UNBOUNDED PRECEDING) as RunningCount
FROM Sales.SalesOrderHeader
ORDER BY OrderDate;

-- Verify LAG and LEAD:
SELECT TOP 20
    ProductID,
    OrderDate,
    TotalDue,
    LAG(TotalDue) OVER(ORDER BY OrderDate) as PreviousOrder,
    LEAD(TotalDue) OVER(ORDER BY OrderDate) as NextOrder,
    TotalDue - LAG(TotalDue) OVER(ORDER BY OrderDate) as Difference
FROM Sales.SalesOrderHeader
ORDER BY OrderDate;
*/

-- ============================================================================
-- PRACTICE COMPLETION CHECKLIST
-- ============================================================================

/*
After completing all 100 questions, you should be able to:

☐ Use all ranking functions (ROW_NUMBER, RANK, DENSE_RANK, NTILE)
☐ Apply aggregate functions with OVER clause
☐ Use PARTITION BY to create groups
☐ Use ORDER BY in window functions
☐ Access previous/next rows with LAG/LEAD
☐ Get first/last values with FIRST_VALUE/LAST_VALUE
☐ Specify window frames with ROWS and RANGE
☐ Combine multiple window functions in one query
☐ Solve real business problems with window functions
☐ Optimize window function queries for performance

CONGRATULATIONS! You're now a window function expert! 🎉
*/

-- ============================================================================
-- END OF PRACTICE QUESTIONS
-- Master window functions and unlock advanced SQL analytics! 🚀
-- ============================================================================
