DROP DATABASE IF EXISTS asset_managment;
CREATE DATABASE asset_managment;
USE asset_managment;

DROP TABLE IF EXISTS employees;
CREATE TABLE employees
(
  id int(255) AUTO_INCREMENT,
  name varchar(200),
  PRIMARY KEY(id)
);

LOCK TABLES employees WRITE;
INSERT INTO employees(name) values('Alice'),('Bob'),('Chris'),('Duke'),('Emily');
UNLOCK TABLES;

DROP TABLE IF EXISTS assets;
CREATE TABLE assets
(
  id int(255) AUTO_INCREMENT,
  name varchar(200),
  date_of_purchase DATE,
  make varchar(200),
  warranty int(6),  #years
  status enum('assigned','not assigned','repair','Shared') DEFAULT 'not assigned',
  PRIMARY KEY(id)
);

LOCK TABLES assets WRITE;
INSERT INTO assets(id,name,date_of_purchase,make,warranty,status) values(1,'Laptop A','2011-01-01','Dell',2,'assigned'),(2,'Laptop B','2011-01-01','Sony',4,'not assigned'),(3,'Laptop N1',DATE_ADD(CURDATE(),INTERVAL 1 YEAR),'MAC',5,'not assigned'),(4,'Laptop N2',DATE_ADD(CURDATE(),INTERVAL 1 YEAR),'MAC',5,'not assigned'),(5,'Iphone A','2011-03-01','Apple',1,'assigned'),(6,'Iphone B','2011-01-01','Apple',1,'assigned'),(7,'Projector A','2011-08-15','DigiMax',10,'shared'),(8,'Printer A','2011-08-15','Canon',10,'shared'),(9,'Printer B','2011-09-10','Canon',10,'not assigned');
UNLOCK TABLES;


DROP TABLE IF EXISTS assigned_assets;
CREATE TABLE assigned_assets
(
  id int(255) AUTO_INCREMENT,
  assets_id int(255),
  employees_id int(255),
  from_date DATE,
  till DATE,
  PRIMARY KEY (id),
  FOREIGN KEY (employees_id) REFERENCES employees(id),
  FOREIGN KEY (assets_id) REFERENCES assets(id)
);

LOCK TABLES assigned_assets WRITE;
INSERT INTO assigned_assets(assets_id,employees_id,from_date,till) values (1,1,'2011-01-01','2011-01-31'),(1,2,'2012-01-01',DATE_ADD(CURDATE(),INTERVAL 1 YEAR)),(2,2,'2011-01-01','2011-01-31'),(5,1,'2011-03-01',DATE_ADD(CURDATE(),INTERVAL 1 YEAR)),(6,2,'2011-01-01',DATE_ADD(CURDATE(),INTERVAL 1 YEAR));
UNLOCK TABLES;

DROP TABLE IF EXISTS shared_assets;
CREATE TABLE shared_assets
(
  id int(255) AUTO_INCREMENT,
  assets_id int(255),
  kept_at varchar(200),
  kept_from DATE,
  PRIMARY KEY (id),
  FOREIGN KEY (assets_id) REFERENCES assets(id)
);

LOCK TABLES shared_assets WRITE;
INSERT INTO shared_assets(assets_id,kept_at,kept_from) values (8,'Meeting Room','2011-08-15');
UNLOCK TABLES;

DROP TABLE IF EXISTS on_repair_assets;
CREATE TABLE on_repair_assets
(
  id int(255) AUTO_INCREMENT,
  assets_id int(255),
  cost float(20),
  defect text,
  warranty_in_years int(6), #MAX 5
  PRIMARY KEY (id),
  FOREIGN KEY (assets_id) REFERENCES assets(id)
);

DELIMITER $$
DROP TRIGGER IF EXISTS checkWarrantyRange;
CREATE TRIGGER checkWarrantyRange BEFORE INSERT ON on_repair_assets
FOR EACH ROW 
  BEGIN
    IF (NEW.warranty_in_years > 5 || NEW.warranty_in_years < 0) THEN
      SET NEW.warranty_in_years = 0;
    END IF;
  END$$ 
