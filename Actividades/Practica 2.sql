use empresa2324;

/*
1.- Para los empleados que trabajan en los departamentos 110, 111, 120, 122 y 130 hallar el
nombre, el salario, la comisión y el salario total, es decir salario más comisión.
El listado debe estar ordenado por orden de salario total decreciente. El resultado a
obtener es:
 */

select NOMEM as NOMBRE,SALAR, COMIS, coalesce(SALAR+COMIS,SALAR)
from empleados
where NUMDE in (110, 111, 120, 122,130)
order by SALAR desc;

/*
2.- De la consulta anterior muestra el salario total de los empleados que tienen comisión.
El resultado ha de ser el que muestra la imagen.
 */

select NOMEM as NOMBRE, SALAR,COMIS, concat(COALESCE(SALAR+COMIS , SALAR),'€') as 'SALARIO TOTAL'
from empleados
where NUMDE in (110, 111, 120, 122,130) and comis IS NOT NULL
order by SALAR desc;

/*
 3.-A los empleados que no trabajan en los departamentos ni 111 ni 122 y no cobran
comisión se les va a subir el salario en 100 €. Obtener el listado de dichos empleados
ordenado alfabéticamente junto con su nuevo salario. El resultado ha de ser el siguiente:
 */

select NOMEM as 'Nombre Empleado',COALESCE(SALAR+100, '€') as 'Nuevo salario'
from empleados
where NUMDE not in (111,122)
order by NOMEM, 2;

/*
 4.- A los empleados que no tienen comisión y su salario está comprendido entre 600 y
1100 € ambos valores incluidos, se les va a dar una comisión que va a ser igual al 10% de
su salario.
 */

select NOMEM as Nombre, concat(SALAR*0.1,'€') as 'Nueva comision'
from empleados
where comis is null and SALAR >= 600 and SALAR <= 1100
order by NOMEM;

/*
5.- En una campaña de ayuda familiar se ha decidido dar a los empleados una paga extra
de 100 € por hijo, a partir del tercero inclusive. Obtener por orden alfabético para estos
empleados: el nombre, el número de hijos y esta paga extra.
*/
select NOMEM as NOMBRE, NUMHI as 'Nº de hijos', 100*(NUMHI-2) as 'Paga extra'
from empleados
where NUMHI >= 3
order by NOMEM, NUMHI, 3;

/*
6. Listado de empleados que ganan más de 25000 € anuales. Muestra la consulta tal y
como aparece en la captura.
*/

select NOMEM as NOMBRE, SALAR*12 as 'SALARIO ANUAL TOTAL'
from empleados
where SALAR+COMIS*12 > 25000 or SALAR*12 >= 25000
order by 2 desc, NOMEM;

/*
 7. Listado de empleados que se han incorporado a la empresa a partir del 1 de enero del
2000 junto con su edad.
Consulta en Internet cómo se usa la función TIMESTAMPDIFF y para qué sirve la función
CURDATE() para poder obtener la edad.
*/

select NOMEM as NOMBRE, FECIN, FECNA, timestampdiff(year, FECNA, curdate()) as Edad
from empleados
where FECIN > '2000/01/01'
order by Edad desc;

/*
8. Devuelve un listado con dos columnas, donde aparezca en la primera columna el
nombre de los empleados y en la segunda, el nombre con todos los caracteres invertidos
*/

select NOMEM as Nombre, reverse(NOMEM) as 'Nombre invertido'
from empleados;

/*
9. Devuelve un listado con dos columnas, donde aparezca en la primera columna el
nombre de los empleados y en la segunda, el nombre con todos los caracteres en
minúscula.
*/

select NOMEM as Nombre, lower(NOMEM)
from empleados;

/*
10. Añádele a la consulta anterior una columna más para mostrar el número de caracteres
que tiene cada nombre.
*/

select NOMEM as Nombre, lower(NOMEM) as 'Nombre en minúscula', char_length(NOMEM) as 'Cantidad de caracteres'
from empleados;

/*
11. A cada empleado se le asignará una cuenta de correo electrónico que será su nombre
y número de departamento en que trabaja separados por un ‘.’ Y seguido del dominio
@safareyes. Mostrar dicho listado.
*/

select NOMEM as Nombre, concat(lower(NOMEM),'.',NUMDE,'@safareyes') as 'Correo electrónico'
from empleados;

/*
12. A la consulta anterior le vas añadir una tercera columna que será una contraseña que
va a estar formada por los caracteres invertidos de su nombre en minúscula, seguidos de
los cuatro caracteres del año de la fecha de nacimiento. El resultado ha de ser:
*/

select NOMEM as Nombre, concat(lower(NOMEM),'.', NUMDE, '@safareyes') as 'Correo electrónico', concat(reverse(lower(NOMEM)),year(FECNA))
from empleados;

/*
13.- Devuelve un listado con dos columnas, donde aparezca en la primera columna el
nombre de los empleados y en la segunda, el nombre con la primera letra en mayúscula y
el resto en minúscula.
*/

select NOMEM as Nombre, concat(substr(NOMEM,1,1), lower(substr(NOMEM,2)))
from empleados;

/*
14.-Ahora la contraseña va a estar formada por el año de nacimiento seguido de los
caracteres ¿?- junto con las tres últimas letras del nombre del empleado en minúscula e
invertidas. El resultado ha de ser:
*/

select NOMEM as Nombre, concat(year(FECNA), '¿?-',lower(reverse(RIGHT(NOMEM,3))))
from empleados;
