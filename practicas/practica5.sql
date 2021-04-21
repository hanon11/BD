/*ejercicio1*/
select * 
from articulos
where art_peso <
	(select art_peso
	from articulos
	where art_num = 2)
order by art_peso asc;

/*ejercicio2*/
select *
from proveedores
where prv_num in
	(select art_prv
	from articulos
	where art_prv = prv_num);
	
/*ejercicio3*/
select * 
from ventas
where vnt_art in
	(select art_num
	from articulos
	where art_nom = 'impresora')
or vnt_clt in
	(select clt_num
	from clientes
	where clt_pob = 'Madrid');
	
/*ejercicio4*/
select * 
from clientes
where clt_pais = 'e' and clt_nom not like 'Pablo' and clt_pob in
	(select clt_pob
	from clientes
	where clt_nom = 'Pablo')
order by clt_num;

/*ejercicio5*/
select *
from tiendas
where tda_num in
	(select vnt_tda
	from ventas
	where vnt_art in
		(select art_num
		from articulos
		where art_col = 'azul')
	);
	
/*ejercicio6*/
select *
from articulos
where art_pv > 
	(select max(art_pv)
	from articulos
	where art_col = 'blanco');
	
/*ejercicio7*/
select *
from clientes
where clt_num in 
	(select vnt_clt
	from ventas
	group by vnt_clt
	having count(vnt_clt) > 3);
	
/*ejercicio8*/
select * 
from tiendas
where tda_num in
	(select vnt_tda
	from ventas
	where vnt_clt in
		(select clt_num
		from clientes
		where clt_pob = 'Madrid'));



/*ejercicio9*/
select * 
from articulos
where art_pc >
	(select art_pc
	from articulos
	where art_col = 'malva'
	having min(art_pv));
	
/*ejercicio 10*/
select * from proveedores 
where PRV_NUM in (
    select VNT_ART from (
        select VNT_ART, count(*) from ventas 
        group by vnt_art 
        having count(*) >= ALL (select count(*) from ventas group by vnt_art)
    ) Alias
);
	
