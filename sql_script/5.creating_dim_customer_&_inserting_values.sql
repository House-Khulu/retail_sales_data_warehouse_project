--------------------------------------------------
--creating dim_customer table with the primary key
--------------------------------------------------

IF NOT EXISTS (
    SELECT *
    FROM sys.tables
    WHERE name = 'dim_customer'
)
BEGIN
     CREATE TABLE [retail_sales_stg].[dbo].[dim_customer](
     [customer_key] INT IDENTITY (1,1) PRIMARY KEY NOT NULL,
     [customer_id] VARCHAR (50) NOT NULL,
     [customer_segment] VARCHAR (50) NOT NULL,
     [loyalty_tier] VARCHAR (50) NOT NULL

);
END;

-----------------------
-- Inserting the values
-----------------------

INSERT INTO [retail_sales_stg].[dbo].[dim_customer](
            [customer_id],
            [customer_segment],
            [loyalty_tier]
)

SELECT DISTINCT 
            (LTRIM(RTRIM(customer_id))) AS customer_id,
            (LTRIM(RTRIM(customer_segment))) AS customer_segment,
            (LTRIM(RTRIM(loyalty_tier))) AS loyalty_tier

FROM [retail_sales_stg].[dbo].[retail_sales_raw];

--------------------
-- View dim_customer 
--------------------

SELECT * FROM [retail_sales_stg].[dbo].[dim_customer]