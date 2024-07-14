SELECT 
    rm.Material_Name, 
    rm.Unit_Of_Measure,
    COALESCE(rs.Quantity, 0) AS Current_Quantity  
FROM 
    Raw_Material rm
LEFT JOIN 
    Raw_Material_Stock rs ON rm.Material_ID = rs.Material_ID;


SELECT 
    p.Product_Name,
    COALESCE(ps.Quantity, 0) AS Current_Quantity
FROM 
    Product p
LEFT JOIN 
    Product_Stock ps ON p.Product_ID = ps.Product_ID;

SELECT 
    rm.Material_Name AS "Material Name",
    rms.Quantity AS "Current Stock"
FROM 
    Raw_Material rm
JOIN 
    Raw_Material_Stock rms ON rm.Material_ID = rms.Material_ID;
    
    
SELECT 
    po.Order_ID AS "Order ID",
    po.Order_Date AS "Order Date",
    s.Supplier_Name AS "Supplier",
    po.Status AS "Order Status"
FROM 
    Purchase_Order po
JOIN 
    Supplier s ON po.Supplier_ID = s.Supplier_ID;

SELECT 
    so.Order_ID AS "Order ID",
    so.Order_Date AS "Order Date",
    c.Customer_Name AS "Customer",
    so.Status AS "Order Status"
FROM 
    Sales_Order so
JOIN 
    Customer c ON so.Customer_ID = c.Customer_ID;


SELECT 
    pr.Production_ID AS "Production ID",
    pr.Production_Date AS "Production Date",
    p.Product_Name AS "Product Name",
    pr.Quantity_Produced AS "Quantity Produced",
    pr.Production_Cost AS "Production Cost"
FROM 
    Production pr
JOIN 
    Product p ON pr.Product_ID = p.Product_ID;
