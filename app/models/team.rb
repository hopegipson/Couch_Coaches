class Team < ApplicationRecord
    has_many :competitions
    has_many :games,:through => :competitions
    belongs_to :user
    has_many :players

    def total_team_points
        total = 0
        self.players.all.each do |player|
            total += player.week_projection
        end
        total
    end

end
