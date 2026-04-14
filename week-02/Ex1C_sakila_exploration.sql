/*
a) The actor table includes information such as, actor_id, first_name, last_name, and last_update.

b) The film table includes information such as film_id, title, description, release_year, 
language_id,original_language_id, rental_duration, rental_rate, length, replacement_cost, rating, 
special_features, and last_update.

c) The table that contains both actor_id and film_id is the film_actor table.

d) The rental table includes information about rental transactions, such as rental_id, 
rental_date, inventory_id, customer_id, return_date, staff_id, and last_update. Because it 
mainly uses IDs, this information is a little difficult to read on its own; 
in order to fully understand the meaning, you need related tables.

e) The inventory table includes information such as, inventory_id, film_id, store_id, and last_update.

f) I need the rental, inventory, and film tables in order to figure out the titles of every movie 
rented on a particular date. The inventory table relates each inventory item to a film_id, 
the rental table has inventory_id and displays which inventory items were rented and on what date, 
and the film table includes each movie's title.
*/

-- Relevant columns that will help answer “what were the names of all films that were rented on a specific date?”
SELECT rental_date, inventory_id FROM rental; /* This will show the dates they were borrowed 
and the inventory id. */

SELECT inventory_id, film_id FROM inventory; /* Now we can look in the inventory table for the 
specific inventory id and see which film id it represents. */

SELECT film_id, title FROM film; /* Using the film id from inventory table, we can now see what the
title of the film that was borrowed at a specific date. */
