

-- -----------------------------------------------------
-- Borrar la base de datos UefaEuro2012
-- -----------------------------------------------------
DROP DATABASE IF EXISTS ControlTema5;
CREATE SCHEMA ControlTema5 DEFAULT CHARACTER SET utf8mb4 ;
USE ControlTema5 ;

-- -----------------------------------------------------
-- Tabla Partidos
-- -----------------------------------------------------

CREATE TABLE Partidos (
  PartidoId INT UNSIGNED NOT NULL,
  Fecha DATE DEFAULT NULL,
  Estadio VARCHAR(50) DEFAULT NULL,
  Equipo1 VARCHAR(3) DEFAULT NULL,
  Equipo2 VARCHAR(3) DEFAULT NULL,
  PRIMARY KEY (PartidoId)
) ENGINE = InnoDB;


-- -----------------------------------------------------
-- Tabla Equipos
-- -----------------------------------------------------

CREATE TABLE Equipos (
  id VARCHAR(3) NOT NULL,
  Nombre VARCHAR(50) DEFAULT NULL,
  Entrenador VARCHAR(50) DEFAULT NULL,
  PRIMARY KEY (id)
) ENGINE = InnoDB;


-- -----------------------------------------------------
-- Tabla Goleadores
-- -----------------------------------------------------

CREATE TABLE Goleadores (
  PartidoId INT UNSIGNED NOT NULL DEFAULT '0',
  Equipo VARCHAR(3) NOT NULL,
  Jugador VARCHAR(50) DEFAULT NULL,
  Minuto INT UNSIGNED NOT NULL DEFAULT '0',
  PRIMARY KEY (PartidoId, Minuto),
  INDEX `fk_equipo_idx` (`Equipo` ASC),
  FOREIGN KEY (Equipo) REFERENCES Equipos(id),
  FOREIGN KEY (PartidoId) REFERENCES Partidos(PartidoId)
) ENGINE = InnoDB;

  
INSERT INTO Equipos VALUES ('POL','Poland','Franciszek Smuda');
INSERT INTO Equipos VALUES ('RUS','Russia','Dick Advocaat');
INSERT INTO Equipos VALUES ('CZE','Czech Republic','Michal Bílek');
INSERT INTO Equipos VALUES ('GRE','Greece','Fernando Santos');
INSERT INTO Equipos VALUES ('NED','Netherlands','Bert van Marwijk');
INSERT INTO Equipos VALUES ('DEN','Denmark','Morten Olsen');
INSERT INTO Equipos VALUES ('GER','Germany','Joachim Löw');
INSERT INTO Equipos VALUES ('POR','Portugal','Paulo Bento');
INSERT INTO Equipos VALUES ('ESP','Spain','Vicente del Bosque');
INSERT INTO Equipos VALUES ('ITA','Italy','Cesare Prandelli');
INSERT INTO Equipos VALUES ('IRL','Republic of Ireland','Giovanni Trapattoni');
INSERT INTO Equipos VALUES ('CRO','Croatia','Slaven Bilic');
INSERT INTO Equipos VALUES ('UKR','Ukraine','Oleh Blokhin');
INSERT INTO Equipos VALUES ('SWE','Sweden','Erik Hamrén');
INSERT INTO Equipos VALUES ('ENG','England','Roy Hodgson');
INSERT INTO Equipos VALUES ('FRA','France','Laurent Blanc');

