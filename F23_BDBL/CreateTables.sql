-- Raw Material Table
CREATE TABLE Raw_Material (
  Material_ID INT PRIMARY KEY,
  Material_Name VARCHAR(255) NOT NULL,
  Unit_Of_Measure VARCHAR(50) NOT NULL,
  Unit_Price DECIMAL(10,2) NOT NULL,
  Min_Stock INT,
  Max_Stock INT,
  Description VARCHAR(255)
);

-- Raw Material Stock
CREATE TABLE Raw_Material_Stock (
  Material_ID INT PRIMARY KEY,
  Quantity INT NOT NULL,
  FOREIGN KEY (Material_ID) REFERENCES Raw_Material(Material_ID)
);

-- Product Table
CREATE TABLE Product (
  Product_ID INT PRIMARY KEY,
  Product_Name VARCHAR(255) NOT NULL,
  Production_Date DATE,
  Expiry_Date DATE,
  Wholesale_Price DECIMAL(10,2),
  Retail_Price DECIMAL(10,2),
  Min_Stock INT,
  Max_Stock INT
);

-- Product Stock
CREATE TABLE Product_Stock (
  Product_ID INT PRIMARY KEY,
  Quantity INT NOT NULL,
  FOREIGN KEY (Product_ID) REFERENCES Product(Product_ID)
);

-- Machine Table
CREATE TABLE Machine (
  Machine_ID INT PRIMARY KEY,
  Machine_Name VARCHAR(255) NOT NULL,
  Daily_Capacity INT
);

-- Product_Machine
CREATE TABLE Product_Machine (
  Product_ID INT,
  Machine_ID INT,
  PRIMARY KEY (Product_ID, Machine_ID),
  FOREIGN KEY (Product_ID) REFERENCES Product(Product_ID),
  FOREIGN KEY (Machine_ID) REFERENCES Machine(Machine_ID)
);

-- Production 
CREATE TABLE Production (
  Production_ID INT PRIMARY KEY,
  Product_ID INT NOT NULL,
  Production_Date DATE NOT NULL,
  Quantity_Produced INT NOT NULL,
  Production_Cost DECIMAL(10,2),
  FOREIGN KEY (Product_ID) REFERENCES Product(Product_ID)
);

   CREATE TABLE Production_Stage (
       Stage_ID INT PRIMARY KEY,
       Stage_Name VARCHAR(255) NOT NULL
   );
   
   CREATE TABLE Machine_Stage (
       Machine_ID INT,
       Stage_ID INT,
       PRIMARY KEY (Machine_ID, Stage_ID),
       FOREIGN KEY (Machine_ID) REFERENCES Machine(Machine_ID),
       FOREIGN KEY (Stage_ID) REFERENCES Production_Stage(Stage_ID)
   );
   
   CREATE TABLE Product_Stage (
       Product_ID INT,
       Stage_ID INT,
       Stage_Order INT, -- Order of the stage in the production process
       PRIMARY KEY (Product_ID, Stage_ID),
       FOREIGN KEY (Product_ID) REFERENCES Product(Product_ID),
       FOREIGN KEY (Stage_ID) REFERENCES Production_Stage(Stage_ID)
   );
   

-- Product BOM (Bill of Materials)
CREATE TABLE Product_BOM (
    BOM_ID INT PRIMARY KEY,
    Product_ID INT NOT NULL,
    Material_ID INT NOT NULL,
    Quantity DECIMAL(10,2) NOT NULL,  
    FOREIGN KEY (Product_ID) REFERENCES Product(Product_ID),
    FOREIGN KEY (Material_ID) REFERENCES Raw_Material(Material_ID)
);



Create Table Production_Quality(
  Production_Quality_ID INT PRIMARY KEY,
  Product_ID INT NOT NULL,
  Production_ID INT NOT NULL,
  Inspection_Date DAte NOT NULL,
  Result varchar2(255) Not Null,
  Notes varchar2(255),
  FOREIGN KEY (Product_ID) REFERENCES Product(Product_ID),
  FOREIGN KEY (Production_ID) REFERENCES Production(Production_ID)
);

