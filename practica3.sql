/*EJERCICIO 1*/
SELECT peso_nom, peso_max - peso_min 'Difference'
FROM pesos;

/*EJERCICIO 2*/
SELECT DAYNAME('2000-06-05')

/*EJERCICIO 3*/
SELECT UPPER(pai_nombre)
FROM paises
WHERE pai_nombre LIKE 'A%';

/*EJERCICIO 4*/
select prv_nom
from proveedores
where prv_nom LIKE 'e%' OR UPPER('e%');

/*EJERCICIO 5*/
select emp_nacimiento, YEAR(CURTIME())-YEAR(emp_nacimiento) 'age', round(datediff(curtime(), emp_nacimiento)/365.25,2) 'age2'
from empleados 
where YEAR(CURTIME())-YEAR(emp_nacimiento) > 40;

/*EJERCICIO 6*/
select CONCAT(clt_nom, ' ', clt_apell) 'Client', UPPER(clt_pais)
from clientes;

/*EJERCICIO 7*/
SELECT *, round(art_pv - art_pc,2) 'Profit'
from articulos
where art_pv > art_pc * 2
ORDER BY (art_pv - art_pc) DESC;

/*EJERCICIO 8*/
select *
from ventas
where DAY(vnt_fch) = 2;


/*EJERCICIO 9*/
select emp_nombre
from empleados
where CHAR_LENGTH(emp_nombre) > 5;

/*EJERCICIO 10*/
select tda_num, tda_pob, tda_ger, SUBSTRING_INDEX(tda_ger, ', ', -1) 'Name'
from tiendas;

