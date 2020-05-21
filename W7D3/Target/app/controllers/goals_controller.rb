class GoalsController < ApplicationController
    before_action :require_login

    def new
        @goal=Goal.new 
        render :new
    end

    def create
        @goal = Goal.new(params.require(:goal).permit(:title, :body, :private))
        @goal.user_id = current_user.id
        if @goal.save
            redirect_to user_url(current_user)
        else
            flash.now[:errors] = @goal.errors.full_messages
            render :new
        end
    end

end
