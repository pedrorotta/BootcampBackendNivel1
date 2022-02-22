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

/*Buscar 2 películas de comedia, 1 película de drama, y 2 péliculas producidas por Netflix, 
2 películas que duren 2 horas.*/



