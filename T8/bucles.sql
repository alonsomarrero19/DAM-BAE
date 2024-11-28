SET SERVEROUTPUT ON

ACCEPT v_mensaje CHAR PROMPT 'Por favor introduzca su nombre:';

DECLARE
    v_contador INTEGER := 0;
    v_done BOOLEAN := FALSE;
    v_nombre VARCHAR := '&v_mensaje';
BEGIN
    -- Bucle FOR
    FOR i IN 5..15 LOOP
        dbms_output.put_line(i);
    END LOOP;
    
    -- Bucle FOR invertido
    FOR i IN REVERSE 0..10 LOOP
        dbms_output.put_line(i);
    END LOOP;
    
    -- Ruptura de un bucle FOR
    FOR i IN 0..10 LOOP
        dbms_output.put_line(i);
            EXIT WHEN I = 6;
    END LOOP;
    
    -- Bucle while
    dbms_output.put_line('Bucle While');
    WHILE v_contador < 10 LOOP
        dbms_output.put_line(v_contador);
        v_contador := v_contador + 1;
    END LOOP;
    
    WHILE (NOT v_done) LOOP
        dbms_output.put_line('Ha pasado por aqui');
        v_done := TRUE;
    END LOOP;
    
    -- Bucle LOOP
    v_contador := 0;
    LOOP 
        v_contador := v_contador + 1;
        dbms_output.put_line(v_contador);
        -- IF (v_contador >= 10) THEN
        --    EXIT;
        -- END IF;
        EXIT WHEN v_contador = 10;
    END LOOP;
    
    -- LOOP con EXIT y CONTINUE
    dbms_output.put_line('LOOP con EXIT y CONTINUE');
    v_contador := 0;
    LOOP 
        dbms_output.put_line('Contador: ' || TO_CHAR(v_contador));
        v_contador := v_contador + 1;
        IF (v_contador < 3) THEN
            CONTINUE;
        END IF;
        dbms_output.put_line('Despues de CONTINUE: ' || TO_CHAR(v_contador));
        EXIT WHEN v_contador = 5;
    END LOOP;
    dbms_output.put_line('Despues del LOOP: ' || TO_CHAR(v_contador));
    
END;
/

