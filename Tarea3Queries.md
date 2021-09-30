# Tarea 3: Queries y tabla de emails 
1. **¿Cuáles pagos no son del cliente con ID 5, y cuyo monto sea mayor a 8 o cuya fecha sea 23 de Agosto de 2005?**

``
select *
from payment p 
where (p.customer_id !=5 and p.amount > 8) 
or p.payment_date between'2005-08-23 00:00:00' and'2005-08-23 23:59:59';
``

2. **¿Cuáles pagos son del cliente con ID 5 y cuyo monto no sea mayor a 6 y su fecha tampoco sea del 19 de Junio de 2005?**

`` 
select *
from payment p 
where p.customer_id=5 
and p.amount <= 6 
and  p.payment_date <'2005-06-19 00:00:00' or p.payment_date < '2005-06-19 23:59:59';
``

3. **¿Cuáles pagos tienen el monto 1.98, 7.98 o 9.98?**

``
select *
from payment p 
where amount in (1.98,7.98,9.98);
``

4. **¿Cuál es la suma total pagada por los clientes que tienen una letra A en la segunda posición de su apellido y una W en cualquier lugar después de la A?**

``
select sum(p.amount)  
from payment p join customer c on p.customer_id=c.customer_id where c.last_name like '_A%W%';
``

## Tabla de emails 

**Creación de tabla:**

``
create table avenger(
id_avenger numeric (4) constraint pk_id_avenger primary key, 
nombre varchar(50) not null, 
email varchar(300) not null
);
create sequence avenger_id_avenger_seq start 1 increment 1; 
alter table avenger alter column id_avenger set default nextval('avenger_id_avenger_seq');
``

**Insertar datos:**

``
insert into avenger
(nombre,email)
values 
('Wanda Maximoff','wanda.maximoff@avengers.org'),
('Pietro Maximoff','pietro@mail.sokovia.ru'),
('Erik Lensherr','fuck_you_charles@brotherhood.of.evil.mutants.space'),
('Charles Xavier','i.am.secretely.filled.with.hubris@xavier-school-4-gifted-youngste.'),
('Anthony Edward Stark','iamironman@avengers.gov'),
('Steve Rogers','americas_ass@anti_avengers'),
('The Vision','vis@westview.sword.gov'),
('Clint Barton','bul@lse.ye'), 
('Natasha Romanov','blackwidow@kgb.ru'), 
('Thor','god_of_thunder-^_^@royalty.asgard.gov'),
('Logan','wolverine@cyclops_is_a_jerk.com'),
('Ororo Monroe','ororo@weather.co'), 
('Scott Summers','o@x'), 
('Nathan Summers','cable@xfact.or'),
('Groot','iamgroot@asgardiansofthegalaxyledbythor.quillsux'),
('Nebula','idonthaveelektras@complex.thanos'),
('Gamora','thefiercestwomaninthegalaxy@thanos.'),
('Rocket','shhhhhhhh@darknet.ru');
``

**Query para detectar emails inválidos:**

``
select nombre, email 
from avenger a 
where email not like '%@%' --Una @ tiene que separar el recipient name del domain 
or email not like '%.%'--un punto separando el domain del top-level domain (puede haber más puntos)   
or email like '% %'-- no debe tener espacios 
or email like '%.'--no debe terminar en caracteres especiales
or email like '%"_"'
or email like '%-'
or email like '%^'
or email like '%+'
or email like '%-^_^%'--no debe haber 2 o más caracteres especiales consecutivos
or email like '%..%'
or email like '.%' --no debe empezar con caracteres especiales
or email like '"_"%'
or email like '-%'
or email like '+%';
``

**Explicación del LIKE:**
1. ``email not like '%@%'`` 
En todos los emails una @ tiene que separar el recipient name del domain, si no tiene una @ es un email inválido 
2. ``or email not like '%.%'``
Todos los emails tienen un punto separando el domain del top-level domain (puede haber más puntos en el email) 
3. ``or email like '% %'``
En los emails no debe haber espacios en blanco 
4. ``or email like '%.' or email like '%"_"'
or email like '%-'
or email like '%^'
or email like '%+'
``
Tampoco deben terminar en caracteres especiales 
5. ``or email like '%-^_^%'
or email like '%..%'``
No pueden tener 2 o más caracteres especiales consecutivos, ni puntos consecutivos 
6. ``or email like '.%' 
or email like '"_"%'
or email like '-%'
or email like '+%';``
No pueden empezar con caracteres especiales 

