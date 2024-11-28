#1 Lista el nombre de todos los productos que hay en la tabla producto.
SELECT nombre 
FROM producto;


#2 Lista los nombres y los precios de todos los productos de la tabla producto.
SELECT nombre, precio
FROM producto;

#3 Lista todas las columnas de la tabla producto.
SELECT *
FROM producto;

#4 Lista el nombre de los productos, el precio en euros y el precio en dólares estadounidenses (USD).
SELECT nombre, precio, precio*1.08 AS USD
FROM producto;


#5 Lista el nombre de los productos, el precio en euros.
#  Utiliza los siguientes alias para las columnas: nombre de producto, euros.
SELECT nombre AS nombre_de_producto, precio AS euros
FROM proucto;


# Lista los nombres y los precios de todos los productos de la tabla producto, convirtiendo los nombres a mayúscula.
SELECT UPPER(nombre), precio
FROM producto;


#12 Lista el identificador de los fabricantes que tienen productos en la tabla producto, eliminando los identificadores que aparecen repetidos.
SELECT DISTINCT(id)
FROM fabricante
WHERE id IN (SELECT id_fabricante
			  FROM producto);
              
              
#15 Lista los nombres de los productos ordenados en primer lugar por el nombre de forma ascendente y en segundo lugar por el precio de forma descendente.
SELECT nombre, precio
FROM producto
ORDER BY nombre ASC, precio DESC;


#20 Lista el nombre de todos los productos del fabricante cuyo identificador de fabricante es igual a 2.
SELECT nombre
FROM producto 
WHERE id_fabricante = 2;


#4 Devuelve el nombre del producto, su precio y el nombre de su fabricante, del producto más barato.
SELECT pro.nombre, pro.precio, fab.nombre AS fabricante
FROM producto pro
INNER JOIN fabricante fab
	ON pro.id_fabricante = fab.id
WHERE precio = (SELECT MIN(precio)
				FROM producto);
                
                
#1 Devuelve un listado de todos los fabricantes que existen en la base de datos, junto con los productos que tiene cada uno de ellos. 
#  El listado deberá mostrar también aquellos fabricantes que no tienen productos asociados.
SELECT nombre 
FROM fabricante fab






