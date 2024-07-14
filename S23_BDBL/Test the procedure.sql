SET SERVEROUTPUT ON;
DECLARE
  Quantities Rawmaterialarray := Rawmaterialarray(
    Raw_Material(1, 3),
    RAW_MATERIAL(2, 50)
  );
Begin
  ManufactureProduct(1, quantities, 2);
END;
/