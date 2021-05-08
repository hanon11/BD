select tda_num 'Store number', tda_pob 'Store town', concat(P1.prv_nom, ', ', P2.prv_nom, ', ', P3.prv_nom) 'Supplier name'
from tiendas, proveedores P1, proveedores P2, proveedores P3
where tda_num in
	(select vnt_tda
	from ventas, articulos
	where  P1.prv_num = 2 and art_prv = P1.prv_num and art_num = vnt_art)
and tda_num in
	(select vnt_tda
	from ventas, articulos
	where  P2.prv_num = 3 and art_prv = P2.prv_num and art_num = vnt_art)
and tda_num in
	(select vnt_tda
	from ventas, articulos
	where  P3.prv_num = 5 and art_prv = P3.prv_num and art_num = vnt_art);


