DROP DATABASE IF EXISTS asset_managment;
CREATE DATABASE asset_managment;
USE asset_managment;

DROP TABLE IF EXISTS Employees;
CREATE TABLE Employees
(
  id int(255) AUTO_INCREMENT,
  name varchar(200),
  PRIMARY KEY(id)
);

LOCK TABLES Employees WRITE;
INSERT INTO Employees(name) values('Alice'),('Bob'),('Chris'),('Duke'),('Emily');
UNLOCK TABLES;

DROP TABLE IF EXISTS Assets;
CREATE TABLE Assets
(
  asset_id int(255) AUTO_INCREMENT,
  asset_name varchar(200),
  date_of_purchase DATE,
  make varchar(200),
  warranty int(1),  #years
  status enum('assigned','not assigned','repair','Shared') DEFAULT 'not assigned',
  PRIMARY KEY(asset_id)
);

LOCK TABLES Assets WRITE;
INSERT INTO Assets(asset_id,asset_name,date_of_purchase,make,warranty,status) values(1,'Laptop A','2011-01-01','Dell',2,'assigned'),(2,'Laptop B','2011-01-01','Sony',4,'not assigned'),(3,'Laptop N1',DATE_ADD(CURDATE(),INTERVAL 1 YEAR),'MAC',5,'not assigned'),(4,'Laptop N2',DATE_ADD(CURDATE(),INTERVAL 1 YEAR),'MAC',5,'not assigned'),(5,'Iphone A','2011-03-01','Apple',1,'assigned'),(6,'Iphone B','2011-01-01','Apple',1,'assigned'),(7,'Projector A','2011-08-15','DigiMax',10,'shared'),(8,'Printer A','2011-08-15','Canon',10,'shared'),(9,'Printer B','2011-09-10','Canon',10,'not assigned');
UNLOCK TABLES;


DROP TABLE IF EXISTS Assigned_assets;
CREATE TABLE Assigned_assets
(
  assigned_id int(255) AUTO_INCREMENT,
  assigned_assetId int(255),
  assigned_to int(255),
  assigned_from DATE,
  assigned_till DATE,
  PRIMARY KEY (assigned_id),
  FOREIGN KEY (assigned_to) REFERENCES Employees(id),
  FOREIGN KEY (assigned_assetId) REFERENCES Assets(asset_id)
);

LOCK TABLES Assigned_assets WRITE;
INSERT INTO Assigned_assets(assigned_assetId,assigned_to,assigned_from,assigned_till) values (1,1,'2011-01-01','2011-01-31'),(1,2,'2012-01-01',DATE_ADD(CURDATE(),INTERVAL 1 YEAR)),(2,2,'2011-01-01','2011-01-31'),(5,1,'2011-03-01',DATE_ADD(CURDATE(),INTERVAL 1 YEAR)),(6,2,'2011-01-01',DATE_ADD(CURDATE(),INTERVAL 1 YEAR));
UNLOCK TABLES;

DROP TABLE IF EXISTS Shared_assets;
CREATE TABLE Shared_assets
(
  shared_id int(255) AUTO_INCREMENT,
  shared_assetId int(255),
  kept_at varchar(200),
  kept_from DATE,
  PRIMARY KEY (shared_id),
  FOREIGN KEY (shared_assetId) REFERENCES Assets(asset_id)
);

LOCK TABLES Shared_assets WRITE;
INSERT INTO Shared_assets(shared_assetId,kept_at,kept_from) values (8,'Meeting Room','2011-08-15');
UNLOCK TABLES;

DROP TABLE IF EXISTS OnRepair_assets;
CREATE TABLE OnRepair_assets
(
  repair_id int(255) AUTO_INCREMENT,
  repair_assetId int(255),
  cost float(20),
  defect text,
  warranty_in_years int(2), #MAX 5
  PRIMARY KEY (repair_id),
  FOREIGN KEY (repair_assetId) REFERENCES Assets(asset_id)
);

DELIMITER $$
DROP TRIGGER IF EXISTS checkWarrantyRange;
CREATE TRIGGER checkWarrantyRange BEFORE INSERT ON OnRepair_assets
FOR EACH ROW 
  BEGIN
    IF (NEW.warranty_in_years > 5 || NEW.warranty_in_years < 0) THEN
      SET NEW.warranty_in_years = 0;
    END IF;
  END$$ 
