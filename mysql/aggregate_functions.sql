CREATE DATABASE IF NOT EXISTS aggregate_functions;

USE aggregate_functions;

DROP TABLE IF EXISTS mechanical_keyboards;
DROP TABLE IF EXISTS keyboard_brands;

CREATE TABLE keyboard_brands (
    BrandID INT PRIMARY KEY AUTO_INCREMENT,
    BrandName VARCHAR(50) NOT NULL,
    Country VARCHAR(50)
);

CREATE TABLE mechanical_keyboards (
    KeyboardID INT PRIMARY KEY AUTO_INCREMENT,
    BrandID INT,
    ModelName VARCHAR(100) NOT NULL,
    SwitchType VARCHAR(100),
    Keycaps VARCHAR(100),
    Layout VARCHAR(20),
    Connection VARCHAR(50),
    Price_INR DECIMAL(10,2),
    FOREIGN KEY (BrandID) REFERENCES keyboard_brands(BrandID)
);

INSERT INTO keyboard_brands (BrandName, Country) VALUES
('Keychron', 'Hong Kong'),
('Wooting', 'Netherlands'),
('ASUS ROG', 'Taiwan'),
('Razer', 'USA'),
('NuPhy', 'China');

INSERT INTO mechanical_keyboards
(BrandID, ModelName, SwitchType, Keycaps, Layout, Connection, Price_INR)
VALUES
(1, 'Q1 HE', 'Gateron Double-Rail Magnetic', 'Double-shot PBT',
 '75%', 'Wireless / USB-C', 21190.00),

(1, 'Q1 HE 8K', 'Magnetic Hall Effect', 'Double-shot PBT',
 '75%', 'USB-C', 24999.00),

(2, '80HE', 'Lekker V2 Hall Effect', 'Double-shot PBT',
 '80% TKL', 'USB-C', 30000.00),

(3, 'ROG Azoth', 'ROG NX Red / NX Blue / NX Snow',
 'PBT Double-shot', '75%', 'Wireless / USB-C', 22000.00),

(4, 'Huntsman V3 HE', 'Razer Analog Optical',
 'Doubleshot PBT', '80% TKL', 'USB-C', 15499.00),

(5, 'Field75 HE', 'Gateron Magnetic',
 'Double-shot PBT', '75%', 'Wireless / USB-C', 24000.00);

SELECT * FROM keyboard_brands;

SELECT * FROM mechanical_keyboards;

SELECT COUNT(*) AS Total_Keyboards
FROM mechanical_keyboards;

SELECT AVG(Price_INR) AS Average_Keyboard_Price
FROM mechanical_keyboards;

SELECT
    MAX(Price_INR) AS Highest_Price,
    MIN(Price_INR) AS Lowest_Price
FROM mechanical_keyboards;

SELECT
    BrandID,
    SUM(Price_INR) AS Total_Product_Value
FROM mechanical_keyboards
GROUP BY BrandID;

SELECT
    BrandID,
    SUM(Price_INR) AS Total_Product_Value
FROM mechanical_keyboards
GROUP BY BrandID
HAVING SUM(Price_INR) > 40000;

SELECT
    b.BrandName,
    b.Country,
    k.ModelName,
    k.SwitchType,
    k.Keycaps,
    k.Layout,
    k.Price_INR
FROM keyboard_brands b
JOIN mechanical_keyboards k
    ON b.BrandID = k.BrandID;