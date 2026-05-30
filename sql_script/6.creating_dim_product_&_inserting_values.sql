--------------------------------------------------
--creating dim_product table with the primary key
--------------------------------------------------

IF NOT EXISTS (
    SELECT *
    FROM sys.tables
    WHERE name = 'dim_product'
)
BEGIN
     CREATE TABLE [retail_sales_stg].[dbo].[dim_product](
                  [product_key] INT IDENTITY (1,1) PRIMARY KEY NOT NULL,
                  [product_id] VARCHAR (50) NOT NULL,
                  [SKU] VARCHAR (50) NOT NULL,
                  [product_name] VARCHAR (100) NOT NULL,
                  [category] VARCHAR (50) NOT NULL,
                  [subcategory] VARCHAR (50) NOT NULL,
                  [brand] VARCHAR (50) NOT NULL

);
END;

-------------------
-- inserting values
-------------------

INSERT INTO [retail_sales_stg].[dbo].[dim_product](
            [product_id],
            [SKU],
            [product_name],
            [category],
            [subcategory],
            [brand]

)

SELECT DISTINCT 
            (LTRIM(RTRIM(product_id))) AS product_key,
            (LTRIM(RTRIM(SKU))) AS SKU,
            (LTRIM(RTRIM(product_name))) AS product_name,
            (LTRIM(RTRIM(category))) AS category,
            (LTRIM(RTRIM(subcategory))) AS subcategory,
            (LTRIM(RTRIM(brand))) AS brand

FROM [retail_sales_stg].[dbo].[retail_sales_raw];

-------------------
-- View dim_product
-------------------

SELECT * FROM [retail_sales_stg].[dbo].[dim_product];