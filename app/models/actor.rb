class Actor < ApplicationRecord
  has_many :actor_movies
  has_many :movies, through: :actor_movies

  def self.actors_by_age
    order(:age)
  end

  def self.actors_avg_age
    total = sum(:age)
    (total / count.to_f).round(0)
  end
end
