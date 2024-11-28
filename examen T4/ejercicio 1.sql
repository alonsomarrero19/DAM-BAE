CREATE TABLE IF NOT EXISTS Alumno(
num_matricula INT primary key not null,
fecha_nac DATE,
telefono VARCHAR(20),
nombre VARCHAR(20),
apellidos VARCHAR(30)
);

CREATE TABLE IF NOT EXISTS Curso_escolar(
id_curso INT primary key not null,
año_ini DATE,
año_fin DATE
);

CREATE TABLE IF NOT EXISTS profesor(
ID_PROFESOR INT primary key not null,
nombre VARCHAR(20),
apellidos VARCHAR(30),
telefono VARCHAR(20),
especialidad VARCHAR(20)
);

CREATE TABLE IF NOT EXISTS asignatura(
Código INT primary key not null,
id_profesor INT,
nombre VARCHAR(20),
num_horas INT,
INDEX id_profesor (ID_PROFESOR),
CONSTRAINT ProfesorAsignatura
FOREIGN KEY (ID_PROFESOR)
REFERENCES profesor (ID_PROFESOR)
ON UPDATE CASCADE ON DELETE RESTRICT
);

CREATE TABLE IF NOT EXISTS se_matricula(
num_matricula INT not null,
id_curso INT not null,
Código INT not null,
PRIMARY KEY (num_matricula, id_curso, Código),
INDEX num_matricula (num_matricula),
CONSTRAINT AlumnoSeMatricula
FOREIGN KEY (num_matricula)
REFERENCES alumno (num_matricula)
ON UPDATE CASCADE ON DELETE RESTRICT,
INDEX id_curso (id_curso),
CONSTRAINT CursoMatricula
FOREIGN KEY (id_curso)
REFERENCES Curso_escolar (id_curso)
ON UPDATE CASCADE ON DELETE RESTRICT,
INDEX Código (Código),
CONSTRAINT AsignaturaMatricula
FOREIGN KEY (Código)
REFERENCES asignatura (Código)
ON UPDATE CASCADE ON DELETE RESTRICT
)
