-- 1. Crea el esquema de la BBDD
CREATE SCHEMA actores;


-- 2. Muestra los nombres de todas las películas con una clasificación por edades de ‘Rʼ.

SELECT "title", "rating"
FROM "film"
WHERE "rating" = 'R';


-- 3. Encuentra los nombres de los actores que tengan un “actor_idˮ entre 30 y 40.


SELECT concat("first_name", ' ', "last_name"), "actor_id"
FROM "actor"
LIMIT  11
OFFSET 29;

-- 4. Obtén las películas cuyo idioma coincide con el idioma original.

SELECT f."title" AS "Titulo", f."language_id", l."name" AS "Idioma"
FROM "film" AS f
INNER JOIN "language" AS l
  ON f."language_id" = l."language_id"
WHERE f."original_language_id" = l."language_id";

-- No hay ninguna pelicula que tenga el mismo idioma

-- 5. Ordena las películas por duración de forma ascendente.


SELECT "title" AS "Titulo", "length" AS "Duración"
FROM "film"
ORDER BY "length" ASC;


-- 6. Encuentra el nombre y apellido de los actores que tengan ‘Allenʼ en su apellido.


SELECT concat("first_name", ' ', "last_name") AS "Nombre"
FROM "actor"
WHERE "last_name" ILIKE 'Allen';



-- 7. Encuentra la cantidad total de películas en cada clasificación de la tabla “filmˮ y muestra la clasificación junto con el recuento.



SELECT "rating" AS "Clasificación", COUNT("film_id") AS "Cantidad"
FROM "film"
GROUP BY "rating";


--8. Encuentra el título de todas las películas que son ‘PG-13ʼ o tienen una duración mayor a 3 horas en la tabla film.


SELECT "title" AS "Titulo","rating", "length"
FROM "film" AS f
WHERE "rating" = 'PG-13' 
OR "length" >180;




-- 9.  Encuentra la variabilidad de lo que costaría reemplazar las películas.

SELECT "title" AS "Titulo", 
        round(variance("replacement_cost"),2) AS "Varianza del coste"
FROM "film" AS f
GROUP BY "title";


-- 10. Encuentra la mayor y menor duración de una película de nuestra BBDD

SELECT MIN("length") AS "duración minima",
        MAX("length") AS "duración maxima" 
FROM "film" AS f
LIMIT  1;



-- 11. Encuentra lo que costó el antepenúltimo alquiler ordenado por día.

SELECT "amount" AS "Coste",
        "payment_date" AS "fecha de pago"
FROM "payment"
ORDER BY  "payment_date" ASC 
LIMIT 1
OFFSET 2;



-- 12.  Encuentra el título de las películas en la tabla “filmˮ que no sean ni ‘NC-17ʼ ni ‘Gʼ en cuanto a su clasificación.

SELECT "title" AS "Titulo",
        "rating" AS "clasificación"
FROM "film"
WHERE rating NOT IN  ('NC-17','G');




-- 13.  Encuentra el promedio de duración de las películas para cada clasificación de la tabla film y muestra la clasificación junto con el promedio de duración.

SELECT "rating" AS Clasificación,
        round(avg("length"),2) AS "media de la duracción"
FROM  "film"
GROUP BY "rating";




-- 14.  Encuentra el título de todas las películas que tengan una duración mayor a 180 minutos.

SELECT "title" AS "Titulo",
        "length" AS "Duración"
FROM  "film"
WHERE "length" > 180;




--15. ¿Cuánto dinero ha generado en total la empresa?

SELECT SUM("amount") AS "facturación empresa"
FROM "payment";

-- Ha generado 67.416,51 Dolares



-- 16. Muestra los 10 clientes con mayor valor de id.

SELECT concat("first_name", ' ', "last_name") AS "Nombre", 
        "customer_id" AS "Cliente_id"
FROM "customer"
ORDER BY "customer_id" DESC
LIMIT 10;




-- 17. Encuentra el nombre y apellido de los actores que aparecen en la película con título ‘Egg Igbyʼ.


