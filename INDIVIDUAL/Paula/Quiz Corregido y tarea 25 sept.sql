CREATE database Sonline;
USE Sonline;

CREATE TABLE usuario (
idUsuario int auto_increment primary key, 
nombreUsuario varchar (50), 
cargoUsuario varchar (50)
);

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
idUsuarioFK int, 
idClienteFK int,
idVentas int auto_increment unique,
numeroOrden int primary key
);

CREATE TABLE producto_venta (
codigoBarrasFK varchar (100),
numeroOrdenFK int primary key,
total int (50),
cantidad int
);

ALTER TABLE venta
add constraint FKventaUsuario
foreign key (idUsuarioFK)
references usuario(idUsuario);


ALTER TABLE venta
add constraint FKventaCliente
foreign key (idClienteFK)
references cliente(idCliente);

ALTER TABLE producto_venta
add constraint FKproducto_ventaProducto
foreign key (codigoBarrasFK)
references producto(codigoBarras);

ALTER TABLE producto_venta
add constraint FKproducto_ventaVenta
foreign key (numeroOrdenFK)
references venta(numeroOrden);

INSERT INTO usuario VALUES ("","Paula Gonzalez","Gerente");
INSERT INTO usuario VALUES ("","Juan Gomez","DirectorAdministrativo");
INSERT INTO usuario VALUES ("","Laura Soto","AuxAdministrativa");
INSERT INTO usuario VALUES ("","Mariana Leon","AuxGerente");
INSERT INTO usuario VALUES ("","Pedro Ramirez","Gerente");

INSERT INTO cliente (idCliente, nombreCliente, telefonoCliente, direccionCliente) VALUES 
("",'Cliente A', '5551234567', 'Calle 1, Ciudad A'), 
("",'Cliente B', '5552345678', 'Calle 2, Ciudad B'), 
("",'Cliente C', '5553456789', 'Calle 3, Ciudad C'), 
("",'Cliente D', '5554567890', 'Calle 4, Ciudad D'), 
("",'Cliente E', '5555678901', 'Calle 5, Ciudad E');

INSERT INTO venta (idUsuarioFK, idClienteFK,idVentas, numeroOrden) VALUES 
(1, 1, "",1001), 
(2, 2, "",1002), 
(3, 3, "",1003),
(1, 4, "", 1004),
(2, 5, "",1005);

INSERT INTO producto (codigoBarras, descripcionProducto, precioProductoFK) VALUES
('1234567890123', 'Producto A', 11100),
('2345678901234', 'Producto B', 25000),
('3456789012345', 'Producto C', 9500),
('4567890123456', 'Producto D', 3500),
('5678901234567', 'Producto E', 100000);


INSERT INTO producto_venta (codigoBarrasFK, numeroOrdenFK, total, cantidad) VALUES
('1234567890123', 1001, 11100, 1), 
('2345678901234', 1002, 50000, 2), 
('3456789012345', 1003, 9500, 3), 
('4567890123456', 1004, 3500, 1), 
('5678901234567', 1005, 100000, 1);



/*Consultar el cliente de la maxima venta hecha*/

SELECT c.nombreCliente, v.numeroOrden, pv.total 
FROM cliente c JOIN venta v ON c.idCliente = v.idClienteFK 
JOIN producto_venta pv ON v.numeroOrden = pv.numeroOrdenFK 
WHERE pv.total = ( SELECT MAX(total) FROM producto_venta );

/*Consultar usuario y ciente de una venta especifica*/

SELECT u.nombreUsuario, c.nombreCliente, v.numeroOrden 
FROM venta v 
JOIN usuario u ON v.idUsuarioFK = u.idUsuario 
JOIN cliente c ON v.idClienteFK = c.idCliente 
WHERE v.numeroOrden = 1004;

/*Consultar los productos que compro un cliente en especifico*/

SELECT p.descripcionProducto, pv.cantidad, pv.total
 FROM producto_venta pv 
JOIN venta v ON pv.numeroOrdenFK = v.numeroOrden 
JOIN producto p ON pv.codigoBarrasFK = p.codigoBarras
 WHERE v.idClienteFK = 2;  

/*Consultar todos los clients que han hecho compras*/

SELECT c.nombreCliente 
FROM cliente c 
JOIN venta v ON c.idCliente = v.idClienteFK 
GROUP BY c.idCliente, c.nombreCliente;
