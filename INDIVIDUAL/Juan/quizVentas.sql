CREATE DATABASE ventas;
USE ventas;

#usuario, producto, cliente, venta

# cliente puede generar muchas ordenes
# un usuario puede generar muchas ordenes
# un cliente puede comprar muchos productos, por medio de venta
# una orden puede tener muchos productos (venta/orden n a m) entidad debil

CREATE TABLE usuario(
idUsuario int(100) primary key auto_increment,
nombreUsuario varchar(100) not null
);

DROP TABLE producto;
CREATE TABLE producto(
idProducto int(255), # autoincrement, codigo de barrasPK
codigoBarras int(100) primary key auto_increment,
nombreProducto varchar(100),
precioProducto int(100)
);

DROP TABLE cliente;
CREATE TABLE cliente(
idCliente int(100) primary key auto_increment, # autoincrement
nombreCliente varchar(100) not null,
cedulaCliente int(100)
);

DROP TABLE venta;
CREATE TABLE venta( # fecha,subtotal(precioventa),cantidad
numeroOrden int(255) primary key,
idVenta int(255),
idUsuarioFK int(10),
idClienteFK int(100)
);

use ventas;
ALTER TABLE venta
ADD COLUMN fechaVenta date;

ALTER TABLE venta
ADD COLUMN subtotal int(15);

describe venta;

DROP TABLE productoVenta;
CREATE TABLE productoVenta(
codigoBarrasFK int(100) not null,
numeroOrdenFK int(255) not null,
cantidad int(255),
total int(255)
);

ALTER TABLE venta
ADD CONSTRAINT FKVentaUsuario
FOREIGN KEY (idUsuarioFK)
REFERENCES usuario(idUsuario);

ALTER TABLE venta
ADD CONSTRAINT FKVentaCliente
FOREIGN KEY (idClienteFK)
REFERENCES cliente(idCliente);

ALTER TABLE productoVenta
ADD CONSTRAINT FKproductoVentaCodigoBarras
FOREIGN KEY (codigoBarrasFK)
REFERENCES producto(codigoBarras);

ALTER TABLE productoVenta
ADD CONSTRAINT FKproductoVentaNumeroOrden
FOREIGN KEY (numeroOrdenFK)
REFERENCES venta(numeroOrden);

# inserciones
describe cliente;
INSERT INTO cliente values("","Juanito",1000273164),("","Sofia",1000273414),("","Andrea",1003473164),("","Daniel",1000288233);

describe usuario;
INSERT INTO usuario values("","Usuario1"),("","Usuario2"),("","Usuario3"),("","Usuario4");

describe producto;
INSERT INTO producto values(1,191817,"Shampoo J&J",12000),(2,191818,"Shampoo Old Spice",15000),(3,191819,"Shampoo H&S",12500);

describe venta;
INSERT INTO venta values(1,122,1,1);
INSERT INTO venta values(2,1223,2,2),(3,1224,3,3);
INSERT INTO venta
values(4,001,1,1,"27/09/2024",10000);
SELECT * FROM venta;

describe productoventa;
INSERT INTO productoventa values(191817);



use ventas;

#promedio ventas



# sumatoria total ventas
#SELECT sum(precio) FROM producto;
# cantidad de clientes
#SELECT count(idCliente) FROM cliente;
# venta mas economica hecha
#SELECT min(precio) FROM producto;

SELECT * FROM venta INNER JOIN cliente ON venta.idClienteFK=cliente.idCliente;

# consultar el cliente de la maxima venta hecha
SELECT venta.idClienteFK, productoventa.total, cliente.nombreCliente, cliente.idCliente
FROM venta
INNER JOIN cliente ON cliente.idCliente = venta.idClienteFK
INNER JOIN productoventa ON productoventa.idOrdenFK = venta.idOrden
WHERE total=max(total); 

