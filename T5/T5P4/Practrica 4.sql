#1
SELECT DISTINCT cli.id, cli.nombre, cli.apellido1, cli.apellido2 
FROM clientes cli
INNER JOIN pedidos ped
	ON cli.id = ped.id_cliente 
ORDER BY nombre;
#2
SELECT cli.id, cli.nombre
FROM clientes cli
LEFT JOIN pedidos  ped
	ON ped.id_cliente = cli.id
WHERE ped.id_cliente IS NULL;
#3
SELECT cli.id, cli.nombre,CONCAT_WS(" ",cli.apellido1,cli.apellido2) AS apellidos, ped.fecha, MAX(ped.total) AS valor
FROM clientes cli
INNER JOIN pedidos ped
	ON cli.id = ped.id_cliente
GROUP BY cli.id, ped.fecha
ORDER BY cli.id;
#4
SELECT cli.nombre, CONCAT_WS(" ",cli.apellido1,cli.apellido2) AS apellidos
FROM clientes cli
WHERE cli.id IN (SELECT ped.id_cliente
				FROM pedidos ped
                WHERE total = (SELECT MAX(ped.total)
							   FROM pedidos ped
                               WHERE YEAR(fecha) = 2019));
#5
SELECT com.nombre, CONCAT_WS(" ",com.apellido1,com.apellido2) AS apellidos
FROM comerciales com
WHERE NOT EXISTS (SELECT ped.id_comercial
				  FROM pedidos ped
				  WHERE com.id = ped.id_comercial);
#6
SELECT ped.fecha, ped.total
FROM pedidos ped
WHERE total = (SELECT MIN(ped.total)
			   FROM pedidos ped
               WHERE id_cliente = (SELECT cli.id
								   FROM clientes cli
                                   WHERE CONCAT_WS(" ",cli.nombre,cli.apellido1,cli.apellido2) = "Pepe Ruiz Santana"));
#7
SELECT cli.nombre, CONCAT_WS(" ",cli.apellido1,cli.apellido2) AS apellidos
FROM clientes cli
WHERE cli.id IN (SELECT ped.id_cliente
				 FROM pedidos ped
                 WHERE ped.id_comercial = (SELECT com.id
										   FROM comerciales com
                                           WHERE CONCAT_WS(" ",com.nombre,com.apellido1,com.apellido2) = "Daniel Sáez Vega"));
#8
SELECT cli.id, cli.nombre, CONCAT_WS(" ",cli.apellido1,cli.apellido2) AS apellidos, COUNT(ped.id) AS pedidos
FROM clientes cli
INNER JOIN pedidos ped
	ON cli.id = ped.id_cliente
WHERE YEAR(ped.fecha) = 2017
GROUP BY cli.id;
#9
SELECT cli.id, cli.nombre, CONCAT_WS(" ",cli.apellido1,cli.apellido2) AS apellidos
FROM clientes cli
WHERE NOT EXISTS (SELECT ped.id_cliente
				  FROM pedidos ped
				  WHERE cli.id = ped.id_cliente);
#10
SELECT COUNT(DISTINCT(ped.id_comercial))
FROM pedidos ped;
