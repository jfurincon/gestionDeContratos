/* Triggers
CREATE TRIGGER nombre_del_trigger
{before|after){insert|select|update|delete}
on nombre_tabla (donde se va a aplicar el trigger)
for each row 
begin
--Instrucciones de sql
end;
*/

/*Variables old y new (acceder a registros)
New: al nuevo valor que se va a insertar o modificar
Old: El valor anterior 
*/

/*Ejemplo:
CREATE TRIGGER validar_precio 
after insert on producto
for each row 
begin
	if new.precio <0 then
		signal sqlstate '45000'
		set message_text = 'El precio es incorrecto';
	end if;
end;
*/

/*
CREATE TRIGGER registrar_cambio
after update on empleado
for each row 
begin 
	insert inro historial_cambios values (old.id,old.nombre,new.nombre, now ())
end;
*/

/*
Delimiter $$
CREATE TRIGGER registro_papelera
before delete on usuario
for each row 
begin 
	insert inro usuariosEliminados values (old.id, old.nombre, old.apellido, now());
end;
$$
Delimiter;
*/


