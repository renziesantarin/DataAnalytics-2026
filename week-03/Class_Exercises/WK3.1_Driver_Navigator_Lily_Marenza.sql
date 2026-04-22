USE northwind;


-- 1
SELECT CategoryID, CategoryName, Description
FROM categories;

-- 2
SELECT ProductID, ProductName, QuantityPerUnit
FROM Products
WHERE QuantityPerUnit LIKE '%Box%';

-- 3
SELECT Discontinued, ProductID, ProductName
FROM Products
WHERE Discontinued = 1;

-- 4
SELECT CONCAT(FirstName, ' ' ,LastName) AS 'Full Name', Title
FROM Employees;

-- 5
SELECT CustomerID, CompanyName, Country
FROM Customers
WHERE Country IN ('Germany', 'France');

-- 6
SELECT COUNT(OrderID)
FROM Orders;

-- 7
SELECT SupplierID, CompanyName, ContactName, ContactTitle
FROM Suppliers
WHERE ContactTitle IN ('Sales Representative', 'Sales Manager');

-- 8
SELECT OrderID, CustomerID, ShipCountry, ShippedDate
FROM Orders
WHERE ShipCountry = 'USA';

-- 9
SELECT OrderID, CustomerID, RequiredDate, ShippedDate
FROM Orders
WHERE ShippedDate > RequiredDate;

-- 10
SELECT ProductID, ProductName, UnitsInStock, ReorderLevel, Discontinued
FROM Products
WHERE UnitsInStock <= ReorderLevel AND Discontinued = 0;