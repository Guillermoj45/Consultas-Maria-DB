use empresa2324;

select NOMEM as Nombre, date_format(FECNA, "%d/%m/%Y") as 'Fecha de nacimiento', NUMDE as 'Nº departamento', NUMHI as 'Nº de hijos'
from empleados
where NUMHI >= 2 and NUMDE in (100, 110, 111) and FECNA <= '1971/01/01'
order by NUMDE;
