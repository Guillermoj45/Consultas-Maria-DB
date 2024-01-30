use empresa2324;

/*
Consulta 1
Hallar el salario medio, mínimo y máximo de los empleados de la empresa.
 */
select  truncate(avg(SALAR),0) as 'Salario medio', min(SALAR) as'Salario minimo', max(SALAR) as 'Salario máximo'
from empleados;

/*
Consulta 2
Hallar el número de empleados que hay en el departamento 112, cuántas
comisiones distintas hay en ese departamento y la suma de las comisiones
distintas de null.
*/
select count(NUMEM) as 'Cantidad de empleados',count(distinct COMIS) as 'Comisiones distintas',SUM(COMIS) as 'Suma de las comisiones'
from empleados
where NUMDE = 112;

/*
Consulta 3
Hallar cuántos empleados hay en cada departamento. Tienes que hacer uso de
group by. El resultado ha de ser el siguiente
*/
-- hay una que me cuenta uno menos no se el porque
select NUMDE as 'Nº de departamento', count(NUMEM)
from empleados
group by NUMDE
having count(NUMDE) >= 5;


/*
Consulta 4
Hallar para cada departamento el salario medio, el mínimo y el máximo. Tienes
que hacer uso de group by. El resultado es el siguiente.
*/
select NUMDE, truncate(avg(SALAR),2) as 'Salario medio', min(SALAR) as 'salario minimo',max(SALAR)as 'salario maximo'
from empleados
group by NUMDE;

/*
 Consulta 5
Hallar las comisiones diferentes que tiene cada departamento. Tienes que hacer
uso de group by. El resultado ha de ser el siguiente:
 */

select NUMDE as 'Departamento', count(distinct COMIS)
from empleados
group by NUMDE;

/*
Consulta 6
Para los departamentos en los que hay algún empleado cuyo salario sea mayor y
estricto a 2.500 € al mes, hallar el número de empleados y la suma de sus
salarios. Tienes que hacer uso de una subconsulta en el where. También tienes
que hacer uso de group by. El resultado ha de ser el siguiente:
*/

select NUMDE, count(NUMEM) as 'cantidad de empleados', sum(SALAR) as 'Suma de los salarios'
from empleados
where NUMDE in (select NUMDE
                   from empleados
                   where SALAR >= 2500)
group by NUMDE;

/*
Consulta 7
Para cada centro, hallar los presupuestos medios de los departamentos. Tienes
que hacer uso de group by. El resultado ha de ser el siguiente:
*/

select NUMCE, truncate(avg(PRESU),1) as 'Presupuesto medio'
from departamentos
group by NUMCE;

/*
Consulta 8
Para cada centro, hallar los presupuestos medios de los departamentos
clasificados según estén dirigidos en propiedad o en funciones. Tienes que hacer
uso de group by. El resultado ha de ser el siguiente:
*/

select NUMCE,
from departamentos
group by NUMCE;

/*
Consulta 9
Hallar el número de empleados que usan la misma extensión telefónica.
Solamente se desea mostrar aquellos grupos que tienen más de 1 empleado. El
resultado ha de ser el siguiente:
*/
select EXTEL,count(NUMEM)
from empleados
group by EXTEL
having count(NUMEM) > 1;

/*
Consulta 10
Para los departamentos cuyo salario medio supera al de la empresa, hallar
cuántos empleados tienen. Para el having hay que hacer una subconsulta. El
resultado ha de ser el siguiente:
*/

select NUMDE, count(NUMEM)
from empleados
group by NUMDE
having avg(SALAR) > (select avg(SALAR)
                from empleados);

/*
 Consulta 11
Hallar el máximo valor de la suma de los salarios de los departamentos. Hay que
usar group by, having, subconsulta y el operador ALL (consulta como se usa). El
resultado ha de ser el siguiente:
*/

select NUMDE, sum(SALAR)
from empleados
group by NUMDE
having sum(SALAR) >= all (select sum(SALAR)
                            from empleados
                            group by NUMDE)
