CREATE TABLE IF NOT EXISTS PERSONA (
	dni VARCHAR(9) NOT NULL PRIMARY KEY,
    nombre VARCHAR(20)
);
CREATE TABLE IF NOT EXISTS PROFESOR (
	dni VARCHAR(9) NOT NULL,
    n_cuenta VARCHAR(20),
    PRIMARY KEY (dni),
    KEY (dni),
	FOREIGN KEY (dni) REFERENCES PERSONA (dni) ON DELETE RESTRICT ON UPDATE CASCADE
);
CREATE TABLE IF NOT EXISTS ALUMNO (
	dni VARCHAR(9) NOT NULL,
    edad VARCHAR(2),
    PRIMARY KEY (dni),
    KEY (dni),
	FOREIGN KEY (dni) REFERENCES PERSONA (dni) ON DELETE RESTRICT ON UPDATE CASCADE
);
CREATE TABLE IF NOT EXISTS ASIGNATURA (
	cod_asignatura VARCHAR(20) NOT NULL PRIMARY KEY,
    nombre VARCHAR(30)
);
CREATE TABLE IF NOT EXISTS IMPARTEN (
	dni VARCHAR(9) NOT NULL,
    cod_asignatura VARCHAR(20) NOT NULL,
    PRIMARY KEY (dni, cod_asignatura),
    KEY (dni),
    KEY (cod_asignatura),
	FOREIGN KEY (dni) REFERENCES PERSONA (dni) ON DELETE RESTRICT ON UPDATE CASCADE,
    FOREIGN KEY (cod_asignatura) REFERENCES ASIGNATURA (cod_asignatura) ON DELETE RESTRICT ON UPDATE CASCADE
);
CREATE TABLE IF NOT EXISTS ESTUDIAN (
	dni VARCHAR(9) NOT NULL,
    cod_asignatura VARCHAR(20) NOT NULL,
    PRIMARY KEY (dni, cod_asignatura),
    KEY (dni),
    KEY (cod_asignatura),
	FOREIGN KEY (dni) REFERENCES PERSONA (dni) ON DELETE RESTRICT ON UPDATE CASCADE,
    FOREIGN KEY (cod_asignatura) REFERENCES ASIGNATURA (cod_asignatura) ON DELETE RESTRICT ON UPDATE CASCADE
);