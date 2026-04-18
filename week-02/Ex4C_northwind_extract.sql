USE northwind;

/*
a) The table that holds the items Northwind sells is the products table.
b) The table that holds the types or categories of the items Northwind sells is the categories table.
*/

SELECT * FROM employees;
-- The employee whose name makes it look like she's a bird is Margaret Peacock.

SELECT * FROM products;
-- This query returned 77 records.
-- To retrieve only 10 rows using the toolbar, change the row limit at the top of the query pane from 1000 to 10.
-- Bonus:
-- You can also limit it by using SELECT * FROM products LIMIT 10;.
-- I used w3schools and searched for the limit clause.

SELECT * FROM categories;
-- The category ID for seafood is 8.

SELECT OrderID, OrderDate, ShipName, ShipCountry FROM orders LIMIT 50;
