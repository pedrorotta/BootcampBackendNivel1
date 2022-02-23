CREATE SCHEMA EjemploSchema2 ; /*Crear un schema*/

DROP DATABASE `moviesschema`; /*Eliminar un schema : Cuidado
porque todos los datos, se eliminan*/

CREATE SCHEMA `moviesschema` ;

/*Crear una tabla: Lo importante es el tipo de dato*/
create table Movies(
	title varchar(40),
    productiondate  date,
    duration decimal(3,2),
    moviegender varchar(25),
    studioname varchar(40)
);

create table Actors(
	nameactor varchar(30),
    ageactor int(2),
    gender boolean,
    birthdate date
);

DESCRIBE actors; /*Describir una tabla*/

create table Cinemas(
	nameCinema varchar(20),
    premiun boolean, 
    addressCinema varchar(40),
    numbersmoviesstream int
);

/* Eliminar es peligroso : Hay que tener cuidado de los datos que se eliminan.*/


drop table Cinemas;

alter table movies add directorname varchar(30);

describe movies;

create table usuarios(
	DniUSer char(8) primary key, /*El valor de la llave primaria, debe ser un valor
    único e irrepetible.*/
    NameUser varchar(20) not null,
    ageUser char(2) not null,
    emailUser varchar(20) unique,
    phone char(9) not null default '' ,
    passwordUser varchar(20) not null
);

describe usuarios;

alter table usuarios add addressuser varchar(50);

alter table movies drop studioname;

drop table usuarios;

insert into usuarios value(
	'74736182',
    'Diego Lara',
    '22',
    'diego.lara@gmail.com',
    '999213455',
    '$#jsal9239'
);

insert into usuarios(DniUser,NameUser,ageUser,emailUser,passwordUser) value(
	'42915021',
    'Franco Ubillus',
    '22',
    'email.user@gmail.com',
    '#ksSK"!#'
);

insert into usuarios(DniUser,NameUser,ageUser,emailUser,passwordUser) value(
	'42915021231',
    'Nommmmbreee largoooo que excede la longiud de 20 permitida en el ejemplo',
    '22',
    'email.user@gmail.com',
    '#ksSK"!#'
);

select * from usuarios;
drop table usuarios;

/*Existen tablas que periten valores únicos y tablas que permiten vacíos. */

drop table movies;

create table Movies(
	id_movie int primary key auto_increment,/*Identificador inventado artificial*/
	title varchar(40), /*No importa el valor alfabético*/
    productiondate  date,
    duration decimal(3,2),
    moviegender varchar(25),
    studioname varchar(40)
);

describe movies;

insert into movies(title,productiondate,duration,moviegender,studioname) value(
	'El increíble Hulk',
    date '2008-03-28',
    1.82,
    'action',
    'Universal Studios'
);

select * from movies;

delete from movies where id_movie = 1;

drop table movies; 

insert into movies(title,productiondate,duration,moviegender,studioname) value(
	'Isla Sinistra',
    date '1998-03-28',
    3,
    'thriller',
    'Paramount'
);

update movies set title = 'Isla Siniestra' where moviegender = 'thriller'; 
delete from movies where title = 'Isla Sinistra';

/*Llenar la tabla movies con 5 a 6 películas, que cumplan las sgtes caracteristicas: */
/*Buscar 2 películas de comedia, 1 película de drama, y 2 péliculas producidas por Netflix, 
2 películas que duren 2 horas.*/


insert into movies(title,productiondate,duration,moviegender,studioname) value(
	'Jugar en casa',
    date '2022-01-28',
    1.8,
    'comedy',
    'Netflix'
);


insert into movies(title,productiondate,duration,moviegender,studioname) value(
	'No miren arriba',
    date '2021-12-05',
    2.4,
    'comedy',
    'Netflix'
);

insert into movies(title,productiondate,duration,moviegender,studioname) value(
	'Manos milagrosas',
    date '2021-09-05',
    1.5,
    'drama',
    'Thomas Carter'
);

insert into movies(title,productiondate,duration,moviegender,studioname) value(
	'Hitch',
    date '2005-01-05',
    2,
    'comedy',
    'Columbia Pictures'
);

insert into movies(title,productiondate,duration,moviegender,studioname) value(
	'Ghost la sombra del amor',
    date '1990-03-05',
    2,
    'romantic',
    'Paramount'
);

select * from movies;

/*Consultar el título y el año de producción de las películas*/

select title,productiondate from movies; 

/*Consultar los datos por año de producción de manera descendente*/
select * from movies order by productiondate desc;

/*Consultar 5 filas de la base de datos con los atributos título y año de producción*/

select title, productiondate from movies limit 5;

/*Consultar las películas que tengan duración menor a 2 horas*/

select * from movies where duration < 2.0;

/*Consultar las películas que tengan duración diferente a 2 horas*/

select * from movies where duration <> 2.0;

/*Consultar las películas que tengan duración igual a 2 horas*/

select * from movies where duration = 2.0;

/*Consultar las películas que sean de comedy y que su productora sea netflix*/

select * from movies where moviegender = 'comedy' and studioname = 'netflix';

/*Consultar las películas que sean de comedy y las películas que sean de drama*/

select * from movies where moviegender = 'comedy' or moviegender = 'drama';

/*Lo importante es el criterio. */

/*Consultar las películas que sean de comedy y las películas que sean de drama*/

select * from movies where moviegender in ('comedy','drama');

/*Consultar las películas que sean de netflix o que sean de paramount*/

select * from movies where studioname in ('Netflix','Paramount');

/*Cambiar de nombre a un atributo en una tabla temporal*/

select title as Título,moviegender as Género,studioname as Estudio from movies;

select distinct studioname from movies;  

/*Contar cuantas películas son de netflix*/
select count(studioname) from movies where studioname = 'Netflix';

/*Contar cuantas películas duran menos de 2 horas*/

select count(duration) from movies where duration<2;

/* Cuánto es el promedio de las películas que tenemos*/

select avg(duration) from movies; 

/* Cuánto es el promedio de las películas que tenemos y que su duration sea mayor a 2*/

select avg(duration) from movies where duration>2;

/*Cuál es la suma del número total de horas para todas las películas*/

select sum(duration) from movies;

/*Agrupar por nombre del estudio las películas*/

select * from movies group by studioname; /*Comentar group by es una acción faltante*/

/*Group by: Agrupar un resultado de alguna condición 
medida - sum,avg o count a un atributo*/

/*Contar cuántas películas hay por estudio */

select count(title), studioname from movies where duration>1 group by studioname; 

