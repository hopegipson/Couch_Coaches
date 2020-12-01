class GamesController < ApplicationController
  before_action :current_user

    def index
        @games = Game.all
      end
    
      def new
        @game = Game.new
      end

      def show
        find_game
        @home_team = @game.home_team
        @visitor_team = @game.visitor_team
        @home_players = @home_team.players
        @visitor_players = @visitor_team.players
        @week = @game.competition.game_week

      end

      def edit
        find_game
        @home_team = @game.home_team
        @visitor_team = @game.visitor_team
        @home_players = @home_team.players
        @visitor_players = @visitor_team.players
        @week = @game.competition.game_week
      end

      def update
        find_game
        @game.update(game_params)
        @game.total_score
        @game.choose_winner
        @game.save
        redirect_to game_path(@game)
    end



      private

      def find_game
        @game = Game.find_by(id: params[:id])
    end

      def game_params
          params.require(:game).permit(:team1_player1_score, :team1_player2_score, :team1_player3_score, :team1_player4_score, :team1_player5_score, :team2_player1_score, :team2_player2_score, :team2_player3_score, :team2_player4_score, :team2_player5_score, :scored)
      end









end
