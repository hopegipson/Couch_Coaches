class PlayersController < ApplicationController
    before_action :find_player, only: [:show, :edit, :update, :release, :release_update]
    before_action :current_user
    before_action :free_agent_team


    def index
        @players = Player.all
        @teams = Team.all
        if !params[:team].blank? && !params[:position].blank?
          @players = Player.by_team(params[:team]).filter_by_position(params[:position])
        elsif !params[:team].blank? 
          @players = Player.by_team(params[:team])
        elsif !params[:position].blank? 
          @players = Player.filter_by_position(params[:position])
        else
          @players = Player.all
        end
    end

    def show
    end

    def edit
      if player_belong_to_current_user?
        flash[:errors ]= ["You cannot add a player that is already on your team"]
        redirect_to players_path
      elsif player_free_agent? == false
        flash[:errors ]= ["You cannot add a player that is not a free agent"]
        redirect_to players_path
      end
    end

    def release
      if player_belong_to_current_user? == false
        flash[:errors ]= ["You cannot release a player that is not on your team"]
        redirect_to players_path
      end
    end

    def update
      @team = Team.find_by(id: player_params[:team_id])
      @position = @player.position
      if @team == nil
        flash[:errors ]= ["Must specify a team to add player to"]
        redirect_to edit_player_path(@player)
      elsif @team.players.count == 5
        flash[:errors ]= ["This team already has the maximum 5 players, release a player to add"]
        redirect_to team_path(@team)
      elsif @team.full_roster_of_position(@position)
        message = @team.full_roster_of_position(@position)
        flash[:errors]= [message]
        redirect_to team_path(@team)
      else 
        @player.update(player_params)
        redirect_to player_path(@player)
      end
    end

    def release_update
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

    def player_belong_to_current_user?
      @current_user.teams.include?(@player.team)
    end

    def player_free_agent?
      @player.team_id == 1
    end
end