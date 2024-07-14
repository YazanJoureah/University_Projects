CREATE OR REPLACE TYPE RAW_MATERIALS AS OBJECT (
    RawMaterialID INT,
    Quantity INT
);
CREATE OR REPLACE TYPE Material_Array AS TABLE OF RAW_MATERIALS;

CREATE OR REPLACE FUNCTION Purchase_Orders (
    PO_quantities Material_Array,
    PO_supplier Supplier.Supplier_ID%Type
)
RETURN Number
AS
    total_cost NUMBER := 0;
    result_values Raw_Material.Material_Name%TYPE;
    unit_price Raw_Material.Unit_Price%TYPE;
    unit_measure Raw_Material.Unit_Of_Measure%TYPE;
    Order_ID INT := 0; 
    Order_Item_ID Int := 0; 
    v_Order_ID INT;
    v_Order_Item_ID INT;
BEGIN
    SELECT NVL(MAX(Order_ID), 0) into Order_ID FROM Purchase_Order;
    SELECT NVL(MAX(Order_Item_ID), 0) into Order_Item_ID FROM Purchase_Order_Item;
    v_Order_ID := Order_ID + 1;
    v_Order_Item_ID := Order_Item_ID + 1;

    -- Create Purchase Order
    INSERT INTO Purchase_Order (Order_ID, Order_Date, Supplier_ID, Status) 
    VALUES (v_Order_ID, SYSDATE, PO_supplier, 'Pending'); 

    -- Insert Into Purchase Order Item Table
    FOR i IN 1..PO_quantities.Count LOOP
        INSERT INTO Purchase_Order_Item (Order_Item_ID, Order_ID, Material_ID, Quantity)
        VALUES (((SELECT NVL(MAX(Order_Item_ID), 0)  FROM Purchase_Order_Item)+1), v_Order_ID, PO_quantities(i).RawMaterialID, PO_quantities(i).Quantity); 
    END LOOP;

    -- Update Raw Material Stock
    FOR i IN 1..PO_quantities.Count LOOP
        UPDATE Raw_Material_Stock
        SET Quantity = Quantity + PO_quantities(i).Quantity
        WHERE Material_ID = PO_quantities(i).RawMaterialID;
    END LOOP;

    -- Calculate total cost and display details
    FOR i IN 1..PO_quantities.COUNT LOOP
        SELECT Material_Name, Unit_Price, Unit_Of_Measure
        INTO result_values, unit_price, unit_measure
        FROM Raw_Material
        WHERE Material_ID = PO_quantities(i).RawMaterialID;

        total_cost := total_cost + (unit_price * PO_quantities(i).Quantity);

        DBMS_OUTPUT.PUT_LINE('Material: ' || result_values || ', Quantity: ' || PO_quantities(i).Quantity || ' ' || unit_measure || ', Total Cost: ' || unit_price * PO_quantities(i).Quantity);
    END LOOP;

    DBMS_OUTPUT.PUT_LINE('Total Cost for Purchase: ' || total_cost);
    RETURN total_cost;
END;
/
