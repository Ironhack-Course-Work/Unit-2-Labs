#Lab1
select title from film

select language_id as language, title from film

select distinct name as language from language

select count(return_date) from rental

select count(manager_staff_id) from store

select first_name from staff

select count(distinct left(rental_date, 10)) from rental

#Lab2
#Select all the actors with the first name ‘Scarlett’.
SELECT first_name, last_name from actor
where first_name = 'SCARLETT'

#Select all the actors with the last name ‘Johansson’.
SELECT first_name, last_name from actor
where last_name = 'JOHANSSON'

#How many films (movies) are available for rent?
select count(distinct title) from film

#How many films have been rented?
select count(rental_date) from rental

#What is the shortest and longest rental period?
select max(rental_duration) from film
select min(rental_duration) from film

#What are the shortest and longest movie duration? Name the values max_duration and min_duration.
select title, max(length) as max_duration from film
select title, min(length) as min_duration from film

#What's the average movie duration?
select avg(length) from film

#What's the average movie duration expressed in format (hours, minutes)?
####select date_format(avg(length)/60,"%H:%i") as Avg_length from film; 
select floor(avg(length)/ 60)
as hours, round(avg(length) % 60) as minutes
from film

#How many movies longer than 3 hours?
select count(title) from film
where length > 180

#Get the name and email formatted. Example: Mary SMITH - mary.smith@sakilacustomer.org.
select CONCAT(first_name,' ',last_name,' - ',email) as cust_format
from customer

#What's the length of the longest film title?
select title, max(length) from film