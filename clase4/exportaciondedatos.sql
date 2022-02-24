select * from databasesbuses.conductor;
load data infile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/conductores.csv' 
into table databasesbuses.conductor fields terminated by ',' 	lines terminated by '\n'
ignore 1 rows;

show variables like 'secure_file_priv';

load data infile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/buses.csv' 
into table databasesbuses.buses fields terminated by ',' 	lines terminated by '\n'
ignore 1 rows;

select * from databasesbuses.buses;

load data infile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/ciudades.csv' 
into table databasesbuses.provincia fields terminated by ',' 	lines terminated by '\n'
ignore 1 rows;

select * from databasesbuses.provincia;


load data infile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/paquetes.csv' 
into table databasesbuses.paquetes fields terminated by ',' 	lines terminated by '\n'
ignore 1 rows;


load data infile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/viajes.csv' 
into table databasesbuses.conductor_has_buses fields terminated by ',' 	lines terminated by '\n'
ignore 1 rows;

select * from databasesbuses.buses;