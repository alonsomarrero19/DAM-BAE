CREATE TABLE IF NOT EXISTS CATEGORIA (
	id_categoria INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(20) NOT NULL
) ENGINE=INNOdb DEFAULT CHARACTER SET=utf8mb4;
CREATE TABLE IF NOT EXISTS PROVEEDOR (
	cod_proveedor INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	nombre VARCHAR(20) NOT NULL,
	direccion VARCHAR(60) NOT NULL,
	provincia VARCHAR(40)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
CREATE TABLE IF NOT EXISTS PIEZA (
	cod_pieza INT NOT NULL AUTO_INCREMENT,
    id_categoria INT NOT NULL,
    nombre VARCHAR(20) NOT NULL,
    color VARCHAR(7),
    precio DOUBLE NOT NULL,
    PRIMARY KEY (cod_pieza , id_categoria),
    KEY cod_pieza (cod_pieza),
    KEY id_categoria (id_categoria),
    CONSTRAINT pieza_categoria FOREIGN KEY (id_categoria) REFERENCES CATEGORIA (id_categoria) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=INNOdb DEFAULT CHARACTER SET=utf8mb4;
CREATE TABLE IF NOT EXISTS SUMINISTRA (
	cod_proveedor INT NOT NULL,
    cod_pieza INT NOT NULL,
    cantidad INT NOT NULL,
    fecha DATE,
    PRIMARY KEY (cod_proveedor, cod_pieza),
    KEY cod_proveedor (cod_proveedor),
    KEY cod_pieza (cod_pieza),
    CONSTRAINT suministra_proveedor FOREIGN KEY (cod_proveedor) REFERENCES PROVEEDOR (cod_proveedor) ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT suministra_pieza FOREIGN KEY (cod_pieza) REFERENCES PIEZA (cod_pieza) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARACTER SET=utf8mb4;