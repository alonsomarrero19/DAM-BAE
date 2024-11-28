SET SERVEROUTPUT ON;

DECLARE 

 Localidad VARCHAR2(50) := 'Santa Cruz';
 Comision NUMBER := 500;
 Total Comision%TYPE;
 Salario EMPLOYEES.salary%TYPE; 
 Porcentaje NUMBER(5,3); -- 5 digitos de los cuales 3 son decimales
 EsCasado BOOLEAN := TRUE;
 Fecha DATE;
 FechayHora TIMESTAMP;


BEGIN 

 Total := 4500; 
 Comision := 10;
 Porcentaje := 10.999;
 Fecha := '10-01-2024';

 dbms_output.put_line(Total);
 dbms_output.put_line(Comision);
 dbms_output.put_line(Salario); -- NULL
 dbms_output.put_line(Salario+10); -- NULL + loquesea = NULL

 dbms_output.put_line(Total+Comision);
 dbms_output.put_line(Localidad || ' de Tenerife');

 dbms_output.put_line(Porcentaje);
 dbms_output.put_line(Fecha);


 dbms_output.new_line;


END;
/
