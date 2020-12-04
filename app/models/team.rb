class Team < ApplicationRecord
    validates :name, uniqueness: true
    has_many :competitions
    has_many :games,:through => :competitions
    has_many :user_teams
    has_many :users, :through => :user_teams
    has_many :players
    has_many :winning_games, :class_name => 'Game', :foreign_key => 'winner_id'
    has_many :losing_games, :class_name => 'Game', :foreign_key => 'loser_id'
    validates :name, presence: :true, uniqueness: :true


    def total_team_points
        total = 0
        self.players.all.each do |player|
            total += player.week_projection
        end
        total
    end

    def already_a_user?(userid)
        self.user_ids.include?(userid)
    end


    def self.all_except(team)
        where.not(id: team)
    end

    def full_roster_of_position(position)
        if position == "QB" && self.players.filter_by_position("QB").count == 1
            "This team already has the maximum number of Quarterbacks (1), release a QB to add one."
        elsif position == "RB" && self.players.filter_by_position("RB").count == 2
            "This team already has the maximum number of Running Backs (1), release a RB to add one."
        elsif position == "WR" && self.players.filter_by_position("WR").count == 2
            "This team already has the maximum number of Wide Receivers (1), release a WR to add one."
        elsif position == "TE" && self.players.filter_by_position("TE").count == 1
            "This team already has the maximum number of Tight Ends (1), release a TE to add one."
        elsif position == "K" && self.players.filter_by_position("K").count == 1
            "This team already has the maximum number of Kickers (1), release a K to add one."
        end
    end
end
