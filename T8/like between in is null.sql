SET SERVEROUTPUT ON;

DECLARE
    v_name VARCHAR(20) := 'Alejandro';
    v_numero number := 8;
BEGIN
    IF (v_name like 'A%') THEN
        dbms_output.put_line('El nombre comienza por la A');
    END IF;
    
    IF (v_numero BETWEEN 0 AND 10) THEN
        dbms_output.put_line('El número está entre 0 y 10');
    END IF;
    
    IF (v_numero IN (5,8,10,20)) THEN
        dbms_output.put_line('El número está en el grupo de elementos');
    END IF;
    
    IF (v_numero IS NULL) THEN
        dbms_output.put_line('El número es nulo');
    END IF;
    
END;
/