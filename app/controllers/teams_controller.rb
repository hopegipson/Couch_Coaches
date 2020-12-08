class TeamsController < ApplicationController
  before_action :find_team, only: [:show, :create, :matchup, :edit, :update, :destroy]
  before_action :current_user
  before_action :free_agent_team
  before_action :find_competitions, only: [:matchup]
  before_action :logged_in?



  def index
      if params[:user_id]
      @teams = User.find(params[:user_id]).teams
    else
      @teams = Team.all
    end
  end
    
  def new
    if params[:user_id] && !User.exists?(params[:user_id])
      flash[:errors ]= ["User not found."]
      redirect_to users_path
    elsif params[:user_id].to_i != @current_user.id
      flash[:errors ]= ["You can only make a team for your user account"]
      redirect_to new_user_team_path(@current_user)
    elsif @current_user.admin?
      flash[:errors ]= ["Admin cannot make a team for competition."]
      redirect_to users_path
    else
      @team = Team.new
      @team.user_ids << params[:user_id]
      @team
    end
  end

  def matchup
  end
      
  def create 
    @team = Team.new(name:  create_team_params[:name])
    @team.users << User.find_by(id: create_team_params[:user_id])
    if @team.save
      flash[:messages ]= ["Your team: #{@team.name} was successfully created."]
      redirect_to team_path(@team)
    else
      flash[:errors]= @team.errors.full_messages
      redirect_back(fallback_location: teams_path)
    end
  end

  def edit
    if @team.users.exclude?(@current_user)
      flash[:errors ]= ["You cannot edit another user's team."]
      redirect_to teams_path
    end
  end

  def update
    @team.update(team_params)
  
    if @team.save
      flash[:messages ]= ["Team successfully updated."]
      redirect_to team_path(@team)
    else
      flash[:errors]= @team.errors.full_messages
      redirect_to edit_team_path(@team)
    end 
  end

  def destroy
    @team.players.each do |player|
          player.team_id = 1
          player.save
      end
    @team.destroy
    flash[:messages ]= ["Team successfully deleted."]
    redirect_to teams_path
  end

  def show
  end


  private

  def find_team
      @team = Team.find_by(id: params[:id])
  end

  def team_params
      params.require(:team).permit(:name, user_ids: [])
  end

  def create_team_params
    params.require(:team).permit(:name, :user_id)
  end

  def find_competitions
    @competitions = Competition.home(@team).or(Competition.visitor(@team))
  end
end
