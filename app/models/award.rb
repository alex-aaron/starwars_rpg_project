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
    scope :newest_awards, -> {order(created_at: :desc)}


    def self.sort_by_year
        year_array = []
        Award.all.each do |award|
            year_array << award.year.to_i
        end
        year_array.uniq.sort!
    end

    def self.most_comments_hash
        most_comments_hash = {}
        Award.all.each do |award|
            if most_comments_hash[award.comments.length] 
                most_comments_hash[award.comments.length] << award
            else
                most_comments_hash[award.comments.length] = []
                most_comments_hash[award.comments.length] << award
            end
        end
        most_comments_hash
    end

    def self.most_comments_sorted_array
        most_comments_hash = Award.most_comments_hash
        sorted_array = []
        most_comments_hash.each_with_index do |key, value|
            sorted_array << key
        end
        sorted_array.sort.reverse
    end

end
