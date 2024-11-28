#1
SELECT * FROM personas;
#2
SELECT apellidos FROM personas;
#3
SELECT apellidos 
FROM personas
WHERE localidad LIKE "lorca";
#4
SELECT apellidos 
FROM personas		
WHERE localidad IN ("lorca","murcia");
#5
SELECT dni, apellidos 
FROM personas		
WHERE localidad LIKE "Murcia" AND salario > 1500;
#6
SELECT dni, apellidos
FROM personas		
WHERE localidad LIKE "Murcia" AND salario > 1500 AND funcion LIKE "Director";
#7
SELECT dni, apellidos
FROM personas		
WHERE funcion = "médico"
ORDER BY apellidos DESC;
#8
SELECT DISTINCT localidad
FROM personas;	
#9
SELECT dni, apellidos, salario
FROM personas		
WHERE salario >1500 AND funcion LIKE "medico"
ORDER BY salario DESC;
#10
SELECT apellidos
FROM personas		
WHERE apellidos LIKE "M%";
#11
SELECT dni, apellidos
FROM personas		
WHERE apellidos LIKE "%M%" AND funcion LIKE "conserje";
#12
SELECT apellidos
FROM personas		
WHERE salario BETWEEN 1500 AND 2000;
#13
SELECT dni, apellidos
FROM personas
WHERE funcion LIKE "médico" OR "director";
#14
SELECT dni, apellidos
FROM personas
WHERE funcion NOT LIKE "conserje" AND salario > 1500
ORDER BY apellidos DESC;
#15
SELECT dni, apellidos
FROM personas
WHERE (funcion LIKE "Murcia" OR "cartagena") AND (cod_hospital = 1);
#16
SELECT UPPER(apellidos)
FROM personas
WHERE cod_hospital = 1;
#17 
SELECT apellidos, LENGTH(apellidos)
FROM personas;
#18
SELECT LOWER(apellidos), LOWER(localidad)
from personas
WHERE cod_hospital != 1;
#19
SELECT dni, apellidos
FROM personas
WHERE (cod_hospital = 1 OR 2) AND salario > 1500;
#20
SELECT dni, apellidos
FROM personas
WHERE cod_hospital != 2 AND localidad LIKE "murcia"








