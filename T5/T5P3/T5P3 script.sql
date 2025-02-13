
USE tema5practica3;

-- -----------------------------------------------------
-- Borrar las tablas
-- -----------------------------------------------------

DROP TABLE IF EXISTS Empleados;
DROP TABLE IF EXISTS Departamentos;

-- -----------------------------------------------------
-- Tabla departamentos
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS Departamentos 
(
 DeptNo SMALLINT UNSIGNED NOT NULL,
 DName VARCHAR(15),
 Loc VARCHAR(15),
 CONSTRAINT pk_Dept PRIMARY KEY (DeptNo)
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Tabla Empleados
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS Empleados
(
 EmpNo INT UNSIGNED NOT NULL,
 EName VARCHAR(15),
 Job VARCHAR(9),
 Mgr INT,
 HireDate DATE,
 Sal DECIMAL(7, 2),
 Comm DECIMAL(7, 2),
 DeptNo SMALLINT UNSIGNED,
 CONSTRAINT pk_Emp PRIMARY KEY (EmpNo),
 INDEX fk_dept_idx (DeptNo ASC) VISIBLE,
 CONSTRAINT fk_DeptNo 
    FOREIGN KEY (DeptNo) REFERENCES Departamentos(DeptNo)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION 
) ENGINE = InnoDB;


INSERT INTO Departamentos VALUES (10, 'ACCOUNTING', 'NEW YORK');
INSERT INTO Departamentos VALUES (20, 'RESEARCH', 'DALLAS');
INSERT INTO Departamentos VALUES (30, 'SALES', 'CHICAGO');
INSERT INTO Departamentos VALUES (40, 'OPERATIONS', 'BOSTON');

INSERT INTO Empleados VALUES(7369, 'SMITH', 'CLERK', 7902,STR_TO_DATE('17-12-1980', '%d-%m-%Y'), 800, NULL, 20);
INSERT INTO Empleados VALUES(7499, 'ALLEN', 'SALESMAN', 7698,STR_TO_DATE('20-2-1981', '%d-%m-%Y'), 1600, 300, 30);
INSERT INTO Empleados VALUES(7521, 'WARD', 'SALESMAN', 7698,STR_TO_DATE('22-2-1981', '%d-%m-%Y'), 1250, 500, 30);
INSERT INTO Empleados VALUES(7566, 'JONES', 'MANAGER', 7839,STR_TO_DATE('2-4-1981', '%d-%m-%Y'), 2975, NULL, 20);
INSERT INTO Empleados VALUES(7654, 'MARTIN', 'SALESMAN', 7698,STR_TO_DATE('28-9-1981', '%d-%m-%Y'), 1250, 1400, 30);
INSERT INTO Empleados VALUES(7698, 'BLAKE', 'MANAGER', 7839,STR_TO_DATE('1-5-1981', '%d-%m-%Y'), 2850, NULL, 30);
INSERT INTO Empleados VALUES(7782, 'CLARK', 'MANAGER', 7839,STR_TO_DATE('9-6-1981', '%d-%m-%Y'), 2450, NULL, 10);
INSERT INTO Empleados VALUES(7788, 'SCOTT', 'ANALYST', 7566,STR_TO_DATE('09-12-1982', '%d-%m-%Y'), 3000, NULL, 20);
INSERT INTO Empleados VALUES(7839, 'KING', 'PRESIDENT', NULL,STR_TO_DATE('17-11-1981', '%d-%m-%Y'), 5000, NULL, 10);
INSERT INTO Empleados VALUES(7844, 'TURNER', 'SALESMAN', 7698,STR_TO_DATE('8-9-1981', '%d-%m-%Y'), 1500, 0, 30);
INSERT INTO Empleados VALUES(7876, 'ADAMS', 'CLERK', 7788,STR_TO_DATE('12-1-1983', '%d-%m-%Y'), 1100, NULL, 20);
INSERT INTO Empleados VALUES(7900, 'JAMES', 'CLERK', 7698,STR_TO_DATE('3-12-1981', '%d-%m-%Y'), 950, NULL, 30);
INSERT INTO Empleados VALUES(7902, 'FORD', 'ANALYST', 7566,STR_TO_DATE('3-12-1981', '%d-%m-%Y'), 3000, NULL, 20);
INSERT INTO Empleados VALUES(7934, 'MILLER', 'CLERK', 7782,STR_TO_DATE('23-1-1982', '%d-%m-%Y'), 1300, NULL, 10);

