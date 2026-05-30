---------------------------
-- Create fact_sales table
---------------------------

IF NOT EXISTS (
    SELECT *
    FROM sys.tables
    WHERE name = 'fact_sales'
)
BEGIN

    CREATE TABLE [retail_sales_stg].[dbo].[fact_sales](

        [sales_id] INT IDENTITY(1,1) PRIMARY KEY NOT NULL,

        ---------------------
        -- Date Foreign Keys
        ---------------------

        [purchase_date_key] INT NOT NULL,
        [ship_date_key] INT NULL,
        [return_date_key] INT NULL,
        
        -------------------------
        -- Dimension Foreign Keys
        -------------------------

        [location_key] INT NULL,
        [customer_key] INT NULL,
        [store_key] INT NULL,
        [product_key] INT NULL,
        [order_indicator_key] INT NULL,
        [promotion_key] INT NULL,
        [salesperson_key] INT NULL,

        ------------
        -- Measures
        ------------

        [order_id] VARCHAR (50) NOT NULL,
        [unit_price] DECIMAL (12,2) NOT NULL,
        [discount_amount] DECIMAL (12,2) NOT NULL,
        [tax_amount] DECIMAL (12,2) NOT NULL,
        [shipping_cost] DECIMAL (12,2) NOT NULL,
        [net_sales] DECIMAL (12,2) NOT NULL,
        [COGS] DECIMAL (12,2) NOT NULL,
        [gross_profit] DECIMAL (12,2) NOT NULL,
        [unit_cost] DECIMAL (12,2) NOT NULL,
        [quantity] INT NOT NULL,

        --------------------------
        -- Foreign Key Constraints
        --------------------------

        CONSTRAINT fk_purchase_date
        FOREIGN KEY (purchase_date_key)
        REFERENCES [retail_sales_stg].[dbo].[dim_date](date_key),

        CONSTRAINT fk_ship_date
        FOREIGN KEY (ship_date_key)
        REFERENCES [retail_sales_stg].[dbo].[dim_date](date_key),

        CONSTRAINT fk_return_date
        FOREIGN KEY (return_date_key)
        REFERENCES [retail_sales_stg].[dbo].[dim_date](date_key),

        CONSTRAINT fk_location
        FOREIGN KEY (location_key)
        REFERENCES [retail_sales_stg].[dbo].[dim_location](location_key),

        CONSTRAINT fk_customer
        FOREIGN KEY (customer_key)
        REFERENCES [retail_sales_stg].[dbo].[dim_customer](customer_key),

        CONSTRAINT fk_store
        FOREIGN KEY (store_key)
        REFERENCES [retail_sales_stg].[dbo].[dim_store](store_key),

        CONSTRAINT fk_product
        FOREIGN KEY (product_key)
        REFERENCES [retail_sales_stg].[dbo].[dim_product](product_key),

        CONSTRAINT fk_order_indicator
        FOREIGN KEY (order_indicator_key)
        REFERENCES [retail_sales_stg].[dbo].[dim_order_indicators](order_indicator_key),

        CONSTRAINT fk_promotion
        FOREIGN KEY (promotion_key)
        REFERENCES [retail_sales_stg].[dbo].[dim_promotion](promotion_key),

        CONSTRAINT fk_salesperson
        FOREIGN KEY (salesperson_key)
        REFERENCES [retail_sales_stg].[dbo].[dim_salesperson](salesperson_key)

        );
        END;


------------------------------
-- Insert data into fact_sales
------------------------------

INSERT INTO [retail_sales_stg].[dbo].[fact_sales](

            [purchase_date_key],
            [ship_date_key],
            [return_date_key],
  
            [location_key],
            [customer_key],
            [store_key],
            [product_key],
            [order_indicator_key],
            [promotion_key],
            [salesperson_key],

            
            [order_id],
            [unit_price],
            [discount_amount],
            [tax_amount],
            [shipping_cost],
            [net_sales],
            [COGS],
            [gross_profit],
            [unit_cost],
            [quantity] 

)

SELECT DISTINCT

