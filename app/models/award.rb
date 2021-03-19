class Award < ApplicationRecord
    belongs_to :user 
    has_many :comments
    has_many :users, through: :comments
    validates :year, presence: true
    validates :best_film, presence: true
    validates :best_director, presence: true
    validates :best_actor, presence: true
    validates :best_actress, presence: true
    validates :best_supporting_actor, presence: true
    validates :best_supporting_actress, presence: true
    validates :best_screenplay, presence: true
    validates :best_cinematography, presence: true
    validates :best_film_editing, presence: true
    validates :best_score, presence: true


    def self.sort_by_year
        year_array = []
        Award.all.each do |award|
            year_array << award.year.to_i
        end
        year_array.uniq.sort!
    end
end
