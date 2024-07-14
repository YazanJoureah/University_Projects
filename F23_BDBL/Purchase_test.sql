-- Enable DBMS_OUTPUT 
SET SERVEROUTPUT ON;

-- Test Case 1: Order with multiple materials
DECLARE
    test_materials Material_Array;
    expected_cost NUMBER;
    actual_cost NUMBER;
BEGIN
    -- Test data
    test_materials := Material_Array(
        RAW_MATERIALS(1, 100),  -- Material ID 1, Quantity 100
        RAW_MATERIALS(2, 50)   -- Material ID 2, Quantity 50
    );
    expected_cost := 650; -- Example based on assumed unit prices 

    -- Call the Purchase_Orders function
    actual_cost := Purchase_Orders(test_materials, 700); -- Supplier ID 700

    -- Assertions
    DBMS_OUTPUT.PUT_LINE('Test Case 1 -----------------------');
    IF actual_cost = expected_cost THEN
        DBMS_OUTPUT.PUT_LINE('Test Case 1: PASSED!');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Test Case 1: FAILED!');
        DBMS_OUTPUT.PUT_LINE('Expected Cost: ' || expected_cost);
        DBMS_OUTPUT.PUT_LINE('Actual Cost: ' || actual_cost);
    END IF;

END;
/

-- Test Case 2: Order with a single material
DECLARE
    test_materials Material_Array;
    expected_cost NUMBER;
    actual_cost NUMBER;
BEGIN
    -- Test data
    test_materials := Material_Array(
        RAW_MATERIALS(3, 200)   -- Material ID 3, Quantity 200
    );
    expected_cost := 400;  -- Example based on assumed unit prices

    -- Call the Purchase_Orders function
    actual_cost := Purchase_Orders(test_materials, 701); -- Supplier ID 701

    -- Assertions
    DBMS_OUTPUT.PUT_LINE('Test Case 2 -----------------------');
    IF actual_cost = expected_cost THEN
        DBMS_OUTPUT.PUT_LINE('Test Case 2: PASSED!');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Test Case 2: FAILED!');
        DBMS_OUTPUT.PUT_LINE('Expected Cost: ' || expected_cost);
        DBMS_OUTPUT.PUT_LINE('Actual Cost: ' || actual_cost);
    END IF;

END;
/

