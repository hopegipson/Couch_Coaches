class TeamsController < ApplicationController
    before_action :find_team, only: [:show, :create, :matchup, :edit, :update, :destroy]
    before_action :current_user
    before_action :free_agent_team
    before_action :find_competitions, only: [:matchup]


    def index
       if params[:user_id]
        @teams = User.find(params[:user_id]).teams
      else
        @teams = Team.all
      end
    end
      
    def new
      #admin_check_teams(@current_user)
       # byebug
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

    def matchup
    end
       
    end

    def create 
        @team = Team.new(name:  team_params[:name])
        @team.users << User.find_by(id: team_params[:user_id])
        return redirect_to new_team_path unless @team.save
        redirect_to team_path(@team)
    end

    def edit
      if @team.users.exclude?(@current_user)
        redirect_to teams_path
      end
    end

    def update
        @team.update(team_params)
        redirect_to team_path(@team)
    end

    def destroy
        if @team.users.exclude?(@current_user)
          redirect_to teams_path
        end
        @team.destroy
        redirect_to teams_path
    end

    def show

      find_team
    end


    private

    def find_team
        @team = Team.find_by(id: params[:id])
    end

    def team_params
        params.require(:team).permit(:name, :user_id)
    end

    def find_competitions
      @competitions = Competition.home(@team).or(Competition.visitor(@team))
    end

    #def admin_check_teams(user)
    #  if user.teams.count == 1
    #       errors.add(:base, "You cannot add another team as an admin")
    #      end
  #end

  #  def free_agent_team
   #   @free_agent_team = Team.find_by(name: "Free Agent")
  #end




end
