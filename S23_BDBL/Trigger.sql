CREATE OR REPLACE TRIGGER Rawmaterialcheck
AFTER INSERT OR UPDATE ON Purchased_Rawmaterial
FOR EACH ROW
DECLARE
    v_minLimit Rawmaterial.MinLimit%TYPE;
    v_maxLimit Rawmaterial.MaxLimit%TYPE;
    v_currentQuantity NUMBER;
BEGIN
    SELECT COALESCE(SUM(Quantity), 0)
    INTO v_currentQuantity
    FROM Product_Rawmaterial
    WHERE Rawmaterialid = :NEW.RawMaterialID;

    SELECT COALESCE(SUM(Quantity), 0) + v_currentQuantity
    INTO v_currentQuantity
    FROM Purchased_Rawmaterial
    WHERE Rawmaterialid = :NEW.RawMaterialID;

    SELECT Minlimit, Maxlimit
    INTO v_minLimit, v_maxLimit
    FROM Rawmaterial
    WHERE Rawmaterialid = :NEW.RawMaterialID;

    IF v_currentQuantity > v_maxLimit THEN
        INSERT INTO NotificationTable (Message, CreatedDate) 
		VALUES ('Raw material quantity for raw material ' || :NEW.RawMaterialID || ' exceeds the maximum limit', SYSDATE);
    ELSIF v_currentQuantity < v_minLimit THEN
        INSERT INTO NotificationTable (Message, CreatedDate) 
		VALUES ('Raw material quantity for raw material ' || :NEW.RawMaterialID || ' is below the minimum limit', SYSDATE);
    END IF;
END;