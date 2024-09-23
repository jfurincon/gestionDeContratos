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
CREATE TABLE venta( #numeroOrdenPK, idVenta autoincrement
numeroOrden int(255) primary key,
idVenta int(255),
idUsuarioFK int(10),
idClienteFK int(100)
);

DROP TABLE productoVenta;
CREATE TABLE productoVenta( #codigoDeBarrasFK, numeroOrdenFK
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




#promedio ventas

# sumatoria total ventas

# cantidad de clientes

# venta mas economica hecha