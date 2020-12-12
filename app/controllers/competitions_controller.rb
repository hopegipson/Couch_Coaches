class CompetitionsController < ApplicationController
    before_action :free_agent_team
    before_action :find_competition, only: [:show, :edit, :update, :destroy]
    before_action :logged_in?

    def index
        @competitions = Competition.all        
       16.times do |i| 
         instance_variable_set("@competitions_week#{i+1}", Competition.game_week(i+1))
       end

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
      @competition = Competition.new(competition_params)
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
      if @competition.update(competition_params)
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
