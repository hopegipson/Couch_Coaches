class SearchController < ApplicationController
  before_action :free_agent_team
  before_action :logged_in?

  def index
    @players = Player.all
    player_name = params['player_name']
    if player_name
      @player = Player.find_or_create_from_api(player_name.to_s)
      if !@player
      flash[:errors] = ['Error finding your submitted player name, please try another']
      redirect_to search_path
      end
    end
  end
end



