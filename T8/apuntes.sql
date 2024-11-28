-- Apuntes de la clase de T8

-- Bucles

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

-- Tablas

SET SERVEROUTPUT ON;
DECLARE
    v_Salario NUMBER;
BEGIN

    SELECT Salary into v_Salario
    FROM EMPLOYEES
    WHERE employee_id = 100;
    dbms_output.put_line('Salario :' || v_Salario);

END;
/

SET SERVEROUTPUT ON;
DECLARE
    v_Max NUMBER;
    v_Min Number;
BEGIN

    SELECT MAX(Salary), MIN(Salary) INTO v_Max, v_Min
    FROM EMPLOYEES;
    dbms_output.put_line('Salario maximo:' || v_Max);
    dbms_output.put_line('Salario minimo:' || v_Min);

END;
/


-- Procedimientos

CREATE OR REPLACE PROCEDURE SP_Ejemplo 
AS 
    v_Num NUMBER := 10;
BEGIN
    dbms_output.put_line(v_Num);
END;
/

SET SERVEROUTPUT ON;
DECLARE
BEGIN
    SP_Ejemplo();
END;
/

create or replace PROCEDURE SP_Calc_Tax( Empl IN EMPLOYEES.EMPLOYEE_ID%TYPE, Percentage IN NUMBER DEFAULT 5)
AS 
    v_Tax NUMBER := 0;
    v_Sal NUMBER := 0;
BEGIN

    SELECT Salary INTO v_Sal
    FROM EMPLOYEES
    WHERE employee_id = empl;
    v_Tax := v_sal * percentage/100;

    dbms_output.put_line('Salario :' || v_Sal );
    dbms_output.put_line('Impuestos :' || v_Tax );

    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            dbms_output.put_line('El emleado no existe.');

END;
/

SET SERVEROUTPUT ON;
DECLARE
BEGIN
    SP_Ejemplo(empl, percentage);
END;
/

CREATE OR REPLACE PROCEDURE SP_Sum( Num1 IN NUMBER, Num2 IN NUMBER, v_Total OUT NUMBER )
AS 
BEGIN
    v_total := num1 + num2;
END;
/ 

CREATE OR REPLACE PROCEDURE SP_Cubo( Num1 IN OUT NUMBER )
AS 
BEGIN

    IF num1 < 4 THEN -- entre 20000 y 20999
        RAISE_APPLICATION_ERROR(-20000, 'Numero debe ser superior a 4');
    END IF;
    Num1 := num1 * num1 * num1;
END;
/

-- Funciones

CREATE OR REPLACE FUNCTION Calc_Tax(Empl IN EMPLOYEES.EMPLOYEE_ID%TYPE,
                                    percentage IN NUMBER DEFAULT 20
) RETURN NUMBER
IS 
    v_Sal NUMBER := 0;
BEGIN
    SELECT Salary INTO v_Sal
    FROM EMPLOYEES
    WHERE employee_id = empl;
    
    v_Sal := v_sal * percentage/100;

    RETURN v_sal;

END;
/

-- creacion de tablas y adicion/edicion de datos

CREATE OR REPLACE PROCEDURE crearTest 
AS
BEGIN
    EXECUTE IMMEDIATE 'CREATE TABLE Test(ID NUMBER, Name VARCHAR(10))';
END;
/

CREATE OR REPLACE PROCEDURE insertTest 
AS
    I NUMBER := 10;
BEGIN
    EXECUTE IMMEDIATE 'INSERT INTO Test(ID, Name) VALUES (:value1, :value2)'
    USING I, 'xxxAAAxxx';
END;
/

CREATE OR REPLACE PROCEDURE updateTest(codigo NUMBER, nombre VARCHAR) 
AS
    sql_str VARCHAR2(100) := 'UPDATE Test Name= :nombre WHERE ID = :codigo';
BEGIN
    EXECUTE IMMEDIATE sql_str USING codigo, nombre;
END;
/