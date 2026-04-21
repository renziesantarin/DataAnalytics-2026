-- Marenza Santarin
-- April 20, 2026
SHOW DATABASES;

USE northwind;
SHOW TABLES;

-- Retrieve the product name and unit price from products table.

SELECT ProductName, UnitPrice 
FROM products;

-- Retrieve all columns from the product table.

SELECT * 
FROM products;

/* Rename columns ProductName as Product, 
UnitPrice as Price(USD) and UnitsInStock as Stock. */

SELECT ProductName AS 'Product',
UnitPrice AS 'Price(USD)',
UnitsInStock AS 'Stock'
FROM products;

-- Retrieve all CompanyName, City and Country for Germany.

SELECT CompanyName, City, Country
FROM customers
WHERE Country = 'Germany';

/* Retrieve all ProductName and UnitPrice
from Product table, where UnitPrice is > 50. */

SELECT ProductName, UnitPrice
FROM products
WHERE UnitPrice > 50;

/* Retrieve all the OrderID, CustomerID, ShipCountry and
Freight from the Orders table for all orders shipped to France. */

SELECT OrderID, CustomerId, ShipCountry, Freight
FROM orders
WHERE ShipCountry = 'France';

-- Retrieve all products whose current stock is below the reorder threshold.

SELECT ProductName, UnitsInStock, ReorderLevel
FROM products
WHERE UnitsInStock < ReorderLevel;

-- Retrieve all OrderID and Freight for Freight orders >= 100.

SELECT OrderID, Freight
FROM orders
WHERE Freight >= 100;

-- Exercise 9 missing.

/* Retrieve all products, unit price and units in stock for products
with unit price > 20 and units in stock is > 50.*/

SELECT ProductName, UnitPrice, UnitsInStock
FROM products
WHERE UnitPrice > 20 AND UnitsInStock > 50;

-- Retrieve all company and country names from either UK or Ireland.

SELECT CompanyName, Country
FROM customers
WHERE Country = 'UK' OR 'Ireland';

/* Retrieve all Products, CategoryID and UnitPrice for products
with CategoryID of 1 or 2 and a Unit Price < 20 */

SELECT CategoryID, UnitPrice
FROM products
WHERE (CategoryID = 1 OR CategoryID = 2)
AND UnitPrice < 20;

-- Retrieve all company names and country names other than the USA.

SELECT CompanyName, Country
FROM customers
WHERE NOT Country = 'U.S.A';

-- Retrieve all products that are currently active. Not discontinued.

SELECT ProductName, Discontinued
FROM products
WHERE NOT Discontinued = 1;

-- Retrieve company names from the following countries France, Germany and Spain.

SELECT CompanyName, Country
FROM customers
WHERE Country IN ('France', 'Germany', 'Spain');

/* Retrieve Product Names and SupplierID from suppliers
other than those with SupplierID 1, 2 or 3. */

SELECT ProductName, SupplierID
FROM products
WHERE SupplierID NOT IN (1, 2, 3);

-- #17 or #18

SELECT ProductName, UnitPrice
FROM products
WHERE UnitPrice BETWEEN 10 AND 20;

/* Retrieve the OrderID, CustomerID and Ship Region for 
orders where ShipRegion field has not beem filled in. */

SELECT OrderID, CustomerID, ShipRegion
FROM orders
WHERE ShipRegion is NULL;

-- Retrieves employees first name, last name and region form region fields filled in.

SELECT LastName, FirstName, Region
FROM employees
WHERE Region is NOT NULL;

-- Retrieve all company names that starts with A.

SELECT CompanyName
FROM customers
WHERE CompanyName LIKE 'A%';

/* Retrieves OrderID, CustomerID, OrderDate for 
all orders with a shipped date 1997-01-01. */

SELECT OrderID, CustomerID, OrderDate
FROM orders
WHERE OrderDate = '1997-01-01';

-- Retrieve all orders placed in June 1997 using YEAR() and MONTH () Functions.

SELECT OrderID, CustomerID, OrderDate
FROM orders
WHERE YEAR(OrderDate) = 1997
AND MONTH(OrderDate) = 6;

-- Retrieves all product names and price in descending order.

SELECT ProductName, UnitPrice
FROM products
ORDER BY UnitPrice DESC;

/* Retrieves company names alphabetically by country then name.
Customers are first grouped by country alphabetically. 
Within each country, they are further sorted by company name */

SELECT CompanyName, Country
FROM customers
ORDER BY Country ASC, CompanyName ASC;

-- Retrieve the top 5 most expensive products.

SELECT ProductName, UnitPrice
FROM products
ORDER BY UnitPrice DESC
LIMIT 5;

-- Retrieve products and prices for rows 6 through 10 and skip the first 5 rows.

SELECT ProductName, UnitPrice
FROM products
ORDER BY UnitPrice DESC
LIMIT 5, 5;

-- Retrieve unique countries.

SELECT DISTINCT Country
FROM customers;

/* Return each unique pairing of country and city - if 2 customers 
share the same city, the city appears only once. */

SELECT DISTINCT Country, City
FROM customers
ORDER BY Country, City;

-- Return Full Name from first and last.

SELECT CONCAT(FirstName, ' ', LastName) AS 'Full Name', Title
FROM employees;

-- Return product with original price and a 10% discount.

SELECT ProductName, UnitPrice AS 'Original Price',
UnitPrice * 0.9 AS '10% Discount Price'
FROM products;