﻿--select id_jugador, count(*) as faltas from falta group by id_jugador order by faltas desc;
--select * from jugador where id_jugador=50;
--select nombre,app,apm,nom_equipo,goles from jugador natural join (select id_jugador, sum(goles) as goles from jugador_partido group by id_jugador) as uno order by goles desc limit 10 offset 0;
--select *  from resultado_partido as r join (select * from resultado_partido where nom_equipo='buitres') as x on r.id_partido=x.id_partido and r.nom_equipo!=x.nom_equipo;