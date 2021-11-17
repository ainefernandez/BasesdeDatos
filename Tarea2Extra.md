# Tarea 2 Extra: Funciones (Cilindros videostore)
## ¿Cuántos Blu-Rays hay en cada tienda?
```
select count (film_id) as "NumBluraysStore1"
from inventory i
where store_id =1;
```
NumBlurays de la store 1: 2270

```
select count (film_id) as "NumBluraysStore2"
from inventory i
where store_id =2; 
```
NumBlurays de la store 2: 2311

**Suponemos que todas las pelis que tenemos son en formato Blu-Ray**

## ¿Cuál es el número máximo de pelis que podemos meter en cada cilindro?

Cada cilindro puede soportar un peso máximo de 50 kg, cada Blu-Ray pesa 500g
```
select div(50,.5) as "NumMaxPelis";
```
**El cilindro podría soportar un máximo de 100 pelis** 

## ¿Cuáles son las medidas estándar del cilindro que vamos a poner en nuestras stores?
### Área de la base del cilindro 
Suponemos que los blu-Rays tienen que estar con el arnés puesto dentro de cilindro para que el brazo automatizado las pueda sacar y acomodar en los stands por lo que usamos las medidas 30cm x 21cm x 8cm

**Necesitamos el área de cada uno de los Blu-Rays para determinar la base del cilindro**
```
select 30*21 as "ÁreaCadaPeli"; 
```
Área por peli: 630 cm

Suponemos que al no ser las cajitas circulares, la base del cilindro tiene que ser un poco más grande con las esquinas de las cajitas tocando lacircunferencia de la base

Necesitamos la medida de la diagonal de cada cajita para determinar el diámetro de la base:  **Usamos Pitágoras**
```
select sqrt(power(30,2)+ power(21,2)) as "Diámetro";
```
Diámetro: 36.61966684720111 cm

Calculamos el área de la base del cilindro
```
select pi()*power(div(36.61966684720111, 2),2) as "ÁreaBaseCilindro"
```
Redondeamos:
```
select round(1017.8760197630929,2) as "ÁreaBaseCilindroR";
```
Área base:1017.88 cm

### Altura y radio del cilindro 
```
select 8*100 as "AlturaCilindro";
```
Altura del cilindro: 800 cm

```
select div(36.61966684720111,2) as "Radio"
```
Radio: 18 cm

```
select 1017.88*800 as "VolumenCilindro";
```
Volumen cilindro: 814,304 cm

**Medidas del cilindro:** Radio: 18 cm, Altura: 800 cm 

## ¿Cuántos cilindros se tienen que poner en cada store? 
Suponemos que el último cilindro que se coloque en las stores puede no llegar a su capacidad máxima
```
select div (2270,100) as "NumCilindrosStore1";  
select mod(2270,100) as "PelisSobrantesStore1";
```
Con 22 cilindros llenos, nos sobran 70 pelis por lo que necesitamos 23, el último solo tendrá 70 pelis

**Store 1:** 23 cilindros 

```
select div(2311,100) as "NumCilindrosStore2";
select mod(2311,100) as "PelisSobrantesStore2"; 
```
Con 23 cilindros llenos, nos sobran 11 pelis por lo que necesitamos 24, el último solo tendrá 11 pelis

**Store 2:** 24 cilindros 
