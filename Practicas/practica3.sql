--Eje1
select nombrecompleto from votantes
where substr(votantes.dni, length(votantes.dni)) = votantes.localidad+1;

--Eje2
select v.nombrecompleto, decode(v.localidad, 1, 'Madrid', 2, 'Madrid', 3, 'Madrid', l.nombre) as nombre
from votantes v, localidades l where v.localidad = l.idlocalidad;

--Eje3
select p.siglas from partidos p, eventos_resultados er where p.idpartido = er.partido group by p.siglas
having count(er.partido) >= any(select max(count(er.partido)) from eventos_resultados er, partidos p where p.idpartido=er.partido group by p.siglas);

--Eje4: Obtener el DNI del segundo votante de más edad de entre todos los votantes existentes en la base de datos.
select v.dni from votantes v 
where v.fechanacimiento =
(select min(M) from (select v.fechanacimiento M from votantes v where v.fechanacimiento > (select min(v.fechanacimiento) from votantes v)));

--Eje5: Obtener el DNI del votante y el numero de veces que dicho votante ha participado en una consulta, mostrando el resultado de manera descendente
-- en cuanto a número de participaciones.
select v.dni ,count(c.votante) from votantes v, consultas c where v.dni = c.votante group by v.dni order by count(c.votante) desc;

--Eje6:
select v.dni ,count(c.votante) from votantes v, consultas c group by v.dni having v.dni = c.votante and
count(c.votante)>=4 order by count(c.votante) desc;

--Eje7: Obtener el nombre de los votantes cuya participación ha sido mayor que la media de participaciones de todos los votantes.
select v.nombrecompleto from votantes v, consultas c where v.dni=c.votante
having count(c.votante) > (select avg(count(c.votante)) from votantes v, consultas c where c.votante = v.dni group by c.votante) group by v.nombrecompleto;

--Eje8:
select v.dni, count(c.votante) from votantes v, consultas c 
where v.fechanacimiento !=
(select min(M) from (select v.fechanacimiento M from votantes v where v.fechanacimiento > (select min(v.fechanacimiento) from votantes v))) and
c.votante=v.dni group by v.dni order by count(c.votante) desc;








