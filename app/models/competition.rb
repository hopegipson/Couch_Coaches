class Competition < ApplicationRecord
  belongs_to :game
  belongs_to :home_team, :class_name => 'Team', :foreign_key => 'team1_id'
belongs_to :visitor_team, :class_name => 'Team', :foreign_key => 'team2_id'
end