# consultar usuario y cliente de una venta
#SELECT venta.idUsuarioFK, venta.idClienteFK, cliente.nombreCliente, cliente.idCliente
#FROM
SELECT usuario.nombreUsuario, cliente.nombreCliente, v.numeroOrden 
FROM venta v 
JOIN usuario u ON v.idUsuarioFK = u.idUsuario 
JOIN cliente c ON v.idClienteFK = c.idCliente 
WHERE v.numeroOrden = 1004;

# consultar los productos que compró un cliente específico
SELECT p.descripcionProducto, pv.cantidad, pv.total
FROM producto_venta pv 
JOIN venta v ON pv.numeroOrdenFK = v.numeroOrden 
JOIN producto p ON pv.codigoBarrasFK = p.codigoBarras
WHERE v.idClienteFK = 2; 
 
# consultar todos los clientes que han hecho una orden
SELECT c.nombreCliente 
FROM cliente c 
JOIN venta v ON c.idCliente = v.idClienteFK 
GROUP BY c.idCliente, c.nombreCliente;

# MODIFICACIONES (registros)
/*
UPDATE tabla
SET campo= x
WHERE campo2 = y;
*/

describe cliente;
describe usuario;
describe producto;
describe venta;
describe productoventa;
#registrar a tatiana, registrar ropa para bebés, registrarme como usuario. Generar una venta para tatiana (nus como us, y producto de bebes)
INSERT INTO cliente values('',"Tatiana Cabrera",543544446);
INSERT INTO usuario values('',"Juan Felipe Admin");
INSERT INTO producto values(1112,'',"Arruru Bebes",8000);
INSERT INTO venta values(12,12,"Juan Felipe Admin","Tatiana Cabrera","27/09/2024",8000);
INSERT INTO venta values(13,13,5,5,"2024/09/27", 16000);
INSERT INTO productoventa values(191820, 13, 2, 16000);

UPDATE venta SET idVenta = 20240927 WHERE numeroOrden =  13;
# creacion de nuevos campos en cliente
ALTER TABLE cliente
ADD COLUMN apellido varchar(100);

ALTER TABLE cliente
ADD COLUMN direccion varchar(100);

UPDATE cliente SET apellido = "Cabrera" WHERE idCliente = 5;
UPDATE cliente SET nombreCliente = "Tatiana" WHERE idCliente = 5;
UPDATE cliente SET direccion = "CALLE 104 #13-14" WHERE idCliente = 5;

SELECT * FROM producto;
SELECT * FROM venta;
SELECT * FROM usuario;
SELECT * FROM cliente;

# se intenta cambiar el idCliente
UPDATE cliente SET idCliente = 55163118 WHERE idCliente = 5;
# creo nuevo cliente con los datos buenos
describe cliente;
INSERT INTO cliente values(55163118, "Tatiana",54356674,"Cabrera","Calle 116 #14-13");
# para eliminar el cliente antiguo debo modificar la relacion con venta
UPDATE venta SET idClienteFK = 55163118 WHERE numeroOrden = 13;
# y ahora que ya no hay relacion con el id anterior, se puede eliminar el cliente viejo
DELETE FROM cliente WHERE idCliente = 5;


# delete from lala where lala = x

# PROCEDIMIENTOS ALMACENADOS, SUBCONSULTAS, Y VISTAS.
use ventas;
/*Los procedimientos almacenados nos ayudan a crear subrutinas
de consulta. 
Estructura:

DELIMITER//
CREATE PROCEDURE nombreProcedimiento(parametros)
BEGIN
--Lógica de la sentencia que se quiera utilizar
END//
DELIMITER;

*/

# crear un procedimiento para haceer registros de usuarios
DELIMITER //
CREATE PROCEDURE registrarProductos(id int(255),codigoBarras int(100),nombre varchar(100),precio int(100))
BEGIN
INSERT INTO producto values(id,codigoBarras,nombre,precio);
END//
DELIMITER ;
describe producto;

# utilizar el procedimiento
CALL registrarProductos(6667,'',"Crema Colgate Carbon",23000);
# tambien se pueden eliminar los procedimientos con 
# DROP PROCEDURE nombreProcedimiento

/*Las vistas se utilizan en contextos de consultas muy complejas
CREATE VIEW nombreVista 
SELECT whawha FROM lala

y luego para ver la vista
SELECT aja FROM nombreVista
*/

