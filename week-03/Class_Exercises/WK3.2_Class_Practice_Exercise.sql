USE northwind;

/* 1. Write a query to list ProductID, ProductName, UnitPrice, and UnitsInStock from
the Products table. Order the results by UnitPrice from highest to lowest. */

SELECT ProductID, ProductName, UnitPrice, UnitsInStock
FROM products;

/* 2. Write a query to list all customers. Order them first by Country (A–Z),
then by CompanyName (A–Z) within each country. */

SELECT CustomerID, CompanyName, ContactName, Country
FROM customers
ORDER BY Country ASC, CompanyName ASC;

/* 3. Write a query that counts the total number of products in each category.
Display the CategoryID and the count, labeling the count ProductCount.
Order the results so the category with the most products appears first. */

SELECT CategoryID, COUNT(ProductID) AS ProductCount
FROM products
GROUP BY CategoryID
ORDER BY ProductCount DESC;

/* 4. Write a query against the Order Details table that calculates the total revenue per order. 
Total revenue for a line is UnitPrice × Quantity × (1 − Discount). Label the total Revenue and 
display it alongside OrderID. Order the results by Revenue from largest to smallest. */

SELECT OrderID, ROUND(SUM(UnitPrice * Quantity * (1 - Discount)), 2) AS Revenue
FROM `order details`
GROUP BY OrderID
Order BY Revenue DESC;

/* 5. Write a query to list the number of orders placed by each employee. Show EmployeeID and 
label the count OrderCount. Only include employees who have handled more than 50 orders. 
Order by OrderCount, largest first. */

SELECT EmployeeID, COUNT(OrderID) AS OrderCount
FROM orders
GROUP BY EmployeeID
HAVING COUNT(OrderID) >= 50
ORDER BY OrderCount DESC;

/* 6. Write a query that lists each shipper (ShipVia) and counts the number of orders assigned
to them. Label the count OrderCount. Order results by ShipperID ascending. */

SELECT ShipVia AS ShipperID, COUNT(OrderID) AS OrderCount
FROM orders
GROUP BY ShipVia
ORDER BY ShipperID ASC;

/* 7. List every product together with the name of its category. Display ProductID, 
ProductName, and CategoryName. Order alphabetically by CategoryName, 
then by ProductName within each category. */

SELECT ProductID, ProductName, CategoryName
FROM products
JOIN categories USING (CategoryID)
ORDER BY CategoryName ASC, ProductName ASC;

/* 8. Write a query that shows each order and the company name of the customer who placed it.
Display OrderID, OrderDate, and CompanyName. Order by OrderDate from most recent to oldest. */

SELECT OrderID, OrderDate, CompanyName
FROM orders
JOIN customers USING (CustomerID)
ORDER BY OrderDate DESC;

/* 9. Write a query that calculates the average unit price of products in each category.
Display CategoryName and the average price labeled AvgPrice, rounded to 2 decimal places.
Only show categories where the average price is greater than $20. Order by AvgPrice descending. */

SELECT CategoryName, ROUND(AVG(UnitPrice), 2) AS AvgPrice
FROM categories
JOIN products USING (CategoryID)
GROUP BY CategoryID
HAVING AvgPrice > 20
ORDER BY AvgPrice DESC;

/* 10. Write a query that lists each employee's full name along with the total number of orders
they have processed. Show FullName (combined FirstName + LastName) and OrderCount. Only include
employees who have processed at least 70 orders. Order by OrderCount descending,
then by FullName ascending. */

SELECT EmployeeID, CONCAT(FirstName, ' ', LastName) AS FullName,
COUNT(OrderID) AS OrderCount
FROM employees
JOIN orders USING (EmployeeID)
GROUP BY EmployeeID
HAVING OrderCount >= 70
ORDER BY OrderCount DESC;