INSERT INTO Partidos VALUES (1001,'2012-06-08','National Stadium, Warsaw','POL','GRE');
INSERT INTO Partidos VALUES (1002,'2012-06-08','Stadion Miejski (Wroclaw)','RUS','CZE');
INSERT INTO Partidos VALUES (1003,'2012-06-12','Stadion Miejski (Wroclaw)','GRE','CZE');
INSERT INTO Partidos VALUES (1004,'2012-06-12','National Stadium, Warsaw','POL','RUS');
INSERT INTO Partidos VALUES (1005,'2012-06-16','Stadion Miejski (Wroclaw)','CZE','POL');
INSERT INTO Partidos VALUES (1006,'2012-06-16','National Stadium, Warsaw','GRE','RUS');
INSERT INTO Partidos VALUES (1007,'2012-06-09','Metalist Stadium','NED','DEN');
INSERT INTO Partidos VALUES (1008,'2012-06-09','Arena Lviv','GER','POR');
INSERT INTO Partidos VALUES (1009,'2012-06-13','Arena Lviv','DEN','POR');
INSERT INTO Partidos VALUES (1010,'2012-06-13','Metalist Stadium','NED','GER');
INSERT INTO Partidos VALUES (1011,'2012-06-17','Metalist Stadium','POR','NED');
INSERT INTO Partidos VALUES (1012,'2012-06-17','Arena Lviv','DEN','GER');
INSERT INTO Partidos VALUES (1013,'2012-06-10','PGE Arena Gdansk','ESP','ITA');
INSERT INTO Partidos VALUES (1014,'2012-06-10','Stadion Miejski (Poznan)','IRL','CRO');
INSERT INTO Partidos VALUES (1015,'2012-06-14','Stadion Miejski (Poznan)','ITA','CRO');
INSERT INTO Partidos VALUES (1016,'2012-06-14','PGE Arena Gdansk','ESP','IRL');
INSERT INTO Partidos VALUES (1017,'2012-06-18','PGE Arena Gdansk','CRO','ESP');
INSERT INTO Partidos VALUES (1018,'2012-06-18','Stadion Miejski (Poznan)','ITA','IRL');
INSERT INTO Partidos VALUES (1019,'2012-06-11','Donbass Arena','FRA','ENG');
INSERT INTO Partidos VALUES (1020,'2012-06-11','Olimpiyskiy National Sports Complex','UKR','SWE');
INSERT INTO Partidos VALUES (1021,'2012-06-15','Donbass Arena','UKR','FRA');
INSERT INTO Partidos VALUES (1022,'2012-06-15','Olimpiyskiy National Sports Complex','SWE','ENG');
INSERT INTO Partidos VALUES (1023,'2012-06-19','Donbass Arena','ENG','UKR');
INSERT INTO Partidos VALUES (1024,'2012-06-19','Olimpiyskiy National Sports Complex','SWE','FRA');
INSERT INTO Partidos VALUES (1025,'2012-06-21','National Stadium, Warsaw','CZE','POR');
INSERT INTO Partidos VALUES (1026,'2012-06-22','PGE Arena Gdansk','GER','GRE');
INSERT INTO Partidos VALUES (1027,'2012-06-23','Donbass Arena','ESP','FRA');
INSERT INTO Partidos VALUES (1028,'2012-06-24','Olimpiyskiy National Sports Complex','ENG','ITA');
INSERT INTO Partidos VALUES (1029,'2012-06-27','Donbass Arena','POR','ESP');
INSERT INTO Partidos VALUES (1030,'2012-06-28','National Stadium, Warsaw','GER','ITA');
INSERT INTO Partidos VALUES (1031,'2012-07-01','Olimpiyskiy National Sports Complex','ESP','ITA ');


