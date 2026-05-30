----------------------------------------------------------
--creating dim_order_indicators table with the primary key
----------------------------------------------------------

IF NOT EXISTS (
    SELECT *
    FROM sys.tables
    WHERE name = 'dim_order_indicators'
)
BEGIN
     CREATE TABLE [retail_sales_stg].[dbo].[dim_order_indicators](
                  [order_indicator_key] INT IDENTITY (1,1) PRIMARY KEY NOT NULL,
                  [returned] VARCHAR (50) NOT NULL,
                  [channel] VARCHAR (50) NOT NULL,
                  [priority] VARCHAR (50) NOT NULL,
                  [payment_method] VARCHAR (50) NOT NULL

);
END;

-------------------
-- Inserting Values
-------------------

INSERT INTO [retail_sales_stg].[dbo].[dim_order_indicators](
            [returned],
            [channel],
            [priority],
            [payment_method]

)

SELECT DISTINCT 
            (LTRIM(RTRIM(returned))) AS returned,
            (LTRIM(RTRIM(Channel))) AS channel,
            (LTRIM(RTRIM(priority))) AS priority,
            (LTRIM(RTRIM(payment_method))) AS payment_method

FROM [retail_sales_stg].[dbo].[retail_sales_raw];

--------------------------
--View dim_order_indicator
--------------------------

SELECT * FROM [retail_sales_stg].[dbo].[dim_order_indicators];