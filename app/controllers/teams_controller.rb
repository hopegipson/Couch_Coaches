class TeamsController < ApplicationController
    before_action :find_team, only: [:show, :create]

    def index
       current_user
       if params[:user_id]
        @teams = User.find(params[:user_id]).teams
      else
        @teams = Team.all
      end
    end
      
    def new
      # @team = Team.new
       #@users = User.all
       if params[:user_id] && !User.exists?(params[:user_id])
        redirect_to users_path, alert: "User not found."
      else
        @team = Team.new(user_id: params[:user_id])
      end
       
    end

    def create 
        @team = Team.create(team_params)
        @team.user_id = current_user.id
        return redirect_to new_team_path unless @team.save
        redirect_to team_path(@team)
       
    end

    def show
      current_user
        if params[:user_id]
            @user = User.find_by(id: params[:user_id])
            @team = @User.teams.find_by(id: params[:id])

            #@team = User.find(params[:user_id]).teams.find(params[:id])
          else
            @team = Team.find(params[:id])
          end
    end


    private

    def find_team
        @team = Team.find_by(id: params[:id])
    end

    def team_params
        params.require(:team).permit(:name, :user_id)
    end


end
