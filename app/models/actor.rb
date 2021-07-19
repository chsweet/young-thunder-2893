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

  def actors_coworkers
    coworkers = []
    movies.each do |movie|
      movie.actors.each do |actor|
        coworkers << actor.name
      end
    end
    coworkers.delete(name)
    coworkers.uniq
  end
end
