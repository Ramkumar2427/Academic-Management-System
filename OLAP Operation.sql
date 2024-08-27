-- OLAP Operation
CREATE DATABASE sales_data;
use sales_data;

CREATE TABLE sales_sample (
    Product_Id INT,
    Region VARCHAR(50),
    Date DATE,
    Sales_Amount NUMERIC
);
INSERT INTO sales_sample (Product_Id, Region, Date, Sales_Amount) VALUES
(1, 'East', '2024-04-01', 420),
(2, 'West', '2024-04-02', 380),
(3, 'North', '2024-04-03', 320),
(4, 'South', '2024-04-04', 290),
(1, 'East', '2024-05-01', 550),
(2, 'West', '2024-05-02', 460),
(3, 'North', '2024-05-03', 410),
(4, 'South', '2024-05-04', 370),
(1, 'East', '2024-06-01', 600),
(2, 'West', '2024-06-02', 530);

SELECT Region, Product_Id, SUM(Sales_Amount) AS Total_Sales
FROM sales_sample
GROUP BY Region, Product_Id
ORDER BY Region;

SELECT 
    COALESCE(Region, 'All Regions') AS Region,
    COALESCE(CAST(Product_Id AS CHAR), 'Total') AS Product,
    SUM(Sales_Amount) AS Total_Sales
FROM sales_sample
GROUP BY Region, Product_Id WITH ROLLUP
ORDER BY Region, Product;



-- For a specific region:
SELECT *
FROM sales_sample
WHERE Region = 'East';


-- For a specific date range:
SELECT *
FROM sales_sample
WHERE Date BETWEEN '2024-04-01' AND '2024-05-01';

SELECT *
FROM sales_sample
WHERE Region IN ('East', 'West') AND Product_Id IN (1, 2) AND Date BETWEEN '2024-04-01' AND '2024-05-01';



