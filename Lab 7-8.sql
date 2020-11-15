-- LAB 7

 -- 
 # In the table actor, which are the actors whose last names are not repeated? For example if you would sort the data in the table actor by last_name, you would see that there is Christian Arkoyd, Kirsten Arkoyd, and Debbie Arkoyd. These three actors have the same last name. So we do not want to include this last name in our output. Last name "Astaire" is present only one time with actor "Angelina Astaire", hence we would want this in our output list.
    
    SELECT * FROM sakila.actor;        #200 Actors
    
    select last_name, first_name from actor         #66 unique last names
    group by last_name
    having count(*) = 1      # having filters out any last names that repeat
    
    
# Which last names appear more than once? We would use the same logic as in the previous question but this time we want to include the last names of the actors where the last name was present more than once
    select last_name from actor
    group by last_name
    having count(*) > 1             #55 repeated last names
    
# Using the rental table, find out how many rentals were processed by each employee.
	
    SELECT * FROM sakila.rental;
    
    select count(rental_id), staff_id from rental
    group by staff_id
    
    
# Using the film table, find out how many films were released each year.
	
    SELECT * FROM sakila.film;
    
    select count(film_id), release_year from film
    group by release_year

# Using the film table, find out for each rating how many films were there.
	
    select count(film_id), rating from film
    group by rating
    
# What is the mean length of the film for each rating type. Round off the average lengths to two decimal places
    
    select rating, round(avg(length), 2) from film
    group by rating
    
# Which kind of movies (rating) have a mean duration of more than two hours?

	select rating, round(avg(length), 2) from film
    group by rating
    having round(avg(length), 2) > 120
    

-- LAB 8 

#Rank films by length (filter out the rows that have nulls or 0s in length column). In your output, only select the columns title, length, and the rank.

	SELECT * FROM sakila.film
    order by length                         #no 0s or nulls in column
    
    select title, length, dense_rank() over (order by length asc) as 'Rank'
    from film
	
#Rank films by length within the rating category (filter out the rows that have nulls or 0s in length column). In your output, only select the columns title, length, rating and the rank.

	select title, length, rating, dense_rank() over (partition by rating order by length asc) as 'Rank'
    from film
    
#How many films are there for each of the categories in the category table. Use appropriate join to write this query

	select * from category
    join film_category
    on category.category_id = film_category.category_id
    where category.category_id = 1
    
#Which actor has appeared in the most films? Assume we want the actors name

	select a.first_name, a.last_name, count(fa.film_id) as total
    from actor a
    join film_actor fa
    on a.actor_id = fa.actor_id
    group by a.last_name, a.first_name
    order by total desc
    
    select count(distict(actor_id)) from actor
    