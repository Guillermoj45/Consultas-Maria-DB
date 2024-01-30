-- Configuración de varialbles globales de MariaDB para
-- que aparezcan los nombres de los meses y los días de la semana en español
SET lc_time_names = 'es_ES';
SELECT @@lc_time_names;

-- Para indicar las zona horaria que vamos a usar para hacer las consultas
SET GLOBAL time_zone = 'Europe/Madrid';
SET time_zone = 'Europe/Madrid';

use instituto;
-- Ejemplos sobre la base de datos instituto
/* C1 Devuelve un listado con cuatro columnas, donde aparezca en la primera columna la fecha de nacimiento
 completa de los alumnos, en la segunda columna el día, en la tercera el mes y en la cuarta el año.
 Utilice las funciones DAY, MONTH y YEAR.*/

select fecha_nacimiento, day(fecha_nacimiento) as Día, month(fecha_nacimiento) as Mes,year(fecha_nacimiento) as Año
from alumno;

select fecha_nacimiento, 
concat(day(fecha_nacimiento),' de ', monthname(fecha_nacimiento),' de ', year(fecha_nacimiento)) as 'Fecha de nacimiento'
from alumno;

/* C2 Devuelve un listado con tres columnas, donde aparezca en la primera columna la fecha de nacimiento
 de los alumnos, en la segunda el nombre del día de la semana de la fecha de nacimiento y 
 en la tercera el nombre del mes de la fecha de nacimiento. 
Usa DAYNAME y MONTHNAME */
select fecha_nacimiento, dayname(fecha_nacimiento) as Día, monthname(fecha_nacimiento) as Mes
from alumno;

/* C3 Resuelve la consulta anterior usando Date_format*/
select fecha_nacimiento, date_format(fecha_nacimiento, '%W') as Día, date_format(fecha_nacimiento, '%M') as Mes
from alumno;

/* C4 Devuelve un listado con dos columnas, donde aparezca en la primera columna la fecha de nacimiento
 de los alumnos y en la segunda columna el número de días que han pasado desde la fecha actual
 hasta la fecha de nacimiento. Utilice las funciones DATEDIFF y NOW.*/
 -- Esta consulta devuelve la fecha y hora actuales.
SELECT NOW();
select curdate();

select fecha_nacimiento, datediff(now(),fecha_nacimiento) as 'Días vividos'
from alumno;
select fecha_nacimiento, datediff(curdate(),fecha_nacimiento) as 'Días vividos'
from alumno;
 
 /*Devuelva un listado con dos columnas, donde aparezca en la primera columna la fecha de nacimiento
 de los alumnos y en la segunda columna la edad de cada alumno/a. 
 La edad (aproximada) la podemos calcular realizando las siguientes operaciones:*/
 
select fecha_nacimiento, datediff(now(),fecha_nacimiento)/365.25 as 'edad'
from alumno;

select fecha_nacimiento, truncate((datediff(now(), fecha_nacimiento)) / 365.25, 0) as 'edad'
from alumno;

 
 -- Esta sería incorrecta.
select fecha_nacimiento, now()-fecha_nacimiento as 'edad'
from alumno;
 
 
 /*  El número de días que han pasado desde la fecha actual hasta la fecha de nacimiento se ha dividido entre 365.25 
 (El 0.25 es para compensar los años bisiestos que han podido existir entre la fecha de nacimiento y la fecha actual).
 Por último se trunca las cifras decimales del número obtenido.*/