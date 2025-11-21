USE `Car Dealership`;
 
 -- 6.
 
 SELECT d.Dealership_ID,
		name,
        Contract_ID,
        Sale_Date,
        sc.Price,
        v.VIN,
        Make,
        Model
 FROM Dealerships d
 JOIN Inventory i ON d.Dealership_ID = i.Dealership_ID
 JOIN Vehicles v ON v.VIN = i.VIN
 JOIN Sales_Contracts sc ON sc.VIN = v.VIN
 WHERE d.Dealership_ID = 2
   AND Sale_Date BETWEEN '2024-01-01' AND '2025-01-01';
 