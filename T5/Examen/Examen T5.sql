#1 Mostrar el nombre de los goleadores de Alemania (GER) y el identificador del partido en el que marcaron.
SELECT jugador, partidoId
FROM goleadores 
WHERE equipo = "GER";

#2 Mostrar el nombre de los goleadores, estadio y fecha de los partidos de la selección española. Usar JOINs.
SELECT gol.jugador, par.Estadio, par.fecha
FROM partidos par
INNER JOIN goleadores gol
	USING(PartidoId)
WHERE par.Equipo1 = "ESP" OR par.Equipo2 = "ESP";

#3 Mostrar el identificador de los equipos que participaron en el partido,
# el nombre de los jugadores y su nacionalidad, de aquellos que hayan marcado algún gol cuyo nombre empiece por Mario. Usar JOINs.
SELECT par.equipo1, par.equipo2, gol.jugador, gol.equipo AS nacionalidad
FROM partidos par
INNER JOIN goleadores gol
	USING (partidoId)
WHERE gol.jugador LIKE "Mario%";

#4 Mostrar el jugador, id del equipo, entrenador y minuto,
#  de todos los partidos donde se haya marcado un gol antes del minuto 10.
#  Ordenar la salida por minuto de formas ascendente. Usar JOINs.
SELECT gol.jugador, eq.id, eq.entrenador, gol.minuto
FROM goleadores gol
INNER JOIN equipos eq
	ON eq.id = gol.equipo
WHERE minuto < 10 ;

#5 Listar las fechas y el nombre de los equipos de aquellos partidos en los cuales Fernando Santos es el entrenador del equipo local (Equipo1).
#  Usar subconsultas.
SELECT DISTINCT(par.fecha),eq.nombre
FROM partidos par
INNER JOIN equipos eq
	ON eq.id = par.equipo1 OR eq.id = par.equipo2
WHERE par.equipo1 = (SELECT id
					 FROM equipos eq
                     WHERE eq.entrenador = "Fernando Santos");

#6 Mostrar el nombre de los diferentes jugadores que han marcado algún gol en el estadio 'National Stadium, Warsaw'
#  ordenar la salida alfabéticamente. Usar JOINs.
SELECT gol.jugador 
FROM goleadores gol
WHERE partidoId IN (SELECT partidoId
					FROM partidos par
                    WHERE estadio = "National Stadium, Warsaw");

#7 Obtener el listado de los distintos nombres de los jugadores que le han marcado algún gol a Alemania (GER),
#  ordenar la salida alfabéticamente. Usar JOINs.
SELECT gol.jugador
FROM goleadores gol
INNER JOIN partidos par
	USING (partidoId)
WHERE par.equipo2 = "GER";

#8 Mostrar el identificador, nombre y número de goles marcados por cada equipo. Usar JOINs.
SELECT eq.id, eq.nombre, COUNT(gol.minuto)
FROM equipos eq
INNER JOIN goleadores gol
	ON eq.id = gol.equipo
GROUP BY eq.id;

#9 Mostrar el nombre de todos los equipos que no hayan marcado goles. Usar LEFT JOIN.
SELECT eq.nombre
FROM equipos eq
LEFT JOIN goleadores gol
	ON eq.id = gol.equipo
GROUP BY eq.nombre
HAVING count(minuto) = 0;

#10 Mostrar la fecha, id y nombre de los equipos, de aquellos partidos que tuvieron lugar en el mes de Julio. Usar JOINs.
SELECT par.fecha, eq.id, eq.nombre
FROM partidos par
INNER JOIN equipos eq
	ON eq.id = par.equipo1 OR eq.id = par.equipo2
WHERE month(par.fecha) = 7