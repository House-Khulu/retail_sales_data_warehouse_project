SELECT [Order_ID]
      ,[Purchase_Date]
      ,[Ship_Date]
      ,[Returned]
      ,[Return_Date]
      ,[Continent]
      ,[Country]
      ,[City]
      ,[Store_ID]
      ,[Store_Name]
      ,[Store_Type]
      ,[Channel]
      ,[Priority]
      ,[Payment_Method]
      ,[Promotion_ID]
      ,[Promotion_Name]
      ,[Customer_ID]
      ,[Customer_Segment]
      ,[Loyalty_Tier]
      ,[Salesperson_ID]
      ,[Salesperson_Department]
      ,[Product_ID]
      ,[SKU]
      ,[Product_Name]
      ,[Category]
      ,[Subcategory]
      ,[Brand]
      ,[Quantity]
      ,[Unit_Cost]
      ,[Unit_Price]
      ,[Discount_Amount]
      ,[Tax_Amount]
      ,[Shipping_Cost]
      ,[Gross_Sales]
      ,[Net_Sales]
      ,[COGS]
      ,[Gross_Profit]
  FROM [retail_sales_stg].[dbo].[retail_sales_raw]

  ------------------------------------------------
  --Checking the number of records on the dataset 
  ------------------------------------------------

  SELECT * FROM [retail_sales_stg].[dbo].[retail_sales_raw];

  -----------------------------------------------------------
  --checking the minimum and maximum different types of dates
  -----------------------------------------------------------
SELECT 
    MIN(purchase_date) AS min_purchase_date,
    MAX(purchase_date) AS max_purchase_date,

    MIN(ship_date) AS min_ship_date,
    MAX(ship_date) AS max_ship_date,

    MIN(return_date) AS min_return_date,
    MAX(return_date) AS max_return_date

  FROM [retail_sales_stg].[dbo].[retail_sales_raw];

/*
--Insight:
From the three dates I have discovered that
the minimum date is *2024-01-01* and maximum date is *2025-01-15* */



--------------------------------------------------------
--Counting the number of ship, purchase and return dates
--------------------------------------------------------

SELECT  
      COUNT(ship_date) AS number_of_ship_dates,
      COUNT(purchase_date) AS number_of_purchase_dates,
      COUNT(return_date) AS number_of_return_dates

FROM [retail_sales_stg].[dbo].[retail_sales_raw]
;

/*
Insight: 
-purchase_date has 5000 sales
-ship_dates has 2458 sales
-and the returns are 229 */


-----------------------------
--Checking distinct locations
-----------------------------

SELECT DISTINCT [Continent] FROM [retail_sales_stg].[dbo].[retail_sales_raw];

/* Insight:
Three distinct Continents */


SELECT DISTINCT [Country] FROM [retail_sales_stg].[dbo].[retail_sales_raw];

/* Insight:
Four distinct Countries */


SELECT DISTINCT [City] FROM [retail_sales_stg].[dbo].[retail_sales_raw];

/* Insight:
Fifteen distinct Cities */






































































