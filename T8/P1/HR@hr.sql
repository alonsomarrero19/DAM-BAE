-- 1

SET SERVEROUTPUT ON;

DECLARE
    nombre VARCHAR2(20);
    apellido1 VARCHAR2(20);
    apellido2 VARCHAR2(20);
    iniciales VARCHAR2(20);
BEGIN
    nombre := 'Alonso';
    apellido1 := 'Marrero';
    apellido2 := 'Bello';

    iniciales := UPPER(SUBSTR(nombre, 1, 1)) || '.' || UPPER(SUBSTR(apellido1, 1, 1)) || '.' || UPPER(SUBSTR(apellido2, 1, 1));

    DBMS_OUTPUT.PUT_LINE(iniciales);
END;
/

-- 2 

SET SERVEROUTPUT ON;

DECLARE
    fecha_nacimiento DATE;
    dia_nacimiento VARCHAR2(20);
BEGIN
    fecha_nacimiento := TO_DATE('2005-06-19', 'YYYY-MM-DD'); --fecha de nacimiento

    dia_nacimiento := TO_CHAR(fecha_nacimiento, 'DAY');

    DBMS_OUTPUT.PUT_LINE('Naciste un ' || dia_nacimiento);
END;
/

-- 3

SET SERVEROUTPUT ON;

DECLARE
    x1 NUMBER := 3;
    y1 NUMBER := 2;
    x2 NUMBER := 5;
    y2 NUMBER := 8;
    distancia NUMBER;
BEGIN
    distancia := SQRT((x2 - x1)**2 + (y2 - y1)**2);

    DBMS_OUTPUT.PUT_LINE('CALCULAR LA DISTANCIA ENTRE DOS PUNTOS');
    DBMS_OUTPUT.PUT_LINE('');
    DBMS_OUTPUT.PUT_LINE('Punto x : ( ' || x1 || ', ' || y1 || ' )');
    DBMS_OUTPUT.PUT_LINE('Punto y : ( ' || x2 || ', ' || y2 || ' )');
    DBMS_OUTPUT.PUT_LINE('Distancia XY :' || TO_CHAR(distancia, '999.9'));
END;
/

-- 4

DECLARE
  Num1 NUMBER( 8, 2 ) := 0;
  Num2 NUMBER( 8, 2 ) NOT NULL DEFAULT 0;
  Num3 NUMBER( 8, 2 ) NOT NULL;
  Cantidad INTEGER( 3 );
  Precio, Descuento NUMBER( 6 );
  Num4 Num1%ROWTYPE;
  Dto CONSTANT INTEGER;
BEGIN
   ...
END;
