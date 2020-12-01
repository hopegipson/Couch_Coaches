class TeamsController < ApplicationController
    before_action :find_team, only: [:show, :create]
    before_action :current_user


    def index
       if params[:user_id]
        @teams = User.find(params[:user_id]).teams
      else
        @teams = Team.all
      end
    end
      
    def new
       if params[:user_id] && !User.exists?(params[:user_id])
       redirect_to users_path, alert: "User not found."
       else
        if params[:user_id].to_i != @current_user.id
          redirect_to new_user_team_path(@current_user), alert: "Can only make for user you are"
        else
          @team = Team.new
          @team.user_ids << params[:user_id]
          @team
      end
    end
       
    end

    def create 
        @team = Team.new(name:  team_params[:name])
        @team.users << User.find_by(id: team_params[:user_id])
        return redirect_to new_team_path unless @team.save
        redirect_to team_path(@team)
    end

    def show
      find_team
       # if params[:user_id]
        #    @team = User.find(params[:user_id]).teams.find(params[:id])
        #  else
          #  @team = Team.find(params[:id])
       #   end
    end


    private

    def find_team
        @team = Team.find_by(id: params[:id])
    end

    def team_params
        params.require(:team).permit(:name, :user_id)
    end




end