SELECT concat(a."first_name", ' ', a."last_name") AS "Nombre"
FROM "actor" as a
JOIN "film_actor" as fa 
    ON a."actor_id" = fa."actor_id"
JOIN "film" AS f   
    ON fa."film_id" = f."film_id"
WHERE f."title" = 'Egg Igby';




-- 18. Selecciona todos los nombres de las películas únicos.

SELECT "title" AS "Nombre pelicula"
FROM "film"
GROUP BY film_id;


-- 19.  Encuentra el título de las películas que son comedias y tienen una duración mayor a 180 minutos en la tabla “filmˮ.

SELECT f."title" AS "Nombre pelicula"
FROM "film" AS f
JOIN "film_category" AS fc
    ON f."film_id" = fc."film_id"
JOIN "category" AS C
    ON fc."category_id" = c."category_id"
WHERE c."name" LIKE 'Comedy'
AND f."length" > 180;




-- 20. Encuentra las categorías de películas que tienen un promedio de duración superior a 110 minutos y muestra el nombre de la categoría junto con el promedio de duración.

SELECT c."name" AS "Categoría",
        round(AVG(f.length),0) AS "Duración_media"
FROM "film" AS f
JOIN "film_category" AS fc
    ON f."film_id" = fc."film_id"
JOIN "category" AS C
    ON fc."category_id" = c."category_id"
WHERE length > 110
GROUP BY c."name";




-- 21. ¿Cuál es la media de duración del alquiler de las películas?

SELECT AVG("rental_rate") AS "Media del aqluiler"
FROM "film";




-- 22. Crea una columna con el nombre y apellidos de todos los actores y actrices.

SELECT concat("first_name", ' ', "last_name") AS "Nombre de actores"
FROM "actor";




-- 23. Números de alquiler por día, ordenados por cantidad de alquiler de forma descendente.

SELECT DATE("rental_date") AS "Día",
       COUNT("rental_id") AS "Cantidad de Alquileres"
FROM "rental"
GROUP BY DATE("rental_date")
ORDER BY "Cantidad de Alquileres" DESC;





-- 24. Encuentra las películas con una duración superior al promedio.

SELECT "title" AS "titulo",
        "length" "Duración"
FROM "film" AS f
WHERE "length" >(SELECT avg("length")
    FROM "film"AS f);


-- El priomedio de duración es de 115 minutos
    
    
    
-- 25. Averigua el número de alquileres registrados por mes.
    
SELECT DATE_TRUNC('month', "rental_date") AS "Mes",
       COUNT("rental_id") AS "Cantidad de Alquileres"
FROM "rental"
GROUP BY DATE_TRUNC('month', "rental_date")
ORDER BY "Mes";
    



-- 26. Encuentra el promedio, la desviación estándar y varianza del total pagado.

SELECT round(avg("amount"),2) AS "Media del total pagaddo", 
        round(STDDEV("amount"),2) AS "Desviación del total pagaddo",
        round(variance("amount"),2) AS "Varianza del total pagaddo"
FROM "payment";




-- 27. ¿Qué películas se alquilan por encima del precio medio?

SELECT f."title" AS "Titulo", 
       ROUND(AVG(p."amount"), 2) AS "Precio Promedio Alquiler"
FROM "film" f
JOIN "inventory" i ON f."film_id" = i."film_id"
JOIN "rental" r ON i."inventory_id" = r."inventory_id"
JOIN "payment" p ON r."rental_id" = p."rental_id"
GROUP BY f."title"
HAVING AVG(p."amount") > (
    SELECT AVG("amount") FROM "payment"
)
ORDER BY "Precio_Promedio_Alquiler" ;




-- 28. Muestra el id de los actores que hayan participado en más de 40 películas.

SELECT "actor_id" AS "Id de actores",
        count("film_id") AS "cuenta de peliculas"
FROM "film_actor" AS fa
GROUP BY "actor_id"
HAVING  (SELECT count("film_id") AS "cuenta de peliculas") > 40;


-- Solo dos actores tienen más de 40 peliculas



