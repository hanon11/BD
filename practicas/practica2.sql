/*Ejercicio 21*/
select distinct tda_pob
from tiendas
order by tda_pob

/*Ejercicio 22*/
select distinct clt_pob, clt_pais
from clientes

/*Ejercicio 23*/
select art_nom 'Name', art_col 'Colour', art_pv 'Selling price'
from articulos
where art_prv=2
order by art_pv DESC, art_nom

/*Ejercicio 24*/
select  vnt_tda 'Shop', vnt_art 'Item',vnt_cant 'Quantity', vnt_fch 'Date of purchase'
from ventas
where vnt_clt=1 AND vnt_art between 12 and 20

/*Ejercicio 25*/
select tda_ger 'Manager', tda_pob 'Town'
from tiendas
where tda_pob NOT IN ('París', 'Lyon') AND tda_pob not LIKE 'Madrid%'
order by tda_ger, tda_pob 


/*Ejercicio 26*/
select art_nom
from articulos
where art_peso AND art_col is not null AND (art_nom not LIKE 'b%' OR art_nom not LIKE 'i%')
order by art_pc DESC

/*Ejercicio 27*/
select vnt_fch 'Date'
from ventas
where vnt_art = 9
order by vnt_fch


/*Ejercicio 28*/
select prv_num 'Code number', prv_nom 'Name of supplier'
from proveedores
where prv_nom LIKE '%ca%' AND prv_nom NOT LIKE '%nic'


/*Ejercicio 29*/
select *
from tiendas
where tda_ger LIKE '%Juan Carlos%'

/*Ejercicio 30*/
select clt_nom, clt_apell
from clientes
where clt_nom LIKE 'J%' AND clt_apell NOT LIKE '%z' AND (clt_pob in ('Madrid', 'Barcelona', 'Valencia', 'Pamplona') OR clt_num BETWEEN 1 AND 10)

