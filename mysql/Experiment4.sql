CREATE DATABASE IF NOT EXISTS Experiment4;
USE Experiment4;

DROP TABLE IF EXISTS drivers;
CREATE TABLE drivers (
  driver_id INT AUTO_INCREMENT PRIMARY KEY,
  driver_number INT UNIQUE,
  name VARCHAR(100) NOT NULL,
  team VARCHAR(150),
  championships INT DEFAULT 0,
  birth_date DATE,
  debut_year INT
);

INSERT INTO drivers (driver_number, name, team, championships, birth_date, debut_year) VALUES
  (1, 'Max Verstappen', 'Red Bull Racing', 4, '1997-09-30', 2015),
  (3, 'Michael Schumacher', 'Scuderia Ferrari', 7, '1969-01-03', 1991),
  (11, 'Daniel Ricciardo', 'McLaren', 1, '1989-07-01', 2008),
  (81, 'Oscar Piastri', 'McLaren', 0, '2001-04-06', 2023);

SELECT * FROM drivers;
SELECT name, team FROM drivers WHERE championships > 0 ORDER BY championships DESC;

ALTER TABLE drivers ADD COLUMN country VARCHAR(50);
UPDATE drivers SET country = 'Netherlands' WHERE name LIKE 'Max%';
UPDATE drivers SET championships = championships + 1 WHERE driver_number = 1;
SELECT * FROM drivers WHERE driver_number = 1;

ALTER TABLE drivers MODIFY COLUMN team VARCHAR(200);

DELETE FROM drivers WHERE driver_number = 11;

SELECT team, COUNT(*) AS num_drivers, MAX(championships) AS max_champs
  FROM drivers
  GROUP BY team;

DESCRIBE drivers;

START TRANSACTION;
  INSERT INTO drivers (driver_number, name, team) VALUES (99, 'Temp Driver', 'Test Team');
ROLLBACK;

START TRANSACTION;
  INSERT INTO drivers (driver_number, name, team) VALUES (100, 'Committed Driver', 'Test Team');
COMMIT;