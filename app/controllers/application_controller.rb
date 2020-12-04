class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    helper_method :current_user
    helper_method :admin?
    helper_method :free_agent_team

    def current_user
      if session[:user_id]
        @current_user ||= User.find(session[:user_id])
        @user_teams = @current_user.teams
      else
        @current_user = nil
      end
    end
  
    def home
      current_user
      free_agent_team
      @user_teams = @current_user.teams if current_user

    end

    def admin?
      current_user
      @current_user.admin
    end

    def free_agent_team
      @free_agent_team = Team.find_by(name: "Free Agent")
  end
end