DELIMITER ;

DELIMITER $$
DROP TRIGGER IF EXISTS changeAssignedStatus;
CREATE TRIGGER changeAssignedStatus AFTER INSERT ON Assigned_assets
FOR EACH ROW 
  BEGIN
    UPDATE Assets
    SET status = 'assigned' WHERE asset_id = NEW.assigned_assetId;
  END$$ 
DELIMITER ;

DELIMITER $$
DROP TRIGGER IF EXISTS changeRepairStatus;
CREATE TRIGGER changeRepairStatus AFTER INSERT ON OnRepair_assets
FOR EACH ROW 
  BEGIN
    UPDATE Assets
    SET status = 'repair' WHERE asset_id = NEW.repair_assetId;
  END$$ 
DELIMITER ;

DELIMITER $$
DROP TRIGGER IF EXISTS changeSharedStatus;
CREATE TRIGGER changeSharedStatus AFTER INSERT ON Shared_assets
FOR EACH ROW 
  BEGIN
    UPDATE Assets
    SET status = 'shared' WHERE asset_id = NEW.shared_assetId;
  END$$ 
DELIMITER ;

DELIMITER $$
DROP TRIGGER IF EXISTS changeNotAssignedStatus;
CREATE TRIGGER changeNotAssignedStatus BEFORE DELETE ON Shared_assets
FOR EACH ROW 
  BEGIN
    UPDATE Assets
    SET status = 'not assigned' WHERE asset_id = OLD.shared_assetId;
  END$$ 
DELIMITER ;

########Queries#########

#1 Find the name of the employee who has been alloted the maximum number of assets till date
SELECT Employees.name,Count(Assigned_assets.assigned_assetId) AS Total_Assigned_assets FROM Assigned_assets
JOIN Employees 
WHERE Employees.id = Assigned_assets.assigned_to
GROUP BY Assigned_assets.assigned_to
HAVING Total_Assigned_assets = (SELECT COUNT(*) AS 'total' FROM Assigned_assets GROUP BY assigned_to ORDER BY total DESC LIMIT 1);

#2 Identify the name of the employee who currently has the maximum number of assets as of today
SELECT Employees.name,Count(Assigned_assets.assigned_assetId) AS Total_Assigned_assets FROM Assigned_assets
JOIN Employees 
WHERE Employees.id = Assigned_assets.assigned_to AND CURDATE() < Assigned_assets.assigned_till
GROUP BY Assigned_assets.assigned_to
HAVING Total_Assigned_assets = (SELECT COUNT(*) AS 'total' FROM Assigned_assets WHERE  CURDATE() < assigned_till GROUP BY assigned_to ORDER BY total DESC LIMIT 1);

#3 Find name and period of all the employees who have used a Laptop - let’s say laptop A - since it was bought by the company.
SELECT Employees.name,Assets.asset_name,Assigned_assets.assigned_from,'Currently Assigned' AS 'Assigned Till' FROM Assigned_assets
JOIN Employees 
ON Employees.id = Assigned_assets.assigned_to
JOIN Assets
ON Assets.asset_id =  Assigned_assets.assigned_assetId
WHERE Assets.asset_name = "Laptop A";

#4 Find the list of assets that are currently not assigned to anyone hence lying with the asset manage ( HR)
SELECT asset_name FROM Assets 
WHERE status = 'not assigned';

#5 An employee say Bob is leaving the company, write a query to get the list of assets he should be returning to the company.
SELECT Employees.name,Assets.asset_name AS 'Assets to return' ,Assigned_assets.assigned_from,'Currently Assigned' AS 'Assigned Till' FROM Assigned_assets
JOIN Employees 
ON Employees.id = Assigned_assets.assigned_to
JOIN Assets
ON Assets.asset_id =  Assigned_assets.assigned_assetId
WHERE Employees.name = "Bob" AND CURDATE() < Assigned_assets.assigned_till;

#6 Write a query to find assets which are out of warranty
SELECT * FROM Assets where CURDATE() < DATE_ADD(date_of_purchase,INTERVAL warranty YEAR);

#7 Return a list of Employee Names who do not have any asset assigned to them.
SELECT name FROM Employees
WHERE id NOT IN (SELECT DISTINCT assigned_to FROM Assigned_assets WHERE assigned_till > CURDATE());
