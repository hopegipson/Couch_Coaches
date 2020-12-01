class PlayersController < ApplicationController
    before_action :find_player, only: [:show, :edit, :update]
    before_action :current_user


    def index
        @players = Player.all
        @teams = Team.all
   
        # filter the @posts list based on user input
        if !params[:team].blank?
          @players = Player.by_team(params[:team])
        else
          # if no filters are applied, show all posts
          @players = Player.all
        end
    end

    def show
    end

    def edit
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