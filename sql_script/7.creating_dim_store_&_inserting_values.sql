--------------------------------------------------
--creating dim_store table with the primary key
--------------------------------------------------

IF NOT EXISTS (
    SELECT *
    FROM sys.tables
    WHERE name = 'dim_store'
)
BEGIN
     CREATE TABLE [retail_sales_stg].[dbo].[dim_store](
                  [store_key] INT IDENTITY (1,1) PRIMARY KEY NOT NULL,
                  [store_id] VARCHAR (50) NOT NULL,
                  [Store_name] VARCHAR (100) NOT NULL,
                  [store_type] VARCHAR (50) NOT NULL

);
END;

-------------------
-- Inserting values
-------------------

INSERT INTO [retail_sales_stg].[dbo].[dim_store](
            [store_id],
            [store_name],
            [store_type]

 )

 SELECT DISTINCT 
            (LTRIM(RTRIM(store_id))) AS store_id,
            (LTRIM(RTRIM(store_name))) AS store_name,
            (LTRIM(RTRIM(store_type))) AS store_type

 FROM [retail_sales_stg].[dbo].[retail_sales_raw];

 -----------------
 -- View dim_store
 -----------------

 SELECT * FROM [retail_sales_stg].[dbo].[dim_store];