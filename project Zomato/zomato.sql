create database zomato_data;
use zomato_data;
select * from zomato_data;
rename table zomato_data to zomato;
select * from zomato;

SELECT COUNT(*) AS total_restaurants
FROM zomato;

-- Find top 10 highest-rated restaurants
SELECT restaurant, rate
FROM zomato
ORDER BY rate DESC
LIMIT 10;

ALTER TABLE zomato
DROP COLUMN listed_in_city;

-- Top 10 locations with the highest number of restaurants.
SELECT location,
       COUNT(*) AS total_restaurants
FROM zomato
GROUP BY location
ORDER BY total_restaurants DESC
LIMIT 10;
-- .average rating
SELECT  ROUND(AVG(rate),2) AS average_rating
FROM zomato;
-- top 5 restro by votes
SELECT restaurant, votes
FROM zomato
ORDER BY votes DESC
LIMIT 5;

-- Count restaurants offering online delivery
SELECT COUNT(*) AS online_delivery_restaurants
FROM zomato
WHERE online_order = 'Yes';

-- Count restaurants offering table booking
SELECT COUNT(*) AS table_booking_restaurants
FROM zomato
WHERE book_table = 'Yes';

SELECT AVG(approx_cost) AS avg_cost
FROM zomato;

-- top localities with highest restaurant count 
SELECT location,
       COUNT(*) AS total_restaurants
FROM zomato
GROUP BY location
ORDER BY total_restaurants DESC
LIMIT 10;

-- average rating by restaurant type
SELECT rest_type,
       ROUND(AVG(rate),2) AS avg_rating
FROM zomato
GROUP BY rest_type
ORDER BY avg_rating DESC;

-- Find top cuisines based on ratings
SELECT cuisines,
       ROUND(AVG(rate),2) AS avg_rating
FROM zomato
GROUP BY cuisines
ORDER BY avg_rating DESC
LIMIT 10;

-- Restaurants having more than 1000 votes
SELECT restaurant, votes
FROM zomato
WHERE votes > 1000;

-- Find costliest restaurants
SELECT restaurant,
       approx_cost
FROM zomato
ORDER BY approx_cost DESC
LIMIT 10;

ALTER TABLE zomato
MODIFY COLUMN address VARCHAR(255) AFTER cuisines;
