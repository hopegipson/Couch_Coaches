class Team < ApplicationRecord
    has_many :competitions
    has_many :games,:through => :competitions
    belongs_to :user
    has_many :players
end
