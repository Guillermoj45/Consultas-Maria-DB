use empresa2324;

/*
1. Hallar, por orden alfabético descendente, los nombres de los departamentos
que pertenecen al centro de trabajo número 10.
*/

select NOMDE
from departamentos
where NUMCE = '10'
order by NOMDE DESC;

/*
2. Obtener un listín telefónico de los empleados que trabajan en los departamentos 110
y 111 incluyendo nombre de empleado, número de empleado,extensión telefónica y
el número de departamento. Los nombres deben estar ordenados
alfabéticamente(ascendente) en cada departamento.
*/

select NOMEM, NUMEM, EXTEL, NUMDE
from empleados
where NUMDE in ('110','111')
order by NUMDE, NOMEM;

/*
3. Obtener una relación de todos los números de extensiones telefónicas de los
empleados, junto con el nombre de estos, para aquellos que trabajen en el
departamento 122. En la consulta nomem debe aparecer como Nombre y extel como
Extensión Telefónica. El resultado debe aparecer ordenado como se muestra en la
imagen */

SELECT NOMEM as 'Nombre', EXTEL as 'Extension telefonica'
from empleados
where numde = '122'
order by NOMEM;

/*
4. Hallar la comisión, nombre y salario de los empleados que tienen tres o más hijos,
ordenados por comisión, y dentro de comisión por orden alfabético como aparece en
la imagen.*/

select COMIS, NOMEM,SALAR
from empleados
where NUMHI >= 3
order by COMIS, NOMEM;

/*
5. Hallar la comisión, nombre y salario de los empleados que tienen tres hijos,
ordenados por comisión, para aquellos empleados que tienen comisión. */

select COMIS, NOMEM, SALAR
from empleados
where NUMHI = 3 and not COMIS = 'null'
order by COMIS;

/*
 6. Obtener salario y nombre de los empleados sin hijos y cuyo salario esté comprendido
entre 600 y 1200 ambos incluidos. Se obtendrán por orden decreciente de salario.
 */

select SALAR, NOMEM
from empleados
where SALAR >=600 and SALAR <= 1200 and NUMHI = 0
order by SALAR DESC;

/*
 7. Obtener los números de los departamentos, sin repetición, donde trabajan
empleados cuyo salario sea inferior a 1500. CONSULTA LA DIAPOSITIVA nº 26 del
documento de los apuntes.
 */

 -- revisar, no entiedo el enunciado creo
select distinct *
from empleados;

select distinct NUMDE
from empleados
where SALAR < 1500
order by NUMDE;
/*
8. Obtener las distintas comisiones que hay en el departamento 112. El resultado ha de
ser el que muestra la imagen
*/
select distinct COMIS
from empleados
where NUMDE = 112 and COMIS is not NULL
order by COMIS;

/*
 9. Listado de empleados que trabajan en los departamentos 120, 122 y 130
ordenado por departamentos y en cada departamento los nombres de los
empleados en orden alfabético. Consulta la diapositiva 35 de los apunte.
 */

select NUMDE, NOMEM
from empleados
where NUMDE in ('120','122','130')
order by NUMDE, NOMEM;

/*
    10. Modifica la consulta anterior para que en la cabecera de la tabla aparezca
    Nº Departamento en lugar de numde y Nombre empleado en lugar de
    nomem y nos muestre los empleados que además de trabajar en los
    departamentos 120, 122 o 130 su nombre comienza por C. Consulta la
    diapositiva 35, 36 y 37 para ver cómo se usa el operador LIKE
 */

select NUMDE as "Nº Departamento", NOMEM as "Nombre empleado"
from empleados
where NUMDE in ('120', '122', '130') and NOMEM like 'C%';

 /*
 11. Obtener los departamentos cuyo presupuesto esté comprendido entre 12 y 90.
 */

SELECT NOMDE, PRESU
from departamentos
where PRESU >= 12 and PRESU <= 90
order by PRESU;

 /*
 12. Realiza una consulta para obtener concatenado en una única columna el
 número de empleado y su extensión telefónica separados por un guión -. A
 esta nueva columna asignarle el nombre de Nº Empleado Extensión.
 */

SELECT NUMem, EXTEL, concat(NUMEM, '-', EXTEL) as 'Nº Empleado Extensión'
from empleados;

SELECT NUMem, EXTEL, concat_ws('-',NUMEM, EXTEL) as 'Nº Empleado Extensión'
from empleados;

 /*
 13. Listado de empleados que no presentan comisión, su salario es inferior a
 1500 y tienen más de dos hijos.
 */

select NOMEM, COMIS, SALAR, NUMHI
from empleados
where NUMHI >= 2 and SALAR < 1500;

 /*
 14. Listado de empleados que están en la empresa desde el año 2000, ordenado
 por fecha. Consulta cómo usar la función DATE_FORMAT para mostrar la
 fecha según aparece en la imagen,
 */

select NOMEM,date_format(FECIN, "%d/%m/%Y") as 'Fecha de incorporacio'
from empleados
where FECIN >= '2000/01/01'
order by FECIN;

 /*
 15. Obtener una relación por orden alfabético de los departamentos cuyo
 presupuesto es inferior a 30. El nombre de los departamentos vendrá
 precedido de las palabras “DEPARTAMENTO DE“. Nota: Hay que aplicar
 la concatenación para obtener el siguiente resultado.
 */

select concat('Departamento de ', NOMDE) as Nombre
from departamentos
where PRESU < 30;
