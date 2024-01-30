DROP DATABASE IF EXISTS instituto;
CREATE DATABASE instituto;
USE instituto;

CREATE TABLE alumno (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  apellido1 VARCHAR(100) NOT NULL,
  apellido2 VARCHAR(100),
  fecha_nacimiento DATE NOT NULL,
  es_repetidor ENUM('sí', 'no') NOT NULL,
  teléfono VARCHAR(9)
);
/* Para reiniciar el autoincrementable por si nos hiciera falta.
 * después de borrar los registros de la tabla
 */
ALTER TABLE alumno AUTO_INCREMENT=1;

-- Insercción de registros.
INSERT INTO alumno VALUES(1,'María', 'Sánchez', 'Pérez', '1990/12/01', 'no', NULL);

INSERT INTO alumno (nombre,apellido1,apellido2,fecha_nacimiento,es_repetidor,teléfono) 
	VALUES('Juan', 'Sáez', 'Vega', '1998/04/02', 'no', 618253876);
INSERT INTO alumno (nombre,apellido1,apellido2,fecha_nacimiento,es_repetidor,teléfono)
	VALUES('Pepe', 'Ramírez', 'Gea', '1988/01/03', 'no', NULL);
INSERT INTO alumno(nombre,apellido1,apellido2,fecha_nacimiento,es_repetidor,teléfono) 
	VALUES('Lucía', 'Sánchez', 'Ortega', '1993/06/13', 'sí', 678516294);

INSERT INTO alumno(nombre,apellido1,apellido2,fecha_nacimiento,es_repetidor,teléfono) 
	VALUES('Paco', 'Martínez', 'López', '1995/11/24', 'no', 692735409),
		('Irene', 'Gutiérrez', 'Sánchez', '1991/03/28', 'sí', NULL),
		('Cristina', 'Fernández', 'Ramírez', '1996/09/17', 'no', 628349590),
		('Antonio', 'Carretero', 'Ortega', '1994/05/20', 'sí', 612345633),
		('Manuel', 'Domínguez', 'Hernández', '1999/07/08', 'no', NULL),
		('Daniel', 'Moreno', 'Ruiz', '1998/02/03', 'no', NULL);
	
-- Consulta nº 1
-- Obtener todos los datos de todos los alumnos matriculados en el curso.
SELECT *
FROM alumno;

-- Consulta nº 2
-- Obtener el nombre de todos los alumnos.
SELECT nombre
FROM alumno;

-- Consulta nº 3
-- Obtener el nombre y los apellidos de todos los alumnos
SELECT nombre, apellido1, apellido2
FROM alumno;

-- Los datos se mostrarán según el orden
-- en el que se escriban los campos.
SELECT apellido1, apellido2, nombre
FROM alumno;

-- Consulta  nº 4
-- Obtener el nombre y los apellidos de todos los alumnos en una única columna.
SELECT CONCAT(nombre, apellido1, apellido2) AS nombre_completo
FROM alumno;

SELECT CONCAT(nombre, apellido1, apellido2) 'Nombre y Apellidos'
FROM alumno;

-- Con espacio en blanco para separar
SELECT CONCAT_WS(' ', nombre, apellido1, apellido2) "Nombre y Apellidos"
FROM alumno;

-- Consulta nº 5
-- Obtener el nombre y los apellidos de todos los alumnos, ordenados por su primer apellido de forma ascendente.
SELECT apellido1, apellido2, nombre
FROM alumno
ORDER BY apellido1;

-- También se puede hacer usando ASC
-- La consulta anterior es equivalente a esta otra.
SELECT apellido1, apellido2, nombre
FROM alumno
ORDER BY apellido1 ASC;

-- Consulta nº 6
-- Orden descendente
SELECT apellido1, apellido2, nombre
FROM alumno
ORDER BY apellido1 DESC;

-- Consulta nº 7
-- Orden de múltiples columnas.
SELECT apellido1, apellido2, nombre
FROM alumno
ORDER BY apellido1, apellido2, nombre;
-- Otra forma de la anterior
SELECT apellido1, apellido2, nombre
FROM alumno
ORDER BY 1, 2, 3;
-- Consulta nº 8
-- Obtener todos los datos de los seis primeros alumnos
-- que hay registrados en la tabla.
SELECT *
FROM alumno
LIMIT 6;

-- Cláusula WHERE
SELECT nombre
FROM alumno
WHERE apellido1 = 'Martínez';

SELECT *
FROM alumno
WHERE id = 9;

SELECT nombre, fecha_nacimiento
FROM alumno
WHERE fecha_nacimiento >= '1997/01/01';

SELECT nombre AS Nombre, apellido1 AS 'Primer apellido', apellido2 AS 'Segundo apellido' 
FROM alumno;

SELECT *
FROM alumno
WHERE teléfono IS NOT null;