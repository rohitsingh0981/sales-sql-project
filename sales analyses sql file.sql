create database salesDB;
use salesDB;
CREATE TABLE sales_data (
    Sale_ID INT PRIMARY KEY,
    Date DATE,
    Product_ID VARCHAR (20),
    Region VARCHAR(20),
    Customer_Segment VARCHAR(20),
    Units_Sold INT,
    Sales_Amount FLOAT,
    Profit FLOAT
    );
SELECT*from sales_data;
create table if not exists product_data (
Product_id varchar(20) primary key,
Product_name varchar(20),
Category varchar(50)
);
SELECT*from product_data;
ALTER TABLE product_data
modify Product_id VARCHAR(100);
SELECT * FROM sales_data LIMIT 10;
SELECT * FROM product_data LIMIT 10;

# Total Sales and Profit
SELECT 
  SUM(Sales_Amount) AS Total_Sales,
  SUM(Profit) AS Total_Profit
FROM sales_data;
# Monthly Sales Trend
SELECT 
  DATE_FORMAT(Date, '%Y-%m') AS Month,
  SUM(Sales_Amount) AS Monthly_Sales,
  SUM(Profit) AS Monthly_Profit
FROM sales_data
GROUP BY Month
ORDER BY Month;
#Sales by Region
SELECT 
  Region,
  SUM(Sales_Amount) AS Total_Sales
FROM sales_data
GROUP BY Region
ORDER BY Total_Sales DESC;
# Sales by Product
SELECT 
  p.Product_Name,
  SUM(s.Sales_Amount) AS Revenue
FROM sales_data s
JOIN product_data p ON s.Product_ID = p.Product_ID
GROUP BY p.Product_Name
ORDER BY Revenue DESC
;
#Sales by Customer Segment
SELECT 
  Customer_Segment,
  SUM(Sales_Amount) AS Total_Sales
FROM sales_data
GROUP BY Customer_Segment;
#Top 5 Profitable Products
SELECT 
  p.Product_Name,
  SUM(s.Profit) AS Total_Profit
FROM sales_data s
JOIN product_data p ON s.Product_ID = p.Product_ID
GROUP BY p.Product_Name
ORDER BY Total_Profit DESC
LIMIT 5;











