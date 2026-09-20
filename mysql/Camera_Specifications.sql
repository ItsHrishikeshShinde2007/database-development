CREATE DATABASE IF NOT EXISTS Camera_Specifications;

USE Camera_Specifications;

DROP TABLE IF EXISTS cameras;
DROP TABLE IF EXISTS camera_brands;
DROP TABLE IF EXISTS customers;

CREATE TABLE camera_brands (
    Brand_ID INT NOT NULL,
    Brand_Name VARCHAR(50) NOT NULL,
    Country VARCHAR(50),
    CONSTRAINT Camera_Brands_PK PRIMARY KEY (Brand_ID)
);

CREATE TABLE cameras (
    Camera_ID INT NOT NULL,
    Brand_ID INT NOT NULL,
    Model_Name VARCHAR(100) NOT NULL,
    Sensor_Type VARCHAR(50),
    Resolution_MP DECIMAL(5,2),
    Max_FPS INT,
    Price_INR DECIMAL(10,2),
    CONSTRAINT Cameras_PK PRIMARY KEY (Camera_ID),
    CONSTRAINT FK_Camera_Brand FOREIGN KEY (Brand_ID)
        REFERENCES camera_brands(Brand_ID)
);

CREATE TABLE customers (
    Customer_ID INT PRIMARY KEY,
    Customer_Name VARCHAR(50) NOT NULL,
    Customer_Type VARCHAR(20) NOT NULL,
    Customer_Code INT UNIQUE,
    CONSTRAINT chk_customer_code CHECK (Customer_Code > 10)
);

INSERT INTO camera_brands VALUES
    (1, 'Sony', 'Japan'),
    (2, 'Canon', 'Japan'),
    (3, 'Nikon', 'Japan'),
    (4, 'Fujifilm', 'Japan');

INSERT INTO cameras VALUES
    (101, 1, 'ZV-E10 II', 'APS-C', 26.00, 120, 99990.00),
    (102, 1, 'A7 IV', 'Full Frame', 33.00, 120, 219990.00),
    (103, 2, 'EOS R6 Mark II', 'Full Frame', 24.20, 180, 239990.00),
    (104, 3, 'Z6 III', 'Full Frame', 24.50, 120, 234990.00);

INSERT INTO customers VALUES
    (1, 'Amit', 'Creator', 11),
    (2, 'Sneha', 'Professional', 12),
    (3, 'Rahul', 'Enthusiast', 13);

SELECT * FROM camera_brands;

SELECT * FROM cameras;

SELECT * FROM customers;