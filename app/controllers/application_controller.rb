class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    helper_method :current_user
    helper_method :admin?

    def current_user
      if session[:user_id]
        @current_user ||= User.find(session[:user_id])
      else
        @current_user = nil
      end
    end
  
    def home
      current_user
      if current_user
        @teams = @current_user.teams
      end
    end

    def admin?
      current_user
      @current_user.admin
    end
end
