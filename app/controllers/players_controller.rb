class PlayersController < ApplicationController
    before_action :find_player, only: [:show]

    def index
        @players = Player.all
        #current_user
    end

    def show
        #current_user
    end

    private

    def find_player
        @player = Player.find_by(id: params[:id])
    end

end