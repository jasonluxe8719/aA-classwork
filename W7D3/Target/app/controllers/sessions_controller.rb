class SessionsController < ApplicationController

    def create
        @user = User.find_by_credentials(params[:user][:username], params[:user][:password])
        if @user.nil?
            flash.now[:errors] = ["invalid credentials"]
            render :new 
        else
            login_user(@user)
            redirect_to user_url(@user) 
        end

    end

    def new
        @user = User.new
        render :new 
    end

    def destroy
        logout_user 
        redirect_to new_session_url
    end

end
