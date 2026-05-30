--------------------------------------------------
--creating dim_location table with the primary key
--------------------------------------------------

IF NOT EXISTS (
    SELECT *
    FROM sys.tables
    WHERE name = 'dim_location'
)
BEGIN
    CREATE TABLE [retail_sales_stg].[dbo].[dim_location](
        [location_key] INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
        [continent] NVARCHAR(250) NOT NULL,
        [country] NVARCHAR(250) NOT NULL,
        [city] NVARCHAR(250) NOT NULL
    );
END;

-------------------------------------
-- Inserting values into dim_location
-------------------------------------
INSERT INTO [retail_sales_stg].[dbo].[dim_location](
        [continent],
        [country],
        [city]
)

SELECT DISTINCT

        (LTRIM(RTRIM(continent))) AS continent,
        (LTRIM(RTRIM(country))) AS country,
        (LTRIM(RTRIM(city))) AS city

FROM [retail_sales_stg].[dbo].[retail_sales_raw];

------------------------
-- Viewing dim-location
-----------------------

SELECT * FROM [retail_sales_stg].[dbo].[dim_location];