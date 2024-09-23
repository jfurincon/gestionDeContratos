CREATE database Tonline;
USE Tonline;

CREATE TABLE usuario (
idUsuarioFK int auto_increment primary key, 
nombreUsuario varchar (50), 
cargoUsuario varchar (50)
);

ALTER TABLE usuario CHANGE idUsuarioFK idUsuario int auto_increment;

CREATE TABLE producto (
idProducto int auto_increment unique,
codigoBarras varchar (100) primary key,
descripcionProducto varchar (100),
precioProductoFK int (50)
);

CREATE TABLE cliente (
idCliente int auto_increment primary key,
nombreCliente varchar (50),
telefonoCliente int (20),
direccionCliente varchar (50)
);

CREATE TABLE venta (
idUsuarioFK int (50), 
idClienteFK int (20),
idVentas int auto_increment unique,
numeroOrden int (100) primary key
);

CREATE TABLE producto_venta (
codigoBarrasFK varchar (100),
numeroOrdenFK int (100) primary key,
total int (50),
cantidad int (20)
);

ALTER TABLE venta
add constraint FKventaUsuario
foreign key (idUsuarioFK)
references Usuario(idUsuario);

ALTER TABLE venta
add constraint FKventaCliente
foreign key (idClienteFK)
references Cliente(idCliente);

ALTER TABLE producto_venta
add constraint FKproducto_ventaProducto
foreign key (codigoBarrasFK)
references Producto(codigoBarras);

ALTER TABLE producto_venta
add constraint FKproducto_ventaVenta
foreign key (numeroOrdenFK)
references Venta(numeroOrden);

DESCRIBE usuario;
INSERT INTO usuario VALUES ("","Paula","Gerente");
INSERT INTO usuario VALUES ("","Juan","DirectorAdministrativo");
INSERT INTO usuario VALUES ("","Laura","AuxAdministrativa");
INSERT INTO usuario VALUES ("","Mariana","AuxGerente");