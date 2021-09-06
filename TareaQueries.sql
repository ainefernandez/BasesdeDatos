--Tarea: Ejercicios de Queries Ainé Fernández 
--Visualización de tablas 
select * from suppliers s
select * from orders o 
select * from products p 
select * from employees e 

--1.¿Qué contactos de proveedores tienen la posición de sales representative?
select contact_name,contact_title --datos que queremos 
from suppliers s --tabla de donde se seleccionan los datos  
where contact_title='Sales Representative'; --condición: posición de sales representative 

--2. ¿Qué contactos de proveedores no son marketing managers?
select contact_name,contact_title --datos que queremos 
from suppliers s --tabla de donde se seleccionan los datos
where contact_title !='Marketing Manager';--condición: posición diferente a marketing manager
--diferente también se puede escribir:<> 
 
--3. ¿Cuáles órdenes no vienen de clientes en Estados Unidos?
select order_id, customer_id,ship_country--datos que queremos 
from orders o--tabla de donde se seleccionan los datos
where ship_country !='USA';--condición: diferente a Estados Unidos

--4. ¿Qué productos de los que transportamos son quesos?
select product_name--dato que queremos  
from products p--tabla de donde se seleccionan los datos 
where product_name like '%Queso%';--condición: que contiene la palabra queso 
--like busca patrones, % significa al principio o al final 
--este select nos da 2 productos, pero viendo la tabla products hay más quesos de los que nos da el select 

--Otro select con category=4(dairy products)
select product_name--dato que queremos 
from products p--tabla de donde se seleccionan los datos  
where category_id =4;--condición: productos que estén catalogados en la categoría 4 
--Nos da 10 productos, todos son quesos 

--5.¿Qué órdenes van a Bélgica o Francia?
select order_id,ship_country--datos que queremos 
from orders o--tabla de donde se seleccionan los datos
where ship_country ='Belgium' or ship_country='France';--condición: país Bélgica o Francia

--Otro select con el comando in--> nos permite poner varios or's sin tener que escribirlos 
select order_id,ship_country--dato que queremos
from orders o--tabla de donde se seleccionan los datos
where ship_country in('Belgium', 'France');--condición: país Bélgica o Francia

--6. ¿Qué órdenes van a LATAM?
--Ver que países de LATAM están incluidos en la tabla 
select distinct ship_country--select distinct--> valores sin repetidos 
from orders o; 
--Países de LATAM incluidos: Argentina, México, Brasil y Venezuela 

--Órdenes que van a LATAM 
select order_id,ship_country--datos que queremos
from orders o--tabla de donde se seleccionan los datos
where ship_country in('Argentina', 'Mexico','Brazil','Venezuela');--condición: país pertenece a LATAM

--7.¿Qué órdenes no van a LATAM?
select order_id,ship_country--datos que queremos
from orders o--tabla de donde se seleccionan los datos
where ship_country not in ('Argentina', 'Mexico','Brazil','Venezuela');--condición: país no pertenece a LATAM

--8.Necesitamos los nombres completos de los empleados, nombres y apellidos unidos en un mismo registro
select concat(first_name,' ',last_name) as "Full Name"--datos que queremos concatenar 
--IMPORTANTE-> comillas dobles en el nombre de la columna de los datos concatenados 
from employees e;--tabla de donde se seleccionan los datos

--9.¿Cuánta lana tenemos en inventario?
select sum(units_in_stock*unit_price)--dato que queremos--> multiplicamos las units en stock por el precio por unidad y sumamos todos los resultados 
from products p;--tabla de donde se seleccionan los datos

--10.¿Cuántos clientes tenemos de cada país?
select country, count(customer_id)--dato que queremos contar--> clientes, agrupados por país   
from customers c group by country;--group by--> agrupa los datos, en este caso clientes por país  

--Comprobación:  
select count (customer_id)
from customers c 
where country='UK'--> país que se quiere comprobar  

