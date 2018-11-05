require 'rails_helper'

RSpec.describe Movie, :type => :model do
  describe "Movie index" do
    it 'calls the model method to create movie' do
      movie = Movie.create!(:title => 'Home Stay', :release_date => '31/10/2018', :rating => 'G')

      expect(movie.reload.title).to eq('Home Stay')
      expect(movie.reload.release_date).to eq('31/10/2018')  
      expect(movie.reload.rating).to eq('G')   
    end
    it "calls the model method to delete movie" do
      movie1 = Movie.create!(:title => 'Star Wars', :release_date => '5/11/2018', :rating => 'G')
      movie2 = Movie.create!(:title => 'thor', :release_date => '26/10/2018', :rating => 'G')
      
      expect(Movie.all.count).to eq(2)
      movie2.destroy
      expect(Movie.all.count).to eq(1)
    end
  end
end