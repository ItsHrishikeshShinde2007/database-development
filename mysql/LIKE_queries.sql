CREATE DATABASE IF NOT EXISTS LIKE_queries;

USE LIKE_queries;

DROP TABLE IF EXISTS foldable_phones;

CREATE TABLE foldable_phones (
    Phone_ID INT PRIMARY KEY AUTO_INCREMENT,
    Brand VARCHAR(50) NOT NULL,
    Model_Name VARCHAR(100) NOT NULL,
    Chipset VARCHAR(100),
    RAM_GB INT,
    Storage_GB INT,
    Main_Display VARCHAR(100),
    Cover_Display VARCHAR(100),
    Main_Camera_MP INT,
    Battery_mAh INT,
    Charging_W INT,
    Price_INR DECIMAL(12,2)
);

INSERT INTO foldable_phones
(Brand, Model_Name, Chipset, RAM_GB, Storage_GB, Main_Display,
 Cover_Display, Main_Camera_MP, Battery_mAh, Charging_W, Price_INR)
VALUES
('Samsung', 'Galaxy Z Fold7 Ultra', 'Snapdragon 8 Elite', 16, 1024,
 '8.2-inch Dynamic AMOLED 2X 2K 120Hz',
 '6.5-inch Dynamic AMOLED 2X 120Hz',
 200, 5200, 65, 219999.00),

('Google', 'Pixel Fold Pro XL', 'Google Tensor G5', 16, 512,
 '8.1-inch LTPO OLED 120Hz',
 '6.4-inch LTPO OLED 120Hz',
 108, 5000, 45, 199999.00),

('Huawei', 'Mate X7 Ultra', 'Kirin flagship platform', 16, 1024,
 '8.0-inch LTPO OLED 120Hz',
 '6.5-inch OLED 120Hz',
 200, 5500, 100, 189999.00),

('Xiaomi', 'Mix Fold 5 Ultra', 'Snapdragon 8 Elite', 16, 1024,
 '8.0-inch LTPO OLED 120Hz',
 '6.5-inch AMOLED 120Hz',
 200, 5600, 100, 179999.00),

('Oppo', 'Find N6 Pro', 'Snapdragon 8 Elite', 16, 1024,
 '8.1-inch LTPO AMOLED 120Hz',
 '6.5-inch AMOLED 120Hz',
 50, 5700, 100, 169999.00),

('Honor', 'Magic V6 Pro', 'Snapdragon 8 Elite', 16, 1024,
 '8.0-inch LTPO OLED 120Hz',
 '6.45-inch LTPO OLED 120Hz',
 200, 6100, 100, 159999.00);

SELECT * FROM foldable_phones;

SELECT DISTINCT Brand
FROM foldable_phones;

SELECT ALL Brand
FROM foldable_phones;

SELECT Model_Name, Price_INR
FROM foldable_phones
WHERE Brand = 'Samsung'
AND RAM_GB >= 16;

SELECT *
FROM foldable_phones p1, foldable_phones p2;

SELECT Model_Name
FROM foldable_phones
WHERE Model_Name LIKE '%Fold%';

SELECT *
FROM foldable_phones
WHERE Model_Name LIKE 'Galaxy%';

SELECT *
FROM foldable_phones
WHERE Model_Name LIKE '%Pro';

SELECT *
FROM foldable_phones
WHERE Model_Name LIKE '%Ultra%';

SELECT *
FROM foldable_phones
WHERE Model_Name LIKE 'V_%';

SELECT *
FROM foldable_phones
WHERE Model_Name LIKE 'M_%_%';

SELECT *
FROM foldable_phones
WHERE Model_Name LIKE 'G%XL';

SELECT *
FROM foldable_phones
WHERE Model_Name NOT LIKE 'S%';