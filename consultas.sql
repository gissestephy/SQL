select*from world.country,
select*from world.city,
select*from countrylanguage

/* Listar código, nombre, continente y población de todos los países. 
(Se esperan 4 columnas y 239 registros)*/

select code, name, continent, population from world.country; 

/* Listar solo.el nombre de todos los lenguajes distintos que existan. 
(Se espera 1 columna y 457 registros)*/
select language from world.countrylanguage;

/* Listar nombre y población de cada ciudad, con los nombres de las columnas en castellano. 
(Se esperan 2 columnas y 4079 registros).*/
select name AS Nombre_ciudad, population AS Poblacion from city;

/* Listar el nombre, el GNP como 'Producto Bruto Nacional', el GNPOld como
'Producto Bruto Nacional Anterior' y la diferencia entre estos como 'Diferencia',
para todos los países. (Se esperan 4 columnas y 239 registros).*/
select name AS Nombre, GNP AS Producto_Bruto_Nacional, GNPOld AS Producto_Bruto_Nacional_Anterior, (GNP-GNPOld) AS Diferencia from world.country;

/* Listar el nombre, la cantidad de habitantes, la superficie y una columna llamada
'Densidad' con el resultado de la densidad poblacional de todos los países. (Se
esperan 4 columnas y 239 registros).*/
select name AS Nombre, population AS Habitantes, SurfaceArea AS superficie,(population/SurfaceArea) AS Densidad from world.country;

/*Ordenamiento*/
/* Listar toda la información de los países, ordenados por población de manera
ascendente. (Se esperan 15 columnas y 239 registros).*/
select*from world.country ORDER BY country.population ASC;
select*from world.country ORDER BY country.population DESC;

/* Listar nombre de los lenguajes en orden alfabético. (Se espera 1 columna y 984
registros).*/
select countrylanguage.language AS nombre from world.countrylanguage ORDER BY nombre ASC; 

/* Listar nombre y cantidad de habitantes de las veinte ciudades menos pobladas.
(Se esperan 2 columnas y 20 registros).*/
select city.name AS Nombre, city.population AS cant_habitantes from world.city ORDER BY cant_habitantes ASC LIMIT 20;

/* Listar código, nombre y año de independencia de todos los países, ordenados por antigüedad descendente. 
(Se esperan 3 columnas y 239 registros).*/
select country.code as codigo, country.name as nombre, country.IndepYear as independencia from world.country ORDER BY country.IndepYear DESC;

/* Listar nombre y continente de los cien países con mayor expectativa de vida. Si
hubiera países que tengan la misma expectativa de vida, mostrar primero a los de menor superficie. 
(Se esperan 2 columnas y 100 registros).*/
select country.name, country.Continent from world.country ORDER by country.lifeExpectancy, country.SurfaceArea DESC LIMIT 100;

/*Operadores relacionales y logicos. Operadores IN y BETWEEN*/
/* Listar todos los datos de los países que no cuenten con habitantes. 
(Se esperan 15 columnas y 7 registros).*/
select*from world.country WHERE country.population=0;

/* Listar todos los datos de los países cuya expectativa de vida supere los setenta y cinco años, ordenados bajo este concepto de forma ascendente. (Se esperan 15 columnas y 62 registros).*/
select*from world.country WHERE country.lifeExpectancy>75 ORDER BY country.lifeExpectancy ASC;

/* Listar todos los datos de los países cuya independencia haya ocurrido a partir de la segunda mitad del siglo XIX y su forma de gobierno sea una monarquía constitucional. 
(Se esperan 15 columnas y 20 registros).*/
select*from world.country WHERE country.IndepYear>1850 AND country.GovernmentForm='ConstitutionalMonarchy';

/* Listar todos los datos de los diez países europeos de mayor PBN. (Se esperan 15 columnas y 10 registros).*/
select*from world.country WHERE country.Continent='Europe' ORDER BY country.GNP DESC LIMIT 10;

/* Listar todos los datos de los países cuyo nombre registrado coincida con su nombre local. (Se esperan 15 columnas y 104 registros).*/
select*from world.country WHERE country.name=country.localname;

/* Listar todos los datos de los países cuya independencia se haya dado a partir de la segunda mitad del siglo XX. (Se esperan 15 columnas y 110 registros).*/
select*from world.country WHERE country.IndepYear>1950;

/* Listar todos los datos de los países situados en Europa, Asia o Sudamérica. (Se esperan 15 columnas y 111 registros).*/
select*from world.country WHERE country.continent IN ('Europe', 'Asia', 'South America');

/* Listar todos los datos de todos los países, excepto los africanos. (Se esperan 15 columnas y 181 registros).*/
select*from world.country WHERE NOT country.continent='Africa';

/* Listar todos los datos de las ciudades argentinas fuera de la provincia de Buenos Aires. (Se esperan 5 columnas y 26 registros).*/
/* select*from world.country WHERE country.continent='Argentina' but NOT city.name='Buenos Aires' (join y unir ambas tablas) */
select*from world.city WHERE city.name!='Buenos Aires' AND district!='Buenos Aires' AND city.countrycode IN (Select country.code FROM world.country WHERE country.name= 'Argentina');

/* Listar todos los datos de las ciudades de entre 125 mil y 130 mil habitantes. (Se esperan 5 columnas y 138 registros).*/
select*from world.city WHERE city.population BETWEEN 125000 and 130000;

/*Valores Nulos. Operador Like. Comodines*/
/* Listar todos los datos de los países donde no se cuente con datos acerca de su independencia. 
(Se esperan 15 columnas y 47 registros).*/
select*from world.country WHERE country.IndepYear is null;

/* Listar todos los datos de los países donde no se tengan datos acerca del PBN anterior ni de la expectativa de vida. (Se esperan 15 columnas y 17 registros).*/
select*from world.country WHERE country.GNPOld IS NULL AND country.LifeExpectancy IS NULL;

/* Listar todos los datos de los países cuyo nombre comience y termine con ‘A’. (Se esperan 15 columnas y 13 registros).*/
select*from world.country WHERE country.name LIKE 'A%A';

/* Listar todos los datos de los países cuyo nombre sea compuesto (más de una palabra). (Se esperan 15 columnas y 66 registros).*/
select*from world.country WHERE country.name LIKE '% %';

/* Listar todos los datos de las ciudades cuyo nombre o distrito contengan un '-'. (Se esperan 5 columnas y 372 registros).*/
select*from world.city WHERE city.name LIKE '%-%' AND city.district LIKE '%-%';

select*from world.city WHERE city.name LIKE 'A%%';
select*from world.city WHERE city.name LIKE '%%A';
select*from world.city WHERE city.name LIKE 'A%%' and city.name LIKE '%%A';