-- 29. Obtener todas las películas y, si están disponibles en el inventario, mostrar la cantidad disponible.

SELECT "film_id" AS "id_pelicula",
        count("inventory_id") AS "inventario"
FROM "inventory" AS i
GROUP BY "film_id";




-- 30. Obtener los actores y el número de películas en las que ha actuado.

SELECT concat(a."first_name", ' ', a."last_name") AS "nombre actor",
        count(fa."film_id") AS "Peliculas realizadas"
FROM "actor" AS a
JOIN "film_actor" AS fa
ON a."actor_id" = fa."actor_id"
GROUP BY "nombre actor"
ORDER BY "Peliculas realizadas";




-- 31. Obtener todas las películas y mostrar los actores que han actuado en  ellas, incluso si algunas películas no tienen actores asociados

SELECT f."title" AS "pelicula",
        count(concat(a."first_name",a."last_name")) AS "cuenta actores"
FROM "film" AS f
FULL JOIN "film_actor" AS fa
ON f."film_id" = fa."film_id"
FULL JOIN "actor" AS a
ON fa."actor_id" = a."actor_id"
GROUP BY "pelicula"
ORDER BY "cuenta actores" ASC;

-- Todas las peliculas tienen actores asociados.




-- 32. Obtener todos los actores y mostrar las películas en las que han actuado, incluso si algunos actores no han actuado en ninguna película.

SELECT concat(a."first_name", ' ', a."last_name") AS "nombre actor",
        count(f."title") AS "Peliculas realizadas"
FROM "actor" AS a
full JOIN "film_actor" AS fa
ON a."actor_id" = fa."actor_id"
full  JOIN "film" AS F
ON fa."film_id" = f."film_id"
GROUP BY "nombre actor"
ORDER BY "Peliculas realizadas";




-- 33. Obtener todas las películas que tenemos y todos los registros de alquiler.

SELECT f."title" AS "pelicula",
        count(r."rental_date") AS "alquileres"
FROM "film" AS f
JOIN "inventory" AS i
ON f."film_id" = i."film_id"
FULL JOIN "rental" AS r
ON i."inventory_id" = r."inventory_id"
GROUP BY "pelicula"
ORDER BY "alquileres";




-- 35.  Encuentra los 5 clientes que más dinero se hayan gastado con nosotros.

SELECT concat(c."first_name", ' ', c."last_name") AS "clientes",
        SUM(p."amount") AS "total gastado"
FROM "customer" AS c
JOIN "payment" AS p
ON c."customer_id" = p."customer_id"
GROUP BY "clientes"
ORDER BY "total gastado" DESC
LIMIT 5;




-- 35. Selecciona todos los actores cuyo primer nombre es 'Johnny'.

SELECT concat("first_name", ' ', "last_name") AS "Nombre de actores"
FROM "actor"
WHERE "first_name" iLIKE 'Jhonny';

-- No se ha encontrado ninún actor llamado Jhonny




-- 36.  Renombra la columna “first_nameˮ como Nombre y “last_nameˮ como Apellido.
SELECT "first_name" AS "nombre",
        "last_name" AS "apellido"
FROM "actor";




-- 37.  Encuentra el ID del actor más bajo y más alto en la tabla actor.

SELECT min("actor_id")AS "id minimo",
        max("actor_id") AS "id maximo"
FROM "actor";




-- 38. Cuenta cuántos actores hay en la tabla “actorˮ.

SELECT COUNT("actor_id") AS "Cuenta actores"
FROM "actor";



-- 39. Selecciona todos los actores y ordénalos por apellido en orden ascendente.


SELECT concat("first_name", ' ', "last_name") AS "actores"
FROM "actor"
ORDER BY "last_name" DESC;




-- 40. Selecciona las primeras 5 películas de la tabla “filmˮ.

SELECT "title" AS "peliculas"
FROM "film"
ORDER BY "peliculas"
LIMIT 5;




-- 41. Agrupa los actores por su nombre y cuenta cuántos actores tienen el mismo nombre. ¿Cuál es el nombre más repetido?

