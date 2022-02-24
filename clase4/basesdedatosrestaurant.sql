-- 1er paso: Crear esquema, eliminarlo y crearlo
drop schema if exists restaurant;
create schema restaurant;

-- 2 paso: Crear tablas que no tengan llaves foráneas. 

create table restaurant.Categoría(
	idCategoria int primary key auto_increment,
    Nombre varchar(45),
    Descripción varchar(100),
    Encargado varchar(25)
);

create table restaurant.Ingredientes(
	NombreIngrediente varchar(20) primary key,
    cantidadActual Float,
    unididad_de_medida varchar(10)
);

-- 3er paso, creamos la tabla con llaves foráneas

create table restaurant.plato(
	NombrePlato char(25) primary key,
    Foto Blob, 
	Descripción	varchar(70),
    Precio float,
    Elaboración varchar(200),
    Nivel int,
    Categoria_id int,
    foreign key(Categoria_id) references Categoría(idCategoria) on delete cascade-- con on delete cascade asumes la relación total. on delete set null - Parti. parcial. 
);

create table restaurant.plato_ingredientes(
	NombrePlato_id char(25),
    Ingrediente_Nombre varchar(25),
    cantidad_requerida float,
    primary key(NombrePlato_id,Ingrediente_Nombre),
    foreign key(NombrePlato_id) references plato(NombrePlato) on delete cascade,
    foreign key(Ingrediente_Nombre) references Ingredientes(NombreIngrediente) on delete cascade
);
