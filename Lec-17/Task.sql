use sakila;
select f.title ,f.film_id 
from film f
left join inventory i on f.film_id=i.film_id
left join rental r on i.inventory_id=r.inventory_id
where r.rental_id is null ;

select f.title ,f.film_id 
from film f
left join inventory i on f.film_id=i.film_id
left join rental r on i.inventory_id=r.inventory_id
group by f.film_id, f.title
having count(r.rental_id) = 0;

select f.title ,f.film_id ,count(r.rental_id) as transactions
from film f
left join inventory i on f.film_id=i.film_id
left join rental r on i.inventory_id=r.inventory_id
group by f.title ,f.film_id
order by transactions desc;


select s.first_name,s.last_name, s.staff_id ,sum(p.amount) as TotalSales
from staff s
left join payment p on s.staff_id=p.staff_id
group by s.first_name,s.last_name, s.staff_id
order by TotalSales desc;

select count(*) as NoRentals
from film f
left join inventory i on f.film_id=i.film_id
left join rental r on i.inventory_id=r.inventory_id
where r.rental_id is null ;

select * from film;
select title,film_id,length,
case
when length>60 then "Short Film"
when length between 60 and 120 then "Medium Film"
else "Long Film"
end as FilmLength
from film;

select f.title,f.film_id,count(r.rental_id) as Transactions,
   case 
   when count(r.rental_id) <25 then "Low Demand"
   When count(r.rental_id) between 25 and 30  then "Medium Demand"
   else "High Demand"
   end as FilmDemand
   from film f
   left join inventory i on f.film_id=i.film_id
   left join rental r on i.inventory_id=r.inventory_id
   group by f.film_id
   having FilmDemand="High Demand";
   
   
select c.customer_id,sum(p.amount) as TotalSales ,
case 
   when sum(p.amount)=0 then "No purchase"
   when sum(p.amount)<100 then "Low Spender"
   when sum(p.amount) between 100 and 200 then "Medium Spender"
   else "High Spender"
   end as SpendingTime
   from customer c
   left join payment p on c.customer_id=p.customer_id 
   group by c.customer_id 
   Having SpendingTime in ("High Spender","Medium Spender")
   order by TotalSales desc;
   
   
   


