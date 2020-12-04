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
    end

    def create
        @user = User.create(user_params)
        @user.teams << Team.find_by(id: 1) if @user.admin
        if @user.save 
            session[:user_id] = @user.id
            flash[:messages ]= ["User was successfully created."]
            redirect_to user_path(@user)
        else
            flash[:errors]= @user.errors.full_messages
            redirect_to new_user_path
        end
    end

    def edit
        if @user != @current_user
            flash[:errors ]= ["You cannot edit another user"]
            redirect_to teams_path
        end
    end

    def update
        @user.update(user_params)
        redirect_to user_path(@user)
    end

    def destroy
        if @user.admin == true && User.filter_by_admin.count == 1
            flash[:errors] = ['You cannot delete the only admin, you must make another user an admin to delete']
            redirect_to user_path(@user)
        else
            @user.teams.each do |team|
            if team.users.count == 1
                team.players.each do |player|
                     player.team_id = 1
                     player.save
            end
                team.destroy
                end
            end
        @user.destroy
        session[:user_id] = nil
        flash[:messages ]= ["User successfully deleted."]
        redirect_to root_path
        end
    end

    

    private
  
    def user_params
        params.require(:user).permit(:first_name, :last_name, :email, :username, :password, :admin)
    end

    def find_user
        @user = User.find_by(id: params[:id])
    end
end