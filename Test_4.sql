USE `Car Dealership`;
 
 -- 4.
 
 SELECT *
 FROM Dealerships d
 JOIN Inventory i ON d.Dealership_ID = i.Dealership_ID
 WHERE VIN = '1OFORDMUSTANG18X1';