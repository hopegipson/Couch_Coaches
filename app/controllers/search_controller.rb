class SearchController < ApplicationController
  def index
    if params['player_name']
      @response = SportsData::Search.by_player(params['player_name'])
    end
  end


end
