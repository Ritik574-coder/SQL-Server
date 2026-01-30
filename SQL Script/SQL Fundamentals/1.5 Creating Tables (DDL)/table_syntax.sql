-- Dropping table store.employee_info if eixsts
IF OBJECT_ID('store.employee_info' , 'U') IS NOT NULL
BEGIN
    PRINT '>>> Dropping Table if Exists........' ;
    DROP TABLE store.employee_info ;
END ; 
GO 

-- Creating Table store.employee_info 
PRINT '>>> Creating Table store.employee_info.........' ;
CREATE TABLE store.employee_info
(
--  Column definitions 
    employee_id    INT IDENTITY(1,1) PRIMARY KEY  ,
    employee_key   NVARCHAR(30) NOT NULL , 

    first_name     NVARCHAR(100) NOT NULL , 
    last_name      NVARCHAR(100) NOT NULL , 
    city           NVARCHAR(100) NOT NULL , 
    email_id       NVARCHAR(255) UNIQUE NOT NULL, 
    date_of_birth  DATE NOT NULL ,
    age            SMALLINT NOT NULL CHECK (age BETWEEN 18 AND 50),

    insert_d_time  DATETIME2(3) NOT NULL DEFAULT SYSUTCDATETIME()
)  ;
GO
