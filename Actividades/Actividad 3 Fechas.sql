-- Guillermo Remesal García
SET lc_time_names = 'es_ES';
SELECT @@lc_time_names;

/*
Consulta 1

Obtener por orden alfabético, los nombres y fechas de nacimiento de los
empleados que cumplen años en el mes de Agosto. Usa la función MONTH. El
resultado ha de ser:
*/
select NOMEM as Nombre, date_format(FECNA, '%e/%c/%Y') as 'Fecha de nacimiento'
from empleados
where 8 = month(FECNA)
order by NOMEM;

/*
Consulta 2

Modifica la consulta anterior para que también muestre los que han nacido en el
último trimestre de cualquier año. Usa el operador IN. El resultado ha de ser:
*/
select NOMEM as Nombre, date_format(FECNA, '%e/%c/%Y') as 'Fecha de nacimiento'
from empleados
where month(FECNA) in (10, 11, 12)
order by month(FECNA);

/*
Consulta 3

Del listado anterior queremos los que hayan nacido después del 1967 sin incluir
este. Usa la función YEAR. El resultado ha de ser:
*/

select NOMEM as Nombre, date_format(FECNA, '%e/%c/%Y') as 'Fecha de nacimiento'
from empleados
where month(FECNA) in (10, 11, 12)
  and year(FECNA) > 1967
order by month(FECNA);

/*
Consulta 4
Obtener los nombres y fecha de nacimiento de los empleados cuya fecha de
nacimiento es anterior al 1965 incluido este. Usa la función YEAR El resultado ha
de ser:
*/

select NOMEM as Nombre, date_format(FECNA, '%e/%c/%Y') as 'Fecha de nacimiento'
from empleados
where year(FECNA) <= 1965
order by year(FECNA);

/*
Consulta 5
Obtener los empleados cuyo nacimiento fue en domingo. Usa la función day() y
dayname(). El resultado ha de ser:
*/

select NOMEM as Nombre, day(FECNA) as 'Dia', dayname(FECNA) as 'Día de la semana'
from empleados
where dayname(FECNA) = 'domingo'
order by NOMEM;

/*
Consulta 6
Obtener los empleados cuyo día de la semana para el nacimiento y la
incorporación fue viernes. El resultado ha de ser:
*/

select NOMEM as Nombre, dayname(FECNA) as 'Día de nacimiento', dayname(FECIN) as 'Día de la incorporacion'
from empleados
where dayname(FECIN) = 'viernes'
  and dayname(FECNA) = 'viernes'
order by NOMEM;

/*
 Consulta 7
Obtener los empleados cuyo día de la semana para el nacimiento y la
incorporación coinciden. Es decir nacieron y se incorporaron un lunes, o nacieron
y se incorporaron un martes, etc. El resultado ha de ser:
*/

select NOMEM as nombre, dayname(FECNA) as 'Día de nacimiento', dayname(FECIN) as 'Día de incorporación'
from empleados
where dayname(FECIN) = dayname(FECNA)
order by NOMEM;

/*
Consulta 8
Obtener los empleados y su mes de incorporación siempre que sea del primer
trimestre de cualquier año. El resultado ha de ser:
*/
select NOMEM as nombre, monthname(FECIN)
from empleados
where month(FECIN) in (1, 2, 3)
order by monthname(FECIN), NOMEM;

/*
Consulta 9
Obtener los empleados y su mes de incorporación siempre que esté entre los
meses de Enero y Junio (ambos inclusive) y el mes de nacimiento coincida con el
mes de incorporación. El resultado ha de ser:
*/
select NOMEM as Nombre, monthname(FECNA) as 'Mes de nacimiento', monthname(FECIN) as 'Mes de incorporacion'
from empleados
where monthname(FECNA) = monthname(FECIN)
  and month(FECIN) in (1, 2, 3, 4, 5)
order by month(FECIN);

/*
Consulta 10
Devuelve el nombre y la edad de los empleados que trabajan en el departamento
nº 110. El resultado ha de ser:
*/
select NOMEM, concat(timestampdiff(year, FECNA, curdate()), 'años') as Edad
from empleados
where NUMDE = 110;

/*
Consulta 11
Devuelve un listado con dos columnas, donde aparezca el nombre del empleado
junto con la cantidad de días que lleva trabajando en la empresa. El resultado ha
de ser:
*/

select NOMEM, timestampdiff(day, FECIN, now()) as 'Días trabajados'
from empleados
order by NOMEM;

/*
Consulta 12
Devuelve un listado con dos columnas, donde aparezca el nombre del empleado
junto con la cantidad de meses (la parte entera) que lleva trabajando en la
empresa. El resultado ha de ser:
*/

select NOMEM, timestampdiff(month, FECNA, FECIN), truncate((datediff(FECIN, FECNA)) / 30, 0)
from empleados
order by NOMEM;

/*
Consulta 13
Devuelve un listado con dos columnas, donde aparezca el nombre del empleado
junto con la fecha de nacimiento especificada de la siguiente forma: 1 de enero de
1999, según sea el caso para cada empleado. El resultado ha de ser:
*/

select NOMEM, concat(day(FECNA), ' de ', monthname(FECNA), ' de ', year(FECNA)) as 'Fecha de nacimiento'
from empleados
order by NOMEM;