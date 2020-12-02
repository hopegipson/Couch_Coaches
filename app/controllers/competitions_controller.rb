class CompetitionsController < ApplicationController
    before_action :current_user
    before_action :free_agent_team
    before_action :find_competition, only: [:show, :edit, :update, :destroy]

    def index
        current_user
        @competitions = Competition.all
        @competitions_week1 = Competition.where(game_week: 1)
        @competitions_week2 = Competition.where(game_week: 2)
        @competitions_week3 = Competition.where(game_week: 3)
        @competitions_week4 = Competition.where(game_week: 4)
        @competitions_week5 = Competition.where(game_week: 5)
      end
    
      def new
        if admin? == false
          redirect_to competitions_path
        end 
        @competition = Competition.new
      end

      def edit
        if admin? == false
          redirect_to competitions_path
        end
      end



 
      def create 
        @competition = Competition.create(competition_params)
        @competition.game = Game.new
        return redirect_to new_competition_path unless @competition.save
        game = @competition.game
        redirect_to game_path(game)
    end

    def update
        if @current_user.admin
        @competition.update(competition_params)
        redirect_to competition_path(@competition)
        end
    end


    def show
    end

    def destroy
      @competition.destroy
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
