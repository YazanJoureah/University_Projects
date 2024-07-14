--Create a New object Represent Mulible Raw material Fror each Product
CREATE OR REPLACE TYPE RAW_MATERIAL AS OBJECT (
    RawMaterialID NUMBER,
    Quantity NUMBER
);
/
-- Create a new collection type based on the RAW_MATERIAL object
CREATE OR REPLACE TYPE RawMaterialArray AS TABLE OF RAW_MATERIAL;
/

CREATE OR REPLACE PROCEDURE ManufactureProduct (
    p_productID NUMBER,
    p_quantities RawMaterialArray,
    p_warehouseID NUMBER
) AS
    v_totalCapacity NUMBER;
    v_quantitiesCount NUMBER := p_quantities.Count; -- Get the count directly from the collection
BEGIN
    -- Check if the required raw materials are available and the total capacity of the warehouse is sufficient
    FOR i IN 1..v_quantitiesCount LOOP
        SELECT SUM(CASE WHEN pr.Quantity < p_quantities(i).Quantity THEN 1 ELSE 0 END)
        INTO v_totalCapacity
        FROM Product_RawMaterial pr
        JOIN RawMaterial r ON pr.RawMaterialID = r.RawMaterialID
        WHERE pr.ProductID = p_productID
        AND pr.RawMaterialID = p_quantities(i).RawMaterialID;

        IF v_totalCapacity > 0 THEN
            DBMS_OUTPUT.PUT_LINE('Insufficient quantity of Raw Material');
            RETURN;
        END IF;
    END LOOP;

    -- At this point, we know that sufficient quantities are available, so we can proceed with the manufacturing process
    FOR i IN 1..v_quantitiesCount LOOP
        UPDATE Product_RawMaterial
        SET Quantity = Quantity - p_quantities(i).Quantity
        WHERE ProductID = p_productID
        AND RawMaterialID = p_quantities(i).RawMaterialID;
    END LOOP;

    -- Insert the manufactured product into QualityControl
    INSERT INTO QualityControl (QualityControlDate, Status, ProductID, WarehouseID, Quantity)
    VALUES (SYSDATE, 'VALID', p_productID, p_warehouseID, 50);

    -- Proper concatenation of the message
    DBMS_OUTPUT.PUT_LINE('Product ' || p_productID || ' manufactured successfully.');
    
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('Insufficient warehouse capacity.');
END;
/