INSERT INTO Goleadores VALUES (1001,'POL','Robert Lewandowski',17);
INSERT INTO Goleadores VALUES (1001,'GRE','Dimitris Salpingidis',51);
INSERT INTO Goleadores VALUES (1002,'RUS','Alan Dzagoev',15);
INSERT INTO Goleadores VALUES (1002,'RUS','Alan Dzagoev',79);
INSERT INTO Goleadores VALUES (1002,'RUS','Roman Shirokov',24);
INSERT INTO Goleadores VALUES (1002,'RUS','Roman Pavlyuchenko',82);
INSERT INTO Goleadores VALUES (1002,'CZE','Václav Pilar',52);
INSERT INTO Goleadores VALUES (1003,'GRE','Theofanis Gekas',53);
INSERT INTO Goleadores VALUES (1003,'CZE','Petr Jirácek',3);
INSERT INTO Goleadores VALUES (1003,'CZE','Václav Pilar',6);
INSERT INTO Goleadores VALUES (1004,'POL','Jakub Blaszczykowski',57);
INSERT INTO Goleadores VALUES (1004,'RUS','Alan Dzagoev',37);
INSERT INTO Goleadores VALUES (1005,'CZE','Petr Jirácek',72);
INSERT INTO Goleadores VALUES (1006,'GRE','Giorgos Karagounis',45);
INSERT INTO Goleadores VALUES (1007,'DEN','Michael Krohn-Dehli',24);
INSERT INTO Goleadores VALUES (1008,'GER','Mario Gómez',72);
INSERT INTO Goleadores VALUES (1009,'DEN','Nicklas Bendtner',41);
INSERT INTO Goleadores VALUES (1009,'DEN','Nicklas Bendtner',80);
INSERT INTO Goleadores VALUES (1009,'POR','Pepe (footballer born 1983)',24);
INSERT INTO Goleadores VALUES (1009,'POR','Hélder Postiga',36);
INSERT INTO Goleadores VALUES (1009,'POR','Silvestre Varela',87);
INSERT INTO Goleadores VALUES (1010,'NED','Robin van Persie',73);
INSERT INTO Goleadores VALUES (1010,'GER','Mario Gómez',24);
INSERT INTO Goleadores VALUES (1010,'GER','Mario Gómez',38);
INSERT INTO Goleadores VALUES (1011,'POR','Cristiano Ronaldo',28);
INSERT INTO Goleadores VALUES (1011,'POR','Cristiano Ronaldo',74);
INSERT INTO Goleadores VALUES (1011,'NED','Rafael van der Vaart',11);
INSERT INTO Goleadores VALUES (1012,'DEN','Michael Krohn-Dehli',24);
INSERT INTO Goleadores VALUES (1012,'GER','Lukas Podolski',19);
INSERT INTO Goleadores VALUES (1012,'GER','Lars Bender',80);
INSERT INTO Goleadores VALUES (1013,'ESP','Cesc Fàbregas',64);
INSERT INTO Goleadores VALUES (1013,'ITA','Antonio Di Natale',61);
INSERT INTO Goleadores VALUES (1014,'IRL','Sean St Ledger',19);
INSERT INTO Goleadores VALUES (1014,'CRO','Mario Mandžukic',3);
INSERT INTO Goleadores VALUES (1014,'CRO','Mario Mandžukic',49);
INSERT INTO Goleadores VALUES (1014,'CRO','Nikica Jelavic',43);
INSERT INTO Goleadores VALUES (1015,'ITA','Andrea Pirlo',39);
INSERT INTO Goleadores VALUES (1015,'CRO','Mario Mandžukic',72);
INSERT INTO Goleadores VALUES (1016,'ESP','Fernando Torres',4);
INSERT INTO Goleadores VALUES (1016,'ESP','Fernando Torres',70);
INSERT INTO Goleadores VALUES (1016,'ESP','David Silva',49);
INSERT INTO Goleadores VALUES (1016,'ESP','Cesc Fàbregas',83);
INSERT INTO Goleadores VALUES (1017,'ESP','Jesús Navas',88);
INSERT INTO Goleadores VALUES (1018,'ITA','Antonio Cassano',35);
INSERT INTO Goleadores VALUES (1018,'ITA','Mario Balotelli',90);
INSERT INTO Goleadores VALUES (1019,'FRA','Samir Nasri',39);
INSERT INTO Goleadores VALUES (1019,'ENG','Joleon Lescott',30);
INSERT INTO Goleadores VALUES (1020,'UKR','Andriy Shevchenko',55);
INSERT INTO Goleadores VALUES (1020,'UKR','Andriy Shevchenko',62);
INSERT INTO Goleadores VALUES (1020,'SWE','Zlatan Ibrahimovic',52);
INSERT INTO Goleadores VALUES (1021,'FRA','Jérémy Ménez',53);
INSERT INTO Goleadores VALUES (1021,'FRA','Yohan Cabaye',56);
INSERT INTO Goleadores VALUES (1022,'SWE','Glen Johnson (English footballer)',49);
INSERT INTO Goleadores VALUES (1022,'SWE','Olof Mellberg',59);
INSERT INTO Goleadores VALUES (1022,'ENG','Andy Carroll',23);
INSERT INTO Goleadores VALUES (1022,'ENG','Theo Walcott',64);
INSERT INTO Goleadores VALUES (1022,'ENG','Danny Welbeck',78);
INSERT INTO Goleadores VALUES (1023,'ENG','Wayne Rooney',48);
INSERT INTO Goleadores VALUES (1024,'SWE','Zlatan Ibrahimovic',54);
INSERT INTO Goleadores VALUES (1024,'SWE','Sebastian Larsson',90);
INSERT INTO Goleadores VALUES (1025,'POR','Cristiano Ronaldo',79);
INSERT INTO Goleadores VALUES (1026,'GER','Philipp Lahm',39);
INSERT INTO Goleadores VALUES (1026,'GER','Sami Khedira',61);
INSERT INTO Goleadores VALUES (1026,'GER','Miroslav Klose',68);
INSERT INTO Goleadores VALUES (1026,'GER','Marco Reus',74);
INSERT INTO Goleadores VALUES (1026,'GRE','Georgios Samaras',55);
INSERT INTO Goleadores VALUES (1026,'GRE','Dimitris Salpingidis',89);
INSERT INTO Goleadores VALUES (1027,'ESP','Xabi Alonso',19);
INSERT INTO Goleadores VALUES (1027,'ESP','Xabi Alonso',90);
INSERT INTO Goleadores VALUES (1030,'GER','Mesut Özil',90);
INSERT INTO Goleadores VALUES (1030,'ITA','Mario Balotelli',20);
INSERT INTO Goleadores VALUES (1030,'ITA','Mario Balotelli',36);
INSERT INTO Goleadores VALUES (1031,'ESP','David Silva',14);
INSERT INTO Goleadores VALUES (1031,'ESP','Jordi Alba',41);
INSERT INTO Goleadores VALUES (1031,'ESP','Fernando Torres',84);
INSERT INTO Goleadores VALUES (1031,'ESP','Juan Mata',88);
