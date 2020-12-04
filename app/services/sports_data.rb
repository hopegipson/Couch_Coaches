module SportsData
  class Search
    def self.by_player(player_name)
      @player_name = player_name
      response = Faraday.get 'https://api.sportsdata.io/v3/nfl/projections/json/PlayerSeasonProjectionStats/2020REG?key=' + ENV['API_KEY']
      response =JSON.parse(response.body)
      foundplayer = response.detect {|result| result["Name"].to_s.downcase == @player_name.downcase}
      foundplayer
    end
  end
end