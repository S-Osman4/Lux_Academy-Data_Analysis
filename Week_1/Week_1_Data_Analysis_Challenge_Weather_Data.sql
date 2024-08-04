-- Display all records
SELECT * FROM week_1.`1. weather data`;

-- Question 1: Find all records where the weather was exactly clear.
SELECT * FROM week_1.`1. weather data`
WHERE Weather = 'Clear';

-- Question 2: Find the number of times the wind speed was exactly 4 km/hr.
SELECT COUNT(*) FROM week_1.`1. weather data`
WHERE `Wind Speed_km/h` = 4;

-- Question 5: What is the mean visibility of the dataset?
SELECT AVG(Visibility_km) AS Visibility_Mean 
FROM week_1.`1. weather data`;

-- Question 6: Find the number of records where the wind speed is greater than 24 km/hr and visibility is equal to 25 km.
SELECT COUNT(*) FROM week_1.`1. weather data`
WHERE `Wind Speed_km/h` > 24 AND Visibility_km = 25;