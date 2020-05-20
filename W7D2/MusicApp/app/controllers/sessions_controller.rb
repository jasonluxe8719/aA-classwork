class SessionsController < ApplicationController

    def create
        @user = User.find_by_credentials(
            params[:user][:email],
            params[:user][:password]
        )
    
        if @user
            log_in_user!(@user)
            redirect_to user_url(@user)
        else
            flash[:errors] = ["User not found!"]
            redirect_to new_sesion_url
        end
    end

    def destroy
        logout_user!
        redirect_to new_session_url
    end

    def new
        @user = User.new
    end
end
