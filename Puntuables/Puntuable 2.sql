-- Guillermo Remesal Garcia
use empresa2324;
SET lc_time_names = 'es_ES';

select NOMEM as Nombre, FECIN as 'Fecha de incorporación', concat(truncate(SALAR*0.03,0),' €') as 'Nueva comisión', concat(lpad(month(FECNa),2,'0'), reverse(right(NOMEM,3)),lower(left(NOMEM,2)))
from empleados
where COMIS is null and NUMHI = '0' and year(FECIN) <= 2000
order by NOMEM;
