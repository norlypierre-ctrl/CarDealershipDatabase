USE `Car Dealership`;
 
 -- 5.
 
 SELECT  DISTINCT *
 FROM Dealerships d
 JOIN Inventory i ON d.Dealership_ID = i.Dealership_ID
 JOIN Vehicles v ON v.VIN = v.VIN
 WHERE Make = 'Ford'
   AND Model = 'Mustang' 
   AND Color = 'Black';
 
 