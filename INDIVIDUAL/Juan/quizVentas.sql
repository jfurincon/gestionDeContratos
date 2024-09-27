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

SELECT * FROM producto;
SELECT * FROM venta;
SELECT * FROM usuario;
SELECT * FROM cliente;
# numero de orden 20240927
