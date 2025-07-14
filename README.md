# 📊 Data Project: Lógica Consultas SQL

Proyecto de consultas de lógica SQL del programa **The Power MBA**.

---

## 1. Resumen o descripción

El proyecto consiste en entender y resolver **64 consultas SQL**.  
Para ello, trabajamos con una **base de datos de una empresa de alquiler de películas** compuesta por múltiples tablas relacionadas.

---

## 2. Estructura del repositorio

El repositorio contiene 3 archivos principales y este README:

- 📄 **BBDD_proyecto**: Contiene la estructura de la base de datos de una empresa dedicada al alquiler de películas. Incluye 15 tablas relacionadas entre sí y dos vistas creadas como parte del proyecto.
- 📄 **Código del proyecto**: Archivo SQL con los enunciados y la resolución de los 64 problemas propuestos.
- 📄 **EnunciadoDataProject_SQL.LógicaTablas**: Documento con los enunciados utilizados.
- 📄 **README**: Este mismo documento, explicando el trabajo realizado.

---

## 3. Instalaciones y requisitos

Para ejecutar y analizar este proyecto, se recomienda tener instaladas las siguientes herramientas:

- Excel
- PostgreSQL
- DBeaver
- Word

---

## 4. Explicación de los datos

La base de datos está compuesta por **15 tablas** conectadas mediante claves foráneas (estructura tipo "nido de araña"). El conocimiento del sector cinematográfico, especialmente en inglés, es útil para interpretar bien los datos.

A continuación se listan las tablas principales y sus claves primarias:

- **payment**  
  - 🔑 `payment_id`
- **rental**  
  - 🔑 `rental_id`
- **customer**  
  - 🔑 `customer_id`
- **store**  
  - 🔑 `store_id`
- **staff**  
  - 🔑 `staff_id`
- **address**  
  - 🔑 `address_id`
- **city**  
  - 🔑 `city_id`
- **country**  
  - 🔑 `country_id`
- **inventory**  
  - 🔑 `inventory_id`
- **actor**  
  - 🔑 `actor_id`
- **film_actor**  
  - 🔑 `actor_id`, `film_id`
- **film**  
  - 🔑 `film_id`
- **language**  
  - 🔑 `language_id`
- **film_category**  
  - 🔑 `film_id`, `category_id`
- **category**  
  - 🔑 `category_id`

Además, se crean dos vistas adicionales en los enunciados 48 y 52:

- 🧩 `CREATE VIEW actor_num_peliculas`
- 🧩 `CREATE VIEW cliente_rentas_temporal`

---

## 5. Proceso llevado a cabo

1. Se realiza un **primer análisis exploratorio** de la base de datos.
2. Se lee el conjunto de enunciados para identificar los más directos y los que requieren conocimientos adicionales.
3. Se resuelven los 64 ejercicios de forma secuencial, identificando la **petición principal** y las **secundarias** en cada uno para estructurar correctamente el código SQL.

---

## 6. Resultados y conclusiones

- Los resultados pueden consultarse ejecutando el script completo, ya que cada ejercicio está separado por `;`.
- El proyecto permite practicar ampliamente **consultas SQL reales** sobre una base relacional completa.

---

## 7. Contribuciones

Si deseas contribuir o ponerte en contacto, puedes escribirme por:

- 💼 LinkedIn: [Jacobo Pérez Ferreira](https://www.linkedin.com/in/jacobo-pérez-ferreira-0937905b)
- 📧 Email: jacoboferreira91@gmail.com
