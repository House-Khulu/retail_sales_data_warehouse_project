-----------------------------------------------------
--creating dim_salesperson table with the primary key
-----------------------------------------------------

IF NOT EXISTS (
    SELECT *
    FROM sys.tables
    WHERE name = 'dim_salesperson'
)
BEGIN
     CREATE TABLE [retail_sales_stg].[dbo].[dim_salesperson](
                  [salesperson_key] INT IDENTITY (1,1) PRIMARY KEY NOT NULL,
                  [salesperson_id] VARCHAR (50) NOT NULL,
                  [salesperson_department] VARCHAR (50) NOT NULL
                  
);
END;

-------------------
-- Inserting Values
-------------------

INSERT INTO [retail_sales_stg].[dbo].[dim_salesperson](
            [salesperson_id],
            [salesperson_department]

)

SELECT DISTINCT 
            (LTRIM(RTRIM(salesperson_id))) AS salesperson_id,
            (LTRIM(RTRIM(salesperson_department))) AS salesperson_department

FROM [retail_sales_stg].[dbo].[retail_sales_raw];

-----------------------
-- View dim_salesperson
----------------------

SELECT * FROM [retail_sales_stg].[dbo].[dim_salesperson];