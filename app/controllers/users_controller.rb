class UsersController < ApplicationController
    before_action :find_user, only: [:show, :edit, :update, :destroy]
    before_action :current_user
    before_action :free_agent_team



    def new
        @user = User.new
    end

    def index
        @users = User.all
    end

    def show
        if !current_user
            redirect_to root_path
        end
    end

    def create
        @user = User.create(user_params)
        if @user.admin
            @user.teams << Team.find_by(id: 1)
        end
        return redirect_to new_user_path unless @user.save
        session[:user_id] = @user.id
        redirect_to user_path(@user)
    end

    def edit
    end

    def update
        @user.update(user_params)
        redirect_to user_path(@user)
    end

    def destroy
        @user.destroy
        session[:user_id] = nil
        redirect_to root_path
    end

    

    private
  
    def user_params
        params.require(:user).permit(:first_name, :last_name, :email, :username, :password, :admin)
    end

    def find_user
        @user = User.find_by(id: params[:id])
    end



end