use ventas;
describe cliente;
SELECT * FROM cliente;

ALTER TABLE cliente
ADD COLUMN estado boolean;

# procedimiento para inactivar cliente
DELIMITER //
CREATE PROCEDURE inactivarCliente(id int(100))
BEGIN
UPDATE cliente
SET estado = 0
WHERE idCliente = id;
END//
DELIMITER ;

CALL inactivarCliente(2);

# procedimiento para consultar productos que ha comprado un cliente
describe venta;
describe productoventa;
describe producto;
SELECT * FROM productoventa;
SELECT * FROM venta;
SELECT * FROM producto;

/*
Para esto debemos mirar la venta asociada al id del cliente
luego mirar el codigo de barras (producto) que se encuentra en esa venta
esto se logra por medio de la tabla débil
*/

DELIMITER //
CREATE PROCEDURE consultarProductoCliente(id int(255))
BEGIN
SELECT p.nombreProducto
FROM cliente c
INNER JOIN venta v ON c.idCliente = v.idClienteFK
INNER JOIN productoventa pv ON v.numeroOrden = pv.numeroOrdenFK
INNER JOIN producto p ON pv.codigoBarrasFK = p.codigoBarras
WHERE c.idCliente = id;
END//
DELIMITER ;

CALL consultarProductoCliente(55163118);

# Procedimiento para modificar fecha de nacimiento de un cliente
describe cliente;
SELECT * FROM cliente;

ALTER TABLE cliente
ADD COLUMN fechaNacimiento date;

DELIMITER //
CREATE PROCEDURE nuevaFechaNac(id int(255), fecha varchar(255))
BEGIN
UPDATE cliente
SET fechaNacimiento = fecha
WHERE idCliente = id; 
END//
DELIMITER ;

CALL nuevaFechaNac(1,"2002/09/05");

# vista que me consulte que cliente compró un producto y cual fue su # de orden
CREATE VIEW productoCliente AS
SELECT c.nombreCliente, p.nombreProducto, v.numeroOrden, p.codigoBarras
FROM cliente c
INNER JOIN venta v ON c.idCliente = v.idClienteFK
INNER JOIN productoventa pv ON pv.numeroOrdenFK = v.numeroOrden
INNER JOIN producto p ON p.codigoBarras = pv.codigoBarrasFK;

SELECT * FROM productoCliente
WHERE codigoBarras = 191820;

# vista que me muestre el cliente que mas compras haya hecho

/*
SUBCONSULTAS: una consulta dentro de una consulta. 

SELECT campox, campoy, campoz
FROM tabla
WHERE campox = (SELECT columna2x FROM tablainicial WHERE condicion);
*/

# Consultar los datos de los empleados y su sueldo promedio
/*
SELECT idEmpleado, nombreEmpleado, salario, (SELECT avg(salario) FROM empleado) AS promedio
FROM empleado;
*/

# consultar el empleado que tenga un salario mayor que el salario promedio
/*
SELECT idEmpleado, nombreEmpleado, salario
FROM empleado
WHERE salario > (SELECT avg(salario) FROM empleado)
*/

# consultar a que area pertenece un empleado
/*
SELECT idEmpleado, nombreEmpleado, idArea, nombreArea
FROM empleado
WHERE idArea in (SELECT idArea FROM area WHERE nombreEmpleado="Tatiana")
*/

use ventas;

describe producto;
# mostrar los productos que se vendan a un precio mayor del promedio de todos los productos
SELECT nombreProducto, precioProducto
FROM producto
WHERE precioProducto > (SELECT avg(precioProducto) FROM producto);

describe venta;
describe cliente;
# mostrar los clientes que el total de compra sea mayor al promedio de compras de la tienda
SELECT nombreCliente, apellido, idCliente
FROM cliente
WHERE idCliente in (SELECT idCliente FROM venta WHERE subtotal > (SELECT avg(subtotal) FROM venta));

# mostrar el promedio de precios de productos comprados por clientes
SELECT

