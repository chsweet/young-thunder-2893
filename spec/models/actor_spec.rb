require 'rails_helper'

RSpec.describe Actor do
  describe 'relationships' do
    it { should have_many(:actor_movies) }
    it { should have_many(:movies).through(:actor_movies) }
  end

  describe 'methods' do
    before :each do
      @studio_1 = Studio.create!(name: 'Warner Bros', location: 'California')

      @movie_1 = @studio_1.movies.create!(title: 'the little things', creation_year: 2021, genre: 'Drama')

      @actor_2 = Actor.create!(name: 'Rami Malek' , age: 40)
      @actor_1 = Actor.create!(name: 'Denzel Washington' , age: 66)
      @actor_3 = Actor.create!(name: 'Natalie Morales' , age: 36)

      ActorMovie.create!(movie: @movie_1, actor: @actor_1)
      ActorMovie.create!(movie: @movie_1, actor: @actor_2)
      ActorMovie.create!(movie: @movie_1, actor: @actor_3)
    end
    #User story 2
    describe '::actors_by_age' do
      it 'returns actors sorted by age' do
        expect(Actor.actors_by_age).to eq([@actor_3, @actor_2, @actor_1])
      end
    end
    #User story 2
    describe '::actors_avg_age' do
      it 'returns actors average age' do
        expect(Actor.actors_avg_age).to eq(47.33)
      end
    end
  end
end
