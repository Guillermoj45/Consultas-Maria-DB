use instituto;

-- Explicación funciones de agregación
-- Estas instrucciones se emplean para que los días de la semana y los meses se muestren en español.
set lc_time_names='es_ES';
select @@lc_time_names;
-- Ejemplo de función. Hay que seleccionar el código para su ejecución
DELIMITER $$
create function años (fecha date)
returns int unsigned
	begin
		DECLARE num INT UNSIGNED;
		set num=(TIMESTAMPDIFF( year, fecha, now() ));
		return num;
	end $$
delimiter ;
-- Obtener la edad usando una función definida por nosotros.

select nombre, fecha_nacimiento, años(fecha_nacimiento) as 'edad'
from alumno;

-- Devolver la edad máxima y mínima
select MAX(años(fecha_nacimiento)) as 'edad máxima', MIN(años(fecha_nacimiento)) as 'edad mínima'
from alumno;

-- Calcular la edad media sin redondeo y redondeada.
select truncate(avg(años(fecha_nacimiento)),0) as 'edad media sin redondear',
concat(round(AVG(años(fecha_nacimiento))),' años') as 'edad media redondeada'
from alumno;

/* Contar las ocurrencias o registros o fila de una tabla COUNT(*) o
contar los alumnos matriculados.*/

select count(*)
from alumno;

-- Contar el número de alumnos que no tienen teléfono indicado
select count(*) as 'alumnos sin teléfono'
from alumno
where teléfono is null;

select *
from alumno;

-- Contar el número de alumnos que tienen teléfono indicado
-- No hace fatla poner condición porque al llamar a la función count con un 
-- nombre de atributo cuenta los no nulos.

select count(teléfono) as 'alumnos con teléfono'
from alumno;

-- Contar el número de alumnos que son repetidores
select count(*) as 'Alumnos repetidores'
from alumno
-- where es_repetidor ='sí';
where es_repetidor like 'sí';

-- Ejemplo Group by
-- Mostrar la cantidad de alumnos repetidores y no repetidores
select es_repetidor, id
from alumno
order by 1;

Select es_repetidor, count(id) as 'Número de alumnos'
from alumno
group by es_repetidor
order by 1;

describe alumno;

-- Contar los alumnos nacidos por año
select year(fecha_nacimiento), id 
from alumno
order by 1;

select year(fecha_nacimiento), count(id) as 'Número de alumnos'
from alumno
group by year(fecha_nacimiento)
order by 1;

-- Contar los alumnos nacidos por año a partir del 1995 incluido este
select year(fecha_nacimiento), count(id) as 'Número de alumnos'
from alumno
where year(fecha_nacimiento)>=1995
group by year(fecha_nacimiento);
-- group by 1;

-- Mostrar los años donde han nacido más de un alumno.
select year(fecha_nacimiento), count(id) as 'Número de alumnos'
from alumno
group by year(fecha_nacimiento)
having count(id) > 1 ;

-- EJEMPLO de subconcultas.
-- Queremos saber los nombres de los alumnos que han nacido en el mismo año que el alumno de id=10
select year(fecha_nacimiento)
from alumno
where id = 10;

select *
from alumno;

select nombre
from alumno
where year(fecha_nacimiento) = (select year(fecha_nacimiento)
							  from alumno
								where id=3);

-- Saber el nombre de los alumnos que tienen la edad máxima
-- Aquí hay que hacer uso de una SUBCONSULTAS.

select nombre AS 'Alumno edad máxima',años(fecha_nacimiento) as 'edad'
from alumno
where años(fecha_nacimiento) =
				(select MAX(años(fecha_nacimiento))
                from alumno);

select nombre AS 'Alumno edad mínima', años(fecha_nacimiento) as 'edad'
from alumno
where  años(fecha_nacimiento)=
		(select MIN(años(fecha_nacimiento))
        from alumno);
        
select nombre AS 'Alumno',concat(años(fecha_nacimiento), ' (el mayor)') as 'edad'
from alumno
where años(fecha_nacimiento)=
				(select MAX(años(fecha_nacimiento))
                from alumno)
union

select nombre AS 'Alumno', concat(años(fecha_nacimiento), ' (el menor)') as 'edad'
from alumno
where  años(fecha_nacimiento)=
		(select MIN( años(fecha_nacimiento))
        from alumno);