class UsersController < ApplicationController

    def create
        @user = User.new(params.require(:user).permit(:username, :password))

        if @user.save
            login_user(@user) 
            redirect_to user_url(@user)
        else
            flash.now[:errors] = ["you did it wrong yo!"]
        end
    end

    def new
        @user = User.new
        render :new
    end

    def show
        @user = User.find(params[:id])
        render :show
    end
end