SELECT "first_name" AS "nombre actor",
        COUNT("first_name")
FROM "actor"
GROUP BY "nombre actor";





-- 42. Encuentra todos los alquileres y los nombres de los clientes que los realizaron.

SELECT p."rental_id" AS "alquileres",
        concat(c."first_name", ' ', c."last_name")
FROM "payment" AS p
JOIN "customer" AS c
ON p."customer_id" = c."customer_id";



-- 43. Muestra todos los clientes y sus alquileres si existen, incluyendo aquellos que no tienen alquileres.

SELECT concat(c."first_name", ' ', c."last_name") AS "clientes",
        COUNT(p."rental_id") AS "alquileres"
FROM "customer" AS c
left JOIN "payment" AS p
ON c."customer_id" = p."customer_id"
GROUP BY "clientes"
ORDER BY "alquileres" asc;




-- 44. Realiza un CROSS JOIN entre las tablas film y category. ¿Aporta valor esta consulta? ¿Por qué? Deja después de la consulta la contestación.

SELECT f."title" AS "Película",
       c."name" AS "Categoría"
FROM "film" AS f
CROSS JOIN "category" c;


-- El cruce no tiene sentido. No da información diferente adicional. 




-- 45.Encuentra los actores que han participado en películas de la categoría 'Action'

SELECT concat(a."first_name", ' ', a."last_name") AS "nombre actor"
FROM "actor" as a
JOIN "film_actor" AS fa
ON a."actor_id" = fa."actor_id"
JOIN "film" AS f
ON fa."film_id" = f."film_id"
JOIN "film_category" AS fc
ON f."film_id" = fc."film_id"
JOIN "category" AS c
ON fc."category_id" = c."category_id"
WHERE c."name" LIKE 'Action'
GROUP BY "nombre actor";





-- 46. Encuentra todos los actores que no han participado en películas.

SELECT concat(a."first_name", ' ', a."last_name") AS "nombre actor"
FROM "actor" a
LEFT JOIN "film_actor" fa 
ON a."actor_id" = fa."actor_id"
WHERE fa."film_id" IS NULL;


-- No hay actores que no hayan participado en peliculas




-- 47. Selecciona el nombre de los actores y la cantidad de películas en las que han participado.

SELECT concat(a."first_name", ' ', a."last_name") AS "nombre actor",
        count(fa."film_id")
FROM "actor" a
JOIN "film_actor" AS fa
ON a."actor_id" = fa."actor_id"
GROUP BY "nombre actor";





-- 48. Crea una vista llamada “actor_num_peliculasˮ que muestre los nombres  de los actores y el número de películas en las que han participado.

CREATE VIEW "actor_num_peliculas" AS 
SELECT concat(a."first_name", ' ', a."last_name") AS "nombre actor",
        count(fa."film_id")
FROM "actor" a
JOIN "film_actor" AS fa
ON a."actor_id" = fa."actor_id"
GROUP BY "nombre actor";





-- 49. Calcula el número total de alquileres realizados por cada cliente.

SELECT concat(c."first_name", ' ', c."last_name") AS "nombre cliente",
        COUNT(p."rental_id") AS "numero de alquileres"
FROM "customer" AS c
JOIN "payment" AS p
ON c."customer_id" = p."customer_id"
GROUP BY "nombre cliente";



-- 50. Calcula la duración total de las películas en la categoría 'Action'.

SELECT c."name" AS "nombre categoria",
        SUM(f."length") AS "Duración total 'Accion'"
FROM "category" AS c
JOIN "film_category" AS fc
ON c."category_id" = fc."category_id"
JOIN "film" AS f
ON fc."film_id" = f."film_id"
WHERE c."name" LIKE 'Action'
GROUP BY "nombre categoria";




-- 51. Crea una tabla temporal llamada “cliente_rentas_temporalˮ para  almacenar el total de alquileres por cliente.

CREATE VIEW "cliente_rentas_temporal" AS 
select concat(c."first_name", ' ', c."last_name") AS "nombre cliente",
        sum(p."amount")