----------------
-- Purchase Date
----------------

    CAST(
        CONVERT(
            VARCHAR(8),
            TRY_CAST(r.purchase_date AS DATE),
            112
        ) AS INT
    ) AS purchase_date_key,

------------
-- Ship Date
------------

  CAST(
        CONVERT(
            VARCHAR(8),
            TRY_CAST(r.ship_date AS DATE),
            112
        ) AS INT
    ) AS ship_date_key,


--------------
-- Return Date
--------------

  CAST(
        CONVERT(
            VARCHAR(8),
            TRY_CAST(r.return_date AS DATE),
            112
        ) AS INT
    ) AS return_date_key,


    -------------------------
    -- Dimension Foreign Keys
    -------------------------

    dl.location_key,
    dc.customer_key,
    ds.store_key,
    dp.product_key,
    doi.order_indicator_key,
    dpr.promotion_key,
    dsp.salesperson_key,

    -----------
    -- Measures
    -----------

    r.order_id,
    r.unit_price,
    r.discount_amount,
    r.tax_amount,
    r.shipping_cost,
    r.net_sales,
    r.COGS,
    r.gross_profit,
    r.unit_cost,
    r.quantity
    
FROM [retail_sales_stg].[dbo].[retail_sales_raw] r


----------------
-- Location Join
----------------

INNER JOIN [retail_sales_stg].[dbo].[dim_location] dl

ON (LTRIM(RTRIM(r.continent))) =
   dl.continent

AND (LTRIM(RTRIM(r.country))) =
    dl.country

AND (LTRIM(RTRIM(r.city))) =
    dl.city

----------------
-- Customer Join
----------------

INNER JOIN [retail_sales_stg].[dbo].[dim_customer] dc

ON (LTRIM(RTRIM(r.customer_id))) =
   dc.customer_id

AND (LTRIM(RTRIM(r.customer_segment))) =
    dc.customer_segment

AND (LTRIM(RTRIM(r.loyalty_tier))) =
    dc.loyalty_tier

-------------
-- Store Join
-------------

INNER JOIN [retail_sales_stg].[dbo].[dim_store] ds

ON (LTRIM(RTRIM(r.store_id))) =
   ds.store_id

AND (LTRIM(RTRIM(r.store_name))) =
    ds.store_name

AND (LTRIM(RTRIM(r.store_type))) =
    ds.store_type

---------------
-- Product Join
--------------

INNER JOIN [retail_sales_stg].[dbo].[dim_product] dp

ON (LTRIM(RTRIM(r.product_id))) =
   dp.product_id

AND (LTRIM(RTRIM(r.SKU))) =
    dp.SKU

AND (LTRIM(RTRIM(r.product_name))) =
    dp.product_name

AND (LTRIM(RTRIM(r.category))) =
    dp.category

AND (LTRIM(RTRIM(r.subcategory))) =
    dp.subcategory

AND (LTRIM(RTRIM(r.brand))) =
    dp.brand

------------------------
-- Order Indicators Join
------------------------

INNER JOIN [retail_sales_stg].[dbo].[dim_order_indicators] doi

ON (LTRIM(RTRIM(r.returned))) =
   doi.returned

AND (LTRIM(RTRIM(r.channel))) =
    doi.channel

AND (LTRIM(RTRIM(r.priority))) =
    doi.priority

AND (LTRIM(RTRIM(r.payment_method))) =
    doi.payment_method


-----------------
-- Promotion Join
-----------------

INNER JOIN [retail_sales_stg].[dbo].[dim_promotion] dpr

ON (LTRIM(RTRIM(r.promotion_id))) =
   dpr.promotion_id

AND (LTRIM(RTRIM(r.promotion_name))) =
    dpr.promotion_name


-------------------
-- Salesperson Join
-------------------

INNER JOIN [retail_sales_stg].[dbo].[dim_salesperson] dsp

ON (LTRIM(RTRIM(r.salesperson_id))) =
   dsp.salesperson_id

AND (LTRIM(RTRIM(r.salesperson_department))) =
    dsp.salesperson_department;

-------------------
-- View Fact Table
------------------

SELECT * FROM [retail_sales_stg].[dbo].[fact_sales];



























