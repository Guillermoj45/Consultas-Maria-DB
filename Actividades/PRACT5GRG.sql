use tiendainfor;

/*
 1. Devuelve una lista con las 5 primeras filas de la tabla fabricante. Usa la
cláusula limit.
 */

select codigo, nombre
from fabricante
limit 5;

/*Muestra ahora las dos últimas filas o registros de la tabla fabricante.*/

SELECT codigo, nombre
from fabricante
order by codigo desc
limit 2;

/*
 2. Lista todos los productos que tengan un precio entre 100 € y 200 €. SIN
USAR BETWEEN.
 */

select nombre, precio
from producto
where precio >= 100 and precio <= 200;

/*
 3. Lista todos los productos que tengan un precio mayor que 200 € y que el
fabricante sea Crucial. Usa subconsulta.
 */
select nombre, precio
from producto
where precio >= 200 and codigo_fabricante = (select codigo
                                                 from fabricante
                                                 where nombre = 'Crucial');

-- 4. Lista el nombre y el precio de los productos en céntimos

select nombre, 100 * precio
from producto
order by precio;

-- 5. Lista los nombres de los productos cuyo nombre contenga la palabra FULL.

select nombre
from producto
where nombre like '%FULL%';

-- 6. Lista los nombres de los fabricantes cuyo nombre sea de 7 caracteres.

select nombre
from fabricante
where char_length(nombre) = 7;

-- 7. Calcula el número total de productos que hay en la tabla productos.

select count(nombre) as 'Numero de productos'
from producto;

-- 8. Calcula el número de valores distintos de código de fabricante que aparecen en la tabla productos.

select count(distinct codigo_fabricante) as 'Numero de codigos distintos'
from producto;

-- 9. Calcula la media del precio de todos los productos redondeada con dos dos decimales.

select truncate(avg(precio), 2) as 'media de los productos'
from producto;

-- 10. Calcula el precio más barato de todos los productos.

select min(precio) as 'precio mas barato'
from producto;

-- 11. Calcula el precio más caro de todos los productos.

select max(precio) as 'precio mas caro'
from producto;

-- 12. Lista el nombre y el precio del producto más barato.

select nombre, precio
from producto
where precio = (select min(precio)
                from producto);

-- 13. Lista el nombre y el precio del producto más caro.

select nombre, precio
from producto
where precio = (select max(precio)
                from producto);

-- 14. Calcula la suma de los precios de todos los productos.
select sum(precio) as 'precio total'
from producto;

-- 15. Calcula el número de productos que tiene el fabricante Asus

select count(codigo_fabricante) as 'Productos del fabricante Asus'
from producto
where codigo_fabricante = (select codigo
                           from fabricante
                           where nombre = 'Asus')
group by codigo_fabricante;

-- 16. Calcula la media del precio de todos los productos del fabricante Asus

select round(avg(precio),0)
from producto
where codigo_fabricante = (select codigo
            from fabricante
            where nombre = 'Asus');


/*17.Muestra el precio máximo, precio mínimo, precio medio y el número total de
productos que tiene el fabricante Crucial*/

select max(precio), min(precio), avg(precio), count(codigo_fabricante) as 'Nº total de productos crucial'
from producto
where codigo_fabricante = (select codigo
                           from fabricante
                           where nombre = 'Crucial')
group by codigo_fabricante;

/*
18. Muestra el precio máximo, precio mínimo, precio medio y el número total
de productos de los fabricantes que tienen un precio medio superior a
200€. No es necesario mostrar el nombre del fabricante, con el código del
fabricante es suficiente.
 */

select codigo_fabricante, max(precio), min(precio), avg(precio), count(nombre)
from producto
group by codigo_fabricante
having avg(precio) > 200;

/*19. Devuelve un listado con los nombres de los fabricantes donde la suma del
precio de todos sus productos es superior a 200€.*/

select nombre
from fabricante
where codigo in (select codigo_fabricante
                from producto
                group by codigo_fabricante
                having sum(precio) > 200);

/*20. Devuelve todos los datos de los productos que tienen un precio menor que el
precio del producto más caro del fabricante Lenovo.*/

select *
from producto
where ;

