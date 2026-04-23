USE sakila;

-- How much total revenue has the business generated?
SELECT SUM(amount) AS TotalRevenue
FROM payment; -- $67,406.56

-- What is the spending range of customers per transaction?
Select * FROM payment;

SELECT MAX(amount) AS HighestPayment
FROM payment; -- $11.99

SELECT MIN(amount) AS LowestPayment
FROM payment; -- $0.00

-- How many customers had $0 payments?
Select CONCAT(first_name, ' ', last_name) AS CustomerName, customer_id, amount
FROM customer
JOIN payment USING (customer_id)
WHERE amount = 0; -- 24 rows returned