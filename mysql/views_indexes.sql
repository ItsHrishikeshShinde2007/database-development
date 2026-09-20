CREATE DATABASE IF NOT EXISTS views_indexes;

USE views_indexes;

DROP VIEW IF EXISTS premium_adventure_bikes;

DROP TABLE IF EXISTS bike_orders;
DROP TABLE IF EXISTS adventure_bikes;

CREATE TABLE adventure_bikes (
    BikeID INT PRIMARY KEY AUTO_INCREMENT,
    ModelName VARCHAR(100) NOT NULL,
    Brand VARCHAR(50) NOT NULL,
    Engine_CC INT,
    Power_BHP DECIMAL(5,2),
    Torque_NM DECIMAL(5,2),
    Fuel_Tank_L DECIMAL(5,2),
    Ground_Clearance_MM INT,
    Price_INR DECIMAL(10,2)
);

CREATE TABLE bike_orders (
    OrderID INT PRIMARY KEY AUTO_INCREMENT,
    BikeID INT,
    CustomerName VARCHAR(50) NOT NULL,
    City VARCHAR(50),
    OrderDate DATE,
    Amount DECIMAL(10,2),
    FOREIGN KEY (BikeID) REFERENCES adventure_bikes(BikeID)
);

INSERT INTO adventure_bikes (
    ModelName,
    Brand,
    Engine_CC,
    Power_BHP,
    Torque_NM,
    Fuel_Tank_L,
    Ground_Clearance_MM,
    Price_INR
) VALUES
('Himalayan 450', 'Royal Enfield', 452, 40.02, 40.00, 17.00, 230, 290000.00),
('390 Adventure', 'KTM', 399, 46.00, 39.00, 14.50, 227, 330000.00),
('Xpulse 210', 'Hero', 210, 24.60, 20.70, 13.00, 220, 175000.00),
('Xpulse 200 4V', 'Hero', 199, 18.90, 17.35, 13.00, 220, 155000.00),
('Adventure', 'Yezdi', 334, 29.60, 29.90, 15.50, 220, 215000.00),
('Scrambler 400 X', 'Triumph', 398, 39.50, 37.50, 13.00, 195, 264000.00);

INSERT INTO bike_orders (
    BikeID,
    CustomerName,
    City,
    OrderDate,
    Amount
) VALUES
(1, 'Aarav', 'Mumbai', '2026-09-01', 290000.00),
(2, 'Rohan', 'Delhi', '2026-09-02', 330000.00),
(3, 'Kabir', 'Pune', '2026-09-03', 175000.00),
(4, 'Vihaan', 'Mumbai', '2026-09-04', 155000.00),
(5, 'Arjun', 'Chennai', '2026-09-05', 215000.00);

CREATE OR REPLACE VIEW premium_adventure_bikes AS
SELECT
    b.ModelName,
    b.Brand,
    b.Engine_CC,
    b.Power_BHP,
    b.Torque_NM,
    b.Fuel_Tank_L,
    b.Ground_Clearance_MM,
    b.Price_INR,
    o.CustomerName,
    o.City
FROM adventure_bikes b
JOIN bike_orders o
    ON b.BikeID = o.BikeID
WHERE b.Price_INR > 250000;

SELECT * FROM premium_adventure_bikes;

CREATE INDEX idx_bike_brand
ON adventure_bikes(Brand);

START TRANSACTION;

INSERT INTO bike_orders (
    BikeID,
    CustomerName,
    City,
    OrderDate,
    Amount
) VALUES
(1, 'Dev', 'Mumbai', '2026-09-06', 290000.00);

SELECT * FROM bike_orders;

ROLLBACK;

SELECT * FROM bike_orders;

START TRANSACTION;

INSERT INTO bike_orders (
    BikeID,
    CustomerName,
    City,
    OrderDate,
    Amount
) VALUES
(2, 'Aditya', 'Nashik', '2026-09-07', 330000.00);

COMMIT;

SELECT * FROM bike_orders;