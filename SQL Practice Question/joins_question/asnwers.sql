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
SELECT 
    p.ProductID,
    p.name as ProductName,
    ps.Name as SubcategoryName
FROM Production.Product AS p 
INNER JOIN Production.ProductSubcategory AS ps 
ON p.ProductSubcategoryID = ps.ProductSubcategoryID
ORDER BY ProductID ASC ;
GO

/*
QUESTION 2: Display all employees with their job titles
Database: AdventureWorks2022
Tables: HumanResources.Employee, Person.Person
Join Column: BusinessEntityID
*/

-- Write your query here:
SELECT 
    COALESCE(pp.FirstName , '') + ' ' + COALESCE(pp.LastName , '') AS EmployeeName ,
    hre.JobTitle 
FROM HumanResources.Employee AS hre
INNER JOIN person.Person as pp 
ON hre.BusinessEntityID = pp.BusinessEntityID 
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

SELECT 
    ssh.SalesOrderID,
    ssh.OrderDate,
    ssh.TotalDue,
    CONCAT(sc.FirstName, ' ', sc.LastName) AS CustomerName
FROM SalesLT.SalesOrderHeader AS ssh
INNER JOIN SalesLT.Customer AS sc
    ON ssh.CustomerID = sc.CustomerID;

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
SELECT 
    ppm.Name AS ProductModelName ,
    pp.Name AS ProudctName 
FROM Production.Product AS pp 
INNER JOIN Production.ProductModel AS ppm 
ON pp.ProductModelID = ppm.ProductModelID 
ORDER BY ppm.Name ASC
GO

/*
QUESTION 5: Display all addresses with their address type description
Database: AdventureWorks2022
Tables: Person.BusinessEntityAddress, Person.AddressType
Join Column: AddressTypeID
*/

-- Write your query here:
SELECT 
    pbea.BusinessEntityID ,
    pat.Name AS AddressTypeName
FROM Person.BusinessEntityAddress AS pbea 
INNER JOIN Person.AddressType as pat 
ON pbea.AddressTypeID = pat.AddressTypeID

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
SELECT 
    p.Name AS ProductName  ,
    sod.*
FROM SalesLT.SalesOrderDetail AS sod 
INNER JOIN SalesLT.Product AS p
ON  sod.ProductID = p.ProductID 

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
SELECT 
    pc.Name AS ProductCategory ,
    psc.name AS ProductSubcategory ,
    p.Name AS ProudctName
FROM Production.Product AS p
LEFT JOIN Production.ProductSubcategory AS psc 
    ON psc.ProductSubcategoryID = p.ProductSubcategoryID
LEFT JOIN Production.ProductCategory AS pc 
    ON pc.ProductCategoryID = psc.ProductCategoryID
ORDER BY pc.Name , psc.Name , p.Name
GO

/*
QUESTION 8: Display all employees with their department names
Database: AdventureWorks2022
Tables: HumanResources.Employee, HumanResources.EmployeeDepartmentHistory, HumanResources.Department
Chain: Employee → EmployeeDepartmentHistory → Department
Note: Use EndDate IS NULL for current department
*/

-- Write your query here:
SELECT 
    e.BusinessEntityID ,
    e.HireDate ,
    e.JobTitle ,
    d.Name AS DepartmentName ,
    d.GroupName AS DepartmentGroupName
FROM HumanResources.Employee AS e 
INNER JOIN HumanResources.EmployeeDepartmentHistory AS edh 
ON e.BusinessEntityID = edh.BusinessEntityID AND edh.EndDate IS NULL
INNER JOIN HumanResources.Department AS d  
ON edh.DepartmentID = d.DepartmentID 

GO
