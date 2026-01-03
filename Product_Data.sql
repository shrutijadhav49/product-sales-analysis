SELECT * FROM product_db.product_data;


-- 1. Display all product records
SELECT * FROM product_data;

-- 2. Total number of products
SELECT COUNT(DISTINCT ProductID) AS Total_Products
FROM product_data;

-- 3. Show all unique categories
SELECT DISTINCT Category
FROM product_data;

-- 4. Total quantity sold
SELECT SUM(Quantity) AS Total_Quantity_Sold
FROM product_data;

-- 5. Products sold in a specific year (example: 2024)
SELECT *
FROM product_data
WHERE Year = 2024;

-- 6. Category-wise total quantity sold
SELECT Category, SUM(Quantity) AS Total_Quantity
FROM product_data
GROUP BY Category;

-- 7. Month-wise sales count
SELECT Month, COUNT(ProductID) AS Sales_Count
FROM product_data
GROUP BY Month;

-- 8. Total selling amount
SELECT 
SUM(CAST(Selling_Price AS DECIMAL(10,2)) * Quantity) AS Total_Sales
FROM product_data;

-- 9. Products with discount applied
SELECT Product, Discount
FROM product_data
WHERE Discount <> '0';

-- 10. Sales count by Sales_Type
SELECT Sales_Type, COUNT(*) AS Total_Sales
FROM product_data
GROUP BY Sales_Type;

-- 11. Profit per product
SELECT Product,
(CAST(Selling_Price AS DECIMAL(10,2)) - CAST(Buying_Price AS DECIMAL(10,2))) * Quantity AS Profit
FROM product_data;

-- 12. Top 5 products by quantity sold
SELECT Product, SUM(Quantity) AS Total_Quantity
FROM product_data
GROUP BY Product
ORDER BY Total_Quantity DESC
LIMIT 5;

-- 13. Year-wise total sales
SELECT Year,
SUM(CAST(Selling_Price AS DECIMAL(10,2)) * Quantity) AS Yearly_Sales
FROM product_data
GROUP BY Year;

-- 14. Target vs actual sales
SELECT Product,
SUM(CAST(SellingPrice
 AS DECIMAL(10,2)) * Quantity) AS Actual_Sales,
Target
FROM product_data
GROUP BY Product, Target;


-- 15. Day-wise sales quantity (highest first)
SELECT Day, SUM(Quantity) AS Total_Quantity
FROM product_data
GROUP BY Day
ORDER BY Total_Quantity DESC;
