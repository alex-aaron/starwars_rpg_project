class Award < ApplicationRecord
    belongs_to :user 
    has_many :award_movies 
    has_many :movies, through: :award_movies
end
