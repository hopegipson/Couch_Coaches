class Player < ApplicationRecord

    def self.find_by_name(name)
        Player.all.find_by(name: name.titleize)
    end

    def self.create_from_api(name)
        @response = SportsData::Search.by_player(name)
        player = Player.new
        player.name = @response["Name"]
        player.nfl_team = @response["Team"]
        player.position = @response["Position"]
        player.projected_points = @response["FantasyPoints"]
        player.save
        player
    end

    def self.find_or_create_from_api(name)
        find_by_name(name) || create_from_api(name)
    end



end

