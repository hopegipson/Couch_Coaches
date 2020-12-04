class Game < ApplicationRecord
    has_one :competition
    has_one :home_team,:through => :competition
    has_one :visitor_team,:through => :competition
    
    def total_score
        self.team1_total_score = team1_player1_score + team1_player2_score + team1_player3_score + team1_player4_score + team1_player5_score + team1_player6_score + team1_player7_score
        self.team2_total_score = team2_player1_score + team2_player2_score + team2_player3_score + team2_player4_score + team2_player5_score + team2_player6_score + team1_player7_score
    end

    def choose_winner
        if self.team1_total_score > self.team2_total_score
            self.winner_id = self.home_team.id
            self.loser_id = self.visitor_team.id
        elsif self.team2_total_score > self.team1_total_score
            self.winner_id = self.visitor_team.id
            self.loser_id = self.home_team.id
        end
    end
end
