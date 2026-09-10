CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerName VARCHAR(100) NOT NULL,
    ContactName VARCHAR(100),
    CustomerStreet VARCHAR(100),
    Branch_Name VARCHAR(50),
    Loan_Number INT,
    Amount DECIMAL(10,2)
);

INSERT INTO Customers (CustomerName, ContactName, CustomerStreet, Branch_Name, Loan_Number, Amount) VALUES
('Amit', 'Ramesh', 'Main Road', 'Perryridge', 101, 1500.00),
('Sneha', 'Suresh', 'High Street', 'Downtown', 102, 900.00),
('Rahul', 'Mahesh', 'Main Avenue', 'Perryridge', 103, 2000.00),
('Anita', 'Kiran', 'Lake View', 'Uptown', 104, 1200.00),
('Arjun', 'Vikas', 'Market Road', 'Perryridge', 105, 800.00);

SELECT Branch_Name FROM Customers;
SELECT DISTINCT Branch_Name FROM Customers;
SELECT ALL Branch_Name FROM Customers;

SELECT Loan_Number FROM Customers
WHERE Branch_Name = 'Perryridge' AND Amount > 1200;

SELECT * FROM Customers c1, Customers c2;

SELECT CustomerName FROM Customers WHERE CustomerStreet LIKE '%Main%';
SELECT * FROM Customers WHERE CustomerName LIKE 'A%';
SELECT * FROM Customers WHERE CustomerName LIKE '%a';
SELECT * FROM Customers WHERE CustomerName LIKE '%or%';
SELECT * FROM Customers WHERE CustomerName LIKE '_r%';
SELECT * FROM Customers WHERE CustomerName LIKE 'a_%_%';
SELECT * FROM Customers WHERE ContactName LIKE 'a%o';
SELECT * FROM Customers WHERE CustomerName NOT LIKE 'a%';