FROM "customer" AS c
JOIN "payment" AS p
ON c."customer_id" = p."customer_id"
GROUP BY "nombre cliente"




-- 52. Crea una tabla temporal llamada “peliculas_alquiladasˮ que almacene las películas que han sido alquiladas al menos 10 veces.

SELECT f."title" AS "peliculas",
        COUNT(r."rental_id") "numero de alquileres"
FROM "film" AS f
JOIN "inventory" AS i
ON f."film_id" = i."film_id"
JOIN "rental" AS r
ON i."inventory_id" = r."inventory_id"
GROUP BY f."film_id", f."title"
HAVING COUNT(r."rental_id") >= 10;




-- 53. Encuentra el título de las películas que han sido alquiladas por el cliente con el nombre ‘Tammy Sandersʼ y que aún no se han devuelto. Ordena los resultados alfabéticamente por título de película.

SELECT f."title" AS "peliculas"
FROM "film" AS f
JOIN "inventory" AS i
ON f."film_id" = i."film_id"
JOIN "rental" AS r
ON i."inventory_id" = r."inventory_id"
JOIN "customer"AS c
ON r."customer_id" = c."customer_id"
WHERE c."first_name"  = 'Tammy'
AND c."last_name" = 'Sanders'
AND r."return_date" IS null;


-- No hay ninguna pelicula que no hay nunguna pelicula alquilada por Tammy Sanders, he compobado que haya fecha o no de retorno.




-- 54.  Encuentra los nombres de los actores que han actuado en al menos una película que pertenece a la categoría ‘Sci-Fiʼ. Ordena los resultados alfabéticamente por apellido.

SELECT a."first_name" AS "nombre actor",  
        a."last_name" AS "apellido actor",
        count(f."film_id")
FROM "actor" AS a
JOIN "film_actor" AS fa
ON a."actor_id" = fa."actor_id"
JOIN "film" AS f
ON fa."film_id" = f."film_id"
JOIN "film_category" AS fc
ON f."film_id" = fc."film_id"
JOIN "category" AS c
ON fc."category_id" = c."category_id"
WHERE c."name" = 'Sci-Fi'
GROUP BY a."first_name", a."last_name"
ORDER BY a."last_name" ASC;





-- 55. Encuentra el nombre y apellido de los actores que han actuado en películas que se alquilaron después de que la película ‘Spartacus Cheaperʼ se alquilara por primera vez. Ordena los resultados alfabéticamente por apellido.
SELECT DISTINCT a."first_name" AS "Nombre",
                a."last_name" AS "Apellido"
FROM "actor" a
JOIN "film_actor" fa ON a."actor_id" = fa."actor_id"
JOIN "film" f ON fa."film_id" = f."film_id"
JOIN "inventory" i ON f."film_id" = i."film_id"
JOIN "rental" r ON i."inventory_id" = r."inventory_id"
WHERE r."rental_date" > (
    SELECT MIN(r2."rental_date")
    FROM "film" f2
    JOIN "inventory" i2 ON f2."film_id" = i2."film_id"
    JOIN "rental" r2 ON i2."inventory_id" = r2."inventory_id"
    WHERE f2."title" = 'Spartacus Cheaper'
)
ORDER BY a."last_name", a."first_name";




--  56. nuentra el nombre y apellido de los actores que no han actuado en ninguna película de la categoría ‘Musicʼ.

SELECT a."first_name" AS "nombre actor",  
        a."last_name" AS "apellido actor"
FROM "actor" AS a
JOIN "film_actor" AS fa
ON a."actor_id" = fa."actor_id"
JOIN "film" AS f
ON fa."film_id" = f."film_id"
JOIN "film_category" AS fc
ON f."film_id" = fc."film_id"
JOIN "category" AS c
ON fc."category_id" = c."category_id"
WHERE c."name" = 'Music';




-- 57.  Encuentra el título de todas las películas que fueron alquiladas por más  de 8 días.

