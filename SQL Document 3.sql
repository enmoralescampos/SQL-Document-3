-- SQL Document 3 Estefany Morales Campos

-- 1. List all customers who live in Texas (use JOINs)
select *
from customer
left join address
on customer.address_id = address.address_id
where district = 'Texas';

-- Answer: Jennifer Davis, Kim Cruz, Richard Mccrary, Bryan Hardison, Ian Still


-- 2. Get all payments above $6.99 with the Customer's Full Name
select first_name, last_name, amount 
from customer
left join payment 
on customer.customer_id = payment.customer_id
where amount > 6.99;

-- Answer: Lowest amount was Florence Woods with $7.98 and highest was Peter Menard with $141.99.


-- 3. Show all customers names who have made payments over $175(use subqueries)
select first_name, last_name 
from customer
where customer_id in (
	select customer_id 
	from payment  
	where amount > 175
);

-- Answer: none


-- 4. List all customers that live in Nepal (use the city table)
select first_name, last_name 
from customer
left join address 
on customer.address_id = address.address_id
left join city 
on address.city_id = city.city_id 
left join country 
on city.country_id = country.country_id
where country = 'Nepal';

-- Answer: Kevin Schuler


-- 5. Which staff member had the most transactions?
select staff.first_name, staff.last_name, count(payment.payment_id) as transaction_count
from staff
left join payment 
on staff.staff_id = payment.staff_id 
group by staff.staff_id, staff.first_name, staff.last_name
order by transaction_count desc 
limit 1;

-- Answer: Jon Stephens with 7,304 transactions


-- 6. How many movies of each rating are there?
select count(film_id), rating
from film
group by rating;

-- PG: 194, G: 178, PG-13: 223, R: 195, NC-17: 210 


-- 7.Show all customers who have made a single payment above $6.99 (Use Subqueries)
select first_name, last_name 
from customer
where customer_id in (
	select customer_id 
	from payment  
	where amount > 6.99
);


-- 8. How many free rentals did our stores give away?
select count(rental.rental_id)
from rental 
left join payment
on rental.rental_id = payment.payment_id 
where amount = 0;

-- Answer: 0

