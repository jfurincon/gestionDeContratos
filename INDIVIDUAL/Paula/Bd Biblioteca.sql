CREATE database biblioteca;
USE biblioteca;

CREATE TABLE libro(
idLibro varchar (20) primary key,
tituloLibro varchar (50) not null,
idAutorFK varchar(50),
anioPulicacion year not null,
estadoLibro bool   
);

CREATE TABLE autor(
idAutor varchar (50) primary key,
nombreAutor varchar (50) not null,
fechaNacimiento date
);

CREATE TABLE miembro(
idMiembro int primary key,
nombreMiembro varchar (20) not null,
direccionMiembro varchar (50),
fechaInscripcion date not null,
estadoMiembro bool 
);

CREATE TABLE prestamo(
idPrestamo int primary key,
idLibroFK varchar (20),
idMiembroFK int not null,
fechaPrestamo date not null,
fechaDevolucion date not null,
estadoPrestamo bool 
);

(se crea la relacion entre la tabla libro y autor)
ALTER TABLE libro
add constraint FKautorlibro
foreign key (idAutorFK)
references Autor(idAutor);

(se modifica el tipo de dato y se le quita la restriccion)
ALTER TABLE prestamo
MODIFY fechaDevolucion datetime DEFAULT NULL;

(se cambia el nombre de la columna)

ALTER TABLE autor
CHANGE fechaNacimiento fechaNacimientoAutor DATE;
