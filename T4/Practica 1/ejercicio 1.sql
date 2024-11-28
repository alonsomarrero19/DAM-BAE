CREATE TABLE IF NOT EXISTS SUCURSALES (
id_sucursal INT NOT NULL PRIMARY KEY,
num_empleados INT NOT NULL,
direccion VARCHAR(60),
telefono  VARCHAR(20)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE IF NOT EXISTS EMPLEADOS (
id_empleado INT NOT NULL PRIMARY KEY,
nombre VARCHAR(20) NOT NULL,
direccion VARCHAR(60)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE IF NOT EXISTS ASIGNADO (
  id_sucursal INT NOT NULL,
  id_empleado INT NOT NULL,
  fec_ini DATE NOT NULL,
  fec_fin DATE NOT NULL,
  PRIMARY KEY (`id_sucursal`,`id_empleado`),
  KEY `id_sucursal` (`id_sucursal`),
  KEY `id_empleado` (`id_empleado`),
  CONSTRAINT `asignado_ibfk_1` FOREIGN KEY (`id_sucursal`) REFERENCES `SUCURSALES` (`id_sucursal`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `asignado_ibfk_2` FOREIGN KEY (`id_empleado`) REFERENCES `EMPLEADOS` (`id_empleado`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci