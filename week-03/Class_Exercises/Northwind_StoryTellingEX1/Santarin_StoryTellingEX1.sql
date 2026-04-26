USE northwind;

-- #1 
SELECT c.CategoryName,
SUM(od.Quantity * od.UnitPrice * (1 - od.Discount)) AS Total_Revenue,
COUNT(DISTINCT o.OrderID) AS Total_Orders,
AVG(od.Quantity * od.UnitPrice * (1 - od.Discount)) AS Average_Order_Value,
SUM( od.Quantity) AS Total_Units_Sold
FROM categories c
JOIN products p ON p.categoryID - c.categoryID
JOIN `order details` od ON od.ProductID = p.ProductID
JOIN orders o ON o.OrderID = od.OrderID
GROUP BY c.CategoryName
ORDER BY Total_Revenue DESC;

-- #2
SELECT YEAR(o.OrderDate) AS Year,
MONTH(o.OrderDate) AS Month,
DATE_FORMAT(o.OrderDate, '%b') AS MonthName,
SUM(od.Quantity * od.UnitPrice * (1 - od.Discount)) AS Total_Revenue,
COUNT(DISTINCT o.OrderID) AS Num_Orders
FROM orders o
JOIN `order details` od ON od.OrderID = o.OrderID
GROUP BY Year, Month, MonthName
ORDER BY Year, Month;

-- #3
SELECT CONCAT(e.FirstName, ' ', e.LastName) AS Employee,
SUM(od.Quantity * od.UnitPrice * (1 - od.Discount)) AS Total_Revenue,
COUNT(DISTINCT o.OrderID) AS Orders_Handled,
AVG(od.Quantity * od.UnitPrice * (1 - od.Discount)) AS AVG_Revenue_per_Order,
MIN(od.Quantity * od.UnitPrice * (1 - od.Discount)) AS Min_Order_Value,
MAX(od.Quantity * od.UnitPrice * (1 - od.Discount)) AS Max_Order_Value
FROM Employees e
JOIN orders o ON o.EmployeeID = e.EmployeeID
JOIN `order details` od ON od.OrderID = o.OrderID
GROUP BY e.EmployeeID, e.FirstName, e.LastName
ORDER BY Total_Revenue DESC;

-- #4
SELECT o.ShipCountry,
SUM(od.Quantity * od.UnitPrice * (1 - od.Discount)) AS Total_Revenue,
COUNT(DISTINCT o.OrderID) AS Num_Orders,
AVG(o.Freight) AS Avg_Freight,
SUM(o.Freight) AS Total_Freight_Cost
FROM orders o
JOIN `order details` od ON od.OrderID = o.OrderID
GROUP BY o.ShipCountry
HAVING Total_Revenue > 10000
ORDER BY Total_Revenue DESC
LIMIT 10;

-- #5
SELECT c.CategoryName,
SUM(CASE WHEN YEAR(o.OrderDate) = 1997
THEN od.Quantity * od.UnitPrice * (1 - od.Discount)
ELSE 0 END) AS Revenue_1997,
SUM(CASE WHEN YEAR(o.OrderDate) = 1998
THEN od.Quantity * od.UnitPrice * (1 - od.Discount)
ELSE 0 END) AS Revenue_1998,
SUM(od.Quantity * od.UnitPrice * (1 - od.Discount)) AS Total_Revenue,
ROUND((SUM(CASE WHEN YEAR(o.OrderDate) = 1998
THEN od.Quantity * od.UnitPrice * (1 - od.Discount)
ELSE 0 END) -
SUM(CASE WHEN YEAR(o.OrderDate) = 1997
THEN od.Quantity * od.UnitPrice * (1 - od.Discount)
ELSE 0 END)) /
NULLIF(SUM(CASE WHEN YEAR(o.OrderDate) = 1997
THEN od.Quantity * od.UnitPrice * (1 - od.Discount)
ELSE 0 END), 0) * 100, 
1) AS YoY_Growth_Pct
FROM categories c
JOIN products p ON p.CategoryID = c.CategoryID
JOIN `order details` od ON od.ProductID = p.ProductID
JOIN orders o ON o.OrderID = od.OrderID
GROUP BY c.CategoryName
ORDER BY Total_Revenue DESC;