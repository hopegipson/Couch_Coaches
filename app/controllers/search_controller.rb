class SearchController < ApplicationController
  def index
    player_name = params['player_name']
     if player_name
      @player = Player.find_by_name(player_name)
      @player = Player.create_from_api(player_name)


     #@response = SportsData::Search.by_player(player_name)

      #@response = SportsData::Search.by_player(params['player_name'])
      #@response = @response["Team"]

    end
  end

end



