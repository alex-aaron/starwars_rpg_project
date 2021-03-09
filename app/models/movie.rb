class Movie < ApplicationRecord
    has_many :award_movies
    has_many :awards, through: :award_movies
end
