class CompetitionsController < ApplicationController
    def index
        @competitions = Competition.all
      end
    
      def new
        @competition = Competition.new
      end

 
      def create 
        @competition = Competition.create(competition_params)
        @competition.game = Game.new
        return redirect_to new_competition_path unless @competition.save
        game = @competition.game
        redirect_to game_path(game)
    end

    def show
        find_competition
    end

    private

    def competition_params
        params.require(:competition).permit(:team1_id, :team2_id, :game_id, :game_week)
    end

    def find_competition
        @competition = Competition.find_by(id: params[:id])
    end


end
