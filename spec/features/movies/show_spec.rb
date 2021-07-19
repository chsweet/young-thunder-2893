require 'rails_helper'

RSpec.describe 'movie show page' do
  before :each do
    @studio_1 = Studio.create!(name: 'Warner Bros', location: 'California')

    @movie_1 = @studio_1.movies.create!(title: 'the little things', creation_year: 2021, genre: 'Drama')
    # @movie_2 = @studio_1.movies.create!(title: 'Million Dollar Baby', creation_year: 2004, genre: 'Action/Drama')
    # @movie_3 = @studio_1.movies.create!(title: "Harry Potter: Sourcerer's Stone", creation_year: 2001, genre: 'Fantasy')

    @actor_1 = Actor.create!(name: 'Denzel Washington' , age: 66)
    @actor_2 = Actor.create!(name: 'Rami Malek' , age: 40)
    @actor_3 = Actor.create!(name: 'Natalie Morales' , age: 36)
    # @actor_4 = Actor.create!(name: 'Hilary Swank' , age: 46)
    # @actor_5 = Actor.create!(name: 'Clint Eastwood' , age: 91)
    # @actor_6 = Actor.create!(name: 'Daniel Radcliffe' , age: 31)
    # @actor_7 = Actor.create!(name: 'Emma Watson' , age: 31)
    # @actor_8 = Actor.create!(name: 'Rupert Grint' , age: 32)

    ActorMovie.create!(movie: @movie_1, actor: @actor_1)
    ActorMovie.create!(movie: @movie_1, actor: @actor_2)
    ActorMovie.create!(movie: @movie_1, actor: @actor_3)
    # ActorMovie.create!(movie: @movie_2, actor: @actor_4)
    # ActorMovie.create!(movie: @movie_2, actor: @actor_5)
    # ActorMovie.create!(movie: @movie_3, actor: @actor_6)
    # ActorMovie.create!(movie: @movie_4, actor: @actor_7)
    # ActorMovie.create!(movie: @movie_5, actor: @actor_8)
  end
  #User story 2
  it 'displays movie title, creation year, and genre' do
    visit "/movies/#{@movie_1.id}"

    expect(page).to have_content(@movie_1.title)
    expect(page).to have_content(@movie_1.creation_year)
    expect(page).to have_content(@movie_1.genre)
  end
  #User story 2
  it 'lists all actors youngest to oldest' do
    visit "/movies/#{@movie_1.id}"

    expect(@actor_3.name).to appear_before(@actor_2.name)
    expect(@actor_2.name).to appear_before(@actor_1.name)
    expect(@actor_2.name).to_not appear_before(@actor_3.name)
  end
  #User story 2
  it 'displays the average age of the actors' do
    visit "/movies/#{@movie_1.id}"

    expect(page).to have_content("Average Age: 47.3")
  end
end
