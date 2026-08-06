CREATE DATABASE IF NOT EXISTS F1_drivers;

USE F1_drivers;

DROP TABLE IF EXISTS drivers;

CREATE TABLE drivers(
    Driver_Number INT PRIMARY KEY,
    Name VARCHAR (100) NOT NULL,
    Team VARCHAR (100),
    Championships INT
);

INSERT INTO drivers VALUES
(1,"Max Verstappen","Red Bull Racing Formula 1 Team",4),
(3,"Micheal Schumacher","Ferrari",7),
(11,"Daniel Ricciardo","Infiniti Red Bull Racing",0),
(81,"Oscar Piastri","McLaren Mastercard F1 Team",0);

SELECT * FROM drivers;