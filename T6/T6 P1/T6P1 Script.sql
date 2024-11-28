DROP DATABASE IF EXISTS tema6practica1; 
CREATE DATABASE tema6practica1;
USE tema6practica1;
CREATE TABLE fabricante (
	codigo INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	nombre VARCHAR(100) NOT NULL
  );
 CREATE TABLE producto (
	codigo int unsigned auto_increment primary key,
	nombre varchar(100) not null,
    precio double not null,
    codigo_fabricante int unsigned not null,
    constraint cod_fab FOREIGN KEY (codigo_fabricante) references fabricante (codigo) 
    );

INSERT INTO fabricante VALUES(1, 'Asus');
INSERT INTO fabricante VALUES(2, 'Lenovo');
INSERT INTO fabricante VALUES(3, 'Hewlett-Packard');
INSERT INTO fabricante VALUES(4, 'Samsung');
INSERT INTO fabricante VALUES(5, 'Seagate');
INSERT INTO fabricante VALUES(6, 'Crucial');
INSERT INTO fabricante VALUES(7, 'Gigabyte');
INSERT INTO fabricante VALUES(8, 'Huawei');
INSERT INTO fabricante VALUES(9, 'Xiaomi');

INSERT INTO producto VALUES(1, 'Disco duro SATA3 1TB', 86.99, 5);
INSERT INTO producto VALUES(2, 'Memoria RAM DDR4 8GB', 120, 6);
INSERT INTO producto VALUES(3, 'Disco SSD 1 TB', 150.99, 4);
INSERT INTO producto VALUES(4, 'GeForce GTX 1050Ti', 185, 7);
INSERT INTO producto VALUES(5, 'GeForce GTX 1080 Xtreme', 755, 6);
INSERT INTO producto VALUES(6, 'Monitor 24 LED Full HD', 202, 1);
INSERT INTO producto VALUES(7, 'Monitor 27 LED Full HD', 245.99, 1);
INSERT INTO producto VALUES(8, 'Portátil Yoga 520', 559, 2);
INSERT INTO producto VALUES(9, 'Portátil Ideapd 320', 444, 2);
INSERT INTO producto VALUES(10, 'Impresora HP Deskjet 3720', 59.99, 3);
INSERT INTO producto VALUES(11, 'Impresora HP Laserjet Pro M26nw', 180, 3);

SELECT * FROM fabricante;

SELECT * FROM producto;

INSERT INTO fabricante VALUES(10, 'Logitech');

INSERT INTO fabricante (nombre) VALUES( 'LG');

INSERT INTO producto VALUES(12, 'ratón G705', 94, 10); 

INSERT producto(nombre, precio, codigo_fabricante) VALUES('TV 4K OLED', 1601.85, 11);

CREATE TABLE fabricante_productos(
	nombre_fabricante VARCHAR(100) not null,
    nombre_producto VARCHAR(100) not null,
    precio DOUBLE not null
    );

INSERT fabricante_productos (nombre_fabricante, nombre_producto, precio)
    SELECT f.nombre,p.nombre, p.precio
    FROM fabricante f
    INNER JOIN producto p
		ON f.codigo = p.codigo_fabricante;
        
SELECT * FROM fabricante_productos;

CREATE VIEW vista_fabricante_productos AS
	SELECT nombre_fabricante, nombre_producto, precio 
    FROM fabricante_productos;

# Para eliminar correctamente el fabricante Asus descativamos el modo seguro de la base de datos, posteriormente eliminamos todos 
# los productos del fabricante, tras esto eliminamos al fabricante de la tabla fabricantes y activamos el modo seguro.
SET SQL_SAFE_UPDATES = 0;
DELETE FROM producto WHERE codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre = 'Asus');
DELETE FROM fabricante WHERE nombre = "Asus";
SET SQL_SAFE_UPDATES = 1;

SET SQL_SAFE_UPDATES = 0;
DELETE FROM fabricante WHERE nombre = "Xiaomi";
SET SQL_SAFE_UPDATES = 1;

SET SQL_SAFE_UPDATES = 0;
ALTER TABLE producto DROP FOREIGN KEY cod_fab;
UPDATE fabricante SET codigo = 20 WHERE nombre = "Lenovo";
SELECT * FROM producto WHERE codigo_fabricante NOT IN (SELECT codigo FROM fabricante);
UPDATE producto SET codigo_fabricante = 20 WHERE codigo_fabricante NOT IN (SELECT codigo FROM fabricante);
ALTER TABLE producto ADD CONSTRAINT cod_fab FOREIGN KEY (codigo_fabricante) REFERENCES fabricante(codigo);
SET SQL_SAFE_UPDATES = 1;

SET SQL_SAFE_UPDATES = 0;
UPDATE fabricante SET codigo = 30 WHERE nombre = "Huawei";
SET SQL_SAFE_UPDATES = 1;

SET SQL_SAFE_UPDATES = 0;
UPDATE producto SET precio = precio + 5;
SET SQL_SAFE_UPDATES = 1;

SET SQL_SAFE_UPDATES = 0;
DELETE FROM producto WHERE (nombre LIKE "%Impresora%" AND precio < 200);
SET SQL_SAFE_UPDATES = 1;
