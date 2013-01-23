require 'singleton'
require 'sqlite3'

class RestaurantReviewsDB < SQLite3::Database
  include Singleton

  def initialize
    # open up the db
    super("database.sqlite3")

    self.results_as_hash = true
    self.type_translation = true
  end
end

class RestaurantReviews
  def get_restaurants_by_neighborhood(neighborhood)
    query = "SELECT *
            FROM restaurants
            WHERE neighborhood=?"
    RestaurantReviewsDB.instance.execute(query, neighborhood)
  end

  def get_reviews_by_critic(critic_id)
    query = "SELECT *
            FROM restaurant_reviews
            JOIN critics
            ON restaurant_reviews.critic_id=critics.id
            WHERE critics.id=?"
    RestaurantReviewsDB.instance.execute(query, critic_id)
  end

  def get_average_score_by_critic(critic_id)
    query = "SELECT AVG(score)
            FROM restaurant_reviews
            JOIN critics
            ON restaurant_reviews.critic_id=critics.id
            WHERE critics.id=?"
    RestaurantReviewsDB.instance.execute(query, critic_id)
  end

  def get_reviews_by_restaurant(restaurant_id)
    query = "SELECT *
            FROM restaurant_reviews
            JOIN restaurants
            ON restaurant_reviews.restaurant_id=restaurants.id
            WHERE restaurants.id=?"
    RestaurantReviewsDB.instance.execute(query, restaurant_id)
  end

  def get_average_score_of_restaurant(restaurant_id)
    query = "SELECT AVG(score)
            FROM restaurant_reviews
            JOIN restaurants
            ON restaurant_reviews.restaurant_id=restaurants.id
            WHERE restaurants.id=?"
    RestaurantReviewsDB.instance.execute(query, restaurant_id)
  end

  def get_average_score_of_chef(chef_id)
    query = "SELECT AVG(restaurant_reviews.score)
            FROM restaurant_reviews
            JOIN chefs_restaurants
            ON restaurant_reviews.restaurant_id=chefs_restaurants.restaurant_id
            WHERE restaurant_reviews.review_date
            BETWEEN chefs_restaurants.start_date and chefs_restaurants.end_date
            AND chefs_restaurants.chef_id=?"
    RestaurantReviewsDB.instance.execute(query, chef_id)
  end

  def get_proteges_of_chef(mentor_id)
    query = "SELECT *
            FROM chefs
            WHERE mentor_id=?"
    RestaurantReviewsDB.instance.execute(query, mentor_id)
  end
end