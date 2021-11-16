# Tarea 1 Extra: Funciones 
**1. ¿Cuál es el promedio, en formato human-readable, de tiempo entre cada pago por cliente de la BD Sakila?**
```
select customer_id, 
min(payment_date) as "FechaInicial", 
max(payment_date) as "FechaFinal", 
count(payment_id) as "NumPagos", 
(max(payment_date)::timestamp- min(payment_date)::timestamp)/count(payment_id) as "TiempoPromedioEntrePagos"
from payment p 
group by customer_id 
order by customer_id asc;
```
Creamos una tabla para guardar los datos:  
```
create table tiempo_promedio_pagos as select customer_id, 
min(payment_date) as "FechaInicial", 
max(payment_date) as "FechaFinal", 
count(payment_id) as "NumPagos", 
cast(((max(payment_date)::date- min(payment_date)::date)/count(payment_id))as numeric) as "tiempo_promedio"
from payment p 
group by customer_id 
order by customer_id asc;
```
**2. ¿Sigue una distribución normal?**
```
select * from histogram('tiempo_promedio_pagos tpp', 'tiempo_promedio')
```
**Como se puede ver en el histograma, no es normal porque la distribución no tiene forma de campana.**

**3. ¿Qué tanto difiere ese promedio del tiempo entre rentas por cliente?**
```
select customer_id, 
min(rental_date) as "FechaInicial", 
max(rental_date) as "FechaFinal", 
count(rental_id) as "NumRentas", 
(max(rental_date)::timestamp- min(rental_date)::timestamp)/count(rental_id) as "TiempoPromedioEntreRentas"
from rental r 
group by customer_id 
order by customer_id asc;
```
Creamos una tabla para guardar los datos: 
```
create table tiempo_promedio_rentas as select customer_id, 
min(rental_date) as "FechaInicial", 
max(rental_date) as "FechaFinal", 
count(rental_id) as "NumRentas", 
cast(((max(rental_date)::date- min(rental_date)::date)/count(rental_id))as numeric) as "tiempo_promedio"
from rental r 
group by customer_id 
order by customer_id asc; 
```
Generamos un histograma para comparar los dos promedios: 
```
select * from histogram('tiempo_promedio_rentas tpr', 'tiempo_promedio')
```
**Las distribuciones son muy diferentes porque la de los tiempos promedio de pago tiene una cola más larga.**
