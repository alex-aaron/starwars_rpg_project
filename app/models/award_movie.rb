class AwardMovie < ApplicationRecord
    belongs_to :movies
    belongs_to :awards
end