-- Defective Products 
CREATE TABLE Defective_Product_Stock (
  Production_ID INT NOT NULL,
  Product_ID INT NOT NULL ,
  Quantity INT NOT NULL,
  Defect_Date DATE NOT NULL,
  Defect_Reason VARCHAR(255),
  Wholesale_Price DECIMAL(10,2),
  Retail_Price DECIMAL(10,2),
  PRIMARY KEY (Production_ID,Product_ID),
  FOREIGN KEY (Product_ID) REFERENCES Product(Product_ID),
  FOREIGN KEY (Production_ID) REFERENCES Production(Production_ID)
);

-- Supplier Table
CREATE TABLE Supplier (
  Supplier_ID INT PRIMARY KEY,
  Supplier_Name VARCHAR(255) NOT NULL
);

-- Purchase Order
CREATE TABLE Purchase_Order (
  Order_ID INT PRIMARY KEY,
  Order_Date DATE NOT NULL,
  Supplier_ID INT NOT NULL,
  Status VARCHAR(50) ,
  FOREIGN KEY (Supplier_ID) REFERENCES Supplier(Supplier_ID)
);

-- Purchase Order Item
CREATE TABLE Purchase_Order_Item (
  Order_Item_ID INT PRIMARY KEY,
  Order_ID INT NOT NULL,
  Material_ID INT NOT NULL,
  Quantity INT NOT NULL,
  FOREIGN KEY (Order_ID) REFERENCES Purchase_Order(Order_ID),
  FOREIGN KEY (Material_ID) REFERENCES Raw_Material(Material_ID)
);

-- Customer Table
CREATE TABLE Customer(
  Customer_ID INT PRIMARY KEY,
  Customer_Name VARCHAR(255) Not Null
);

-- Sales Order
CREATE TABLE Sales_Order (
  Order_ID INT PRIMARY KEY,
  Order_Date DATE NOT NULL,
  Customer_ID INT, 
  Status VARCHAR(255) ,
  FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID)
);

-- Sales Order Item 
CREATE TABLE Sales_Order_Item (
  Order_Item_ID INT PRIMARY KEY,
  Order_ID INT NOT NULL,
  Product_ID INT NOT NULL,
  Quantity INT NOT NULL,
  FOREIGN KEY (Order_ID) REFERENCES Sales_Order(Order_ID),
  FOREIGN KEY (Product_ID) REFERENCES Product(Product_ID)
);

-- Department (purchasing, quality assurance, and sales)
CREATE TABLE Department (
  Department_ID INT PRIMARY KEY,
  Department_Name VARCHAR(255) NOT NULL
);

-- Employee 
CREATE TABLE Employee (
  Employee_ID INT PRIMARY KEY,
  Employee_Name VARCHAR(255) NOT NULL,
  Department_ID INT,
  Role VARCHAR(255),
  FOREIGN KEY (Department_ID) REFERENCES Department(Department_ID)
);


drop table Employee cascade constraints;
drop table Department cascade constraints;
drop table Sales cascade constraints;
drop table Sales_Order_Item cascade constraints;
drop table Sales_Order cascade constraints;
drop table Customer cascade constraints;
drop table Production_Quality cascade constraints;
drop table Defective_Product_Stock cascade constraints;
drop table Product_BOM cascade constraints;
drop table Production cascade constraints;
drop table Product_Stock cascade constraints;
drop table Raw_Material_Stock cascade constraints;
drop table Purchase_Order_Item cascade constraints;
drop table Purchase_Order cascade constraints;
drop table Product cascade constraints;
drop table Machine cascade constraints;
drop table Raw_Material cascade constraints;
drop table Supplier cascade constraints;
drop table Product_Machine cascade constraints;
drop table  Production_Stage cascade constraints;
drop table Product_Stage cascade constraints;