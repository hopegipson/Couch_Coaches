class PlayersController < ApplicationController
    before_action :find_player, only: [:show, :edit, :update, :release, :release_update]
    before_action :current_user
    before_action :free_agent_team


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

    def release
    end

    def update
         #need to add code that only if that player is a free agent can you add

        @team = Team.find_by(id: player_params[:team_id])
        if @team.players.count >= 5
          #add some error here about too many players for that team
          redirect_to players_path
        else 
          @player.update(player_params)
          redirect_to player_path(@player)
        end

 
    end

    def release_update
        #need to add code that only if you have that player you can release
        
        @player.team_id = 1
        @player.save
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