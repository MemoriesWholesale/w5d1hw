--How many actors are there with the last name ‘Wahlberg’?
select count(actor_id)
from actor
where last_name = 'Wahlberg';

--How many payments were made between $3.99 and $5.99?
select count(amount)
from payment
where amount between 3.99 and 5.99;

--What films have exactly 7 copies? (search in inventory)
select film_id
from inventory
group by film_id
having count(film_id) = 7;

--How many customers have the first name ‘Willie’?
select count(customer_id)
from customer
where first_name = 'Willie';

--What store employee (get the id) sold the most rentals (use the rental table)?
select count(staff_id)
from rental
group by staff_id
order by count(distinct rental_id) desc;

--How many unique district names are there?
select count(distinct district)
from address;

--What film has the most actors in it? (use film_actor table and get film_id)
select film_id,count(distinct actor_id)
from film_actor
group by film_id
order by count(distinct actor_id) desc;

--From store_id 1, how many customers have a last name ending with ‘es’? (use customer table)
select count(customer_id)
from customer
where store_id = 1 and last_name like '%es';

--How many payment amounts (4.99, 5.99, etc.) had a number of rentals above 250 for customers
--with ids between 380 and 430? (use group by and having > 250)
select amount,count(payment_id)
from payment
where customer_id between 380 and 430
group by amount
having count(payment_id) > 250;

--Within the film table, how many rating categories are there? And what rating has the most
--movies total?
select distinct rating, count(film_id)
from film
group by rating
order by count(film_id) desc;
