--drop table historialjugadorpartido;
create table historialjugadorpartido (
	id_historial   serial NOT NULL,
	GolesAntiguo integer NOT NULL,
	GolesNuevo integer NOT NULL,
	usuarioModif  varchar(100) NOT NULL,
	horaModif time NOT NULL,
	fechaModif date NOT NULL);

--drop table historialBorradoJugador;
create table historialBorradoJugadorPartido (
	id_historial   serial NOT NULL,
	nombreJugadorAntiguo varchar(20) NOT NULL,
	GolesAntiguo integer NOT NULL,
	usuarioModif  varchar(100) NOT NULL,
	horaModif time NOT NULL,
	fechaModif date NOT NULL);
	
--drop table historialIngresoJugadorPartido;
create table historialIngresoJugadorPartido (
	id_historial   serial NOT NULL,
	nombreJugadorRegistrado varchar(20) NOT NULL,
	GolesNuevo integer NOT NULL,
	usuarioRegistro  varchar(100) NOT NULL,
	horaModif time NOT NULL,
	fechaModif date NOT NULL);
	
--------
create function historial_jugador_partido()
RETURNS trigger
AS $$
BEGIN
	IF (TG_OP = 'DELETE') THEN

               INSERT INTO historialBorradoJugadorPartido (nombreJugadorAntiguo,GolesAntiguo,usuarioModif,horaModif,fechaModif)
		VALUES (OLD.nombre,OLD.goles,
		current_user, current_time, current_date);

        ELSIF (TG_OP = 'UPDATE') THEN

            INSERT INTO historialjugadorpartido (GolesAntiguo,GolesNuevo,usuarioModif,horaModif,fechaModif)
		VALUES (OLD.goles,NEW.goles,
		current_user, current_time, current_date);

        ELSIF (TG_OP = 'INSERT') THEN

            INSERT INTO historialIngresoJugadorPartido (nombreJugadorRegistrado,GolesNuevo,usuarioRegistro,horaModif,fechaModif)
		VALUES (NEW.nombre,NEW.goles,
		current_user, current_time, current_date);

        END IF;
RETURN NULL;
END;
$$ language 'plpgsql';
---------------
create trigger eventos_imp
after update or insert or delete on jugador_partido
for each row
execute procedure historial_jugador_partido();
