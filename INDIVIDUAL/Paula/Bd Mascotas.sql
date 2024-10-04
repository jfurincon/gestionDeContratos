CREATE database mascotasp;
USE mascotasp;

CREATE TABLE producto(
codigoProducto int (11) primary key,
nombreProducto varchar (15),
marca varchar (15),
precio float,
cedulaClienteFK int (11) not null
);

CREATE TABLE cliente(
cedulaCliente int (11) primary key,
nombreCliente varchar (15),
apellidoCliente varchar (15),
direccionCliente varchar (10),
telefono int (10),
idMascotaFK int (11) not null
);

CREATE TABLE vacuna(
codigoVacuna int (11) primary key,
nombreVacuna varchar (15),
dosisVacuna int (10),
enfermedad varchar (15)
);

CREATE TABLE mascota(
idMascota int (11) primary key,
nombreMascota varchar (15),
generoMascota varchar (15),
razaMascota varchar (15),
cantidad int (10)
);

CREATE TABLE mascota_vacuna(
codigoVacunaFK int (11) not null,
idMascotaFK int(11) not null,
enfermedad varchar (15)
);

ALTER TABLE cliente
add constraint FKclienteMascota
foreign key (idMascotaFK)
references Mascota(idMascota);

ALTER TABLE producto
add constraint FKproductoCliente
foreign key (cedulaClienteFK)
references Cliente(cedulaCliente);

ALTER TABLE mascota_vacuna
add constraint FKmascota_vacunaMascota
foreign key (idMascotaFK)
references Mascota(idMascota);

ALTER TABLE mascota_vacuna
add constraint FKmascota_vacunaVacuna
foreign key (codigoVacunaFK)
references Vacuna(codigoVacuna);

/*PUNTO 4*/
ALTER TABLE producto ADD cantidad int not null;

/*PUNTO 5*/
ALTER TABLE mascota CHANGE cantidad cantidadMascota INT;

/*PUNTO 6*/
ALTER TABLE mascota_vacuna RENAME TO detalleVacuna;

DESCRIBE MASCOTA;
INSERT INTO MASCOTA VALUES(1,"Dante","F","Shitzu",1);
INSERT INTO MASCOTA VALUES(2,"Max","M","Criollo",1);
INSERT INTO MASCOTA VALUES(3,"MICHIGO","F","Shitzu",1);
INSERT INTO MASCOTA VALUES(4,'','','','');

DESCRIBE PRODUCTO;
INSERT INTO PRODUCTO VALUES(1,"SHAMPOO","PETS",10500,1013108031,2);
INSERT INTO PRODUCTO VALUES(2,"JABON","PETS",20500,987654321,5);

DESCRIBE VACUNA;
INSERT INTO VACUNA VALUES(1234,"RABIA",1,"RABIA");
INSERT INTO VACUNA VALUES(5678,"VARICELA",2,"VARICELA");

DESCRIBE CLIENTE;
INSERT INTO CLIENTE VALUES(1013108031,"PAULA","GONZALEZ","CALLE6#1437SUR",3128991399,1);
INSERT INTO CLIENTE VALUES(987654321,"LAURA","GOMEZ","CALLE2ASUR#56",123456789,3);

DESCRIBE DETALLEVACUNA;
INSERT INTO DETALLEVACUNA VALUES(1234,1,"RABIA");
INSERT INTO DETALLEVACUNA VALUES(5678,2,"VARICELA");
