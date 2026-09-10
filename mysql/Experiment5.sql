CREATE TABLE Supplier (
    Supplier_ID INT NOT NULL,
    Supplier_Name VARCHAR(50) NOT NULL,
    Contact_Name VARCHAR(50),
    CONSTRAINT Supplier_PK PRIMARY KEY (Supplier_ID)
);

CREATE TABLE Products (
    Product_ID INT NOT NULL,
    Supplier_ID INT NOT NULL,
    CONSTRAINT Products_PK PRIMARY KEY (Product_ID),
    CONSTRAINT FK_Supplier FOREIGN KEY (Supplier_ID)
        REFERENCES Supplier(Supplier_ID)
);

CREATE TABLE Customer (
    CustID INT PRIMARY KEY,
    CustName VARCHAR(10) NOT NULL,
    Status VARCHAR(5) NOT NULL,
    SID INT UNIQUE,
    CONSTRAINT chk_sid CHECK (SID > 10)
);

INSERT INTO Supplier VALUES (1, 'ABC Traders', 'Ramesh');
INSERT INTO Supplier VALUES (2, 'XYZ Distributors', 'Suresh');

INSERT INTO Products VALUES (101, 1);
INSERT INTO Products VALUES (102, 2);

INSERT INTO Customer VALUES (1, 'Amit', 'Gold', 11);
INSERT INTO Customer VALUES (2, 'Sneha', 'Silver', 12);
INSERT INTO Customer VALUES (3, 'Rahul', 'Platinum', 13);

SELECT * FROM Supplier;
SELECT * FROM Products;
SELECT * FROM Customer;
