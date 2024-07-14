-- Insert data into Products table
Insert Into Product (P_Name, Specifications, Productiondate, Expirydate, Wholesaleprice, Retailprice, Deffective_Price)
Values ('Product1', 'Spec1', '1/1/2022', '1/1/2023', 50.00, 75.00, 30.00);
Insert Into Product (P_Name, Specifications, Productiondate, Expirydate, Wholesaleprice, Retailprice, Deffective_Price)
VALUES ('Product2', 'Spec2', '1/1/2022', '1/1/2023', 40.00, 60.0, 20.00);

-- Insert data into Departments table
INSERT INTO Departments (D_Name) VALUES ('Sales');
INSERT INTO Departments (D_Name) VALUES ('Purchasement');

-- Insert data into PurchaseOrder table
INSERT INTO Purchaseorder (Departmentid, Purchasedate) VALUES (2, '1/1/2023');

-- Insert data into SalesOrder table
INSERT INTO Salesorder (Departmentid, Salesdate) VALUES (1, '1/1/2023');

-- Insert data into Warehouse table
Insert Into Warehouse (W_Location, Capacity) Values ('Location1', 1000);
Insert Into Warehouse (W_Location, Capacity) Values ('Location2', 1000);
INSERT INTO Warehouse (W_Location, Capacity) VALUES ('Location3', 1000);

-- Insert data into Rawmaterial table
Insert Into Rawmaterial (M_Name, Supplier, Warehouseid, Minlimit, Maxlimit) Values ('Material1', 'Supplier1', 1, 100, 500);
Insert Into Rawmaterial (M_Name, Supplier, Warehouseid, Minlimit, Maxlimit) Values ('Material2', 'Supplier2', 1, 100, 500);
INSERT INTO Rawmaterial (M_Name, Supplier, Warehouseid, Minlimit, Maxlimit) VALUES ('Material3', 'Supplier1', 1, 100, 500);

-- Insert data into Machine table
INSERT INTO Machine (M_Name, Capacity) VALUES ('Machine1', 100);

-- Insert data into Purchased_Rawmaterial table
Insert Into Purchased_Rawmaterial (Rawmaterialid, Purchaseorderid, Quantity) Values (1, 1, 200);
Insert Into Purchased_Rawmaterial (Rawmaterialid, Purchaseorderid, Quantity) Values (2, 1, 200);
INSERT INTO Purchased_Rawmaterial (Rawmaterialid, Purchaseorderid, Quantity) VALUES (3, 1, 200);

-- Insert data into Sold_Products table
INSERT INTO Sold_Products (Productid, Salesorderid, Quantity) VALUES (1, 1, 50);

-- Insert data into Product_Rawmaterial table
Insert Into Product_Rawmaterial (Rawmaterialid, Productid, Quantity) Values (1, 1, 100);
Insert Into Product_Rawmaterial (Rawmaterialid, Productid, Quantity) Values (2, 1, 100);
INSERT INTO Product_Rawmaterial (Rawmaterialid, Productid, Quantity) VALUES (3, 2, 100);

-- Insert data into Productmachine table
INSERT INTO Productmachine (Productid, Machineid) VALUES (1, 1);

