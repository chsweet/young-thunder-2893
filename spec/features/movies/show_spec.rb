require 'rails_helper'

RSpec.describe 'movie show page' do
  before :each do
    @studio_1 = Studio.create!(name: 'Warner Bros', location: 'California')

    @movie_1 = @studio_1.movies.create!(title: 'the little things', creation_year: 2021, genre: 'Drama')

    @actor_1 = Actor.create!(name: 'Denzel Washington' , age: 66)
    @actor_2 = Actor.create!(name: 'Rami Malek' , age: 40)
    @actor_3 = Actor.create!(name: 'Natalie Morales' , age: 36)
    @actor_4 = Actor.create!(name: 'Oliva Washington' , age: 30)
    @actor_5 = Actor.create!(name: 'Isabel Arriaza' , age: 31)

    ActorMovie.create!(movie: @movie_1, actor: @actor_1)
    ActorMovie.create!(movie: @movie_1, actor: @actor_2)
    ActorMovie.create!(movie: @movie_1, actor: @actor_3)
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
    save_and_open_page
    expect(page).to have_content("Average Age: 47")
  end
  #User story 3
  it 'does not diasplay any actors not part of the movie' do
    visit "/movies/#{@movie_1.id}"

    expect(page).to_not have_content(@actor_4.name)
    expect(page).to_not have_content(@actor_5.name)
  end
  #User story 3
  it 'displays a form to add and existing actor to the movie' do
    visit "/movies/#{@movie_1.id}"

    fill_in "Actor Name", with: 'Oliva Washington'
    click_on('Add')

    expect(current_path).to eq("/movies/#{@movie_1.id}")
    expect(@actor_4.name).to appear_before(@actor_3.name)
  end
end
