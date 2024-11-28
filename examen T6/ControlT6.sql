

DROP DATABASE IF EXISTS ControlT6;
CREATE DATABASE ControlT6;
USE ControlT6;

CREATE TABLE Articulos (
	Id VARCHAR(20) NOT NULL,
	Cod_Fabricante  INTEGER UNSIGNED,
	Peso DECIMAL(6,2) DEFAULT 0,
	Categoria VARCHAR(10),
	Precio_Venta DECIMAL(6,2) DEFAULT 0,
	Precio_Costo DECIMAL(6,2) DEFAULT 0,
	Existencias INT UNSIGNED DEFAULT 0,
	PRIMARY KEY (Id, Cod_Fabricante, Peso, Categoria)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- Datos
INSERT INTO Articulos VALUES ('Macarrones', 20, 1,'Primera', 100, 98, 120);
INSERT INTO Articulos VALUES ('Tallarines', 20, 2,'Primera', 120, 100, 100);
INSERT INTO Articulos VALUES ('Tallarines', 20, 1,'Segunda', 99, 50, 100);
INSERT INTO Articulos VALUES ('Macarrones', 20, 1,'Tercera', 80, 50, 100);
INSERT INTO Articulos VALUES ('Atún'      , 10, 3,'Primera', 200, 150, 220);
INSERT INTO Articulos VALUES ('Atún'      , 10, 3,'Segunda', 150, 100, 220);
INSERT INTO Articulos VALUES ('Atún'      , 10, 3,'Tercera', 100, 50, 220);
INSERT INTO Articulos VALUES ('Sardinillas', 10, 1,'Primera', 250, 200, 200);
INSERT INTO Articulos VALUES ('Sardinillas', 10, 2,'Segunda', 200, 160, 200);
INSERT INTO Articulos VALUES ('Sardinillas', 10, 1,'Tercera', 100, 150, 220);
INSERT INTO Articulos VALUES ('Mejillones', 10, 1,'Tercera', 90, 50, 200);
INSERT INTO Articulos VALUES ('Mejillones', 10, 1,'Primera', 200, 150, 300);
INSERT INTO Articulos VALUES ('Macarrones', 25, 1,'Primera', 90, 68, 150);
INSERT INTO Articulos VALUES ('Tallarines', 25, 1,'Primera', 100, 90, 100);
INSERT INTO Articulos VALUES ('Fideos'    , 25, 1,'Segunda', 75, 50, 100);
INSERT INTO Articulos VALUES ('Fideos'    , 25, 1,'Primera', 100, 80, 100);
INSERT INTO Articulos VALUES ('Galletas Cuadradas', 15, 1,'Primera', 100, 80, 100);
INSERT INTO Articulos VALUES ('Galletas Cuadradas', 15, 1,'Segunda', 70, 50, 100);
INSERT INTO Articulos VALUES ('Galletas Cuadradas', 15, 1,'Tercera', 50, 40, 100);
INSERT INTO Articulos VALUES ('Barquillos', 15, 1,'Primera', 100, 80, 100);
INSERT INTO Articulos VALUES ('Barquillos', 15, 1,'Segunda', 100, 80, 100);
INSERT INTO Articulos VALUES ('Canutillos', 15, 2,'Primera', 170, 150, 110);
INSERT INTO Articulos VALUES ('Canutillos', 15, 2,'Segunda', 120, 150, 110);
INSERT INTO Articulos VALUES ('Leche entera', 30, 1,'Primera', 110, 100, 300);
INSERT INTO Articulos VALUES ('Leche desnat.', 30, 1,'Primera', 120, 100, 300);
INSERT INTO Articulos VALUES ('Leche semi.', 30, 1,'Primera', 130, 110, 300);
INSERT INTO Articulos VALUES ('Leche entera', 30, 2,'Primera', 210, 200, 300);
INSERT INTO Articulos VALUES ('Leche desnat.', 30, 2,'Primera', 220, 200, 300);
INSERT INTO Articulos VALUES ('Leche semi.', 30, 2,'Primera', 230, 210, 300);
INSERT INTO Articulos VALUES ('Mantequilla', 30, 1,'Primera', 510, 400, 200);
INSERT INTO Articulos VALUES ('Mantequilla', 30, 1,'Segunda', 450, 340, 200);


CREATE TABLE Fabricantes (
	Cod_Fabricante INTEGER UNSIGNED NOT NULL,	
	Nombre VARCHAR(15),
	Pais VARCHAR(15),
	PRIMARY KEY (Cod_Fabricante)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- Datos
INSERT INTO Fabricantes VALUES (10, 'CALVO', 'España');
INSERT INTO Fabricantes VALUES (15, 'LU', 'Bélgica');
INSERT INTO Fabricantes VALUES (20, 'BARILA', 'Italia');
INSERT INTO Fabricantes VALUES (25, 'GALLO', 'España');
INSERT INTO Fabricantes VALUES (30, 'PRESIDENT', 'Francia');



CREATE TABLE Tiendas (
	Nif VARCHAR(6) NOT NULL,	
	Nombre VARCHAR(20),
	Direccion VARCHAR(20),
	Poblacion VARCHAR(20), 
	Provincia VARCHAR(20),
	CodPostal INT UNSIGNED,
	PRIMARY KEY (Nif)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- Datos
INSERT INTO Tiendas VALUES ('1111-A', 'Almacenes Pérez', 'C/Toledo, 20', 'Siguenza', 'GUADALAJARA', 19104);
INSERT INTO Tiendas VALUES ('5555-B', 'La Gacela', 'C/Santander Ríos, 20', 'Azuqueca', 'GUADALAJARA', 19209);
INSERT INTO Tiendas VALUES ('2222-A', 'Comestibles Rodolfo', 'C/ del Val s/n', 'Alcalá de Henares', 'MADRID', 28804);
INSERT INTO Tiendas VALUES ('4444-A', 'La Pasta Gansa', 'C/Alcalá, 20', 'Ajalvir', 'MADRID', 28765);
INSERT INTO Tiendas VALUES ('3333-N', 'Ultramarinos Montse', 'Avda Pio 10', 'Toledo', 'TOLEDO', 45100);
INSERT INTO Tiendas VALUES ('4141-B', 'Todo Toledo', 'C/Avila 24', 'Talavera', 'TOLEDO', 45199);



CREATE TABLE Pedidos (
	Nif VARCHAR(10) NOT NULL,	
	Articulo VARCHAR(20),
	Cod_Fabricante INT UNSIGNED,
	Peso DECIMAL(5,2) DEFAULT 0,
	Categoria VARCHAR(10),
	Fecha_Pedido DATE,
	Unidades_Pedidas INT UNSIGNED,
	PRIMARY KEY (Nif, Articulo, Cod_Fabricante, Peso, Categoria, Fecha_Pedido),
	FOREIGN KEY (Articulo) REFERENCES Articulos (Id),
	FOREIGN KEY (Cod_Fabricante) REFERENCES Fabricantes (Cod_Fabricante)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- Datos
INSERT INTO Pedidos VALUES ('5555-B', 'Macarrones' , 20, 1, 'Primera', '2010-02-18', 30);
INSERT INTO Pedidos VALUES ('5555-B', 'Atún'       , 10, 3, 'Primera', '2010-02-21', 10);
INSERT INTO Pedidos VALUES ('5555-B', 'Atún'       , 10, 3, 'Segunda', '2010-03-11',  4);
INSERT INTO Pedidos VALUES ('5555-B', 'Sardinillas', 10, 1, 'Segunda', '2010-03-11', 10);
INSERT INTO Pedidos VALUES ('5555-B', 'Macarrones' , 25, 1, 'Primera', '2010-04-14', 12);
INSERT INTO Pedidos VALUES ('5555-B', 'Fideos'     , 25, 1, 'Segunda', '2010-05-18', 24);
INSERT INTO Pedidos VALUES ('5555-B', 'Fideos'     , 25, 1, 'Segunda', '2010-05-19', 20);
INSERT INTO Pedidos VALUES ('5555-B', 'Galletas Cuadradas', 15, 1, 'Segunda', '2010-06-20', 15);
INSERT INTO Pedidos VALUES ('1111-A', 'Barquillos' , 15, 1, 'Primera', '2010-02-20', 10);
INSERT INTO Pedidos VALUES ('1111-A', 'Canutillos' , 15, 2, 'Segunda', '2010-04-10', 12);
INSERT INTO Pedidos VALUES ('1111-A', 'Leche semi.', 30, 1, 'Primera', '2010-06-24', 5);
INSERT INTO Pedidos VALUES ('1111-A', 'Leche semi.', 30, 2, 'Primera', '2010-07-04', 11);
INSERT INTO Pedidos VALUES ('1111-A', 'Mantequilla', 30, 1, 'Primera', '2010-07-10', 10);
INSERT INTO Pedidos VALUES ('4141-B', 'Macarrones' , 20, 1, 'Primera', '2010-04-16', 30);
INSERT INTO Pedidos VALUES ('4141-B', 'Atún'       , 10, 3, 'Primera', '2010-06-21', 10);
INSERT INTO Pedidos VALUES ('4141-B', 'Atún'       , 10, 3, 'Segunda', '2010-08-12',  9);
INSERT INTO Pedidos VALUES ('2222-A', 'Sardinillas', 10, 1, 'Segunda', '2010-08-12', 20);
INSERT INTO Pedidos VALUES ('2222-A', 'Sardinillas', 10, 1, 'Tercera', '2010-02-12', 22);
INSERT INTO Pedidos VALUES ('2222-A', 'Mejillones' , 10, 1, 'Primera', '2021-03-09', 1000);
INSERT INTO Pedidos VALUES ('3333-A', 'Macarrones' , 25, 1, 'Primera', '2010-11-10',  8);
INSERT INTO Pedidos VALUES ('3333-A', 'Tallarines' , 25, 1, 'Primera', '2010-11-12',  9);
INSERT INTO Pedidos VALUES ('3333-A', 'Fideos'     , 25, 1, 'Primera', '2010-11-15', 11);
INSERT INTO Pedidos VALUES ('3333-A', 'Galletas Cuadradas', 15, 1, 'Primera', '2010-11-20', 6);
INSERT INTO Pedidos VALUES ('3333-A', 'Barquillos' , 15, 1, 'Segunda', '2010-11-20', 40);
INSERT INTO Pedidos VALUES ('3333-A', 'Canutillos' , 15, 2, 'Segunda', '2010-11-20', 10);


CREATE TABLE Ventas (
	Nif VARCHAR(10) NOT NULL,	
	Articulo VARCHAR(20),
	Cod_Fabricante INT UNSIGNED,
	Peso DECIMAL(5,2) DEFAULT 0,
	Categoria VARCHAR(10),
	Fecha_Venta DATE,
	Unidades_Vendidas INT UNSIGNED,
	PRIMARY KEY (Nif, Articulo, Cod_Fabricante, Peso, Categoria, Fecha_Venta),
	FOREIGN KEY (Nif) REFERENCES Tiendas (Nif),
	FOREIGN KEY (Articulo) REFERENCES Articulos (Id),
	FOREIGN KEY (Cod_Fabricante) REFERENCES Fabricantes (Cod_Fabricante)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- Datos
INSERT INTO Ventas VALUES ('5555-B', 'Macarrones' , 20, 1, 'Primera', '2020-02-19', 5);
INSERT INTO Ventas VALUES ('5555-B', 'Atún'       , 10, 3, 'Primera', '2020-02-19', 6);
INSERT INTO Ventas VALUES ('5555-B', 'Sardinillas', 10, 1, 'Segunda', '2020-03-20', 15);
INSERT INTO Ventas VALUES ('5555-B', 'Macarrones' , 25, 1, 'Primera', '2020-04-17', 2);
INSERT INTO Ventas VALUES ('5555-B', 'Fideos'     , 25, 1, 'Segunda', '2020-05-18', 14);
INSERT INTO Ventas VALUES ('5555-B', 'Leche semi.', 30, 1, 'Primera', '2020-06-24', 5);
INSERT INTO Ventas VALUES ('2222-A', 'Galletas Cuadradas', 15, 1, 'Segunda', '2020-06-20', 5);
INSERT INTO Ventas VALUES ('2222-A', 'Barquillos' , 15, 1, 'Primera', '2020-02-20', 6);
INSERT INTO Ventas VALUES ('2222-A', 'Canutillos' , 15, 2, 'Segunda', '2020-06-10', 2);
INSERT INTO Ventas VALUES ('2222-A', 'Sardinillas', 10, 1, 'Segunda', '2020-08-15', 5);
INSERT INTO Ventas VALUES ('2222-A', 'Sardinillas', 10, 1, 'Tercera', '2020-08-15', 5);
INSERT INTO Ventas VALUES ('3333-N', 'Leche semi.', 30, 2, 'Primera', '2020-07-06', 11);
INSERT INTO Ventas VALUES ('3333-N', 'Mantequilla', 30, 1, 'Primera', '2020-07-16', 10);
INSERT INTO Ventas VALUES ('3333-N', 'Macarrones' , 20, 1, 'Primera', '2020-04-26', 30);
INSERT INTO Ventas VALUES ('3333-N', 'Atún'       , 10, 3, 'Primera', '2020-04-26', 10);
INSERT INTO Ventas VALUES ('3333-N', 'Barquillos' , 15, 1, 'Segunda', '2020-11-25', 4);
INSERT INTO Ventas VALUES ('3333-N', 'Canutillos' , 15, 2, 'Segunda', '2020-11-25', 4);
INSERT INTO Ventas VALUES ('4141-B', 'Atún'       , 10, 3, 'Segunda', '2020-08-12', 2);
INSERT INTO Ventas VALUES ('4141-B', 'Macarrones' , 25, 1, 'Primera', '2020-11-10', 2);
INSERT INTO Ventas VALUES ('4141-B', 'Tallarines' , 25, 1, 'Primera', '2020-11-11', 3);
INSERT INTO Ventas VALUES ('4141-B', 'Canutillos' , 15, 2, 'Segunda', '2020-11-11', 8);


