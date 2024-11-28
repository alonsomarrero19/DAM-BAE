
USE tema5practica1;

CREATE TABLE IF NOT EXISTS personas
(
cod_hospital VARCHAR(9),
dni VARCHAR(10),
apellidos VARCHAR(40),
funcion VARCHAR(30),
salario INT(10),
localidad VARCHAR(40),
constraint pk_personas primary key (dni)
)ENGINE = InnoDB;

INSERT INTO personas 
VALUES ('1','12345678','García Hernández, Eladio','CONSERJE',1200,'LORCA');

INSERT INTO personas 
VALUES ('1','87654321','Fuentes Bermejo, Carlos','DIRECTOR',2000,'MURCIA');

INSERT INTO personas 
VALUES ('2','55544433','González Marín, Alicia','CONSERJE',1200,'MURCIA');

INSERT INTO personas 
VALUES ('1','66655544','Castillo Montes, Pedro','MÉDICO',1700,'MURCIA');

INSERT INTO personas 
VALUES ('2','22233322','Tristán García, Ana','MÉDICO',1900,'MURCIA');

INSERT INTO personas 
VALUES ('3','55544411','Ruiz Hernández, Caridad','MÉDICO',1900,'LORCA');

insert into personas
values('3','99988333','Serrano Díaz, Alejandro','DIRECTOR',2400,'CARTAGENA');

insert into personas
values('4','3322211','Mesa del Castillo, Juan','MÉDICO',2200,'LORCA');

insert into personas
values('2','2223333','Martínez Molina, Andrés','MÉDICO',1600,'CARTAGENA');

insert into personas
values('4','55544412','Jiménez Jiménez, Dolores','CONSERJE',1200,'MURCIA');

insert into personas
values('4','22233311','Martínez Molina, Gloria','MÉDICO',1600,'MURCIA');