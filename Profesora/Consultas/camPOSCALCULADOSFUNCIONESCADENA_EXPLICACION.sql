use empresa2324;
/* CAMPOS CALCULADOS Y FUNCIONES DE CADENA DE CARÁCTERES */

/* Obtener un listado con el nombre de los empleados junto con su salario total (salar+comis)*/
SELECT nomem, (salar+comis) AS 'Salario Total'
FROM empleados
ORDER BY 2;

/*COMO EVITAR MOSTRAR LOS NULL
Para ello usaremos la función de Mysql/MariDB llamada COALESCE aue lo que hace es que en el caso
de que salar+comis sea null nos devuelva solo el valor de salar*/

SELECT nomem, COALESCE((salar+comis),salar) AS 'Salario Total'
FROM empleados
ORDER BY 2;

/* Mostrar el salario de los empleados que no tienen comisión incrementados un 5% */
SELECT nomem, salar+(salar*0.05) AS Salario
FROM empleados
WHERE comis IS NULL;


SELECT nomem, salar*1.05 AS Salario
FROM empleados
WHERE comis IS NULL;


/* FUNCIONES DE CADENAS DE CARACTERES */
SELECT nomde, LOWER(nomde)
FROM departamentos;

SELECT nomde, LEFT(nomde, 1)
FROM departamentos;

SELECT nomde, lower(LEFT(nomde, 1))
FROM departamentos;

/*Si quieres contar los caracteres o letras, independientemente de si son multibyte o no, usa char_length.
En caso de que quieras el espacio ocupado en bytes usa length ( Por ejemplo, para representar la letra ‘á’ (la a con acento o tilde) 
se necesitan dos bytes.).
Comúnmente para saber la longitud de una cadena vas a usar char_length. */
SELECT nomde, CHAR_LENGTH(nomde), LENGTH(nomde)
FROM departamentos;

select version();
SELECT @@lc_time_names;
