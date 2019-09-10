
--Eje1: Mostrar el nombre completo y el correo electrónico del votante con DNI
-- 30983712, mostrando la información como sigue:
set serveroutput on;
DECLARE
v_nombre votantes.nombrecompleto % type;
v_email votantes.email % type;
mydni NUMBER := 30983712;
BEGIN
select v.nombrecompleto, v.email into v_nombre, v_email from votantes v where v.dni=mydni;
dbms_output.put_line(v_nombre||''||v_email);
END;


--Eje2: Mostrar sólo el nombre (sin apellidos) y el correo electrónico del votante con
--DNI 30983712, mostrando la información como sigue:
set serveroutput on;
DECLARE
    v_nombre votantes.nombrecompleto % type;
    v_email votantes.email % type;
    mydni NUMBER:=30983712;
BEGIN
    select v.nombrecompleto, v.email INTO v_nombre, v_email  from votantes v where v.dni=mydni and substr(v.nombrecompleto, );
    DBMS_OUTPUT.put_line('v_nombre || '' || v_email');
END;