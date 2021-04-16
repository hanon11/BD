/*ejercicio 11*/
select count(*)
from proveedores;

/*ejercicio 12*/
select max(peso_min), min(peso_max)
from pesos;

/*ejercicio 13*/
select count(TDA_NUM) 'number of shops' , count(distinct TDA_GER) 'number of ger', count(distinct TDA_POB) 'number of pob'
from tiendas;

/*ejercicio 14*/
select avg(ART_PESO)
from articulos

/*ejercicio 15*/
select VNT_FCH 'Fecha', VNT_CANT 'Ventas'
from ventas
group by(VNT_FCH);

/*ejercicio 16*/
select count(*) 'num clientes', CLT_POB 'poblacion'
from clientes
group by(CLT_POB)
having count(*) > 1;

/*ejercicio 17*/
select ART_NOM 'articulo', max(ART_PESO) 'peso', avg(art_pc), avg(art_pv)
from articulos
where ART_PESO is not null 
group by ART_NOM
having avg(ART_PV) > 20
order by ART_PESO desc;

/*ejercicio 18*/
select VNT_ART 'articulo', count(*) 'ventas', sum(VNT_CANT) 'cantidad'
from ventas
where VNT_TDA between 10 and 20
group by VNT_ART;

/*ejercicio 19*/
select CLT_POB 'ciudad', CLT_PAIS 'pais', count(CLT_NUM) 'clientes'
from clientes
group by CLT_POB, CLT_PAIS;

/*ejercicio 20*/
select ART_PRV, ART_COL 'color', count(*) 'numero de art', round(avg(ART_PC),2) 'media'
from articulos
where ART_COL not in ('morado', 'negro')
group by art_prv, ART_COL
order by round(avg(ART_PC),2) desc