class PlayersController < ApplicationController
    before_action :find_player, only: [:show, :edit, :update]

    def index
        @players = Player.all
        current_user
    end

    def show
        current_user
    end

    def edit
        current_user
    end

    def update
        @player.update(player_params)
        redirect_to player_path(@player)
    end

    private

    def find_player
        @player = Player.find_by(id: params[:id])
    end

    def player_params
        params.require(:player).permit(:team_id)
    end

end