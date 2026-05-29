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
3 distinct Continents */


SELECT DISTINCT [Country] FROM [retail_sales_stg].[dbo].[retail_sales_raw];

/* Insight:
4 distinct Countries */


SELECT DISTINCT [City] FROM [retail_sales_stg].[dbo].[retail_sales_raw];

/* Insight:
15 distinct Cities */

------------------------------------------------------------
--Checking the distinct store_ids, store_name and store_type
-----------------------------------------------------------

SELECT DISTINCT [store_id] FROM [retail_sales_stg].[dbo].[retail_sales_raw]
ORDER BY [store_id] ASC;

SELECT DISTINCT [store_name] FROM [retail_sales_stg].[dbo].[retail_sales_raw];

SELECT DISTINCT [store_type] FROM [retail_sales_stg].[dbo].[retail_sales_raw];

/*Insight: 
21 distinct store_ids
21 distinct store_names
4 distinct store_types */

--------------------------------------------------------
--Checking distinct Channel, Priority and Payment_method
--------------------------------------------------------

SELECT DISTINCT [channel] FROM [retail_sales_stg].[dbo].[retail_sales_raw];

SELECT DISTINCT [priority] FROM [retail_sales_stg].[dbo].[retail_sales_raw];

SELECT DISTINCT [payment_method] FROM [retail_sales_stg].[dbo].[retail_sales_raw];


/*Insight:
3 distinct channels
3 distinct priority
5 distinct payment method */


-------------------------------------------------------
--Checking for distinct promotion_id and promotion_name
-------------------------------------------------------

SELECT DISTINCT [promotion_id] FROM [retail_sales_stg].[dbo].[retail_sales_raw];

SELECT DISTINCT [promotion_name] FROM [retail_sales_stg].[dbo].[retail_sales_raw];

/*Insight:
5 promotion_ids
5 promotion_names */

-----------------------------------------------------------------------
--Checking for distinct customer_ids, customer_segment and loyalty_tier
-----------------------------------------------------------------------

SELECT DISTINCT [customer_id] FROM [retail_sales_stg].[dbo].[retail_sales_raw]
ORDER BY [customer_id] ASC;


SELECT DISTINCT [customer_segment] FROM [retail_sales_stg].[dbo].[retail_sales_raw];

SELECT DISTINCT [loyalty_tier] FROM [retail_sales_stg].[dbo].[retail_sales_raw];

/*Insight:
1175 distinct customer_ids
5 distinct customer_segments
4 distinct loyalty_tier */

-------------------------------------------------------------
--Checking distinct salesperson_id and salesperson_department
-------------------------------------------------------------

SELECT DISTINCT [salesperson_id] FROM [retail_sales_stg].[dbo].[retail_sales_raw]
ORDER BY [salesperson_id] ASC;

SELECT DISTINCT [salesperson_department] FROM [retail_sales_stg].[dbo].[retail_sales_raw];

/*Insight:
70 distinct salesperson_ids
4 distinct salesperson_department */

-------------------------
/*Checking for distinct 
product_id, 
stock_keeping_unit(SKU), 
product_name,
catergory,
subcatergory
brand */
-------------------------

SELECT DISTINCT [product_id] FROM [retail_sales_stg].[dbo].[retail_sales_raw]
ORDER BY [product_id] ASC;

SELECT DISTINCT [SKU] FROM [retail_sales_stg].[dbo].[retail_sales_raw]
ORDER BY [SKU] ASC;

SELECT DISTINCT [product_name] FROM [retail_sales_stg].[dbo].[retail_sales_raw];

SELECT DISTINCT [category] FROM [retail_sales_stg].[dbo].[retail_sales_raw];

SELECT DISTINCT [subcategory] FROM [retail_sales_stg].[dbo].[retail_sales_raw];

SELECT DISTINCT [brand] FROM [retail_sales_stg].[dbo].[retail_sales_raw];

/*Insight:
180 distinct product_ids
180 distinct SKU
99 distinct product_names
4 distinct categories
13 distinct subcategories
18 distinct brands */

SELECT DISTINCT [order_id] FROM [retail_sales_stg].[dbo].[retail_sales_raw];



































































