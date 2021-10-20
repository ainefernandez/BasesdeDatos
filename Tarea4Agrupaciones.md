# Tarea 4: Agrupaciones y Agregaciones III
1. **¿Cómo obtenemos todos los nombres y correos de nuestros clientes canadienses para una campaña?**

``
select c.first_name||' '|| c.last_name as fullname, c.email, c3.country 
from customer c 
join address a using (address_id)
join city c2 using (city_id)
join country c3 using (country_id)
where c3.country= 'Canada'; 
``

2. **¿Qué cliente ha rentado más de nuestra sección de adultos?**

``
select c.first_name||' '|| c.last_name as fullname, count(r.rental_id) as numRentas
from customer c 
join rental r using (customer_id)
join inventory i using (inventory_id)
join film f using (film_id)
where f.rating='R'
group by c.first_name, c.last_name
order by numRentas desc limit 1;
``

**Nota:** Considero a las películas con rating 'R' como las películas de adultos. 

3. **¿Qué películas son las más rentadas en todas nuestras stores?**

**Nota:** Para responder esta pregunta la separé en dos queries, uno para la store 1 y otro para la store 2. 

``
select s.store_id as store, f.title as film, count(r.rental_id) as numRentas
from film f 
join inventory i using(film_id)
join rental r using (inventory_id)
join store s on (r.staff_id=s.manager_staff_id)
where s.store_id=1
group by s.store_id, f.title 
order by numRentas desc limit 1;
``

``
select s.store_id as store, f.title as film, count(r.rental_id) as numRentas
from film f 
join inventory i using(film_id)
join rental r using (inventory_id)
join store s on (r.staff_id=s.manager_staff_id)
where s.store_id=2
group by s.store_id, f.title 
order by numRentas desc limit 1;
``

4.**¿Cuál es nuestro revenue por store?**

``
select s.store_id, sum(p.amount) as revenue
from payment p 
join rental r using (rental_id)
join inventory i using (inventory_id)
join store s using (store_id)
group by s.store_id; 
``





