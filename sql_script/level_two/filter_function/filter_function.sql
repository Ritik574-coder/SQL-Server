--################################################################################################
--########################### SQL DATA FILTER FUNCTION PREPARE ###################################
--################################################################################################
-- FUNCTION USE
-- WHERE , AND, OR, NOT, IN, NOT IN, BETWEEN, LIKE, TOP, IS NULL, IS NOT NULL, EXIST, ALL, ANY, SOME, DISTINCT, ORDER BY,
-- GROU BY, HAVIN, OFFSET, PATINDEX, CHARINDEX

/*
QUESTION 1: Retrieve TOP 100 orders where CustomerID BETWEEN 50 AND 200 AND CustomerID NOT IN (60,70,80) ORDER BY CustomerID DESC
Database: WideWorldImporters
Tables: Sales.Orders
*/
SELECT TOP 100 
    OrderID,
    CustomerID,
    SalespersonPersonID,
    PickedByPersonID,
    ContactPersonID,
    BackorderOrderID,
    OrderDate,
    ExpectedDeliveryDate
FROM Sales.Orders 
WHERE CustomerID BETWEEN 50 AND 200 
AND CustomerID NOT IN (60,70,80)
ORDER BY CustomerID DESC ;

 /*
QUESTION 2: Find orders where CustomerPurchaseOrderNumber LIKE '1%' AND CustomerPurchaseOrderNumber LIKE '%4%' AND CustomerPurchaseOrderNumber NOT LIKE '%9%'
Database: WideWorldImporters
Tables: Sales.Orders
*/
SELECT 
    OrderID,
    CustomerID,
    CustomerPurchaseOrderNumber,
    OrderDate,
    ExpectedDeliveryDate
FROM Sales.Orders
WHERE CustomerPurchaseOrderNumber LIKE '1%'
  AND CustomerPurchaseOrderNumber LIKE '%4%'
  AND CustomerPurchaseOrderNumber NOT LIKE '%9%';

 /*
QUESTION 3: Retrieve orders where PickingCompletedWhen IS NULL AND CustomerID IN (10,20,30,40,50)
Database: WideWorldImporters
Tables: Sales.Orders
*/
SELECT 
    OrderID,
    CustomerID,
    CustomerPurchaseOrderNumber,
    OrderDate,
    ExpectedDeliveryDate,
    PickingCompletedWhen
FROM Sales.Orders
WHERE PickingCompletedWhen IS NULL 
AND CustomerID IN (10,20,30,40,50) ;
 /*
QUESTION 4: Find orders where PickingCompletedWhen IS NOT NULL AND CustomerID NOT BETWEEN 100 AND 200
Database: WideWorldImporters
Tables: Sales.Orders
*/
SELECT 
    OrderID,
    CustomerID,
    CustomerPurchaseOrderNumber,
    OrderDate,
    ExpectedDeliveryDate,
    PickingCompletedWhen
