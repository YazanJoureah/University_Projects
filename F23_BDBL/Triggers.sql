
CREATE OR REPLACE TRIGGER RAW_MATERIAL_STOCK_WARNING
BEFORE INSERT OR UPDATE OF Quantity ON Raw_Material_Stock
FOR EACH ROW
BEGIN
  -- Get the Material Name and Stock Levels
  DECLARE
    material_name VARCHAR2(255);
    max_stock     INT;
    min_stock     INT;
  BEGIN
    SELECT Material_Name, Max_Stock, Min_Stock
    INTO material_name, max_stock, min_stock
    FROM Raw_Material
    WHERE Material_ID = :new.Material_ID;

    -- Check if the new quantity exceeds the maximum stock
    IF :new.Quantity > max_stock THEN
      DBMS_OUTPUT.PUT_LINE('WARNING: Raw Material ' || material_name || ' stock exceeds maximum allowed level.');

    END IF;

    -- Check if the new quantity falls below the minimum stock
    IF :new.Quantity < min_stock THEN
      DBMS_OUTPUT.PUT_LINE('WARNING: Raw Material ' || material_name || ' stock is below the minimum required level.');

    END IF;
  END;
END;

CREATE OR REPLACE TRIGGER Product_Stock_Warning
BEFORE INSERT OR UPDATE OF Quantity ON Product_Stock
FOR EACH ROW
BEGIN
  -- Get the Product Name and Stock Levels
  DECLARE
    product_name VARCHAR2(255);
    max_stock     INT;
    min_stock     INT;
  BEGIN
    SELECT Product_Name, Max_Stock, Min_Stock
    INTO product_name, max_stock, min_stock
    FROM Product
    WHERE Product_ID = :new.Product_ID;

    -- Check if the new quantity exceeds the maximum stock
    IF :new.Quantity > max_stock THEN
      DBMS_OUTPUT.PUT_LINE('WARNING: Product ' || product_name || ' stock exceeds maximum allowed level.');
  
    END IF;

    -- Check if the new quantity falls below the minimum stock
    IF :new.Quantity < min_stock THEN
      DBMS_OUTPUT.PUT_LINE('WARNING: Product ' || product_name || ' stock is below the minimum required level.');

    END IF;
  END;
END;
/

   


