#Lab 3

#Instructions

    # 1. How many distinct (different) actors' last names are there?
    SELECT count(distinct(last_name)) from actor
    
    # 2. In how many different languages where the films originally produced? (Use the column language_id from the film table)
	SELECT count(distinct(language_id)) from film
    
    # 3. How many movies were released with "PG-13" rating?
    SELECT count(title) from film
    WHERE rating = 'PG-13'
    
    # 4. Get 10 the longest movies from 2006.
    SELECT title, release_year, length from film
    WHERE release_year = 2006
    ORDER BY length DESC
    LIMIT 10
    
    # 5. How many days has been the company operating (check DATEDIFF() function)?
    SELECT *, 
    DATEDIFF(day, min(rental_date), max(rental_date)) as days_operating 
    from rental
    
    select DATEDIFF( max(rental_date), min(rental_date))
	from rental
    
    # 6. Show rental info with additional columns month and weekday. Get 20.
    SELECT *, 
    DATE_FORMAT(convert(rental_date,date), '%M') as Month, 
    DATE_FORMAT(convert(rental_date,date), '%W') as Weekday 
    from rental
    
    # 7. Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.
    SELECT *,  
    case
    when DATE_FORMAT(convert(rental_date,date), '%W') IN ('Saturday','Sunday') then 'Weekend'
    else 'Workday'
    end
    as 'day_type'
    from rental;
    
    # 8. How many rentals were in the last month of activity?
    SELECT max(rental_date) from rental  #2006-02-14
    
    SELECT count(rental_date) from rental
    WHERE rental_date like '2006-02%'
	

#Lab 4

#Instructions

    # 1. Get film ratings.
    SELECT title, rating from film
    SELECT DISTINCT(rating) from film
    
    # 2. Get release years.
    SELECT title, release_year from film
    SELECT DISTINCT(release_year) from film
    
    # 3. Get all films with ARMAGEDDON in the title.
    SELECT title from film
    WHERE title regexp 'ARMAGEDDON'
    
    # 4. Get all films with APOLLO in the title
    SELECT title from film
    WHERE title regexp 'APOLLO'
    
    # 5. Get all films which title ends with APOLLO.
    SELECT title from film
    WHERE title regexp 'APOLLO$'  
    
    # 6. Get all films with word DATE in the title.
    SELECT title from film
    WHERE title regexp 'DATE'
    
	# 7. Get 10 films with the longest title.
    SELECT *
    from film
    ORDER BY length(title) DESC
    limit 10
    
    # 8. Get 10 the longest films.
    SELECT title, length from film
    ORDER BY length DESC
    LIMIT 10
    
    # 9. How many films include Behind the Scenes content?
    SELECT count(title) from film
    WHERE special_features regexp 'Behind the Scenes'
    
    # 10. List films ordered by release year and title in alphabetical order.
    SELECT title, release_year from film
    ORDER BY release_year, title
