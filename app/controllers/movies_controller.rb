class MoviesController < ApplicationController
  def show
    @movie = Movie.find(params[:id])
    @actors = @movie.actors.actors_by_age
  end

  def update
    movie = Movie.find(params[:id])

    if params[:name]
      actor = Actor.find_by name: (params[:name])
      ActorMovie.create!(movie: movie, actor: actor)
      redirect_to "/movies/#{movie.id}"
    end
  end
end
