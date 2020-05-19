class SessionsController < ApplicationController
    before_action :redirect_if_logged_in, except: :destroy


    def new
        @user = User.new
    end

    def create
        user = User.find_by_credentials(params[:user][:user_name], params[:user][:password])
        session[:session_token] = user.reset_session_token!
        redirect_to cats_url
    end

    def destroy 
        current_user.reset_session_token! if logged_in?
        session[:session_token] = nil
        @current_user = nil
        redirect_to new_session_url
    end
end
