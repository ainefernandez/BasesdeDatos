--Tarea2 Queries: Primer intento

--Obtener un reporte de edades de los empleados para checar su elegibilidad para seguro de gastos médicos menores.
select first_name, last_name, age(now(),birth_date)
from employees e;
--Cuál es la orden más reciente por cliente 

--¿De nuestros clientes, qué función desempeñan y cuántos son?
select contact_title, count(contact_title)
from customers c group by contact_title;

--¿Cuántos productos tenemos de cada categoría?
select category_id, count(product_name) 
from products p group by category_id; 

--¿Cómo podemos generar el reporte de reorder?
select product_id, product_name, units_in_stock, reorder_level 
from products p 
where (units_in_stock<reorder_level);

--A donde va nuestro envío más voluminoso?

--¿Cómo creamos una columna en customers que nos diga si un cliente es bueno, regular, o malo?

--Qué colaboradores chambearon durante las fiestas de navidad?
select distinct o.employee_id, o.order_date, e.first_name, e.last_name 
from orders o
inner join employees e
on (e.employee_id=o.employee_id)
where (o.order_date in ('1996-12-24','1996-12-25','1997-12-24','1997-12-25'));


--¿Qué productos mandamos en navidad?

--Qué país recibe el mayor volumen de producto?
