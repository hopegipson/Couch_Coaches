class CompetitionsController < ApplicationController
    before_action :current_user
    before_action :free_agent_team
    before_action :find_competition, only: [:show, :edit, :update, :destroy]

    def index
        @competitions = Competition.all
        @competitions_week1 = Competition.where(game_week: 1)
        @competitions_week2 = Competition.where(game_week: 2)
        @competitions_week3 = Competition.where(game_week: 3)
        @competitions_week4 = Competition.where(game_week: 4)
        @competitions_week5 = Competition.where(game_week: 5)
      end
    
    def new
      if admin? == false
        flash[:errors ]= ["Only admins can create matchups"]
        redirect_to competitions_path
      end 
      @competition = Competition.new
    end

    def edit
      if admin? == false
        flash[:errors ]= ["Only admins can edit matchups"]
        redirect_to competitions_path
      end
    end
 
    def create 
      @competition = Competition.create(competition_params)
      @competition.game = Game.new
      if @competition.save
        game = @competition.game
        flash[:messages ]= ["Your matchup between #{@competition.home_team.name} and #{@competition.visitor_team.name} was successfully created"]
        redirect_to game_path(game)
      else
        flash[:errors]= @competition.errors.full_messages
        redirect_to new_competition_path
      end
    end

    def update
      @competition.update(competition_params)
      if @competition.save
        flash[:messages ]= ["Your matchup was successfully updated"]
        redirect_to competitions_path
      else
        flash[:errors]= @competition.errors.full_messages
        redirect_to edit_competition_path(@competition)
      end
    end


    def destroy
      @competition.game.destroy
      @competition.destroy
      flash[:messages ]= [" Matchup was successfully deleted"]
      redirect_to competitions_path
    end

    private

    def competition_params
        params.require(:competition).permit(:team1_id, :team2_id, :game_id, :game_week)
    end

    def find_competition
        @competition = Competition.find_by(id: params[:id])
    end
end
