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
CREATE OR REPLACE PROCEDURE SP_Sum( Num1 IN NUMBER, Num2 IN NUMBER, v_Total OUT NUMBER)
AS 
BEGIN
    v_total := num1 + num2;
END;
/ 
CREATE OR REPLACE PROCEDURE SP_Cubo( Num1 IN OUT NUMBER)
AS 
BEGIN

    IF num1 < 4 THEN -- entre 20000 y 20999
        RAISE_APPLICATION_ERROR(-20000, 'Numero debe ser superior a 4');
    END IF;
    Num1 := num1 * num1 * num1;
END;
/

