----Display PRODUCTID, CATEGORYID, MIN UNITPRICE by Categoryid of the Products
select productid, categoryid, min(unitprice)
over(PARTITION by categoryid) as unitprice
from products
---Display orderid,max of quantity by orderid whose max quantity is less than 30
CREATE view max_quantity1
as
select orderid, max(quantity)
OVER( PARTITION BY orderid) as max_quantity
from order_details
o

select max_quantity , orderid
from max_quantity1
where max_quantity < 30

--Display productid,orderid,sum of quantity by orderid of the orderdetails
select productid, orderid, sum(quantity)
over(partition by orderid) as sum_quantity
from order_details

---Create a view as served_cities to display employeeid,orderid and city
create view served_cities
as
select employeeid, orderid, shipcity
from orders

select * from served_cities


-----Display firstname of staff and customer as person_name without missing all the entries
select first_name as person_name from staff
union all
select first_name as person_name from customer

 -----Display cityid’s having same countryid---
 select city_id
 from city
 where city_id = country_id

 ---Display the actors firstname,lastname of their film title starts with C and D
select first_name, last_name, title
from actor a inner join film_actor f
on a.actor_id = f.actor_id inner join film f1
on f.film_id = f1.film_id
where title like 'C%' or title like 'D%'

----create view for the question 3 and get the count of actors acted in each film
create view title_123
as
select first_name, last_name, title
from actor a inner join film_actor f
on a.actor_id = f.actor_id inner join film f1
on f.film_id = f1.film_id
where title like 'C%' or title like 'D%'

select title, count(*) from title_123
group by title

