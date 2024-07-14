-- Inserting into Raw_Material table
INSERT INTO Raw_Material (Material_ID, Material_Name, Unit_Of_Measure, Unit_Price, Min_Stock, Max_Stock, Description) VALUES (1, 'Polyethylene (PE)', 'kg', 1.50, 500, 1000, 'Low-density polyethylene, used for films and bags.');
INSERT INTO Raw_Material (Material_ID, Material_Name, Unit_Of_Measure, Unit_Price, Min_Stock, Max_Stock, Description) VALUES (2, 'Polypropylene (PP)', 'kg', 1.75, 400, 800, 'Used for packaging, containers, and fibers.');
INSERT INTO Raw_Material (Material_ID, Material_Name, Unit_Of_Measure, Unit_Price, Min_Stock, Max_Stock, Description) VALUES (3, 'Polyvinyl Chloride (PVC)', 'kg', 2.25, 300, 600, 'Used for pipes, windows, and flooring.');
INSERT INTO Raw_Material (Material_ID, Material_Name, Unit_Of_Measure, Unit_Price, Min_Stock, Max_Stock, Description) VALUES (4, 'Polystyrene (PS)', 'kg', 2.00, 200, 400, 'Used for food containers, insulation, and packaging.');
INSERT INTO Raw_Material (Material_ID, Material_Name, Unit_Of_Measure, Unit_Price, Min_Stock, Max_Stock, Description) VALUES (5, 'Carbon Black', 'kg', 1.25, 100, 200, 'Used as a pigment and filler in plastics.');

-- Inserting into Raw_Material_Stock table
INSERT INTO Raw_Material_Stock (Material_ID, Quantity) VALUES (1, 750);
INSERT INTO Raw_Material_Stock (Material_ID, Quantity) VALUES (2, 550);
INSERT INTO Raw_Material_Stock (Material_ID, Quantity) VALUES (3, 400);
INSERT INTO Raw_Material_Stock (Material_ID, Quantity) VALUES (4, 250);
INSERT INTO Raw_Material_Stock (Material_ID, Quantity) VALUES (5, 150);

-- Inserting into Product table
INSERT INTO Product (Product_ID, Product_Name, Production_Date, Expiry_Date, Wholesale_Price, Retail_Price, Min_Stock, Max_Stock) VALUES
(100, 'Plastic Bags', TO_DATE('2023-10-26', 'YYYY-MM-DD'), TO_DATE('2024-10-26', 'YYYY-MM-DD'), 0.50, 1.00, 1000, 2000);
INSERT INTO Product (Product_ID, Product_Name, Production_Date, Expiry_Date, Wholesale_Price, Retail_Price, Min_Stock, Max_Stock) VALUES
(101, 'Plastic Bottles', TO_DATE('2023-10-26', 'YYYY-MM-DD'), TO_DATE('2024-10-26', 'YYYY-MM-DD'), 1.25, 2.50, 500, 1000);
INSERT INTO Product (Product_ID, Product_Name, Production_Date, Expiry_Date, Wholesale_Price, Retail_Price, Min_Stock, Max_Stock) VALUES
(102, 'Plastic Tubs', TO_DATE('2023-10-26', 'YYYY-MM-DD'), TO_DATE('2024-10-26', 'YYYY-MM-DD'), 3.00, 5.00, 200, 400);
INSERT INTO Product (Product_ID, Product_Name, Production_Date, Expiry_Date, Wholesale_Price, Retail_Price, Min_Stock, Max_Stock) VALUES
(103, 'Plastic Sheeting', TO_DATE('2023-10-26', 'YYYY-MM-DD'), TO_DATE('2024-10-26', 'YYYY-MM-DD'), 2.00, 3.50, 300, 600);

-- Inserting into Product_Stock table
INSERT INTO Product_Stock (Product_ID, Quantity) VALUES (100, 1200);
INSERT INTO Product_Stock (Product_ID, Quantity) VALUES (101, 750);
INSERT INTO Product_Stock (Product_ID, Quantity) VALUES (102, 300);
INSERT INTO Product_Stock (Product_ID, Quantity) VALUES (103, 400);

-- Inserting into Machine table
INSERT INTO Machine (Machine_ID, Machine_Name, Daily_Capacity) VALUES (200, 'Extrusion Machine', 1000);
INSERT INTO Machine (Machine_ID, Machine_Name, Daily_Capacity) VALUES (201, 'Injection Molding', 500);
INSERT INTO Machine (Machine_ID, Machine_Name, Daily_Capacity) VALUES (202, 'Blow Molding Machine', 250);

