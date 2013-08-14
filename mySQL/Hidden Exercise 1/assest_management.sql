DROP DATABASE IF EXISTS asset_managment;
CREATE DATABASE asset_managment;
USE asset_managment;

DROP TABLE IF EXISTS employees;
CREATE TABLE employees
(
  id int AUTO_INCREMENT,
  name varchar(255),
  PRIMARY KEY(id)
);

LOCK TABLES employees WRITE;
INSERT INTO employees(name) values('Alice'),('Bob'),('Chris'),('Duke'),('Emily');
UNLOCK TABLES;

DROP TABLE IF EXISTS location;
CREATE TABLE location
(
  id int AUTO_INCREMENT,
  name varchar(255),
  PRIMARY KEY(id)
);

LOCK TABLES location WRITE;
INSERT INTO location(name) values('Meeting Room');
UNLOCK TABLES;

DROP TABLE IF EXISTS assets;
CREATE TABLE assets
(
  id int AUTO_INCREMENT,
  name varchar(255),
  date_of_purchase DATE,
  make varchar(255),
  warranty int(6),  #years
  status enum('assigned','not assigned','repair','Shared') DEFAULT 'not assigned',
  PRIMARY KEY(id)
);

LOCK TABLES assets WRITE;
INSERT INTO assets(id,name,date_of_purchase,make,warranty,status) values(1,'Laptop A','2011-01-01','Dell',2,'assigned'),(2,'Laptop B','2011-01-01','Sony',4,'not assigned'),(3,'Laptop N1',CURDATE(),'MAC',5,'not assigned'),(4,'Laptop N2',CURDATE(),'MAC',5,'not assigned'),(5,'Iphone A','2011-03-01','Apple',1,'assigned'),(6,'Iphone B','2011-01-01','Apple',1,'assigned'),(7,'Projector A','2011-08-15','DigiMax',10,'shared'),(8,'Printer A','2011-08-15','Canon',10,'shared'),(9,'Printer B','2011-09-10','Canon',10,'not assigned');
UNLOCK TABLES;


DROP TABLE IF EXISTS assigned_assets;
CREATE TABLE assigned_assets
(
  id int AUTO_INCREMENT,
  assets_id int,
  assigned_to_id int,
  assigned_to_type enum('employee','location'),
  from_at DATE,
  till_at DATE,
  PRIMARY KEY (id),
  FOREIGN KEY (assets_id) REFERENCES assets(id),
  INDEX (assigned_to_id,assigned_to_type)
);

LOCK TABLES assigned_assets WRITE;
INSERT INTO assigned_assets(assets_id,assigned_to_id,assigned_to_type,from_at,till_at) values (1,1,'employee','2011-01-01','2011-12-31'),(1,2,'employee','2012-01-01',NULL),(2,2,'employee','2011-01-01','2011-01-31'),(5,1,'employee','2011-03-01',NULL),(6,2,'employee','2011-01-01',NULL),(8,1,'location','2011-08-15',NULL);
UNLOCK TABLES;


DROP TABLE IF EXISTS on_repair_assets;
CREATE TABLE on_repair_assets
(
  id int AUTO_INCREMENT,
  assets_id int,
  cost float,
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


########Queries#########

#1 Find the name of the employee who has been alloted the maximum number of assets till_at date
SELECT employees.name,Count(assigned_assets.assets_id) AS Total_assigned_assets FROM assigned_assets
JOIN employees 
WHERE employees.id = assigned_assets.assigned_to_id AND assigned_assets.assigned_to_type = 'employee'
GROUP BY assigned_assets.assigned_to_id
HAVING Total_assigned_assets = 
(SELECT COUNT(*) AS 'total' FROM assigned_assets WHERE assigned_assets.assigned_to_type = 'employee' GROUP BY assigned_to_id ORDER BY total DESC LIMIT 1);

#2 Identify the name of the employee who currently has the maximum number of assets as of today
SELECT employees.name,Count(assigned_assets.assets_id) AS Total_assigned_assets FROM assigned_assets
JOIN employees 
WHERE employees.id = assigned_assets.assigned_to_id  AND assigned_assets.till_at IS NULL AND assigned_assets.assigned_to_type = 'employee'
GROUP BY assigned_assets.assigned_to_id
HAVING Total_assigned_assets = 
(SELECT COUNT(*) AS 'total' FROM assigned_assets WHERE till_at IS NULL AND assigned_to_type = 'employee' GROUP BY assigned_to_id ORDER BY total DESC LIMIT 1);

#3 Find name and period of all the employees who have used a Laptop - let’s say laptop A - since it was bought by the company.
SELECT employees.name,assets.name,IF(assigned_assets.till_at IS NOT NULL,TO_DAYS(assigned_assets.till_at) - TO_DAYS(assigned_assets.from_at),'still assigned') AS 'period(in days)' FROM assigned_assets
JOIN employees 
ON employees.id = assigned_assets.assigned_to_id
JOIN assets
ON assets.id =  assigned_assets.assets_id
WHERE assets.id = 1 AND assigned_assets.assigned_to_type = 'employee';

#4 Find the list of assets that are currently not assigned to anyone hence lying with the asset manage ( HR)
SELECT name FROM assets 
WHERE status = 'not assigned';

#5 An employee say Bob is leaving the company, write a query to get the list of assets he should be returning to the company.
SELECT employees.name,assets.name AS 'assets to return' ,assigned_assets.from_at,'Currently Assigned' AS 'Assigned till_at' FROM assigned_assets
JOIN employees 
ON employees.id = assigned_assets.assigned_to_id
JOIN assets
ON assets.id =  assigned_assets.assets_id
WHERE employees.name = "Bob" AND assigned_assets.till_at IS NULL;

#6 Write a query to find assets which are out of warranty
SELECT * FROM assets where CURDATE() < DATE_ADD(date_of_purchase,INTERVAL warranty YEAR);

#7 Return a list of Employee Names who do not have any asset assigned to them.
SELECT e.name,0 as 'Assigned assets currently' FROM employees as e
LEFT JOIN assigned_assets as a
ON e.id = a.assigned_to_id AND a.till_at IS NULL AND a.assigned_to_type = "employee"
WHERE a.from_at is NULL 

