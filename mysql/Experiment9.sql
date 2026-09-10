CREATE TABLE Customers (
    CustID INT PRIMARY KEY AUTO_INCREMENT,
    CustName VARCHAR(50) NOT NULL,
    City VARCHAR(50),
    Status VARCHAR(10)
);

CREATE TABLE Orders
(
    OrderID INT PRIMARY KEY AUTO_INCREMENT,
    CustID INT,
    OrderDate DATE,
    Amount DECIMAL(10,2),
    FOREIGN KEY (CustID) REFERENCES Customers(CustID)
);

INSERT INTO Customers (CustName, City, Status) VALUES
('Amit', 'Mumbai', 'Gold'),
('Sneha', 'Delhi', 'Silver'),
('Rahul', 'Pune', 'Platinum'),
('Anita', 'Mumbai', 'Gold'),
('Arjun', 'Chennai', 'Silver');

INSERT INTO Orders (CustID, OrderDate, Amount) VALUES
(1, '2026-09-01', 1500.00),
(2, '2026-09-02', 800.00),
(3, '2026-09-03', 2000.00),
(1, '2026-09-04', 500.00),
(4, '2026-09-05', 1200.00);

CREATE OR REPLACE VIEW HighValueCustomers AS
SELECT c.CustName, c.City, o.Amount
FROM Customers c
JOIN Orders o ON c.CustID = o.CustID
WHERE o.Amount > 1000;

SELECT * FROM HighValueCustomers;

CREATE INDEX idx_city ON Customers(City);

START TRANSACTION;

INSERT INTO Orders (CustID, OrderDate, Amount) VALUES (2, '2026-09-06', 2500.00);

SELECT * FROM Orders;

ROLLBACK;

SELECT * FROM Orders;

START TRANSACTION;
INSERT INTO Orders (CustID, OrderDate, Amount) VALUES (5, '2026-09-07', 1800.00);
COMMIT;

SELECT * FROM Orders;