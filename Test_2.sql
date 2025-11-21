 USE `Car Dealership`;
 
 -- 2.
 
 SELECT *
 FROM Vehicles v
 JOIN Inventory i on v.VIN = i.VIN
 WHERE Dealership_ID = 3;