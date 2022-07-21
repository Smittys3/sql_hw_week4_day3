--1. List all customers who live in Texas (use JOINs)
-- Answer KIm Cruz, Jennifer Davis, Bryan Hardison, Ian Still, Richard Moorary

SELECT first_name, last_name
FROM customer
INNER JOIN address
ON customer.address_id = address.address_id
WHERE district = 'Texas';

--2. Get all payments above $6.99 with the Customer's Full Name
SELECT first_name, last_name, payment.amount
FROM customer
INNER JOIN payment
ON customer.customer_id = payment.customer_id
WHERE amount > 6.99
ORDER BY amount DESC;

--3. Show all customers names who have made payments over $175(use subqueries)
SELECT first_name, last_name
FROM customer
WHERE customer_id IN (
    SELECT customer_id
    FROM payment
    GROUP BY customer_id
    HAVING SUM(amount) > 175
);

--4. List all customers that live in Nepal (use the city table)
-- ANSWER: KEVIN SCHULER
SELECT first_name, last_name
FROM customer
INNER JOIN address
ON customer.address_id = address.address_id
INNER JOIN city
ON address.city_id = city.city_id
INNER JOIN country
ON country.country_id = city.country_id
WHERE country = 'Nepal';


--5. Which staff member had the most transactions?
SELECT first_name, last_name, COUNT(payment.staff_id)
FROM staff
INNER JOIN payment
ON staff.staff_id = payment.staff_id
GROUP BY first_name, last_name
ORDER BY COUNT(payment.staff_id) DESC;

--6. How many movies of each rating are there?
SELECT rating, COUNT(inventory_id)
FROM film
INNER JOIN inventory
ON film.film_id = inventory.film_id
GROUP BY rating

--7.Show all customers who have made a single payment above $6.99 (Use Subqueries)
SELECT first_name, last_name
FROM customer
WHERE customer_id IN (
    SELECT customer_id
    FROM payment
    GROUP BY customer_id
    HAVING MIN(amount) = 6.99
    ORDER BY COUNT(amount) = 1
);


--8. How many free rentals did our stores give away?
SELECT * FROM payment
WHERE amount = 0;