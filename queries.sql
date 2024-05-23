--QUERY ONE --
SELECT * FROM owners 
LEFT JOIN vehicles 
ON owners.id = vehicles.owner_id;

--QUERY TWO --
SELECT owners.first_name, owners.last_name,
COUNT(vehicles.id) AS count
FROM owners
RIGHT JOIN vehicles
ON owners.id = vehicles.owner_id
WHERE vehicles.id > 0
GROUP BY owners.first_name, owners.last_name
ORDER BY owners.first_name ASC;

--QUERY 3 --
SELECT owners.first_name, owners.last_name, 
       CAST(AVG(vehicles.price) AS INTEGER) AS average_price,
       COUNT(vehicles.id) AS vehicle_count
FROM owners
LEFT JOIN vehicles
ON owners.id = vehicles.owner_id
GROUP BY owners.first_name, owners.last_name
HAVING COUNT(vehicles.id) > 1 AND AVG(vehicles.price) > 10000
ORDER BY owners.first_name DESC;

