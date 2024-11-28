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
