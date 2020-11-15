#LAB 5
	# 1. Drop column picture from staff.

select * from staff

alter table staff
drop column picture;

	# 2. A new person is hired to help Jon. Her name is TAMMY SANDERS, and she is a customer. Update the database accordingly.

select * from staff

SELECT * FROM sakila.customer
where first_name = 'TAMMY';

insert into staff values
(3,'TAMMY','SANDERS',79, 'TAMMY.SANDERS@sakilacustomer.org', 2, 1, 'Tammy', 123, '2006-02-15 04:57:20') 

	# 3. Add rental for movie "Academy Dinosaur" by Charlotte Hunter from Mike Hillyer at Store 1 today.

		# First we select customer information Charlotte Hunter
select customer_id from customer
Where first_name IN ('Charlotte') and last_name IN ('Hunter')			# Result: 130

		#Second, staff worker Mike Hyllier
select staff_id from staff
Where first_name IN ('Mike') and last_name IN ('Hillyer')				# Result: 1	

		#Third, film id to obtain inventory_id
select film_id from film Where title IN ('Academy Dinosaur') 							# Result: 1

select * from inventory Where film_id = 1;

select * from rental where customer_id=130

insert into sakila.rental(rental_date, inventory_id, customer_id, staff_id)
values (curdate(), '1', '130', '1')				#Rental id is generated authomatically and last update is linked to rental date so we don't complete it

	# 4. Delete non-active users, but first, create a backup table deleted_users to store customer_id, email, and the date the user was deleted.
drop table if exists deleted_users;

CREATE TABLE `deleted_users` (
`customer_id` varchar(255) NOT NULL,
`email` text DEFAULT NULL,
`delete_date` date DEFAULT NULL
)
    

    
		# Second, insert the information
INSERT INTO deleted_users
select customer_id, email, curdate()
from customer
where active = 0

		# Last, delete inactive users
DELETE FROM customer WHERE active = 0


#LAB 6

drop table if exists films_2020;
CREATE TABLE `films_2020` (
  `film_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` text,
  `release_year` year(4) DEFAULT NULL,
  `language_id` tinyint(3) unsigned NOT NULL,
  `original_language_id` tinyint(3) unsigned DEFAULT NULL,
  `rental_duration` int(6),
  `rental_rate` decimal(4,2),
  `length` smallint(5) unsigned DEFAULT NULL,
  `replacement_cost` decimal(5,2) DEFAULT NULL,
  `rating` enum('G','PG','PG-13','R','NC-17') DEFAULT NULL,
  PRIMARY KEY (`film_id`),
  CONSTRAINT FOREIGN KEY (`original_language_id`) REFERENCES `language` (`language_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1003 DEFAULT CHARSET=utf8;

SELECT * FROM sakila.films_2020;

# 1. Add the new films to the database.
# 2. Update information on rental_duration, rental_rate, and replacement_cost.

#Hint
	#You might have to use the following commands to set bulk import option to ON:
show variables like 'local_infile';
set global local_infile = 1;
	#If bulk import gives an unexpected error, you can also use the data_import_wizard to insert data into the new table.