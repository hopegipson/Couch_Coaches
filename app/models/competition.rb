class Competition < ApplicationRecord
  belongs_to :game
  belongs_to :home_team, :class_name => 'Team', :foreign_key => 'team1_id'
  belongs_to :visitor_team, :class_name => 'Team', :foreign_key => 'team2_id'
  scope :visitor, -> (team) { where(team2_id: team)}
  scope :home, -> (team) { where(team1_id: team) }
  scope :game_week, -> (week) {where(game_week: week)}
  validates :team1_id, presence: :true
  validates :team2_id, presence: :true
  validates :game_week, presence: :true, numericality: { only_integer: true, greater_than: 0, less_than: 17}
  validate :home_team_cannot_be_visitor_team
  validate :team_cannot_play_twice_one_week

  def home_team_cannot_be_visitor_team
    if home_team == visitor_team
      errors.add(:home_team, "cannot be the same as the Visitor team, a team can't play itself")
    end
  end

  def team_cannot_play_twice_one_week
    competitions = Competition.game_week(game_week)
    competitions.each do |c|
      if  (c.home_team == home_team || c.visitor_team == home_team) || (c.home_team == visitor_team || c.visitor_team == visitor_team)
        errors.add(:home_team, "is already scheduled for a matchup week #{game_week}.")
        errors.add(:visitor_team, "is already scheduled for a matchup week #{game_week}.")
      elsif c.home_team == home_team || c.visitor_team == home_team
        errors.add(:home_team, "is already scheduled for a matchup week #{game_week}.")
      elsif c.home_team == visitor_team || c.visitor_team == visitor_team
        errors.add(:visitor_team, "is already scheduled for a matchup week #{game_week}.")
      end
      end
    end
  end
