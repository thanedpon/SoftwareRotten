class Moviegoer < ApplicationRecord
    has_many :reviews
    has_many :movies, :through => :reviews
    
    def self.create_with_omniauth(auth)
        Moviegoer.create!(
            :provider => auth["provider"],
            :uid => auth["uid"],
            :name => auth["info"]["name"])
    end
end
# class Moviegoer
#   has_many :reviews
#   has_many :movies, :through => :reviews
#   # ...other moviegoer model code
# end
# alice = Moviegoer.where(:name => 'Alice')
# alice_movies = alice.movies
# # MAY work, but a bad idea - see caption:
# alice.movies << Movie.where(:title => 'Inception') # Don't do this!
