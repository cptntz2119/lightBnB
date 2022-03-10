--Get details about a single user.
SELECT id, name, email, password
FROM users
WHERE email='sebastianguerra@ymail.com'
GROUP BY id;

--Get the average duration of all reservations.
SELECT AVG(end_date - start_date) as average_duration
FROM reservations;

--Show specific details about properties located in Vancouver including their average rating.
SELECT properties.id as id, title, cost_per_night, AVG(rating) as average_rating
FROM properties
JOIN property_reviews on properties.id = property_reviews.property_id
WHERE city LIKE '%ancouv%'
GROUP BY properties.id
HAVING avg(rating) >= 4
ORDER BY cost_per_night 
limit 10;

--Get a list of the most visited cities.
SELECT city, count(reservations.*) as total_reservations
FROM properties
JOIN reservations ON properties.id= reservations.property_id
GROUP BY city
ORDER BY total_reservations DESC;

--Show all reservations for a user.
SELECT reservations.id as id, properties.title, properties.cost_per_night, reservations.start_date, AVG(property_reviews.rating) as average_rating
FROM properties
JOIN reservations ON properties.id = reservations.property_id
JOIN property_reviews ON properties.id = property_reviews.property_id
WHERE reservations.guest_id=1
GROUP BY reservations.id, properties.id
ORDER BY start_date
limit 10;



