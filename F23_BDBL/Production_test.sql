-- Enable DBMS_OUTPUT
SET SERVEROUTPUT ON;

-- Test Case 1: Successful Production with Sufficient Materials
DECLARE
    test_product_id INT := 100; -- Replace with an actual product ID
    test_quantity INT := 10;  -- Production quantity
    expected_result NUMBER := 0; -- Expected return value for success
    actual_result NUMBER;
BEGIN
    -- Call the Production_Process function
    actual_result := Production_Process(test_product_id, test_quantity);

    -- Assertions
    DBMS_OUTPUT.PUT_LINE('Test Case 1 -----------------------');
    IF actual_result = expected_result THEN
        DBMS_OUTPUT.PUT_LINE('Test Case 1: PASSED! Production Successful.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Test Case 1: FAILED! Production Failed.');
        DBMS_OUTPUT.PUT_LINE('Expected Result: ' || expected_result);
        DBMS_OUTPUT.PUT_LINE('Actual Result: ' || actual_result);
    END IF;

    -- Check if stock levels are updated correctly (add more specific checks)
    DBMS_OUTPUT.PUT_LINE('Check raw material stock levels manually to verify they were decremented correctly.');

END;
/