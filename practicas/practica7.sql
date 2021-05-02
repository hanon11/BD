/*ejercicio1*/
select art_nom, art_col, art_pc, prv_nom
from articulos, proveedores 
where art_pv > 10 and art_prv = prv_num
order by art_nom;

/*ejercicio2*/
select T.*, vnt_fch
from tiendas T, ventas V
where V.vnt_fch LIKE '2020-02%' and T.tda_num = V.vnt_tda
ORDER BY V.vnt_fch DESC, tda_ger;

/*ejercicio3*/
select C2.* 
from clientes C2, clientes C1 
where C1.clt_num = 5 and C2.clt_num != C1.clt_num and C2.clt_pob = C1.clt_pob;

/*ejercicio4*/
select art_num, art_nom, art_col, peso_nom
from pesos, articulos
where art_col in ('azul', 'rosa', 'verde') and art_peso between PESO_MIN and PESO_MAX;

/*ejercicio5*/
select clt_nom, clt_apell, clt_pob, tda_pob, vnt_fch
from clientes, tiendas, ventas
where clt_pob LIKE 'Barcelona' and tda_pob not like 'Barcelona' and clt_num = vnt_clt and tda_num = vnt_tda;

/*ejercicio6*/
select clt_num, clt_nom, clt_apell, count(*) 'compras'
from clientes, ventas 
where clt_num = vnt_clt
group by clt_num
having compras > 2
order by compras desc;

/*ejercicio7*/
select tda_pob, count(distinct(vnt_clt)) 'Clientes'
from tiendas, clientes, ventas
where clt_num = vnt_clt and vnt_tda = tda_num 
group by tda_num
order by Clientes desc;

/*ejercicio8*/
select ART_COL, sum(VNT_CANT) as 'Amount', count(distinct(ART_NUM)) as 'Variety' from articulos, ventas
    where ART_NUM = VNT_ART
    group by ART_COL
    order by Amount desc, Variety desc;

/*ejercicio9*/
select PRV_NOM, sum(VNT_CANT) 'Sales' from articulos, proveedores, ventas
    where PRV_NUM = ART_PRV
    and ART_NUM = VNT_ART
    group by PRV_NUM;

/*ejercicio10*/

select CONCAT(CLT_NOM, ' ', CLT_APELL) 'Cliente', TDA_POB 'Tienda', SUBSTRING_INDEX(ART_NOM, ' ', 1) 'Articulo', VNT_CANT 'Cantidad', VNT_FCH 'Fecha' from clientes, tiendas, ventas, articulos
    where CLT_NUM = VNT_CLT
    and TDA_NUM = VNT_TDA
    and ART_NUM = VNT_ART
    order by VNT_FCH asc, VNT_CANT;
