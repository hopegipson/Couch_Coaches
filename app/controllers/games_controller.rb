class GamesController < ApplicationController
    def index
        @games = Game.all
      end
    
      def new
        @game = Game.new
      end

      def show
        find_game
        @home_team = @game.home_team
        @visitor_team = @game.home_team
        @home_players = @home_team.players
        @visitor_players = @visitor_team.players

      end

      private

      def find_game
        @game = Game.find_by(id: params[:id])
    end





end
