CREATE OR REPLACE FUNCTION Production_Process (
    PR_Product INT, 
    PR_Quantity INT 
)
RETURN NUMBER -- Returns 0 if production is successful, raises an error otherwise
AS
    total_cost NUMBER := 0;
    Production_ID INT;
    v_Production_ID INT; -- Temporary variable to hold the generated Production ID
    Production_Quality_ID INT := 0; -- Variable to store the next available Production Quality ID
    v_Production_Quality_ID INT; -- Temporary variable to hold the generated Production Quality ID
    Quality_Result varchar(255); 
    material_qty_used  DECIMAL(10,2); 
    BOM_Quantity Product_BOM.quantity%TYPE; 
    Unit_cost Raw_Material.unit_price%TYPE; 
    v_available_quantity Raw_Material_Stock.Quantity%TYPE; 
    v_required_quantity Raw_Material_Stock.Quantity%TYPE; 
    v_material_name Raw_Material.Material_Name%TYPE; 
    material_id Product_BOM.material_id%TYPE; --Store mateial id


    -- Declare a cursor to fetch the required data for each material to check if raw materials are sufficient for the production 
CURSOR material_cursor_1 IS
    SELECT b.quantity, r.unit_price, s.Quantity, r.Material_Name
    FROM Product_BOM b
    JOIN Raw_Material r ON b.material_id = r.material_id
    JOIN Raw_Material_Stock s ON b.material_id = s.Material_ID
    WHERE b.product_id = 1;

-- Declare a cursor to fetch the required data for each material Calculate the total cost of production and update the raw material stock
CURSOR material_cursor_2 IS
    SELECT b.material_id, b.quantity, r.unit_price
    FROM Product_BOM b
    JOIN Raw_Material r ON b.material_id = r.material_id
    WHERE b.product_id = PR_Product;

  

BEGIN
OPEN material_cursor_1;
LOOP
    FETCH material_cursor_1 INTO BOM_Quantity, Unit_cost, v_available_quantity, v_material_name;
    EXIT WHEN material_cursor_1%NOTFOUND;
    -- Calculate the required quantity of material based on the production quantity
    v_required_quantity := PR_Quantity * BOM_Quantity;
    -- Check if the available quantity is sufficient
    IF v_available_quantity < v_required_quantity THEN
        RAISE_APPLICATION_ERROR(-20001, 'Insufficient ' || v_material_name || ' in stock. Required: ' || v_required_quantity || ', Available: ' || v_available_quantity);
    END IF;
END LOOP;
CLOSE material_cursor_1;

        
        -- Get the next available Production ID
    SELECT NVL(MAX(Production_ID), 0) into Production_ID FROM Production;
    
        -- Calculate the new Production ID
    v_Production_ID := Production_ID + 1;
    
    -- Get the next available Production Quality ID
    SELECT NVL(MAX(Production_Quality_ID), 0) into Production_Quality_ID FROM Production_Quality;
    
    -- Calculate the new Production Quality ID
    v_Production_Quality_ID := Production_Quality_ID +1;
    
        -- Create the production plan in the Production table
    INSERT INTO Production (Production_ID, Product_ID, Production_Date,Quantity_Produced) 
    VALUES (v_Production_ID,PR_Product,SYSDATE, PR_Quantity);

    
    -- Calculate the total cost of production and update the raw material stock
OPEN material_cursor_2;
LOOP
    FETCH material_cursor_2 INTO material_id, BOM_Quantity, Unit_cost;
    EXIT WHEN material_cursor_2%NOTFOUND;
    -- Calculate the quantity of material used in this production run
    material_qty_used := PR_Quantity * BOM_Quantity; 
    -- Update the Raw Material Stock table to reflect the material used
    BEGIN
        UPDATE Raw_Material_Stock 
        SET Quantity = Quantity - material_qty_used 
        WHERE Material_ID = material_id;
    EXCEPTION
        WHEN OTHERS THEN
            -- Rollback transaction and raise an error if the update fails
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20002, 'Error updating raw material stock.');
    END;
    
    -- Calculate the total cost of the materials used
    total_cost := total_cost + (material_qty_used * Unit_cost);
END LOOP;
CLOSE material_cursor_2;

    -- Randomly determine the quality inspection result
    DBMS_RANDOM.SEED(DBMS_RANDOM.VALUE);
    Quality_Result := CASE when DBMS_RANDOM.VALUE() <0.8 THen 'Passed' Else 'Faild' END;
    
    -- Record the quality inspection result in the Production_Quality table
    INSERT into Production_Quality (Production_Quality_ID,Production_ID,Product_ID,Inspection_Date,Result)
    Values (v_Production_Quality_ID,v_Production_ID,PR_Product,sysdate,Quality_Result);
    
  -- If the quality inspection passes, update the product stock
  if Quality_Result ='Passed' then
    BEGIN
      Update Product_Stock 
      Set Quantity=Quantity + PR_Quantity
      where Product_ID = PR_Product;
    EXCEPTION
        WHEN OTHERS THEN
            -- Rollback transaction and raise an error if the update fails
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20003, 'Error updating product stock.');
    END;
    
  -- If the quality inspection fails, add the produced items to the defective stock
  else
    BEGIN
        Insert Into Defective_Product_Stock (Production_ID,Product_ID,Quantity,Defect_Date,Defect_Reason,Wholesale_Price,Retail_Price) values
        (v_Production_ID,PR_Product,PR_Quantity,sysdate,'Random reason',
        ( (select max(Wholesale_Price) from Product where Product_ID=PR_Product)/2),
        ((select max(Retail_Price) from Product where Product_ID=PR_Product)/2));
        DBMS_OUTPUT.PUT_LINE('Defective' );    
    EXCEPTION
        WHEN OTHERS THEN
            -- Rollback transaction and raise an error if the insert fails
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20004, 'Error inserting into defective stock.');
    END;
  end if;
    -- Output the total production cost
    DBMS_OUTPUT.PUT_LINE('Productio Complete , Total Cost : ' || total_cost);
    return 0; -- Return 0 to indicate successful production
EXCEPTION
    WHEN OTHERS THEN
        -- Rollback transaction if any error occurs and re-raise the error for handling
        ROLLBACK;
        RAISE;
END;
/