FROM Sales.Orders
WHERE PickingCompletedWhen IS NOT NULL
AND CustomerID BETWEEN 100 AND 200 ;

 /*
QUESTION 5: Retrieve DISTINCT CustomerID where CustomerID BETWEEN 1 AND 300 AND CustomerID NOT IN (5,15,25,35)
Database: WideWorldImporters
Tables: Sales.Orders
*/
SELECT DISTINCT 
CustomerID
FROM Sales.Orders
WHERE CustomerID BETWEEN 1 AND 300 
    AND CustomerID IS NOT NULL
    AND CustomerID NOT IN(5,15,25,35);
    
 /*
QUESTION 6: Find orders where CustomerPurchaseOrderNumber contains 'PO' using CHARINDEX AND also contains '2'
Database: WideWorldImporters
Tables: Sales.Orders
*/

 /*
QUESTION 7: Retrieve orders where CustomerPurchaseOrderNumber has at least one digit using PATINDEX AND does not contain '0'
Database: WideWorldImporters
Tables: Sales.Orders
*/

 /*
QUESTION 8: Find orders where CustomerID < 50 OR CustomerID > 300 AND CustomerID NOT IN (1,2,3,4)
Database: WideWorldImporters
Tables: Sales.Orders
*/

 /*
QUESTION 9: Retrieve orders where CustomerID BETWEEN 100 AND 200 AND CustomerPurchaseOrderNumber IS NOT NULL AND NOT LIKE '%5%'
Database: WideWorldImporters
Tables: Sales.Orders
*/

 /*
QUESTION 10: Find orders where CustomerPurchaseOrderNumber LIKE '%PO%' AND LIKE '%3%' AND LIKE '%4%'
Database: WideWorldImporters
Tables: Sales.Orders
*/

 /*
QUESTION 11: Retrieve orders grouped by CustomerID HAVING COUNT(*) > 5 AND CustomerID NOT IN (10,20)
Database: WideWorldImporters
Tables: Sales.Orders
*/

 /*
QUESTION 12: Find CustomerID groups where COUNT(*) BETWEEN 3 AND 10 AND CustomerID BETWEEN 50 AND 200
Database: WideWorldImporters
Tables: Sales.Orders
*/

 /*
QUESTION 13: Retrieve orders where CustomerID IN (SELECT DISTINCT CustomerID) -- simulate logic without subquery using DISTINCT + GROUP BY thinking
Database: WideWorldImporters
Tables: Sales.Orders
*/

 /*
QUESTION 14: Find orders where CustomerPurchaseOrderNumber contains '1', '2', and '3' but NOT '8'
Database: WideWorldImporters
Tables: Sales.Orders
*/

 /*
QUESTION 15: Retrieve orders ordered by CustomerID ASC OFFSET 20 ROWS FETCH NEXT 30 ROWS ONLY where CustomerID BETWEEN 1 AND 500
Database: WideWorldImporters
Tables: Sales.Orders
*/

 /*
QUESTION 16: Find orders where CustomerID NOT IN (100,200,300) AND CustomerID BETWEEN 50 AND 400 AND PickingCompletedWhen IS NULL
Database: WideWorldImporters
Tables: Sales.Orders
*/

 /*
QUESTION 17: Retrieve orders where CustomerPurchaseOrderNumber LIKE 'P%' AND NOT LIKE '%Z%' AND contains at least one digit
Database: WideWorldImporters
Tables: Sales.Orders
*/

 /*
QUESTION 18: Find orders where CustomerID BETWEEN 10 AND 500 AND NOT (CustomerID BETWEEN 100 AND 200)
Database: WideWorldImporters
Tables: Sales.Orders
*/

 /*
QUESTION 19: Retrieve DISTINCT CustomerID ORDER BY CustomerID DESC OFFSET 10 ROWS FETCH NEXT 50 ROWS ONLY
Database: WideWorldImporters
Tables: Sales.Orders
*/

 /*
QUESTION 20: Find orders where CustomerPurchaseOrderNumber contains 'PO' AND does not contain '1' AND does not contain '2'
Database: WideWorldImporters
Tables: Sales.Orders
*/

 /*
QUESTION 21: Retrieve orders where CustomerID BETWEEN 1 AND 100 AND CustomerID NOT IN (SELECT TOP 10 CustomerID ORDER BY CustomerID) -- think logic without subquery
Database: WideWorldImporters
Tables: Sales.Orders
*/

 /*
QUESTION 22: Find orders where CustomerPurchaseOrderNumber LIKE '%A%' OR LIKE '%B%' AND NOT LIKE '%C%'
Database: WideWorldImporters
Tables: Sales.Orders
*/

 /*
QUESTION 23: Retrieve orders where CustomerID BETWEEN 100 AND 300 AND CustomerID IN (150,160,170,180,190)
Database: WideWorldImporters
Tables: Sales.Orders
*/

 /*
QUESTION 24: Find orders where CustomerPurchaseOrderNumber contains numeric pattern AND contains 'PO' AND NOT LIKE '%7%'
Database: WideWorldImporters
Tables: Sales.Orders
*/

 /*
QUESTION 25: Retrieve orders grouped by CustomerID HAVING COUNT(*) > 2 AND COUNT(*) < 10
Database: WideWorldImporters
Tables: Sales.Orders
*/

 /*
QUESTION 26: Find orders where CustomerID NOT BETWEEN 200 AND 400 AND CustomerID IN (10,20,30,40,50)
Database: WideWorldImporters
Tables: Sales.Orders
*/

 /*
QUESTION 27: Retrieve orders where CustomerPurchaseOrderNumber LIKE '%X%' AND LIKE '%Y%' AND LIKE '%Z%'
Database: WideWorldImporters
Tables: Sales.Orders
*/

 /*
QUESTION 28: Find orders where CustomerID BETWEEN 50 AND 150 AND CustomerID NOT IN (60,70,80,90)
Database: WideWorldImporters
Tables: Sales.Orders
*/

 /*
QUESTION 29: Retrieve orders where CustomerID BETWEEN 1 AND 500 ORDER BY CustomerID DESC OFFSET 100 ROWS FETCH NEXT 50 ROWS ONLY
Database: WideWorldImporters
Tables: Sales.Orders
*/

 /*
QUESTION 30: Find orders where CustomerPurchaseOrderNumber contains 'PO', contains at least one digit, and does not contain '0'
Database: WideWorldImporters
Tables: Sales.Orders
*/
SELECT 
    CountryID,
    CountryName,
    FormalName,
    IsoAlpha3Code,
    IsoNumericCode,
    CountryType,
    LatestRecordedPopulation,
    Continent,
    Region,
    Subregion
FROM Application.Countries ;

SELECT * FROM INFORMATION_SCHEMA.TABLES ;
SELECT
    TABLE_CATALOG,
    TABLE_SCHEMA,
    TABLE_NAME,
    COLUMN_NAME,
    DATA_TYPE,
    ORDINAL_POSITION,
    IS_NULLABLE 
FROM INFORMATION_SCHEMA.COLUMNS 
WHERE TABLE_SCHEMA = 'Application'
AND TABLE_NAME = 'Countries';

SELECT TOP 1000 * FROM Sales.Orders ;
SELECT TOP 1000 * FROM Sales.OrderLines ;
SELECT TOP 1000 * FROM Sales.Invoices ;


SELECT TOP 10 * FROM  Application.People ;
SELECT TOP 10 * FROM Application.Cities ;
SELECT TOP 10 * FROM Application.Countries ;

SELECT * FROM Application.Countries 
WHERE CountryType IN ('UN Member State') ;
