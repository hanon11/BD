/*ejercicio 11*/
select * 
from articulos 
where art_peso > ANY
	(select art_peso 
	from articulos 
	where ART_COL = 'morado');


select * 
from articulos a1
where exists
	(select * 
	from articulos a2 
	where ART_COL = 'morado' and a1.art_peso > a2.art_peso);




/*ejercicio 12*/
select * 
from tiendas
where tda_num in
	(select vnt_tda
	from ventas
	group by vnt_tda
	having count(*) >= ALL
		(select vnt_tda
		from ventas
		group by vnt_tda)
	);



/*ejercicio 13*/
select * 
from clientes c1
where (clt_pais, clt_pob) =
	(select clt_pais, clt_pob
	from clientes c2
	where c1.clt_num != 24 and c2.clt_num = 24);

/*ejercicio 14*/
select *
from ventas v1
where vnt_fch >= ALL
	(select vnt_fch
	from ventas v2
	where v1.vnt_art = v2.vnt_art)
order by vnt_art asc;



/*ejercicio 15*/
select *
from tiendas
where tda_num in
	(select vnt_tda
	from ventas);



select *
from tiendas 
where exists 
	(select * 
	from ventas 
	where VNT_TDA = TDA_NUM);
	
	
/*ejercicio 16*/
select * 
from articulos
where exists
	(select *
	from ventas
	where vnt_art = art_num and vnt_clt in
		(select clt_num
		from clientes
		where clt_pob != 'Madrid')
	);
	
/*ejercicio 17*/
select * 
from clientes
where (clt_pob ='Madrid' or clt_pob = 'Barcelona') and clt_num not in
	(select vnt_clt
	from ventas
	group by vnt_clt
	having count(*) >= 2
	);


/*ejercicio18*/
select * 
from proveedores
where exists
	(select *
	from articulos
	where art_prv = prv_num);
	
/*ejercicio 19*/
select * 
from tiendas
where exists 
	(select *
	from ventas
	where tda_num = vnt_tda and vnt_art in
		(select art_num
		from articulos
		where art_nom not like 'boligrafo%')
	);
	
	
	
/*ejercicio 20*/
SELECT *
FROM clientes
WHERE clt_pais = 'e' AND clt_num IN
	(SELECT vnt_clt
	FROM ventas
	GROUP BY vnt_clt
	HAVING SUM(vnt_cant) >
		(SELECT SUM(vnt_cant)
		FROM ventas
		WHERE vnt_clt = 17
		GROUP BY vnt_clt
		)
	);
