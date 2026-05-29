/* =========================
   CREATE TABLE
   ========================= */

USE [retail_sales_stg]
GO

CREATE TABLE dim_date (
    date_key        INT PRIMARY KEY,     -- YYYYMMDD
    full_date       DATE,
    year            INT,
    quarter         INT,
    month           INT,
    month_name      VARCHAR(20),
    day             INT,
    day_name        VARCHAR(20),
    day_of_week     INT,
    is_weekend      BIT
);


/* =========================
   LOAD DATA 
   RANGE: 2024-01-01 TO 2025-12-31
   ========================= */

WITH date_cte AS (
    SELECT CAST('2024-01-01' AS DATE) AS d

    UNION ALL

    SELECT DATEADD(DAY, 1, d)
    FROM date_cte
    WHERE d < '2025-12-31'
)

INSERT INTO dim_date (
    date_key,
    full_date,
    year,
    quarter,
    month,
    month_name,
    day,
    day_name,
    day_of_week,
    is_weekend
)

SELECT
    CAST(CONVERT(VARCHAR(8), d, 112) AS INT) AS date_key,   -- YYYYMMDD
    d AS full_date,
    YEAR(d) AS year,
    DATEPART(QUARTER, d) AS quarter,
    MONTH(d) AS month,
    DATENAME(MONTH, d) AS month_name,
    DAY(d) AS day,
    DATENAME(WEEKDAY, d) AS day_name,
    DATEPART(WEEKDAY, d) AS day_of_week,

    CASE
        WHEN DATEPART(WEEKDAY, d) IN (1, 7) THEN 1
        ELSE 0
    END AS is_weekend

FROM date_cte

OPTION (MAXRECURSION 731);