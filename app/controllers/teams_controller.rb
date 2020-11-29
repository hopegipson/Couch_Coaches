class TeamsController < ApplicationController
    before_action :find_team, only: [:show, :create]

    def index
       @teams = Team.all
       current_user
    end
      
    def new
       @team = Team.new
       @users = User.all
    end

    def create 
        @team = Team.create(team_params)
        @team.user_id = current_user.id
        return redirect_to new_team_path unless @team.save
        redirect_to team_path(@team)

    end

    def show
        current_user
    end


    private

    def find_team
        @team = Team.find_by(id: params[:id])
    end

    def team_params
        params.require(:team).permit(:name, :user_id)
    end


end
