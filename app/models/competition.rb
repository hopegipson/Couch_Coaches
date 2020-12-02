class Competition < ApplicationRecord
  belongs_to :game
  belongs_to :home_team, :class_name => 'Team', :foreign_key => 'team1_id'
  belongs_to :visitor_team, :class_name => 'Team', :foreign_key => 'team2_id'
  scope :visitor, -> (team) { where(team2_id: team)}
  #scope :team, -> (team) {where(team2_id: OR team1_id: team)}
  #Competition.home(team).or(Competition.visitor(team)).count
   #'name=? OR lastname=?', 'John', 'Smith'
  scope :home, -> (team) { where(team1_id: team) }
end
