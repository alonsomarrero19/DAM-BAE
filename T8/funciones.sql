
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
