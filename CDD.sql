-- Step 1. 
 
 DROP DATABASE IF EXISTS `car dealership`;
 CREATE DATABASE `car dealership`;
 
 USE `car dealership`;

-- Step 2. 

CREATE TABLE vehicles (
	VIN				VARCHAR(17) PRIMARY KEY,
    Make			VARCHAR(50),
    Model			VARCHAR(50),
    Year			INT,
    Sold			BOOLEAN,
    Color 			VARCHAR(50),
    VehicleType 	VARCHAR(50),
    Odometer 		INT,
    price  			DOUBLE
);

CREATE TABLE dealerships (
	Dealership_ID	INT			AUTO_INCREMENT PRIMARY KEY,
    Name			VARCHAR(50),
    Address			VARCHAR(50),
    Phone			VARCHAR(12)
);

CREATE TABLE inventory (
	Dealership_ID	INT,
	VIN			VARCHAR(50),
    PRIMARY KEY  (Dealership_ID, VIN),
    FOREIGN KEY  (Dealership_ID) REFERENCES dealerships(Dealership_ID),
    FOREIGN KEY  (VIN) REFERENCES vehicles(VIN)
);

CREATE TABLE sales_contracts (
	Contract_ID		INT			AUTO_INCREMENT PRIMARY KEY,
    VIN				VARCHAR(17),
   	Sale_DATE		DATE,
    Price			DECIMAL(10.2),
	FOREIGN KEY  (VIN) REFERENCES vehicles(VIN)
);

CREATE TABLE lease_contracts (
	Contract_ID		INT			AUTO_INCREMENT PRIMARY KEY,
    VIN				VARCHAR(17),
    Lease_Start		DATE,
    Lease_End		DATE,  
    Monthly_Payment	DECIMAL(10.2),
	FOREIGN KEY  (VIN) REFERENCES vehicles(VIN)
);

-- 3.

-- DEALERSHIPS: 4

INSERT INTO dealerships (Name, Address, Phone) VALUES
('Noel Motors', '123 Main St', '555-1234'),
('Premier Auto', '456 Oak Ave', '555-5678'),
('Luxury Auto', '789 Park Blvd', '555-9012'),
('Metro Auto Group', '321 River Rd', '555-3456');

-- VEHICLES: 10 

INSERT INTO vehicles (VIN, Make, Model, year, Sold, Color, VehicleType, Odometer, Price) VALUES
('1ABCDEF1234567890', 'Toyota', 'Camry', 2020, 0, 'Blue', 'Sedan', 25000, 21000.00),
('2GHIJKL9876543210', 'Honda', 'Civic', 2019, 1, 'Red', 'Sedan', 40000, 19000.00),
('4BMWX52021ZABCDEF','BMW', 'X5', 2021, 0, 'Black', 'SUV', 18000, 62000.00),
('6FORD1502021TRUCK','Ford', 'F-150', 2021, 0, 'Gray', 'Truck', 15000, 45000.00),
('5PORSCHE911ZZZ012','Porsche','911', 2022, 0, 'Yellow','Coupe', 8000,115000.00),
('7BMWI82019HYBRID1','BMW', 'i8', 2019, 0, 'White', 'Coupe', 12000, 90000.00),
('3TESLAMODELX2022Z','Tesla', 'Model X', 2022, 0, 'White', 'SUV', 5000, 99000.00),
('8CHEVYCORVETTE20A','Chevrolet','Corvette',2020,1,'Blue', 'Coupe', 14000, 65000.00),
('9NISSANALTIMA19AA','Nissan', 'Altima', 2019, 1, 'Silver','Sedan', 36000, 20000.00),
('1OFORDMUSTANG18X1','Ford', 'Mustang', 2018, 0, 'Black', 'Coupe', 45000, 30000.00);

-- INVENTORY 

INSERT INTO inventory (dealership_id, VIN) VALUES

-- Noel Motors
(1, '1ABCDEF1234567890'), -- Camry
(1, '3TESLAMODELX2022Z'), -- Model X
(1, '1OFORDMUSTANG18X1'), -- Mustang

-- Premier Auto
(2, '2GHIJKL9876543210'), -- Civic
(2, '4BMWX52021ZABCDEF'), -- BMW X5
(2, '9NISSANALTIMA19AA'), -- Altima

-- Luxury Lane Auto
(3, '5PORSCHE911ZZZ012'), -- Porsche 911
(3, '7BMWI82019HYBRID1'), -- BMW i8

-- Metro Auto Group
(4, '6FORD1502021TRUCK'), -- F-150
(4, '8CHEVYCORVETTE20A'); -- Corvette

-- SALES CONTRACTS  {SOLD Cars: Civic, Corvette, Altima}

INSERT INTO sales_contracts (VIN, sale_date, price) VALUES
('2GHIJKL9876543210', '2024-10-01', 18500.00), -- Civic
('8CHEVYCORVETTE20A','2024-07-20', 64000.00), -- Corvette
('9NISSANALTIMA19AA','2024-05-10', 19500.00); -- Altima

-- LEASE CONTRACTS 

INSERT INTO lease_contracts (VIN, lease_start, lease_end, monthly_payment) VALUES
('1ABCDEF1234567890', '2024-01-01', '2026-01-01', 350.00), -- Camry
('4BMWX52021ZABCDEF','2024-03-01', '2027-03-01', 780.00), -- BMW X5
('3TESLAMODELX2022Z','2024-06-01', '2028-06-01', 950.00); -- Model X

