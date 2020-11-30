class Team < ApplicationRecord
    has_many :competitions
    #has_many :games,:through => :competitions
    belongs_to :user
    has_many :players
    has_many :winning_games, :class_name => 'Game', :foreign_key => 'winner_id'
    has_many :losing_games, :class_name => 'Game', :foreign_key => 'loser_id'

    def total_team_points
        total = 0
        self.players.all.each do |player|
            total += player.week_projection
        end
        total
    end

end
