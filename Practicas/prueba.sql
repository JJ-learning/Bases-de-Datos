--Eje 1
select l.nombre, l.numerohabitantes, v.nombrecompleto from localidades l, votantes v where v.localidad=l.idlocalidad and
v.fechanacimiento = (select max(v.fechanacimiento) from votantes v, localidades l where v.localidad=l.idlocalidad); 

--Eje 2
select v.nombrecompleto, v.fechanacimiento from votantes v
where v.fechanacimiento>(select p.fechacreacion from partidos p where p.siglas='PP') and 
v.localidad = any(select l.idlocalidad from localidades l, provincias p where p.comunidad='Andalucia' and l.provincia=p.idprovincia)
order by v.fechanacimiento desc;

--Eje 3
select l.nombre, p.comunidad,l.numerohabitantes from localidades l, provincias p where l.numerohabitantes > (select l.numerohabitantes from votantes v, localidades l
where v.fechanacimiento=(select min(v.fechanacimiento) from votantes v where v.fechanacimiento > (select min(v.fechanacimiento) from votantes v)) and
v.localidad=l.idlocalidad) and l.provincia=p.idprovincia order by l.nombre;
