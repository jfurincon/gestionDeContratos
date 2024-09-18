/*Lenguaje de definición de datos DDL SQL para definir y gestionar la estructura de DB
Create: Crear objetos en el DB
Alter: Modificar la estructura de los objetos creados
Drop: Eliminar objetos del DB
Truncate: Eliminar todos los datos de una tabla sin eliminar la tabla

Comandos de DDL

Create: Crear estructura de base de datos
*/

CREATE database dbBiblioteca;
USE dbBiblioteca;

# creacion de tablas
CREATE table libro(
idLibro varchar(10) primary key,
tituloLibro varchar(50) not null,
identificacionAutorKF varchar(10),
anioPublicacion year,
estadoLibro bool
);

CREATE table autor(
idAutor varchar(10) primary key,
nombre varchar(50),
fechaNacimiento date 
);

CREATE table prestamo(
codigoPrestamo varchar(10) primary key,
codigoLibroFK varchar(10),
idMiembroFK varchar(10),
fechaPrestamo date,
fechaDevolucion date,
estadoPrestamo bool
);

CREATE table miembro(
idMiembro varchar(10) primary key,
nombre varchar(50),
direccion varchar(50),
fechaInscripcion date,
estadoMiembro bool
);

#creacion de relaciones (alteraciones)
ALTER TABLE libro
# alter table para modificar la estructura de una tabla.
ADD CONSTRAINT FKAutorLibro 
# add constraint es añadir una regla a una tabla. 
FOREIGN KEY (identificacionAutorKF)
# en foreign key va el atributo del la tabla alterada.
REFERENCES Autor(idAutor);
# en references va de donde proviene esa FK

ALTER TABLE prestamo
ADD CONSTRAINT FKPrestamoLibro
FOREIGN KEY (codigoLibroFK)
REFERENCES libro(idLibro);

ALTER TABLE prestamo
ADD CONSTRAINT FKPrestamoMiembro
FOREIGN KEY (idMiembroFK)
REFERENCES miembro(idMiembro);

# modificar nombre de columna
ALTER TABLE autor
RENAME COLUMN fechaNacimiento
TO fechaNacimientoAutor;

/*
tambien se puede utilizar change column, eliminando
la sentencia TO

usando solo RENAME puedo cambiar el nombre de la tabla
sin la sentencia TO
*/

# modificar tipo de dato
ALTER TABLE prestamo
MODIFY COLUMN fechaPrestamo datetime;

# agregar restricciones
ALTER TABLE prestamo
MODIFY COLUMN fechaDevolucion date NOT NULL;

/*
Para poder eliminar restricciones de FK o PK, etc
ALTER TABLE prestamo
DROP CONSTRAINT

para eliminar una columna solo pongo
DROP nombreColumna
*/ 

ALTER TABLE autor
MODIFY email varchar(50);



