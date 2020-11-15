#Lab | SQL basics (selection and aggregation)

#Query 1
SELECT client_id, district_id FROM client
where district_id = 1
limit 5

#Query 2
SELECT max(client_id), district_id FROM client
where district_id = 72

#Query 3
select amount from loan 
ORDER BY amount ASC
limit 3

#Query 4
select distinct status from loan
order by status ASC

#Query 5
select loan_id, max(payments) from loan
	#not expected result?

#Query 6
select account_id, amount from loan
order by amount asc
limit 5
	#not working
    
#Query 7
select account_id, amount from loan
where duration = 60
order by amount asc
limit 5

#Query 8
select distinct k_symbol in `order`
	#not working
    
#Query 9
select order_id from order
where account_id = 34
	#not working
    
#Query 10
select account_id in order
where order_id > 29540 and order_id < 29560
	#not working
    
#Query 11