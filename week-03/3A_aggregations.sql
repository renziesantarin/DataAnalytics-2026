USE northwind;

/* 1. Write a query to find the price of the cheapest item that Northwind sells. Then write a
second query to find the name of the product that has that price. */

SELECT MIN(UnitPrice) AS CheapestPrice
FROM products; -- $2.5000

SELECT ProductName, UnitPrice
FROM products
WHERE UnitPrice = (SELECT MIN(UnitPrice) FROM products); -- Geitost

-- 2. Write a query to find the average price of all items that Northwind sells.

SELECT AVG(UnitPrice) AS AveragePrice
FROM products; -- $28.86636364

SELECT ROUND(AVG(UnitPrice), 2) AS AveragePrice
FROM products; -- $28.87

/* 3. Write a query to find the price of the most expensive item that Northwind sells. Then
write a second query to find the name of the product with that price, plus the name of
the supplier for that product. */

SELECT ROUND(MAX(UnitPrice), 2) AS HighestPrice
FROM products; -- $263.50

SELECT ProductName, UnitPrice, CompanyName AS Supplier
FROM products
JOIN suppliers USING (SupplierID)
WHERE UnitPrice = (SELECT MAX(UnitPrice) FROM products);
-- Cte de Blaye / Supplier: Aux joyeux ecclsiastiques

-- 4. Write a query to find total monthly payroll (the sum of all the employees’ monthly salaries).

SELECT ROUND(SUM(Salary), 2) AS MonthlySalary
FROM employees; -- $20362.93

/* 5. Write a query to identify the highest salary and the lowest salary amounts which any
employee makes. */

SELECT ROUND(MAX(Salary), 2) AS HighestSalary,
ROUND(MIN(Salary), 2) AS LowestSalary
FROM employees; -- Highest: $3119.15 / Lowest: $1744.21

/* 6. Write a query to find the name and supplier ID of each supplier and the number of
items they supply. */

SELECT SupplierID, CompanyName AS Supplier,
COUNT(ProductID) AS ItemCount
FROM suppliers
JOIN products USING (SupplierID)
GROUP BY SupplierID, CompanyName
ORDER BY SupplierID; -- 29 rows returned

/* 7. Write a query to find the list of all category names and the average price for items in
each category. */

SELECT CategoryID, CategoryName, ROUND(AVG(UnitPrice), 2) AS AveragePrice
FROM categories
JOIN products USING (CategoryID)
GROUP BY CategoryID, CategoryName
ORDER BY CategoryName; -- 8 rows returned

/* 8. Write a query to find, for all suppliers that provide at least 5 items to Northwind, what
is the name of each supplier and the number of items they supply. */

SELECT CompanyName AS Supplier, COUNT(ProductID) AS ItemCount
FROM suppliers
JOIN products USING (SupplierID)
GROUP BY SupplierID, CompanyName
HAVING COUNT(ProductID) >= 5
ORDER BY CompanyName; -- Pavlova, Ltd 5 / Plutzer 5

/* 9. Write a query to list products currently in inventory by the product id, product name,
and inventory value (calculated by multiplying unit price by the number of units on
hand). Sort the results in descending order by value. If two or more have the same
value, order by product name. If a product is not in stock, leave it off the list. */

SELECT ProductID, ProductName,
ROUND(UnitPrice * UnitsInStock, 2) AS InventoryVALUE
FROM products
WHERE UnitsInStock > 0
ORDER BY InventoryValue DESC, ProductName; -- 72 rows returned