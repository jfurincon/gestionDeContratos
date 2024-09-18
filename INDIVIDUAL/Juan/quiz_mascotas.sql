# punto1. crear base de datos
CREATE DATABASE mascotas;
USE mascotas;

# punto2. crear las tablas
CREATE TABLE cliente(
cedulaCliente int(11) primary key,
nombreCliente varchar(15),
apellidoCliente varchar(15),
direccionCliente varchar(10),
telefono int(10),
idMascotaFK int(11)
);

CREATE TABLE producto(
codigoProducto int(11) primary key,
nombreProducto varchar(11),
marca varchar(15),
precio float,
cedulaClienteFK int(11)
);

CREATE TABLE mascota(
idMascota int(11) primary key,
nombreMascota varchar(15),
generoMascota varchar(15),
razaMascota varchar(15),
cantidad int(10)
);

CREATE TABLE vacuna(
codigoVacuna int(11) primary key,
nombreVacuna varchar(15),
dosisVacuna int(10),
enfermedad varchar(15)
);

CREATE TABLE mascota_vacuna(
codigoVacunaFK int(11) not null,
idMascotaFK int(11) not null,
enfermedad varchar(15)
);

# punto3. relacionar las tablas segun modelo
ALTER TABLE producto
ADD CONSTRAINT FKProductoCliente
FOREIGN KEY (cedulaClienteFK)
REFERENCES cliente(cedulaCliente);

ALTER TABLE cliente
ADD CONSTRAINT FKClienteMascota
FOREIGN KEY (idMascotaFK)
REFERENCES mascota(idMascota);

ALTER TABLE mascota_vacuna
ADD CONSTRAINT FKMascota_vacunaMascota
FOREIGN KEY (idMascotaFK)
REFERENCES mascota(idMascota);

ALTER TABLE mascota_vacuna
ADD CONSTRAINT FKMascota_vacunaVacuna
FOREIGN KEY (codigoVacunaFK)
REFERENCES vacuna(codigoVacuna);

# punto4. agregar campo en producto que se llame cantidad int obligatorio
ALTER TABLE producto
ADD COLUMN cantidad int not null;

# punto5. cambiar nombre en mascota cantidad por cantidad mascota
ALTER TABLE mascota
RENAME COLUMN cantidad
TO cantidadMascota;

# punto6. cambiar nombe de tabla de mascota_vacuna por detalleVacuna
ALTER TABLE mascota_vacuna
RENAME detalleVacuna;

/*
Sentencias de consulta {General y específica (multitabla, subconsultas)},
registros, modificaciones, eliminaciones, triggers y vistas.
Para las CRUD
 - en create utilizamos INSERT INTO tabla values(valor)
 - en read utilizamos SELECT (* para consultar cualquiera) FROM tabla 
 - en update utilizamos UPDATE
 - en delete utilizamos DELETE
*/

describe mascota;
INSERT INTO mascota values(1,"Trufa","F","Pastor Australiano",1);
INSERT INTO mascota values(2, "Mauricio","M","Calico",1),(3,"Machini","M","Shih-Tzu",1);
# jugando con valores null
INSERT INTO mascota values(4,"","","","");
SELECT * FROM mascota;

# se deben iniciar a hacer registros en tablas que no tienen llaves foráneas

INSERT INTO vacuna values(1,"Parvirosis",2,"Parvirosis");
INSERT INTO vacuna values(2,"Rabia",1,"Rabia");

describe cliente;
INSERT INTO cliente values(1000273164,"Juan Felipe","Urrego","Calle 163","3505950549",1);
# aqui telefono es int, pero lo introducimos como un varchar, además es un int(10)
SELECT * FROM cliente;

describe producto;
INSERT INTO producto values(1,"Cepillo Largo","DogClean",6000,1000273164,1),(2,"Croqueta XL","DogFood",8000,1000273164,2);
SELECT * FROM producto;

describe detallevacuna;
INSERT INTO detallevacuna values(1,1,"Parvirosis");
INSERT INTO detallevacuna values(2,1,"Rabia");
SELECT * FROM detallevacuna;

