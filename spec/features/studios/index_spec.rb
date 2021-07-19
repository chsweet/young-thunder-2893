require 'rails_helper'

RSpec.describe 'studio index page' do
  before :each do
    @studio_1 = Studio.create!(name: 'Warner Bros', location: 'California')
    @studio_2 = Studio.create!(name: 'Paramount Pictures', location: 'California')
    @studio_3 = Studio.create!(name: '20th Century Fox', location: 'California')

    @movie_1 = @studio_1.movies.create!(title: 'the little things', creation_year: 2021, genre: 'Drama')
    @movie_2 = @studio_1.movies.create!(title: 'Million Dollar Baby', creation_year: 2004, genre: 'Action/Drama')
    @movie_3 = @studio_1.movies.create!(title: "Harry Potter: Sourcerer's Stone", creation_year: 2001, genre: 'Fantasy')
    @movie_4 = @studio_2.movies.create!(title: 'Top Gun', creation_year: 1986, genre: 'Action')
    @movie_5 = @studio_2.movies.create!(title: 'The Wolf of Wall Stree', creation_year: 2013, genre: 'Drama')
    @movie_6 = @studio_2.movies.create!(title: 'Titanic', creation_year: 1997, genre: 'Drama')
    @movie_7 = @studio_3.movies.create!(title: 'Avatar', creation_year: 2009, genre: 'Fantasy')
    @movie_8 = @studio_3.movies.create!(title: 'Deadpool', creation_year: 2016, genre: 'Comedy/Action')
    @movie_9 = @studio_3.movies.create!(title: 'Home Alone', creation_year: 1990, genre: 'Comdey')
  end
  #User story 1
  it 'displays all studios and all studio movies' do
    visit '/studios'
    
    within("#studio-#{@studio_1.id}") do
      expect(page).to have_content(@studio_1.name)
      expect(page).to have_content(@movie_1.title)
      expect(page).to have_content(@movie_2.title)
      expect(page).to have_content(@movie_3.title)
    end

    within("#studio-#{@studio_2.id}") do
      expect(page).to have_content(@studio_2.name)
      expect(page).to have_content(@movie_4.title)
      expect(page).to have_content(@movie_5.title)
      expect(page).to have_content(@movie_6.title)
    end

    within("#studio-#{@studio_3.id}") do
      expect(page).to have_content(@studio_3.name)
      expect(page).to have_content(@movie_7.title)
      expect(page).to have_content(@movie_8.title)
      expect(page).to have_content(@movie_9.title)
    end
  end
end
