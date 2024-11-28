
SELECT * FROM actor;
SELECT first_name, last_name FROM actor;
SELECT DISTINCT first_name FROM actor;

SELECT actor_id, first_name, last_name FROM actor WHERE first_name = "Joe";
SELECT first_name, last_name FROM actor WHERE first_name = "Scarlett";

SELECT * FROM customer WHERE active = 0; 

# Mostrar todos los pagos cuyo importa sea mayor a 2.99
SELECT payment_date, amount FROM payment WHERE amount > 2.99;
# Mostrar todos los pagos cuyo importe sea mayor a 2.99 y menor o igual a 5.99
SELECT payment_date, amount FROM payment WHERE amount > 2.99 AND amount <= 5.99;
# Mostrar todos los pagos que esten entre 2.99 y 5.99, sendos incluidos
SELECT payment_date, amount FROM payment WHERE amount BETWEEN 2.99 AND 5.99;

# Mostrar los actores cuyos apellidos contengan las letras GEN
SELECT * FROM actor WHERE last_name LIKE "%gen%";

# IN comprueba si una columna tiene un valor igual que cualquiera de ls incluidos dentro de un parentesis
# Mostrar  el id del pais y nomnbre
SELECT country_id, country FROM country WHERE country IN ("Afghanistan","Bangladesh","China");

# Mostrar el id y la fecha de los 3 primeros alquileres
SELECT rental_id, rental_date 
FROM rental 
LIMIT 3;

SELECT rental_id, rental_date 
FROM rental 
LIMIT 0,3;

# Mostrar el id nombre y apellidos de los actores ordenados por nombre
# Por defecto ASC
SELECT actor_id, first_name, last_name 
FROM actor 
ORDER BY first_name;
# En orden DESC
SELECT actor_id, first_name, last_name 
FROM actor 
ORDER BY first_name DESC;

# mostrar el ultimo apellido
SELECT actor_id, first_name, last_name 
FROM actor 
ORDER BY last_name DESC
LIMIT 1;

# Mostrar todos los actores que contengan en el apellido li, ordenados por apellido y nombre
SELECT actor_id, first_name, last_name 
FROM actor 
WHERE last_name LIKE "%LI%"
ORDER BY last_name, first_name;

# Calcular la media de las duraciones de la peliculas
SELECT AVG(length) FROM film;

# Cuantos actores hay con un apellido diferente
SELECT COUNT(DISTINCT last_name) FROM actor; 

# Mostrar el pago mas antiguo y el ultimo modificado
SELECT MIN(payment_date) AS MasAntiguo, MAX(last_update) AS FechaActualizacion FROM payment;

# Mostrar el apellido y cuantos actores lo tienen
SELECT last_name, COUNT(last_name)
FROM actor 
GROUP BY last_name
ORDER BY last_name;

# Mostrar los apellidos que no se repitan
SELECT last_name
FROM actor
GROUP BY last_name
HAVING COUNT(*) = 1 
ORDER BY last_name;

# Mostrar el apellido y la cantidad de actores que tienen ese apellido, pero solo para aquellos que lo comparten con al menos 2 actores
SELECT last_name, COUNT(*)
FROM actor
GROUP BY last_name
HAVING COUNT(*) >= 2
ORDER BY COUNT(*);

# Mostrar todas las ciudades junto al pais al que pertenecen
SELECT city, country
FROM city, country
WHERE city.country_id = country.country_id;

# Mostrar todas las ciudades juanto al pais al que pertenecen con INNER JOIN
SELECT city, country
FROM city 
INNER JOIN country 
	ON country.country_id = city.country_id;

# Mostrar del staff el nombre apellidos y direccion
SELECT staff.first_name, staff.last_name, address.address
FROM staff
INNER JOIN address
	ON address.address_id = staff.address_id;


# Listar cada pelicula y el numero de actores que figuran en esa pelicula
SELECT fi.title, COUNT(fa.actor_id)
FROM film fi
INNER JOIN film_actor fa
	ON fi.film_id = fa.film_id
GROUP BY fi.title;


# Para campos comunes
SELECT fi.title, COUNT(fa.actor_id) AS actores
FROM film fi
INNER JOIN film_actor fa
	USING (film_id)
GROUP BY fi.title;


# Mostrar los nombres apellidos y peliculas de cada actor
SELECT a.actor_id, a.first_name, a.last_name, fa.film_id
FROM actor a
LEFT JOIN film_actor fa
	ON a.actor_id = fa.actor_id;


# Mostrar los nombres, apellidos y peliculas en las que no hayan actuado los actores
SELECT a.actor_id, a.first_name, a.last_name, fa.film_id
FROM actor a
LEFT JOIN film_actor fa
	ON a.actor_id = fa.actor_id
WHERE fa.film_id IS NULL;

# Mostrar las categorias de cada una de las peliculas
SELECT fc.film_id, fc.category_id, ca.name
FROM film_category fc
RIGHT OUTER JOIN category ca USING(category_id);

# Mostrar las categorias sin peliculas
SELECT fc.film_id, fc.category_id, ca.name
FROM film_category fc
RIGHT OUTER JOIN category ca 
	USING(category_id)
WHERE fc.film_id IS NULL;

# Mostrar el nombre apellidos de los actores y el titulo de las peliculas en las que ha participado
SELECT a.first_name, a.last_name, f.title
FROM film_actor fa
LEFT JOIN actor a USING(actor_id)
LEFT JOIN film f USING(film_id);

SELECT fc.film_id, fc.category_id, c.name
FROM film_category fc
LEFT OUTER JOIN category c USING(category_id)
UNION
SELECT fc.film_id, fc.category_id, c.name
FROM film_category fc
RIGHT OUTER JOIN category c USING(category_id);  

# Mostrar las peliculas realizadas por Ed Chase
SELECT film_actor.film_id, film_actor.actor_id
FROM film_actor
WHERE film_actor.actor_id = (SELECT actor.actor_id
							 FROM actor
							 WHERE actor.first_name = "ED" 
							 AND actor.last_name = "chase");

# Mostrar las peliculas realizadas por Ed Chase
SELECT film_actor.film_id, film.title, film_actor.actor_id
FROM film_actor
LEFT OUTER JOIN film USING(film_id)
WHERE film_actor.actor_id = (SELECT actor.actor_id
							 FROM actor
							 WHERE actor.first_name = "ED" 
							 AND actor.last_name = "chase");

# Mostrar todas las ciudades de Spain & Japan
SELECT city_id, city, country_id
FROM city
WHERE country_id IN ( SELECT country.country_id
					  FROM country
					  WHERE country IN ("Spain","Japan") );






