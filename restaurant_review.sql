CREATE TABLE chefs (
  id INTEGER PRIMARY KEY,
  first_name VARCHAR(255),
  last_name VARCHAR(255),
  mentor_id INTEGER
);

CREATE TABLE restaurants (
  id INTEGER PRIMARY KEY,
  name VARCHAR(255),
  neighborhood VARCHAR(255),
  cuisine VARCHAR(255)
);

CREATE TABLE chefs_restaurants (
  id INTEGER PRIMARY KEY,
  chef_id INTEGER,
  restaurant_id INTEGER,
  start_date TEXT,
  end_date TEXT
);

CREATE TABLE critics (
  id INTEGER PRIMARY KEY,
  screen_name VARCHAR(255)
);

CREATE TABLE restaurant_reviews (
  id INTEGER PRIMARY KEY,
  review_text TEXT,
  score INTEGER,
  review_date TEXT,
  critic_id INTEGER,
  restaurant_id INTEGER
);