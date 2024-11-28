#1
SELECT nombre 
FROM productos;
#2
SELECT nombre, precio 
FROM productos
ORDER BY precio DESC;
#3
SELECT nombre 
FROM productos
WHERE precio <= 200;
#4
SELECT nombre
FROM productos
WHERE precio BETWEEN 60 AND 120;
#5
SELECT nombre, precio*100 AS precio_cent
FROM productos;
#6
SELECT 	AVG(precio)
FROM productos;
#7
SELECT AVG(precio)
FROM productos
WHERE id_proveedor = 2;
#8 
SELECT COUNT(nombre) 
FROM productos
WHERE precio >= 180;
#9
SELECT nombre, precio 
FROM productos
WHERE precio > 180
ORDER BY precio DESC, nombre ASC;
#10
SELECT prod.id_producto, prod.nombre, prod.precio, prod.id_proveedor, prov.nombre 
FROM productos prod
INNER JOIN proveedores prov
	ON prov.id_proveedor = prod.id_proveedor;
#11
SELECT prod.nombre, prod.precio, prov.nombre AS proveedor
FROM productos prod
INNER JOIN proveedores prov
	ON prod.id_proveedor = prov.id_proveedor;
#12
SELECT AVG(precio), id_proveedor
FROM productos
GROUP BY id_proveedor;
#13
SELECT AVG(prod.precio), prov.nombre, prov.id_proveedor
FROM productos prod
INNER JOIN proveedores prov
	ON prod.id_proveedor = prov.id_proveedor
GROUP BY id_proveedor;
#14
SELECT proveedores.nombre 
FROM productos 
INNER JOIN proveedores 
	ON productos.id_proveedor = proveedores.id_proveedor 
GROUP BY productos.id_proveedor 
HAVING AVG(productos.precio) >= 150;
#15
SELECT nombre, precio
FROM productos
WHERE precio = (SELECT MIN(precio) 
				FROM productos);
#16
SELECT prov.nombre, prod.nombre, prod.precio
FROM proveedores prov 
INNER JOIN productos prod
	USING (id_proveedor)
    WHERE precio IN (SELECT MAX(precio)
					FROM productos
                    GROUP BY id_proveedor
                    );
#17
SELECT prov.nombre
FROM proveedores prov
INNER JOIN productos prod
	USING (id_proveedor)
GROUP BY prov.id_proveedor
HAVING (AVG(precio) >=145) && (COUNT(prov.nombre) >= 2)










