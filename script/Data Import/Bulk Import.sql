--=============================================================
-- Rule 1: When Everything is Well for Medium Data Import
--=============================================================

BULK INSERT [dbo].[Customers]
FROM 'C:\Temp\Red30Tech_Customers.csv'
WITH (
    FIELDTERMINATOR = ',',   -- CSV delimiter
    ROWTERMINATOR  = '\n',   -- Windows CSV files often use \r\n
    FIRSTROW       = 2       -- Skip header row
);

--======================================================================
-- Rule 2: Medium Data Import (Best Way with Staging Table)
--======================================================================

CREATE TABLE Staging_Customers (
    FirstName NVARCHAR(50),
    LastName  NVARCHAR(50),
    Address   NVARCHAR(100),
    City      NVARCHAR(50),
    State     VARCHAR(50)
);

TRUNCATE TABLE Staging_Customers;

BULK INSERT Staging_Customers
FROM 'C:\Temp\Red30Tech_Customers.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR  = '\n',
    FIRSTROW       = 2
);

TRUNCATE TABLE Customers;

INSERT INTO Customers (FirstName, LastName, Address, City, State)
SELECT FirstName, LastName, Address, City, State
FROM Staging_Customers;

--========================================================
-- Rule 3: For Big Data Import
--========================================================

-- Step 1: Create view for bulk import
CREATE VIEW dbo.vCustomersImport
AS
SELECT 
    FirstName,
    LastName,
    Address,
    City,
    State
FROM dbo.Customers;

-- Fast path settings (optional but recommended)
ALTER DATABASE BigData SET RECOVERY BULK_LOGGED;  -- or SIMPLE during load

-- Optional: disable nonclustered indexes for speed
-- ALTER INDEX ALL ON dbo.Customers DISABLE;

-- Optional: disable triggers during bulk load (if you have UpdatedDate trigger)
-- DISABLE TRIGGER TRG_Customers_UpdateDate ON dbo.Customers;

-- Clear existing data (only if you intend a full refresh)
TRUNCATE TABLE dbo.Customers;

-- High-performance bulk insert into the view
BULK INSERT dbo.vCustomersImport
FROM 'C:\Temp\Red30Tech_Customers.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR  = '\n',        -- try '\n' if your file is LF only
    FIRSTROW       = 2,
    TABLOCK,                       -- minimal logging + speed
    BATCHSIZE     = 500000,        -- tune per I/O; 500k–1M good starting range
    ROWS_PER_BATCH = 500000,       -- hint for optimizer
    KEEPNULLS,                     -- keep NULLs as-is
    ERRORFILE     = 'C:\Temp\bulk_errors_Customers.log',
    MAXERRORS     = 1000           -- tolerate some bad rows without aborting
);

-- Optional: re-enable indexes
-- ALTER INDEX ALL ON dbo.Customers REBUILD WITH (ONLINE = ON);

-- Optional: re-enable trigger
-- ENABLE TRIGGER TRG_Customers_UpdateDate ON dbo.Customers;

-- Optional: switch recovery model back after load
-- ALTER DATABASE BigData SET RECOVERY FULL;

--========================================================
-- Rule 4: For Small Table
--========================================================

TRUNCATE TABLE dbo.Customers;  -- Purana data clear

BULK INSERT dbo.vCustomersImport   -- view jisme CustomerID skip hai
FROM 'C:\Temp\Red30Tech_Customers.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR  = '\r\n',
    FIRSTROW       = 2,
    TABLOCK,                  -- speed boost
    BATCHSIZE     = 1000,     -- har batch me 1000 rows commit
    ROWS_PER_BATCH = 1000     -- optimizer ko hint
);

--========================================================
-- Another Example
--========================================================

TRUNCATE TABLE dbo.Customers;

BULK INSERT dbo.vCustomersImport   -- view jisme CustomerID skip hai
FROM 'C:\Data\Red30Tech_Customers.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR  = '\r\n',
    FIRSTROW       = 2,
    TABLOCK,
    BATCHSIZE     = 500000,
    ROWS_PER_BATCH = 500000,
    KEEPNULLS,
    CODEPAGE      = '65001',
    ERRORFILE     = 'C:\Data\bulk_errors_Customers.log',
    MAXERRORS     = 1000
);

