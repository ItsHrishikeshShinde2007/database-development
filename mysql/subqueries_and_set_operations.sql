CREATE DATABASE IF NOT EXISTS subqueries_and_set_operations;

USE subqueries_and_set_operations;

DROP TABLE IF EXISTS monitor_orders;
DROP TABLE IF EXISTS monitors;

CREATE TABLE monitors (
    MonitorID INT PRIMARY KEY AUTO_INCREMENT,
    ModelName VARCHAR(100) NOT NULL,
    Brand VARCHAR(50) NOT NULL,
    Resolution VARCHAR(30),
    RefreshRate INT,
    Price_INR DECIMAL(10,2)
);

CREATE TABLE monitor_orders (
    OrderID INT PRIMARY KEY AUTO_INCREMENT,
    MonitorID INT,
    CustomerName VARCHAR(50) NOT NULL,
    City VARCHAR(50),
    OrderDate DATE,
    Amount DECIMAL(10,2),
    FOREIGN KEY (MonitorID) REFERENCES monitors(MonitorID)
);

INSERT INTO monitors (ModelName, Brand, Resolution, RefreshRate, Price_INR) VALUES
('ROG Swift OLED PG27AQDM', 'ASUS', '1440p', 240, 89999.00),
('Alienware AW3225QF', 'Dell', '4K', 240, 129999.00),
('Odyssey OLED G8', 'Samsung', '4K', 240, 149999.00),
('LG UltraGear OLED 32GS95UE', 'LG', '4K', 240, 119999.00),
('AW2725DF', 'Dell', '1440p', 360, 89999.00);

INSERT INTO monitor_orders (MonitorID, CustomerName, City, OrderDate, Amount) VALUES
(1, 'Aarav', 'Mumbai', '2026-09-01', 89999.00),
(2, 'Rohan', 'Delhi', '2026-09-02', 129999.00),
(3, 'Kabir', 'Pune', '2026-09-03', 149999.00),
(1, 'Vihaan', 'Mumbai', '2026-09-04', 89999.00),
(4, 'Arjun', 'Chennai', '2026-09-05', 119999.00);

SELECT CustomerName
FROM monitor_orders
WHERE MonitorID IN (
    SELECT MonitorID
    FROM monitors
    WHERE Price_INR > 120000
);

SELECT ModelName
FROM monitors m
WHERE EXISTS (
    SELECT 1
    FROM monitor_orders o
    WHERE o.MonitorID = m.MonitorID
);

SELECT ModelName
FROM monitors
WHERE MonitorID IN (
    SELECT MonitorID
    FROM monitor_orders
    WHERE Amount > ANY (
        SELECT Amount
        FROM monitor_orders
        WHERE City = 'Delhi'
    )
);

SELECT ModelName
FROM monitors
WHERE MonitorID IN (
    SELECT MonitorID
    FROM monitor_orders
    WHERE Amount > ALL (
        SELECT Amount
        FROM monitor_orders
        WHERE City = 'Mumbai'
    )
);

SELECT CustomerName
FROM monitor_orders
WHERE City = 'Mumbai'

UNION

SELECT CustomerName
FROM monitor_orders
WHERE City = 'Delhi';

SELECT CustomerName
FROM monitor_orders
WHERE City = 'Mumbai'
AND CustomerName IN (
    SELECT CustomerName
    FROM monitor_orders
    WHERE Amount > 80000
);

SELECT CustomerName
FROM monitor_orders
WHERE City = 'Mumbai'
AND CustomerName NOT IN (
    SELECT CustomerName
    FROM monitor_orders
    WHERE Amount > 100000
);