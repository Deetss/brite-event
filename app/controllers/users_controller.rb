class UsersController < ApplicationController
    
    def new
        @user = User.new
    end
    
    def create
        @user = User.new(user_params)
        if @user.save
            flash[:success] = "Welcome to Brite Event!"
            log_in @user
            redirect_to @user
        else
            render :new
        end
    end
    
    def show
        @user = User.find(params[:id])
        @past_events = @user.events.where("date < ?", Time.now)
        @upcoming_events = @user.events.where("date > ?", Time.now)
    end
    
    private
    
    def user_params
        params.require(:user).permit(:name, :email)
    end
end
