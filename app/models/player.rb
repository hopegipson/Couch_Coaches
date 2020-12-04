class Player < ApplicationRecord
    belongs_to :team
    scope :filter_by_position, -> (position1) { where(position: position1)}
    validates :team_id, presence: :true

    def self.find_by_name(name)
        Player.all.find_by(name: name.titleize)
    end

    def self.create_from_api(name)
        @response = SportsData::Search.by_player(name)
        if @response
            player = Player.new
            player.name = @response["Name"]
            player.nfl_team = @response["Team"]
            player.position = @response["Position"]
            player.projected_points = @response["FantasyPoints"]
            player.team_id = 1
            player.save
            player
        end
    end

    def self.find_or_create_from_api(name)
        find_by_name(name) || create_from_api(name)
    end

    def week_projection
        self.projected_points / 16
    end

    private

    def self.by_team(team_id)
        where(team: team_id)
    end

    def self.all_except(player)
        where.not(id: player)
    end
end