-- Inserting into Product_Machine table
INSERT INTO Product_Machine (Product_ID, Machine_ID) VALUES (100, 200);
INSERT INTO Product_Machine (Product_ID, Machine_ID) VALUES (101, 201);
INSERT INTO Product_Machine (Product_ID, Machine_ID) VALUES (102, 202);
INSERT INTO Product_Machine (Product_ID, Machine_ID) VALUES (103, 200);

-- Inserting into Production table
INSERT INTO Production (Production_ID, Product_ID, Production_Date, Quantity_Produced, Production_Cost) VALUES
(300, 100, TO_DATE('2023-10-26', 'YYYY-MM-DD'), 500, 200.00);
INSERT INTO Production (Production_ID, Product_ID, Production_Date, Quantity_Produced, Production_Cost) VALUES
(301, 101, TO_DATE('2023-10-26', 'YYYY-MM-DD'), 250, 150.00);
INSERT INTO Production (Production_ID, Product_ID, Production_Date, Quantity_Produced, Production_Cost) VALUES
(302, 102, TO_DATE('2023-10-26', 'YYYY-MM-DD'), 100, 75.00);

-- Inserting into Production_Stage table
INSERT INTO Production_Stage (Stage_ID, Stage_Name) VALUES (400, 'Mixing');
INSERT INTO Production_Stage (Stage_ID, Stage_Name) VALUES (401, 'Extrusion');
INSERT INTO Production_Stage (Stage_ID, Stage_Name) VALUES (402, 'Injection Molding');
INSERT INTO Production_Stage (Stage_ID, Stage_Name) VALUES (403, 'Blow Molding');
INSERT INTO Production_Stage (Stage_ID, Stage_Name) VALUES (404, 'Packaging');

-- Inserting into Machine_Stage table
INSERT INTO Machine_Stage (Machine_ID, Stage_ID) VALUES (200, 401);
INSERT INTO Machine_Stage (Machine_ID, Stage_ID) VALUES (201, 402);
INSERT INTO Machine_Stage (Machine_ID, Stage_ID) VALUES (202, 403);

-- Inserting into Product_Stage table
INSERT INTO Product_Stage (Product_ID, Stage_ID, Stage_Order) VALUES (100, 400, 1);
INSERT INTO Product_Stage (Product_ID, Stage_ID, Stage_Order) VALUES (100, 401, 2);
INSERT INTO Product_Stage (Product_ID, Stage_ID, Stage_Order) VALUES (100, 404, 3);
INSERT INTO Product_Stage (Product_ID, Stage_ID, Stage_Order) VALUES (101, 400, 1);
INSERT INTO Product_Stage (Product_ID, Stage_ID, Stage_Order) VALUES (101, 402, 2);
INSERT INTO Product_Stage (Product_ID, Stage_ID, Stage_Order) VALUES (101, 404, 3);
INSERT INTO Product_Stage (Product_ID, Stage_ID, Stage_Order) VALUES (102, 400, 1);
INSERT INTO Product_Stage (Product_ID, Stage_ID, Stage_Order) VALUES (102, 403, 2);
INSERT INTO Product_Stage (Product_ID, Stage_ID, Stage_Order) VALUES (102, 404, 3);
INSERT INTO Product_Stage (Product_ID, Stage_ID, Stage_Order) VALUES (103, 400, 1);
INSERT INTO Product_Stage (Product_ID, Stage_ID, Stage_Order) VALUES (103, 401, 2);
INSERT INTO Product_Stage (Product_ID, Stage_ID, Stage_Order) VALUES (103, 404, 3);

-- Inserting into Product_BOM table
INSERT INTO Product_BOM (BOM_ID, Product_ID, Material_ID, Quantity) VALUES (500, 100, 1, 0.50);
INSERT INTO Product_BOM (BOM_ID, Product_ID, Material_ID, Quantity) VALUES (501, 101, 2, 0.75);
INSERT INTO Product_BOM (BOM_ID, Product_ID, Material_ID, Quantity) VALUES (502, 102, 3, 1.00);
INSERT INTO Product_BOM (BOM_ID, Product_ID, Material_ID, Quantity) VALUES (503, 103, 1, 1.50);

