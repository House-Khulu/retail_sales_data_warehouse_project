-----------------------------------------
--Creating two databases for Retail Sales
-----------------------------------------

IF NOT EXISTS (SELECT * FROM sys.databases 
WHERE NAME = 'retail_sales_stg')
BEGIN
     CREATE DATABASE [retail_sales_stg]
END;


IF NOT EXISTS (SELECT * FROM sys.databases 
WHERE NAME = 'retail_sales_dwh')
BEGIN
     CREATE DATABASE [retail_sales_dwh]
END;