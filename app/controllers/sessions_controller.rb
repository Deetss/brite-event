class SessionsController < ApplicationController
    def new
    end
    
    def create
        @user = User.find_by(email: params[:session][:email])
        if @user
            log_in @user
            flash[:success] = "Log in successful!"
            redirect_to root_url
        else
            flash.now[:danger] = "Email not found!"
            render :new
        end
    end
    
    def destroy
        log_out
        flash[:warning] = "Log out successful!"
        redirect_to root_url
    end
end
