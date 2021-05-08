/*ejercicio11*/
select * from articulos 
    where ART_NUM in 
       (Select VNT_ART from ventas where Month(VNT_FCH) = 1)
    and ART_NUM in
       (Select VNT_ART from ventas where Month(VNT_FCH) = 2)
    order by ART_NUM;

/*ejercicio12*/
select * from tiendas 
    where TDA_NUM in 
       (Select VNT_TDA from ventas where Month(VNT_FCH) = 2)
    and TDA_NUM not in
       (Select VNT_TDA from ventas where Month(VNT_FCH) = 1)
    order by TDA_NUM;

/*ejercicio13*/
select * from proveedores 
    where PRV_NUM in 
       (
        Select ART_PRV from articulos, ventas 
       	     where ART_NUM = VNT_ART
       	     and Month(VNT_FCH) = 1
       )
    or PRV_NUM in
       (
        Select ART_PRV from articulos, ventas 
       	     where ART_NUM = VNT_ART
       	     and Month(VNT_FCH) = 2
       );

/*ejercicio14*/
select clt_num, clt_nom, clt_apell, ifnull(sum(vnt_cant), 0)
from clientes left outer join ventas on clt_num = vnt_clt
group by clt_num; 

/*ejercicio15*/
Select art_num, art_nom, vnt_fch, clt_num, clt_nom, clt_apell
from articulos left outer join (ventas, clientes) on art_num = vnt_art;

 /*   -------------------o--------------*/
    
Select art_num, art_nom, vnt_fch, clt_num, clt_nom, clt_apell
from articulos left outer join ventas on art_num = vnt_art
left outer join clientes on clt_num = vnt_clt;


/*ejercicio16*/
Select TDA_POB, TDA_GER, count(*) as 'Sales', avg(vnt_cant) from tiendas, ventas 
      where tda_num = vnt_tda
      and tda_pob not like 'Madrid%'
      group by TDA_NUM
      having count() > any(
            select count() from tiendas, ventas 
            where tda_num = vnt_tda
            and tda_pob  like 'Madrid%'
            group by TDA_NUM);
            
/*ejercicio17*/
select clt_nom, prv_nom from clientes, ventas, articulos, proveedores
    where clt_pob = 'Madrid' 
    and clt_num = vnt_clt
    and vnt_art = art_num
    and art_prv = prv_num
    and prv_nom = 'electrolamp';













