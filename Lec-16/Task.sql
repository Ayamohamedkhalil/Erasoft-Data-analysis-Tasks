use sakila;

select * from  payment
where amount >3
order by amount asc
limit 10;


select * from actor
where last_name="GUINESS"
limit 1,2;

select   count(payment_id) as "Number of Transactions ",
max(amount) as "Max Sales" ,
sum(amount) as "Total Sales"
from  payment; 

select * from payment;

select customer_id  , sum(amount) as TotalSales
from payment
group by customer_id
order by TotalSales desc;

select customer_id,count(rental_id) as NumberOfTransactions
from rental
group by customer_id
order by NumberOfTransactions desc;

select customer_id,count(rental_id) as NumberOfTransactions ,sum(amount) as TotalSales
from payment
group by customer_id
having NumberOfTransactions>25
order by TotalSales desc;

select c.first_name ,c.last_name ,c.email ,sum(p.amount) as TotalSales
from customer c 
inner join payment p
on c.customer_id=p.customer_id
group by c.first_name ,c.last_name ,c.email
order by TotalSales desc 
limit 5; 

select c.first_name ,c.last_name,c.customer_id,count(r.rental_id) as NumberOfTransactions
from customer c
inner join rental r
on c.customer_id=r.customer_id
group by c.first_name ,c.last_name,c.customer_id
order by NumberOfTransactions desc;


select c.first_name ,sum(p.amount) as TotalSales
from payment p
inner join customer c
on p.customer_id=c.customer_id
group by c.first_name 
order by TotalSales desc;

select * from rental;
select c.first_name,c.last_name,r.customer_id,count(r.rental_id) as Transactions ,sum(p.amount) as TotalSales
from customer c 
inner join rental r on c.customer_id=r.customer_id 
inner join payment p on r.rental_id=p.rental_id
group by c.first_name,c.last_name,r.customer_id
order by TotalSales desc;

select f.title,count(r.rental_id) as Transactions,sum(p.amount) as TotalSales
from film f 
inner join inventory i on f.film_id=i.film_id
inner join rental r on i.inventory_id=r.inventory_id
inner join payment p on r.rental_id=p.rental_id
group by f.title
order by TotalSales desc;

select * from film;



