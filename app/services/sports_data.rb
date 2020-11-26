module SportsData
    class Search
      def self.by_player(player_name)
        Faraday.get 'https://api.sportsdata.io/v3/nfl/projections/json/PlayerSeasonProjectionStats/2020REG' + '?key=' + ENV['API_KEY']
      end
    end
  end