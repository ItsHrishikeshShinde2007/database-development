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

SELECT CustName
FROM Customers
WHERE CustID IN (
    SELECT CustID FROM Orders WHERE Amount > 1000
);

SELECT CustName
FROM Customers c
WHERE EXISTS (
    SELECT 1 FROM Orders o WHERE o.CustID = c.CustID
);

SELECT CustName
FROM Customers
WHERE CustID IN (
    SELECT CustID FROM Orders WHERE Amount > ANY (
        SELECT Amount FROM Orders WHERE CustID = 2
    )
);

SELECT CustName
FROM Customers
WHERE CustID IN (
    SELECT CustID FROM Orders WHERE Amount > ALL (
        SELECT Amount FROM Orders WHERE CustID = 5
    )
);

SELECT CustName FROM Customers WHERE City = 'Mumbai'
UNION
SELECT CustName FROM Customers WHERE City = 'Delhi';

SELECT CustName FROM Customers WHERE Status = 'Gold'
AND CustName IN (SELECT CustName FROM Customers WHERE City = 'Mumbai');

SELECT CustName FROM Customers WHERE City = 'Mumbai'
AND CustName NOT IN (SELECT CustName FROM Customers WHERE Status = 'Gold');