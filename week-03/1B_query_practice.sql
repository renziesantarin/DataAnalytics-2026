USE northwind

-- Exercise 1.B

/* 1. Write a query to list the product id, product name, and 
unit price of every product that Northwind sells. */

SELECT ProductID, ProductName, UnitPrice
FROM products; -- It shows 77 products.

/* 2. Write a query to identify the products where
the unit price is $7.50 or less. */

SELECT ProductID, ProductName, UnitPrice
FROM products
WHERE UnitPrice <= 7.50; -- There are 5 products that are <= 7.50.

/* 3. What are the products that we carry where we have 
no units on hand, but 1 or more units are on backorder? */

SELECT ProductID, ProductName, UnitsInStock, UnitsOnOrder
FROM products
WHERE UnitsInStock = 0 AND UnitsOnOrder >= 1; -- Answer is Gordonzola Telino.

/* 4a. Examine the products table. How does it identify the 
type (category) of each item sold? */ 

SELECT *
FROM products; -- Each product has a CategoryID.

-- 4b. Where can you find a list of all categories?

SELECT *
FROM categories; -- There are 8 categories.

/* 4c. Write a set of queries to answer these questions, ending with a
query that creates a list of all the seafood items we carry. */

SELECT CategoryID, CategoryName
FROM categories
WHERE CategoryName = 'Seafood'; -- CategoryID for seafood is 8.

SELECT ProductID, ProductName, CategoryID
FROM products
WHERE CategoryID = 8; -- There are 12 items.

-- 5a. How do you know what supplier each product comes from?

SELECT *
FROM products; -- The product table uses SupplierID.

-- 5b. Where can you find info on suppliers?

SELECT *
FROM suppliers; -- The supplier table shows 29 suppliers.

/* 5c. Write a set of queries to find the specific identifier for 
"Tokyo Traders" and then find all products from that supplier */

SELECT SupplierID, CompanyName
FROM suppliers
WHERE CompanyName = 'Tokyo Traders'; -- SupplierID is 4.

SELECT ProductID, ProductName, SupplierID
FROM products
WHERE supplierID = 4; -- They are supplying 3 products.

-- 6a. How many employees work at northwind?

SELECT *
FROM employees; -- There are 9 employees.

/* What employees have "manager" somewhere in their
job title? Write queries to answer each question. */

SELECT EmployeeID, FirstName, LastName, Title
FROM employees
WHERE Title LIKE '%manager%'; -- Steven Buchanan is the sales manager.


