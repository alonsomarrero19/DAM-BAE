CREATE OR REPLACE FUNCTION Pagos_TipoTrabajo(job1 IN EMPLOYEES.JOB_ID%TYPE,) RETURN NUMBER
IS 
    v_Sal NUMBER := 0;
BEGIN
    SELECT SUM(salary) INTO v_Sal
    FROM EMPLOYEES
    WHERE JOB_ID = job1;

    RETURN v_sal;

END;
/

SET SERVEROUTPUT ON
DECLARE 
    v_sal NUMBER := 0;
BEGIN
    v_Sal := pagos_tipotrabajo('ST_MAN', v_Sal);
    dbms_output.put_line('Salario total:' || v_Sal);
END;
/

-- ejercicio 2

CREATE OR REPLACE PROCEDURE sp_Formateo_Cuenta( num1 IN OUT VARCHAR)
AS 
BEGIN
    num1 := 'ES' || num1;
    num1 := SUBSTR(num1,1,4) || '-' || SUBSTR(num1,5,4) || '-' || SUBSTR(num1,9,4) || '-' || SUBSTR(num1,13,2) || '-' || SUBSTR(num1,15);
    
END;
/

SET SERVEROUTPUT ON
DECLARE 
    v_sal VARCHAR2(30) := '1320900000290350000083';
BEGIN
    sp_formateo_cuenta(v_sal);
    dbms_output.put_line(v_Sal);
END;
/

-- ejercicio 3

CREATE OR REPLACE PROCEDURE Copy_Table(
    TablaOrigen IN VARCHAR2,
    TablaDestino IN VARCHAR2 DEFAULT "Copy"
)
AS
    v_Columnas VARCHAR2(4000);
    v_ExisteTabla NUMBER;
BEGIN

    SELECT COUNT(*)
    INTO v_ExisteTabla
    FROM all_tables
    WHERE table_name = UPPER(TablaDestino);

    IF v_ExisteTabla = 0 THEN
        EXECUTE IMMEDIATE 'CREATE TABLE ' || TablaDestino || ' AS SELECT * FROM ' || TablaOrigen;
    END IF;

    SELECT LISTAGG(column_name, ', ') WITHIN GROUP (ORDER BY column_id)
    INTO v_Columnas
    FROM all_tab_columns
    WHERE table_name = UPPER(TablaOrigen);
    
    EXECUTE IMMEDIATE 'INSERT INTO ' || TablaDestino || ' (' || v_Columnas || ')
                  SELECT ' || v_Columnas || '
                  FROM ' || TablaOrigen;
                  
    EXCEPTION
    WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(-20001, 'Fallo al copiar los datos: ' || SQLERRM);
END;
/

SET SERVEROUTPUT ON
DECLARE 

BEGIN
    copy_table('Jobs', 'Ejemplo');
END;
/
SELECT * FROM Ejemplo;

-- ejercicio 4

CREATE OR REPLACE PROCEDURE sp_conver_temp(temp IN NUMBER, escala IN VARCHAR2, newTemp OUT NUMBER, newEscala OUT VARCHAR2 )
AS
BEGIN
    IF escala = 'C' THEN
        newTemp := (temp * 9 / 5) + 32 ;
        newEscala := 'F';
    ELSIF escala = 'F' THEN 
        newTemp := (temp - 32) * 5 / 9;
        newEscala := 'F';
    ELSE
        newTemp := 0;
        newEscala := 'C';
    END IF;
    
END;
/

SET SERVEROUTPUT ON
DECLARE 
    a NUMBER := 32;
    b VARCHAR2(20) := 'F';
    c NUMBER := 0;
    d VARCHAR2(20):= '';
BEGIN
    sp_conver_temp(a,b,c,d);
    dbms_output.put_line(a);
    dbms_output.put_line(b);
    dbms_output.put_line(c);
    dbms_output.put_line(d);
END;
/


-- ejercicio 5

CREATE OR REPLACE FUNCTION GetEmail
RETURN VARCHAR2 IS
    v_email VARCHAR2(50);
BEGIN
    v_email := TO_CHAR(SYSDATE, 'DD-MM-MI-SS') || '@gmail.com';
    RETURN v_email;
END;
/

CREATE OR REPLACE PROCEDURE sp_create_empleadosv2 
AS
    counter NUMBER;
BEGIN

    SELECT COUNT(*)
    INTO counter
    FROM all_tables
    WHERE table_name = 'EMPLEADOSV2';
    
    IF counter = 0 THEN 
        EXECUTE IMMEDIATE 'CREATE TABLE EmpleadosV2 (
            emp_id NUMBER,
            emp_email VARCHAR2(50)
        )';
    END IF;

    FOR emp IN (SELECT employee_id FROM HR.employees) LOOP
        INSERT INTO EmpleadosV2 (emp_id, emp_email)
        VALUES (emp.employee_id, GetEmail());
    END LOOP;
END;
/


DECLARE
BEGIN
    sp_create_empleadosv2;
END;
/
SELECT * FROM empleadosv2;

