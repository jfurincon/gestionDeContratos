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

/*CONSULTAS MULTITABLA*/
SELF JOIN - TODA LA UNIO DE LA TABLA
RIGHT JOIN - TODO LO QUE PERTENECE AL CONUNTO B PERO QUE COMPARTE CON A
FULL JOIN - TODO LO DE AMBOS CONJUNTOS
INNER JOIN - LO QUE AMBOS TIENEN
CROSS JOIN - FUNCION SOBREYECTIVA
LEFT JOIN - TODO LO QUE PERTENECE AL CONJUNTO A QUE COMPARTE CON B 

SELECT CAMPO1 FROM TABLA1 INNER JOIN TABLA2 ON CAMPO1;

SELECT * FROM VENTA INNER JOIN cliente ON venta.idClienteFK = cliente.idCliente;

SELECT mascota.*, cliente.nombreCliente FROM mascota INNER JOIN cliente ON mascota.idMascota = cliente.idMascotaFK;

SELECT m.*, c.nombreCliente
FROM Mascota m
JOIN cliente c ON m.idMascota = c.idMascotaFK
JOIN producto p ON p.cedulaClienteFK = c.cedulaCliente;

/*Consultar el cliente de la maxima venta hecha*/
/*Consultar usuario y ciente de una venta especifica*/
/*Consultar los productos que compro un cliente en especifico*/
/*Consultar todos los clients que han hecho compras*/

SELECT c.idCliente, c.nombreCliente, venta.idClienteFK, producto_venta.total
FROM venta
INNER JOIN cliente C on c.idCliente = venta.idClienteFK
INNER JOIN producto_venta ON producto_venta.idVentaFK = venta.idVenta
WHERE total = MAX(total)


 