CREATE DATABASE GRNDatabase;

USE GRNDatabase;

-- Creating Supplier Table
CREATE TABLE Supplier (
    Supplier_ID INT PRIMARY KEY IDENTITY(1,1),
    Supplier_Name VARCHAR(100),
    Supplier_Address VARCHAR(255),
    Supplier_Contact VARCHAR(20)
);

-- Creating GRN Table
CREATE TABLE GRN (
    GRN_ID INT PRIMARY KEY IDENTITY(1,1),
    GRN_Number VARCHAR(50),
    GRN_Date DATETIME,
    Supplier_ID INT,
    FOREIGN KEY (Supplier_ID) REFERENCES Supplier(Supplier_ID)
);

-- Creating Received_Items Table
CREATE TABLE Received_Items (
    Received_Item_ID INT PRIMARY KEY IDENTITY(1,1),
    GRN_ID INT,
    Item_Name VARCHAR(100),
    Quantity INT,
    Description VARCHAR(255),
    FOREIGN KEY (GRN_ID) REFERENCES GRN(GRN_ID)
);

INSERT INTO Supplier (Supplier_Name, Supplier_Address, Supplier_Contact) VALUES ('ABC Supplier', '123 Main Street, Moratuwa', '0714913600');
INSERT INTO Supplier (Supplier_Name, Supplier_Address, Supplier_Contact) VALUES ('XYZ Supplier', '456 Park Street, Colombo 07', '0254867721');

INSERT INTO GRN (GRN_Number, GRN_Date, Supplier_ID) VALUES ('GRN001', '2024-03-12', 1);
INSERT INTO GRN (GRN_Number, GRN_Date, Supplier_ID) VALUES ('GRN002', '2024-03-13', 2);

INSERT INTO Received_Items (GRN_ID, Item_Name, Quantity, Description) VALUES (1, 'Laptop', 10, 'Description of Laptop');
INSERT INTO Received_Items (GRN_ID, Item_Name, Quantity, Description) VALUES (1, 'Television', 20, 'Description of Television');
INSERT INTO Received_Items (GRN_ID, Item_Name, Quantity, Description) VALUES (2, 'Mouse', 15, 'Description of Mouse');

SELECT * FROM Received_Items
SELECT * FROM GRN
SELECT * FROM Supplier

SELECT GRN.GRN_Number, GRN.GRN_Date, Supplier.Supplier_Name FROM GRN JOIN Supplier ON GRN.Supplier_ID = Supplier.Supplier_ID

--Stored procedure to retrieve details for the crystal report
CREATE PROCEDURE GetGRNDetails
    @GRN_ID INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT GRN.GRN_Number, 
           GRN.GRN_Date, 
           Supplier.Supplier_Name, 
           Supplier.Supplier_Address, 
           Supplier.Supplier_Contact,
           Received_Items.Item_Name,
           Received_Items.Quantity,
           Received_Items.Description
    FROM GRN
    JOIN Supplier ON GRN.Supplier_ID = Supplier.Supplier_ID
    JOIN Received_Items ON GRN.GRN_ID = Received_Items.GRN_ID
    WHERE GRN.GRN_ID = @GRN_ID;
END;

EXEC GetGRNDetails @GRN_ID = 2; 
