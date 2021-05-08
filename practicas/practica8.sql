
1.-

select ART_NOM, ART_COL, ART_PC, PRV_NOM from articulos A, proveedores P
    where A.ART_PC > 10
    and P.PRV_NUM = A.ART_PRV
    order by A.ART_NOM;

2.-

select T.*, VNT_FCH from tiendas T, ventas V 
    where V.VNT_FCH between '2020-2-1' and '2020-2-29'
    and V.VNT_TDA = T.TDA_NUM 
    order by V.VNT_FCH desc, T.TDA_GER;


3.-

select * from clientes C2, clientes C1 
    where C1.CLT_NUM = 5 
    and C2.CLT_NUM != 5 
    and C2.CLT_POB = C1.CLT_POB;


4.-

select ART_NUM, ART_NOM, ART_COL, PESO_NOM from articulos, pesos 
    where ART_COL in ('azul', 'rosa', 'verde') 
    and ART_PESO between PESO_MIN and PESO_MAX;

5.-

select CLT_NOM, CLT_APELL, CLT_POB, TDA_POB, VNT_FCH from clientes, ventas, tiendas
    where CLT_POB = 'Barcelona'
    and CLT_NUM = VNT_CLT
    and VNT_TDA = TDA_NUM
    and TDA_POB != 'Barcelona';


6.-

select CLT_NUM, CLT_APELL, CLT_NOM, count(*) as 'purchases' from clientes, ventas
    where CLT_NUM = VNT_CLT
    group by CLT_NUM, CLT_APELL, CLT_NOM
    having purchases > 2
    order by purchases desc;

7.-

select TDA_POB, count(distinct(VNT_CLT)) as 'Count' from ventas, tiendas
    where VNT_TDA = TDA_NUM 
    group by TDA_POB
    order by Count desc;


8.-

select ART_COL, sum(VNT_CANT) as 'Amount', count(distinct(ART_NUM)) as 'Variety' from articulos, ventas
    where ART_NUM = VNT_ART
    group by ART_COL
    order by Amount desc, Variety desc;



9.-

select PRV_NOM, count(VNT_ART) 'Sales' from articulos, proveedores, ventas
    where PRV_NUM = ART_PRV
    and ART_NUM = VNT_ART
    group by PRV_NUM;

10.-

select CONCAT(CLT_NOM, ' ', CLT_APELL) 'Client', TDA_POB 'SHOP', SUBSTRING_INDEX(ART_NOM, ' ', 1) 'Article', VNT_CANT 'Quantity', VNT_FCH 'Date' from clientes, tiendas, ventas, articulos
    where CLT_NUM = VNT_CLT
    and TDA_NUM = VNT_TDA
    and ART_NUM = VNT_ART
    order by VNT_FCH asc, VNT_CANT;

-------------------------------------------------------------

11.-

select * from articulos 
    where ART_NUM in 
       (Select VNT_ART from ventas where Month(VNT_FCH) = 1)
    and ART_NUM in
       (Select VNT_ART from ventas where Month(VNT_FCH) = 2)
    order by ART_NUM;

12.-

select * from tiendas 
    where TDA_NUM in 
       (Select VNT_TDA from ventas where Month(VNT_FCH) = 2)
    and TDA_NUM not in
       (Select VNT_TDA from ventas where Month(VNT_FCH) = 1)
    order by TDA_NUM;

13.-

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

14.-

select clt_num, clt_nom, clt_apell, ifnull(sum(vnt_cant), 0)
from clientes left outer join ventas on clt_num = vnt_clt
group by clt_num; 

15.- 

Select art_num, art_nom, vnt_fch, clt_num, clt_nom, clt_apell
from articulos left outer join (ventas, clientes) on art_num = vnt_art;

    -------------------o--------------
    
Select art_num, art_nom, vnt_fch, clt_num, clt_nom, clt_apell
from articulos left outer join ventas on art_num = vnt_art
left outer join clientes on clt_num = vnt_clt;


16.-

Select TDA_POB, TDA_GER, count(*) as 'Sales', avg(vnt_cant) from tiendas, ventas 
      where tda_num = vnt_tda
      and tda_pob not like 'Madrid%'
      group by TDA_NUM
      having count() > any(
            select count() from tiendas, ventas 
            where tda_num = vnt_tda
            and tda_pob  like 'Madrid%'
            group by TDA_NUM);

17.-

select * from clientes
     where clt_pob = 'Madrid'
     and clt_num in (
         select vnt_clt from ventas where vnt_art in (
            select art_num from articulos where art_prv in (
               select prv_num from proveedores where
               prv_nom = 'electrolamp'
            )
         )
     );
--------------------- segunda versión (le gusta mas a Antonio)

select clt_nom, prv_nom from clientes, ventas, articulos, proveedores
    where clt_pob = 'Madrid' 
    and clt_num = vnt_clt
    and vnt_art = art_num
    and art_prv = prv_num
    and prv_nom = 'electrolamp';


18.- como meto lo otro...?

select tda_num, tda_pob, tda_ger from tiendas
    where tda_num not in (
        select vnt_tda from ventas
        where vnt_clt in (
             select clt_num from clientes
             where clt_pob = 'Madrid'
        )
    )
    and tda_num not in (
        select vnt_tda from ventas
        where vnt_clt in (
             select clt_num from clientes
             where clt_pob = 'Barcelona'
        )
    );
    
    count(*)
from tiendas left outer join ventas on tda_num = vnt_tda


19.- Incompleto

Select art_num, art_nom, vnt_fch
from articulos left outer join ventas on art_num = vnt_art
where vnt_fch between '2019-12-06' and '2020-01-06';

count(vnt_art)

20.-



----------------------------- MAL porque da en prv 2 o 3 o 5

select TDA_NUM 'Store number', TDA_POB 'Store town', concat(P1.PRV_NOM, ', ', P2.PRV_NOM, ', ', P3.PRV_NOM) 'Supplier name'
 	from tiendas, proveedores P1, proveedores P2, proveedores P3
 	where TDA_NUM in (
 	       select VNT_TDA from ventas
 	       where VNT_ART in (
 	           select ART_NUM from articulos
 	           where ART_PRV in (2, 3, 5)
 	           )
 	)
 	and P1.PRV_NUM = 2
 	and P2.PRV_NUM = 3
 	and P3.PRV_NUM = 5;
 	
 	
------------------------------- BIEN porque da en prv 2 Y 3 Y 5

select TDA_NUM 'Store number', TDA_POB 'Store town', concat(P1.PRV_NOM, ', ', P2.PRV_NOM, ', ', P3.PRV_NOM) 'Supplier name'
 	from tiendas, proveedores P1, proveedores P2, proveedores P3
 	where P1.PRV_NUM = 2
 	and P2.PRV_NUM = 3
 	and P3.PRV_NUM = 5
 	
 	and TDA_NUM in (
 	       select VNT_TDA from ventas
 	       where VNT_ART in (
 	           select ART_NUM from articulos
 	           where ART_PRV = P1.PRV_NUM
 	           )
 	)
 	and TDA_NUM in (
 	       select VNT_TDA from ventas
 	       where VNT_ART in (
 	           select ART_NUM from articulos
 	           where ART_PRV = P2.PRV_NUM
 	           )
 	)
 	and TDA_NUM in (
 	       select VNT_TDA from ventas
 	       where VNT_ART in (
 	           select ART_NUM from articulos
 	           where ART_PRV = P3.PRV_NUM
 	           )
 	);














