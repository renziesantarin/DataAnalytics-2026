USE northwind;

/* 1. Write a query to list the product id, product name, and unit price of 
every product. This time, display them in ascending order by price. */

SELECT ProductID, ProductName, UnitPrice
FROM products
ORDER BY UnitPrice ASC; -- Lowest price is $2.50 and highest is $263.50.

/* 2. What are the products that we carry where we have at least 
100 units on hand? Order them in descending order by price. */

SELECT ProductID, ProductName, UnitPrice, UnitsInStock
FROM products
WHERE UnitsInStock >= 100
ORDER BY UnitPrice DESC; -- Highest price is $28.50 and lowest is $2.50.

/* 3. What are the products that we carry where we have at least 100 units on hand? Order
them in descending order by price. If two or more have the same price, list those in
ascending order by product name. */

SELECT ProductID, ProductName, UnitPrice, UnitsInStock
FROM products
WHERE UnitsInStock >= 100
ORDER BY UnitPrice DESC, ProductName ASC;
-- Since there isn't a matching price, the second rule did not execute.

/* 4. Write a query against the orders table that displays the total number of distinct
customers who have placed orders, based on customer ID. Use an alias to label the
count calculation as CustomerCount. */

SELECT COUNT(DISTINCT CustomerID) AS CustomerCount
FROM orders; -- Distint customer count is 89.

/* 5. Write a query against the orders table that displays the total number of distinct
customers who have placed orders, by customer ID, for each country where orders
have been shipped. Again, use an alias to label the count as CustomerCount. Order
the list by the CustomerCount, largest to smallest. */

SELECT ShipCountry, COUNT(DISTINCT CustomerID) AS CustomerCount
FROM orders
GROUP BY ShipCountry
ORDER BY CustomerCount DESC;
-- Largest customer count is 13 from USA, lowest is 1 each from Ireland, Norway and Poland.

/* 6. What are the products that we carry where we have less than 25 units on hand, but 1
or more units of them are on order? Write a query that orders them by quantity on
order (high to low), then by product name. */

SELECT ProductID, ProductName, UnitsInStock, UnitsOnOrder
FROM products
WHERE UnitsInStock < 25 AND UnitsOnOrder >= 1
ORDER BY UnitsOnOrder DESC, ProductName ASC;
-- Highest: Louisiana Hot Spiced Okra has 100. Lowest: Scottish Longbreads has 10.

/* 7. Write a query to list each of the job titles in employees, 
along with a count of how many employees hold each job title. */

SELECT Title, COUNT(*)
FROM employees
GROUP BY Title;
-- Sales Rep: 6, VP of Sales, Sales Manager and Inside Sales Coordinator: each 1.

/* 8. What employees have a monthly salary that is between $2000 and $2500?
Write a query that orders them by job title. */

SELECT EmployeeID, FirstName, LastName, Title, Salary
FROM employees
WHERE Salary BETWEEN 2000 AND 2500
ORDER BY Title ASC;
-- Inside Sales/Laura $2100.5, Sales Rep/Michael $2004.07, Sales Rep/Anne $2333.33 and VP of Sales/Andrew $2254.49.