SELECT f."title" AS "nombre pelicula"
FROM "film" AS f
JOIN "inventory" AS i
ON f."film_id" = i."film_id"
JOIN "rental" AS r
ON i."inventory_id" = r."inventory_id"
WHERE EXTRACT(DAY FROM r."rental_date") > 8
GROUP BY f."title";




 --58. Encuentra el título de todas las películas que son de la misma categoría que ‘Animationʼ.

SELECT f."title" AS "titulo pelicula"
FROM "film" AS f
JOIN "film_category" AS fc
ON f."film_id" = fc."film_id"
JOIN "category" AS c
ON fc."category_id" = c."category_id"
WHERE c."name" = 'Animation';



-- 59. Encuentra los nombres de las películas que tienen la misma duración que la película con el título ‘Dancing Feverʼ. Ordena los resultados alfabéticamente por título de película.
-- 59.1
SELECT "length"
FROM "film"
WHERE "title" = 'DANCING FEVER';


SELECT "title" AS "titulo pelicula"
FROM "film"
WHERE "length" = '144'
ORDER BY "title" ASC;
-- 59.2

SELECT "title" AS "titulo pelicula"
FROM "film"
WHERE "length" =(SELECT "length"
FROM "film"
WHERE "title" = 'DANCING FEVER')
ORDER BY "title";


-- Lo resuelvo de dos formas diferentes.




-- 60. Encuentra los nombres de los clientes que han alquilado al menos 7  películas distintas. Ordena los resultados alfabéticamente por apellido.

SELECT c."first_name" AS "Nombre",
       c."last_name" AS "Apellido",
       COUNT(DISTINCT f."film_id") AS "Peliculas Distintas"
FROM "customer" c
JOIN "rental" r ON c."customer_id" = r."customer_id"
JOIN "inventory" i ON r."inventory_id" = i."inventory_id"
JOIN "film" f ON i."film_id" = f."film_id"
GROUP BY c."customer_id", c."first_name", c."last_name"
HAVING COUNT(DISTINCT f."film_id") >= 7
ORDER BY c."last_name", c."first_name";




-- 61.  Encuentra la cantidad total de películas alquiladas por categoría y muestra el nombre de la categoría junto con el recuento de alquileres.

SELECT c."name" AS "nombre categoria",
        COUNT(r."rental_id") AS "Nº de alquileres"
FROM "category" AS c
JOIN "film_category" AS fc
ON c."category_id" = fc."category_id"
JOIN "film" AS f
ON fc."film_id" = f."film_id"
JOIN "inventory" AS i
ON f."film_id" = i."film_id"
JOIN "rental" AS r
ON i."inventory_id" = r."inventory_id"
GROUP BY c."name";




-- 62. Encuentra el número de películas por categoría estrenadas en 2006.

SELECT c."name" AS "nombre categoria",
        COUNT(f."title") AS "Nº de alquileres"
FROM "category" AS c
JOIN "film_category" AS fc
ON c."category_id" = fc."category_id"
JOIN "film" AS f
ON fc."film_id" = f."film_id"
WHERE f."release_year" = '2006'
GROUP BY c."name";




-- 63. Obtén todas las combinaciones posibles de trabajadores con las tiendas que tenemos.

SELECT s."first_name" AS "Nombre_Trabajador",
       s."last_name" AS "Apellido_Trabajador",
       st."store_id" AS "ID_Tienda"
FROM "staff" s
CROSS JOIN "store" st
ORDER BY s."last_name", s."first_name", st."store_id";




-- 64.  Encuentra la cantidad total de películas alquiladas por cada cliente y muestra el ID del cliente, su nombre y apellido junto con la cantidad de películas alquiladas.

SELECT c."customer_id" AS "id cliente",
        concat(c."first_name", ' ', c."last_name") AS "nombre de clientes",
        COUNT(r."rental_id") AS "Nº de alqileres"
FROM "customer" AS c
JOIN "rental" AS r
ON c."customer_id" = r."customer_id"
GROUP BY "nombre de clientes", "id cliente" ;


