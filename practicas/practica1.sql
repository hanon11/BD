/*Exercise 1*/
/*SELECT *
FROM clientes;*/

/*Exercise 2*/
/*SELECT clt_nom, clt_apell
FROM clientes;*/

/*Exercise 3*/
/*SELECT art_num, art_nom, art_col
FROM articulos;*/

/*Exercise 4*/
/*SELECT prv_nom
FROM proveedores;*/

/*Exercise 5*/
/*SELECT *
FROM pesos;*/

/*Exercise 6*/
/*SELECT tda_ger
FROM tiendas;*/

/*Exercise 7*/
/*SELECT *
FROM ventas
WHERE vnt_clt = 7;*/

/*Exercise 8*/
/*SELECT clt_nom, clt_apell
FROM clientes
WHERE clt_num = 7;*/

/*Exercise 9*/
/*SELECT *
FROM articulos
WHERE art_col = 'rojo';*/

/*Exercise 10*/
/*SELECT *
FROM articulos
WHERE art_num > 5;*/

/*Exercise 11*/
/*SELECT *
FROM pesos
WHERE peso_nom BETWEEN 'leve' AND 'ligero';*/

/*Exercise 12*/
/*SELECT *
FROM ventas
WHERE vnt_fch BETWEEN '2020-01-31' AND '2020-03-01';*/

/*Exercise 13*/
/*SELECT *
FROM clientes
WHERE clt_pais = 'e'
ORDER BY clt_nom;*/


/*Exercise 14*/
/*SELECT *
FROM articulos
WHERE art_prv = 5
ORDER BY art_pc;*/


/*Exercise 15*/
/*SELECT *
FROM tiendas
WHERE tda_pob  NOT IN ('Palencia', 'Pamplona', 'Jerez'); */


/*Exercise 16*/
/*SELECT *
FROM ventas
WHERE vnt_tda = 11
ORDER BY vnt_fch, vnt_cant DESC*/


/*Exercise 17*/
/*SELECT *
FROM clientes
WHERE clt_pais = 'f' OR clt_pob LIKE 'M%';*/


/*Exercise 18*/
/*SELECT *
FROM articulos
WHERE art_nom IN ('calendario', 'papel') AND art_pv > 2*art_pc;*/



/*Exercise 19*/
/*SELECT *
FROM ventas
WHERE vnt_cant IS null*/


/*Exercise 20*/
SELECT *
FROM clientes
WHERE clt_apell LIKE 'Du%t' AND length(clt_apell)=7



















