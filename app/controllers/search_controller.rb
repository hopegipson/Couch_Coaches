class SearchController < ApplicationController
  before_action :current_user
  before_action :free_agent_team


  def index
    @players = Player.all
    player_name = params['player_name']
     if player_name
      @player = Player.find_or_create_from_api("#{player_name}")
    end
  end

end



