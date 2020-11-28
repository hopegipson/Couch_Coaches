class TeamsController < ApplicationController
    before_action :find_team, only: [:show, :create]

    def index
       @teams.all
      
    def new
        @team = Team.new
    end

    def create 
        @team = Team.create(team_params)
        return redirect_to new_team_path unless @team.save
        redirect_to team_path(@team)
        end
    end

    def show
    end


    private

    def find_team
        @team = Team.find_by(id: params[:id])
    end

    def team_params
        params.require(:team).permit(:name, :user_id)
    end


end
