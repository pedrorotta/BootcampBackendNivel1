/*Algebra relacional: Algortimos y métodos por el cuál se puede computar paso a paso una consulta
para relaciones entre tablas y atributos de bases de datos. 
*/

-- Seleccionar todos los datos y atributos de la tabla conductores

SELECT * FROM databasesbuses.conductor;

/*Wildcarts: Caracteres especiales que me permiten relaciones más precisas. 
 
 % => cualquier número de caracteres, antes o después de la búsqueda. 
 _ / hyphen => representa a un caracter en cualquier espacio o lugar de la búsqueda. 
 LIKE: palabra reservada que permite la búsqueda por medio wildcarts. 

*/
-- Filtrar por caracteres para encontrar un nombre como conductor

Select * from databasesbuses.conductor where nombre LIKE 'car%';

-- Filtar todos los apellidos que comienzan con Fon

Select * from databasesbuses.conductor where nombre like '%font%';


-- Encontrar salarios 

Select * from databasesbuses.conductor where salario like '19__';


insert into databasesbuses.conductor value(
	'75321000', 'Mark Robles', '955214569', 'Urb. Robles',
    'Lima', 1900, 'Lima', 'mark.robles@email.com'
);

Select * from databasesbuses.conductor where nombre like 'Mar%';
Select * from databasesbuses.conductor where nombre like 'Mar________';

Select * from databasesbuses.conductor where nombre like 'Mar__ %';



/*
Union: Es una palabra reservada que se usa para generar listas de acuerdo con 1 o más tablas. 
Dentro de la sintaxis se debe considerar:
	. En ambas tablas llamadas, exista el mismo número de columnas. 
	. En ambas tablas llamadas exista el mismo datatype preferiblemente. 
*/

-- realizar una lista con los nombres de los conductores y con los nombres de las ciudades de la base de datos. 

select * from databasesbuses.conductor;

select * from databasesbuses.provincia;

select nombre as ListaNombresyCiudes from databasesbuses.conductor
union 
select NombreProvincia from databasesbuses.provincia;



/*Joins
 Dadas 2 entidades, relacionadas por un atributo - llave foránea, la palabra reservada JOIN permite
 unir a ambas entidades en un atributo común, permitiendo devolver una tabla específica.
	La primera entidad es la entidad del lado izquierdo y la que va unida al join
    es la entidad del lado derecho.
    left join trae todos los datos de la tabla izquierda
    right join trae todos los datos de la tabla derecha

*/	
select * from databasesbuses.conductor;
select * from databasesbuses.paquetes;

-- Consultar la descripción de los paquetes junto a el nombre, el DNI. 

select databasesbuses.conductor.DNI, 
databasesbuses.conductor.Nombre, 
databasesbuses.paquetes.Descripción
from databasesbuses.conductor 
join databasesbuses.paquetes
on databasesbuses.conductor.DNI = databasesbuses.paquetes.Conductor_DNI;

select * from databasesbuses.conductor_has_buses;

-- Solicitar el nombre del conductor con sus viajes.

select databasesbuses.conductor.Nombre,
databasesbuses.conductor_has_buses.Buses_Matrícula,
databasesbuses.conductor_has_buses.fecha 
from databasesbuses.conductor 
join databasesbuses.conductor_has_buses
on databasesbuses.conductor.DNI = databasesbuses.conductor_has_buses.Conductor_DNI;

-- Solicitar el nombre de todos los conductores incluyendo los que no tienen viajes: 
select databasesbuses.conductor.Nombre,
databasesbuses.conductor_has_buses.Buses_Matrícula,
databasesbuses.conductor_has_buses.fecha
from databasesbuses.conductor
left join databasesbuses.conductor_has_buses
on databasesbuses.conductor.DNI = databasesbuses.conductor_has_buses.Conductor_DNI;

-- Solicitar el nombre de todos los conductores y sus viajes, incluyendo los buses que aún no han sido conducidos: 
select databasesbuses.conductor.Nombre,
databasesbuses.conductor_has_buses.Buses_Matrícula,
databasesbuses.conductor_has_buses.fecha
from databasesbuses.conductor
right join databasesbuses.conductor_has_buses
on databasesbuses.conductor.DNI = databasesbuses.conductor_has_buses.Conductor_DNI;


/*Consultas indexadas
Parte de la necesidad de realizar consultas más complejas. La idea es que se pueda indexar, como una consulta
adicional B, dentro de otra consulta A para generar un resultado mucho más exacto, que no se podría realizar 
con solo la consulta A. 
*/

select * from databasesbuses.buses;

-- Quiero sabes los nombres de los conductores que han llevado los mercedes. 

select databasesbuses.conductor.Nombre,
databasesbuses.conductor_has_buses.Buses_Matrícula,
databasesbuses.conductor_has_buses.fecha 
from databasesbuses.conductor 
join databasesbuses.conductor_has_buses
on databasesbuses.conductor.DNI = databasesbuses.conductor_has_buses.Conductor_DNI;

select databasesbuses.buses.Matrícula,databasesbuses.buses.Modelo from databasesbuses.buses 
where databasesbuses.buses.Modelo = 'Mercedes';

select tabla_join_nombre.nombre_conductor,tabla_join_nombre.Buses_Matrícula,tabla_join_2.Modelo from (
select databasesbuses.conductor.Nombre as nombre_conductor,
databasesbuses.conductor_has_buses.Buses_Matrícula,
databasesbuses.conductor_has_buses.fecha 
from databasesbuses.conductor 
join databasesbuses.conductor_has_buses
on databasesbuses.conductor.DNI = databasesbuses.conductor_has_buses.Conductor_DNI) as tabla_join_nombre
join (select databasesbuses.buses.Matrícula,databasesbuses.buses.Modelo  from databasesbuses.buses 
where databasesbuses.buses.Modelo = 'Mercedes') as tabla_join_2
on tabla_join_nombre.Buses_Matrícula = tabla_join_2.Matrícula;


-- calcular los promedios de las matrículas de los autos conducidos. 

select avg(Buses_Matrícula),Conductor_DNI from databasesbuses.conductor_has_buses group by Conductor_DNI;

select avg(Buses_Matrícula),Nombre from 
(
select databasesbuses.conductor.Nombre,
databasesbuses.conductor_has_buses.Buses_Matrícula,
databasesbuses.conductor_has_buses.fecha 
from databasesbuses.conductor 
join databasesbuses.conductor_has_buses
on databasesbuses.conductor.DNI = databasesbuses.conductor_has_buses.Conductor_DNI
) as tabla_join
group by Nombre;

