DELIMITER ;

DELIMITER $$
DROP TRIGGER IF EXISTS changeAssignedStatus;
CREATE TRIGGER changeAssignedStatus AFTER INSERT ON assigned_assets
FOR EACH ROW 
  BEGIN
    UPDATE assets
    SET status = 'assigned' WHERE id = NEW.assets_id;
  END$$ 
DELIMITER ;

DELIMITER $$
DROP TRIGGER IF EXISTS changeRepairStatus;
CREATE TRIGGER changeRepairStatus AFTER INSERT ON on_repair_assets
FOR EACH ROW 
  BEGIN
    UPDATE assets
    SET status = 'repair' WHERE id = NEW.assets_id;
  END$$ 
DELIMITER ;

DELIMITER $$
DROP TRIGGER IF EXISTS changeSharedStatus;
CREATE TRIGGER changeSharedStatus AFTER INSERT ON shared_assets
FOR EACH ROW 
  BEGIN
    UPDATE assets
    SET status = 'shared' WHERE id = NEW.assets_id;
  END$$ 
DELIMITER ;

DELIMITER $$
DROP TRIGGER IF EXISTS changeNotAssignedStatus;
CREATE TRIGGER changeNotAssignedStatus BEFORE DELETE ON shared_assets
FOR EACH ROW 
  BEGIN
    UPDATE assets
    SET status = 'not assigned' WHERE id = OLD.assets_id;
  END$$ 
DELIMITER ;

########Queries#########

#1 Find the name of the employee who has been alloted the maximum number of assets till date
SELECT employees.name,Count(assigned_assets.assets_id) AS Total_assigned_assets FROM assigned_assets
JOIN employees 
WHERE employees.id = assigned_assets.employees_id
GROUP BY assigned_assets.employees_id
HAVING Total_assigned_assets = (SELECT COUNT(*) AS 'total' FROM assigned_assets GROUP BY employees_id ORDER BY total DESC LIMIT 1);

#2 Identify the name of the employee who currently has the maximum number of assets as of today
SELECT employees.name,Count(assigned_assets.assets_id) AS Total_assigned_assets FROM assigned_assets
JOIN employees 
WHERE employees.id = assigned_assets.employees_id AND CURDATE() < assigned_assets.till
GROUP BY assigned_assets.employees_id
HAVING Total_assigned_assets = (SELECT COUNT(*) AS 'total' FROM assigned_assets WHERE  CURDATE() < till GROUP BY employees_id ORDER BY total DESC LIMIT 1);

#3 Find name and period of all the employees who have used a Laptop - let’s say laptop A - since it was bought by the company.
SELECT employees.name,assets.name,assigned_assets.from_date,'Currently Assigned' AS 'Assigned Till' FROM assigned_assets
JOIN employees 
ON employees.id = assigned_assets.employees_id
JOIN assets
ON assets.id =  assigned_assets.assets_id
WHERE assets.name = "Laptop A";

#4 Find the list of assets that are currently not assigned to anyone hence lying with the asset manage ( HR)
SELECT name FROM assets 
WHERE status = 'not assigned';

#5 An employee say Bob is leaving the company, write a query to get the list of assets he should be returning to the company.
SELECT employees.name,assets.name AS 'assets to return' ,assigned_assets.from_date,'Currently Assigned' AS 'Assigned Till' FROM assigned_assets
JOIN employees 
ON employees.id = assigned_assets.employees_id
JOIN assets
ON assets.id =  assigned_assets.assets_id
WHERE employees.name = "Bob" AND CURDATE() < assigned_assets.till;

#6 Write a query to find assets which are out of warranty
SELECT * FROM assets where CURDATE() < DATE_ADD(date_of_purchase,INTERVAL warranty YEAR);

#7 Return a list of Employee Names who do not have any asset assigned to them.
SELECT name FROM employees
WHERE id NOT IN (SELECT DISTINCT employees_id FROM assigned_assets WHERE till > CURDATE());
