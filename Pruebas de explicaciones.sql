use empresa2324;

DELIMITER $$
create function años (fecha date)
returns int unsigned
begin
DECLARE num INT UNSIGNED;
set num=(TIMESTAMPDIFF( year, fecha, now() ));
return num;
end $$
delimiter ;
