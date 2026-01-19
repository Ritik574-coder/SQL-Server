CREATE TABLE dbo.CustomersImports
(
    FirstName   VARCHAR(50),
    LastName    VARCHAR(50),
    Country     VARCHAR(50),
    Email       VARCHAR(255),
    Phone       VARCHAR(20),
    Address     VARCHAR(255)
)
WITH (HEAP);
GO

TRUNCATE TABLE dbo.CustomersImports;
GO

BULK INSERT dbo.CustomersImports
FROM '\\ServerName\Share\customer\data\Customers.csv'
WITH
(
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0A',
    FIELDQUOTE = '"',
    TABLOCK,
    BATCHSIZE = 500000,
    ERRORFILE = '\\ServerName\Share\customer\data\Customers_error.log',
    MAXERRORS = 1000,
    CODEPAGE = '65001'
);
