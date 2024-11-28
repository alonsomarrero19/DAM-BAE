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
