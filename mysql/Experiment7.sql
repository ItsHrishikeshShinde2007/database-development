DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS Customers;

CREATE TABLE Customers (
    CustID INT PRIMARY KEY AUTO_INCREMENT,
    CustName VARCHAR(50) NOT NULL,
    City VARCHAR(50),
    Status VARCHAR(10)
);

CREATE TABLE Orders (
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

SELECT * FROM Customers;
SELECT * FROM Orders;

SELECT COUNT(*) AS Total_Customers FROM Customers;
SELECT AVG(Amount) AS Average_Order_Value FROM Orders;
SELECT MAX(Amount) AS Highest_Order, MIN(Amount) AS Lowest_Order FROM Orders;

SELECT CustID, SUM(Amount) AS Total_Spent
FROM Orders
GROUP BY CustID;

SELECT CustID, SUM(Amount) AS Total_Spent
FROM Orders
GROUP BY CustID
HAVING SUM(Amount) > 1000;

SELECT c.CustName, c.City, o.OrderID, o.Amount
FROM Customers c
JOIN Orders o ON c.CustID = o.CustID;