-- Inserting into Production_Quality table
INSERT INTO Production_Quality (Production_Quality_ID, Product_ID, Production_ID, Inspection_Date, Result, Notes) VALUES
(600, 100, 300, TO_DATE('2023-10-27', 'YYYY-MM-DD'), 'Passed', 'No defects found.');
INSERT INTO Production_Quality (Production_Quality_ID, Product_ID, Production_ID, Inspection_Date, Result, Notes) VALUES
(601, 101, 301, TO_DATE('2023-10-27', 'YYYY-MM-DD'), 'Passed', 'Minor scuffs on some bottles, but acceptable.');

-- Inserting into Defective_Product_Stock table
INSERT INTO Defective_Product_Stock (Production_ID, Product_ID, Quantity, Defect_Date, Defect_Reason, Wholesale_Price, Retail_Price) VALUES
(302, 102, 5, TO_DATE('2023-10-27', 'YYYY-MM-DD'), 'Crack in the plastic', 2.50, 4.00);

-- Inserting into Supplier table
INSERT INTO Supplier (Supplier_ID, Supplier_Name) VALUES (700, 'Petrochem Plastics');
INSERT INTO Supplier (Supplier_ID, Supplier_Name) VALUES (701, 'Global Polymers');
INSERT INTO Supplier (Supplier_ID, Supplier_Name) VALUES (702, 'Advanced Materials Solutions');

-- Inserting into Purchase_Order table
INSERT INTO Purchase_Order (Order_ID, Order_Date, Supplier_ID, Status) VALUES (800, TO_DATE('2023-10-25', 'YYYY-MM-DD'), 700, 'Pending Approval');
INSERT INTO Purchase_Order (Order_ID, Order_Date, Supplier_ID, Status) VALUES (801, TO_DATE('2023-10-26', 'YYYY-MM-DD'), 701, 'Approved');

-- Inserting into Purchase_Order_Item table
INSERT INTO Purchase_Order_Item (Order_Item_ID, Order_ID, Material_ID, Quantity) VALUES (900, 800, 1, 500);
INSERT INTO Purchase_Order_Item (Order_Item_ID, Order_ID, Material_ID, Quantity) VALUES (901, 800, 2, 300);
INSERT INTO Purchase_Order_Item (Order_Item_ID, Order_ID, Material_ID, Quantity) VALUES (902, 801, 3, 200);

-- Inserting into Customer table
INSERT INTO Customer (Customer_ID, Customer_Name) VALUES (1000, 'Packaging Plus');
INSERT INTO Customer (Customer_ID, Customer_Name) VALUES (1001, 'Food Mart');
INSERT INTO Customer (Customer_ID, Customer_Name) VALUES (1002, 'Home Depot');

-- Inserting into Sales_Order table
INSERT INTO Sales_Order (Order_ID, Order_Date, Customer_ID, Status) VALUES (1100, TO_DATE('2023-10-27', 'YYYY-MM-DD'), 1000, 'Processing');
INSERT INTO Sales_Order (Order_ID, Order_Date, Customer_ID, Status) VALUES (1101, TO_DATE('2023-10-27', 'YYYY-MM-DD'), 1001, 'Shipped');

-- Inserting into Sales_Order_Item table
INSERT INTO Sales_Order_Item (Order_Item_ID, Order_ID, Product_ID, Quantity) VALUES (1200, 1100, 100, 200);
INSERT INTO Sales_Order_Item (Order_Item_ID, Order_ID, Product_ID, Quantity) VALUES (1201, 1100, 101, 100);
INSERT INTO Sales_Order_Item (Order_Item_ID, Order_ID, Product_ID, Quantity) VALUES (1202, 1101, 102, 50);

-- Inserting into Department table
INSERT INTO Department (Department_ID, Department_Name) VALUES (1, 'Production');
INSERT INTO Department (Department_ID, Department_Name) VALUES (2, 'Quality Assurance');
INSERT INTO Department (Department_ID, Department_Name) VALUES (3, 'Sales');

-- Inserting into Employee table
INSERT INTO Employee (Employee_ID, Employee_Name, Department_ID, Role) VALUES (1, 'John Smith', 1, 'Production Manager');
INSERT INTO Employee (Employee_ID, Employee_Name, Department_ID, Role) VALUES (2, 'Mary Jones', 2, 'Quality Inspector');
INSERT INTO Employee (Employee_ID, Employee_Name, Department_ID, Role) VALUES (3, 'David Lee', 3, 'Sales Representative');