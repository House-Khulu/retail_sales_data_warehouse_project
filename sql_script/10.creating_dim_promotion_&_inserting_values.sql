---------------------------------------------------
--creating dim_promotion table with the primary key
---------------------------------------------------

IF NOT EXISTS (
    SELECT *
    FROM sys.tables
    WHERE name = 'dim_promotion'
)
BEGIN
     CREATE TABLE [retail_sales_stg].[dbo].[dim_promotion](
                  [promotion_key] INT IDENTITY (1,1) PRIMARY KEY NOT NULL,
                  [promotion_id] VARCHAR (50) NOT NULL,
                  [promotion_name] VARCHAR (50) NOT NULL

);
END;

-------------------
-- Insering Values
-------------------

INSERT INTO [retail_sales_stg].[dbo].[dim_promotion](
            [promotion_id],
            [promotion_name]

)

SELECT DISTINCT 
            (LTRIM(RTRIM(promotion_id))) AS promotion_id,
            (LTRIM(RTRIM(promotion_name))) AS promotion_name

FROM [retail_sales_stg].[dbo].[retail_sales_raw];

---------------------
-- View dim_promotion
---------------------

SELECT * FROM [retail_sales_stg].[dbo].[dim_promotion];