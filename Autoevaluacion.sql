use empresa2324;
/*
 Muestra los nombres de los departamentos que están formados por más de tres departamentos. Revisa la información que
 hay almacena en la tabla departamentos, en concreto la columna depde
 */

select nomde
from departamentos
where 3 >= (select count(DEPDE)
               from empleados);
describe departamentos;
describe empleados;