--> In order to show all the tables
select table_name from user_tables;

-- PRACTICA 1
-- In order to create a table, we have to do the following
create table PRUEBA (
    name_person varchar(255),
    id_person int,
    city_person varchar(255)
);

-- To delete a table, run the following command
drop table PRUEBA;

-- to insert into a table, run the following command
insert into PRUEBA(name_person, id_person, city_person)
values ('Juanjo Mendez', 465677656, 'EEUU');

-- In order to delete an instance of a table, run the following command
delete from PRUEBA where city_person='Spain';

select * from PRUEBA;

select e.nombre, e.fecha, e.tipo from eventos e;

-- In order to show two columns concatenated, use || to do it 
select e.nombre || ' de tipo '|| e.tipo "Convocatoria" from eventos e;



-- PRACTICA 2
select v.nombrecompleto from votantes v where v.nombrecompleto like '%n';

select v.dni from votantes v where v.dni like '%5%5%5%';

select v.nombrecompleto || ' nació el ' || v.fechanacimiento "Votantes"from votantes v where v.fechanacimiento > '01/01/90';

select v.nombrecompleto, l.nombre from votantes v, localidades l where v.localidad = l.idlocalidad and l.numerohabitantes > 300000;

select v.nombrecompleto, p.comunidad from votantes v, localidades l, provincias p 
    where v.localidad = l.idlocalidad and l.numerohabitantes > 300000 and l.provincia = p.idprovincia ;
    
select p.idpartido, count(c.partido) from partidos p, consultas_datos c where p.idpartido = c.partido group by p.idpartido;

select p.nombrecompleto from partidos p, consultas_datos c where p.idpartido = c.partido group by p.nombrecompleto having count(c.partido) > 10;

select p.nombrecompleto, count(c.partido) from partidos p, consultas_datos c where p.idpartido = c.partido group by p.nombrecompleto having count(c.partido) > 10;

select p.nombrecompleto, count(c.partido) from partidos p, consultas_datos c where p.idpartido = c.partido and c.respuesta like 'Si' and c.certidumbre > 0.8 group by p.nombrecompleto;



-- PRACTICA 3
select v.nombrecompleto from votantes v where substr(v.dni, length(v.dni)) = v.localidad+1;

select v.nombrecompleto, decode(v.localidad, 1, 'Madrid', 2, 'Madrid', 3, 'Madrid', l.nombre) as nombre from votantes v, localidades l where v.localidad = l.idlocalidad;

select max(count(e.partido)) from eventos_resultados e, partidos p where e.partido = p.idpartido group by p.siglas;

select p.siglas from eventos_resultados e, partidos p where e.partido = p.idpartido group by p.siglas
having count(e.partido) >= (select max(count(e.partido)) from eventos_resultados e, partidos p where e.partido = p.idpartido group by p.siglas);

select min(v.fechanacimiento) from votantes v;
select min(v.fechanacimiento) from votantes v where v.fechanacimiento > (select min(v.fechanacimiento) from votantes v);
select v.dni from votantes v where v.fechanacimiento = (select min(v.fechanacimiento) from votantes v where v.fechanacimiento > (select min(v.fechanacimiento) from votantes v));


select v.dni, count(c.votante) from votantes v, consultas c where v.dni = c.votante  group by c.votante order by count(c.votante) desc;

select avg(count(c.votante)) from votantes v, consultas c where v.dni=c.votante group by c.votante;
select v.dni, count(c.votante) from votantes v, consultas c where v.dni = c.votante 
    having count(c.votante) > (select avg(count(c.votante)) from votantes v, consultas c where v.dni=c.votante group by c.votante) 
    group by c.votante order by count(c.votante) desc;
    
select v.nombrecompleto from votantes v;
select avg(count(c.votante)) from consultas c, votantes v where v.dni = c.votante group by v.nombrecompleto;
select v.nombrecompleto, count(c.votante) from votantes v, consultas c where v.dni = c.votante
    having count(c.votante) > (select avg(count(c.votante)) from consultas c, votantes v where v.dni = c.votante group by v.nombrecompleto)
    group by v.nombrecompleto;
    
--Falta el 8.





























