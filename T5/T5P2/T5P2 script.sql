
USE tema5practica2;

-- -----------------------------------------------------
-- Tabla proveedores
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Proveedores (
  id_proveedor INT UNSIGNED NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(45) NOT NULL,
  PRIMARY KEY (id_proveedor)
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Tabla productos
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS productos (
  id_producto INT UNSIGNED NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(45) NOT NULL,
  precio DECIMAL(6,2) NULL,
  id_proveedor INT UNSIGNED NOT NULL,
  PRIMARY KEY (id_producto),
  INDEX fk_proveedor_idx (id_proveedor ASC) VISIBLE,
  CONSTRAINT fk_proveedor
    FOREIGN KEY (id_proveedor)
    REFERENCES Proveedores(id_proveedor)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE = InnoDB;


INSERT INTO Proveedores(nombre) VALUES('Sony');
INSERT INTO Proveedores(nombre) VALUES('Creative Labs');
INSERT INTO Proveedores(nombre) VALUES('Hewlett-Packard');
INSERT INTO Proveedores(nombre) VALUES('Iomega');
INSERT INTO Proveedores(nombre) VALUES('Fujitsu');
INSERT INTO Proveedores(nombre) VALUES('Winchester');

INSERT INTO Productos(nombre,precio,id_proveedor) VALUES('Hard drive',240,5);
INSERT INTO Productos(nombre,precio,id_proveedor) VALUES('Memory',120,6);
INSERT INTO Productos(nombre,precio,id_proveedor) VALUES('ZIP drive',150,4);
INSERT INTO Productos(nombre,precio,id_proveedor) VALUES('Floppy disk',5,6);
INSERT INTO Productos(nombre,precio,id_proveedor) VALUES('Monitor',240,1);
INSERT INTO Productos(nombre,precio,id_proveedor) VALUES('DVD drive',180,2);
INSERT INTO Productos(nombre,precio,id_proveedor) VALUES('CD drive',90,2);
INSERT INTO Productos(nombre,precio,id_proveedor) VALUES('Printer',270,3);
INSERT INTO Productos(nombre,precio,id_proveedor) VALUES('Toner cartridge',66,3);
INSERT INTO Productos(nombre,precio,id_proveedor) VALUES('DVD burner',180,2);

