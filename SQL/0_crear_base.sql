CREATE TABLE arbitro(
  id_arbitro integer NOT NULL,
  nombre character varying(15),
  app character varying(15),
  apm character varying(15),
  telefono character varying(12),
  id_entrenador integer);

  CREATE TABLE arbitro_asignado(
  id_partido integer,
  id_arbitro integer,
  posicion character varying(10));

  CREATE TABLE campo(
  nombre character varying(15),
  calle character varying(15),
  colonia character varying(15),
  cp character varying(6),
  id integer NOT NULL);

  CREATE TABLE equipo(
  nom_equipo character varying(15) NOT NULL,
  unif_color character varying(15),
  id_jcapitan integer);

  CREATE TABLE equipo_patrocinador(
  nom_equipo character varying(15),
  patrocinador character varying(15) NOT NULL);

  CREATE TABLE falta(
  id_falta integer NOT NULL,
  id_partido integer,
  id_jugador integer,
  tarjeta character varying(10));

  CREATE TABLE jornada(
  id_jornada integer NOT NULL,
  fecha_ini date,
  fecha_fin date);

 CREATE TABLE jugador(
  id_jugador integer NOT NULL,
  nombre character varying(15),
  app character varying(15),
  apm character varying(15),
  telefono character varying(12),
  fecha_nac date,
  nom_equipo character varying(15)); 

  CREATE TABLE jugador_partido(
  id_partido integer,
  id_jugador integer,
  minutos integer,
  goles integer);

  CREATE TABLE partido(
  id_partido integer NOT NULL,
  hora time without time zone,
  fecha date,
  id_jornada integer,
  id_campo integer);

  CREATE TABLE resultado_partido(
  id_partido integer,
  nom_equipo character varying(20),
  goles integer);