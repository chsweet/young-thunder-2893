require 'rails_helper'

RSpec.describe 'actor show page' do
  before :each do
    @studio_1 = Studio.create!(name: 'Warner Bros', location: 'California')

    @movie_1 = @studio_1.movies.create!(title: 'the little things', creation_year: 2021, genre: 'Drama')
    @movie_2 = @studio_1.movies.create!(title: 'Training Day', creation_year: 2001, genre: 'Drama')
    @movie_3 = @studio_1.movies.create!(title: 'The Pelican Brief', creation_year: 1993, genre: 'Drama')

    @actor_1 = Actor.create!(name: 'Denzel Washington' , age: 66)
    @actor_2 = Actor.create!(name: 'Rami Malek' , age: 40)
    @actor_3 = Actor.create!(name: 'Natalie Morales' , age: 36)
    @actor_4 = Actor.create!(name: 'Oliva Washington' , age: 30)
    @actor_5 = Actor.create!(name: 'Isabel Arriaza' , age: 31)
    @actor_6 = Actor.create!(name: 'Ethan Hawke' , age: 50)
    @actor_7 = Actor.create!(name: 'Eva Mendez' , age: 47)
    @actor_8 = Actor.create!(name: 'Julia Roberts' , age: 53)

    ActorMovie.create!(movie: @movie_1, actor: @actor_1)
    ActorMovie.create!(movie: @movie_1, actor: @actor_2)
    ActorMovie.create!(movie: @movie_1, actor: @actor_3)
    ActorMovie.create!(movie: @movie_2, actor: @actor_1)
    ActorMovie.create!(movie: @movie_2, actor: @actor_6)
    ActorMovie.create!(movie: @movie_2, actor: @actor_7)
    ActorMovie.create!(movie: @movie_3, actor: @actor_1)
    ActorMovie.create!(movie: @movie_3, actor: @actor_8)
  end
  #Extention
  it 'displays actors name and age' do
    visit "/actors/#{@actor_1.id}"

    expect(page).to have_content(@actor_1.name)
    expect(page).to have_content(@actor_1.age)
  end

  it 'displays unique list of all the actors the actor has worked with' do
    visit "/actors/#{@actor_1.id}"

    expect(page).to have_content(@actor_2.name)
    expect(page).to have_content(@actor_3.name)
    expect(page).to have_content(@actor_6.name)
    expect(page).to have_content(@actor_7.name)
    expect(page).to have_content(@actor_8.name)
  end

end
