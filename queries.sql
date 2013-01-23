-- Find restaurants in a neighborhood.
SELECT *
FROM restaurants
WHERE neighborhood='?';

-- Find reviews from a critic.
SELECT *
FROM restaurant_reviews
JOIN critics
ON restaurant_reviews.critic_id=critics.id
WHERE critics.id='?';

--Also return the critic's average score.
SELECT AVG(score)
FROM restaurant_reviews
JOIN critics
ON restaurant_reviews.critic_id=critics.id
WHERE critics.id='?';

-- List reviews for a given restaurant.
SELECT *
FROM restaurant_reviews
JOIN restaurants
ON restaurant_reviews.restaurant_id=restaurants.id
WHERE restaurants.id='?';

--Also return the average restaurant score.
SELECT AVG(score)
FROM restaurant_reviews
JOIN restaurants
ON restaurant_reviews.restaurant_id=restaurants.id
WHERE restaurants.id='?';

-- Find the average review of a chef.
SELECT AVG(restaurant_reviews.score)
FROM restaurant_reviews
JOIN chefs_restaurants
ON restaurant_reviews.restaurant_id=chefs_restaurants.restaurant_id
WHERE restaurant_reviews.review_date
BETWEEN chefs_restaurants.start_date and chefs_restaurants.end_date
AND chefs_restaurants.chef_id='?';

-- Find the number of proteges of a chef.
SELECT *
FROM chefs
WHERE mentor_id='?';