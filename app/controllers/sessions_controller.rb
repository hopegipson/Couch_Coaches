class SessionsController < ApplicationController

    def new 
        @users = User.all
    end

    def create 
        @user = User.find_by(id: params[:user][:username])
        if @user && @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id
            redirect_to user_path(@user) 
        else
            flash[:alert] = "Invalid Password."
            redirect_to signin_path
        end
    end

    def create_by_auth
        @user = User.find_or_create_by(uid: auth['uid']) do |u|
        full_name = auth['info']['name']
        u.first_name = first_name_create(full_name)
        u.last_name = last_name_create(full_name)
        u.email = auth['info']['email']
        #u.image = auth['info']['image']
        u.password = Devise.friendly_token[0, 20]
        u.username = u.last_name.prepend("#{u.first_name[0]}#{u.first_name[1]}#{u.first_name[2]}")
        end
        session[:user_id] = @user.id

        redirect_to user_path(@user)
    end


    def destroy
        session.delete :user_id
        redirect_to root_path
    end

    private
    def auth
        request.env['omniauth.auth']
      end

      def first_name_create(full_name)
        full_name.split(" ")[0]
      end

      def last_name_create(full_name)
        full_name.split(" ")[1]
      end
end