-- LAB 9 

#In this lab we will find the customers who were active in consecutive months of May and June. Follow the steps to complete the analysis.
    #Create a table rentals_may to store the data from rental table with information for the month of May.
DROP table IF EXISTS rentals_may

    CREATE TABLE rentals_may (
  
  `rental_id` varchar(20) UNIQUE NOT NULL,     
  `rental_date` varchar(20) DEFAULT NULL,
  `inventory_id` int(11) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `return_date` varchar(45) DEFAULT NULL,
  `staff_id` int(11) DEFAULT NULL,
  `last_update` varchar(45) DEFAULT NULL,
  CONSTRAINT PRIMARY KEY (rental_id)  -- constraint keyword is optional but its a good practice
);

    #Insert values in the table rentals_may using the table rental, filtering values only for the month of May.

INSERT INTO rentals_may 
	select * from rental
    where rental_date like '2005-05-%'

    #Create a table rentals_june to store the data from rental table with information for the month of June.
    
CREATE TABLE rentals_june (
  
  `rental_id` varchar(20) UNIQUE NOT NULL,     
  `rental_date` varchar(20) DEFAULT NULL,
  `inventory_id` int(11) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `return_date` varchar(45) DEFAULT NULL,
  `staff_id` int(11) DEFAULT NULL,
  `last_update` varchar(45) DEFAULT NULL,
  CONSTRAINT PRIMARY KEY (rental_id)  -- constraint keyword is optional but its a good practice
);

    #Insert values in the table rentals_june using the table rental, filtering values only for the month of June.
    
INSERT INTO rentals_june
	select * from rental
    where rental_date like '2005-06-%'

    #Check the number of rentals for each customer for May.
    
select count(*) from rentals_may     #1156

select customer_id, count(rental_id) as "Amount Rentals"
    from rentals_may  
    group by customer_id

    #Check the number of rentals for each customer for June.
    
select count(*) from rentals_june     #2311

select customer_id, count(rental_id) as "Amount Rentals"
    from rentals_june  
    group by customer_id

    #Create a Python connection with SQL database and retrieve the results of the last two queries (also mentioned below) as dataframes:

        #Check the number of rentals for each customer for May

        #Check the number of rentals for each customer for June

        #Hint: You can store the results from the two queries in two separate dataframes.

    #Write a function that checks if customer borrowed more or less books in the month of June as compared to May.

    #Hint: For this part, you can create a join between the two dataframes created before, using the merge function available for pandas dataframes. Here is a link to the documentation for the merge function.
