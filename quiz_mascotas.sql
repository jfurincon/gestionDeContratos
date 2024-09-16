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


