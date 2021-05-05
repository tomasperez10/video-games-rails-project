class SessionsController < ApplicationController
    helper_method :logged_in?, :current_user
    
    def new
        if logged_in?
          redirect_to user_video_games_path(current_user)
        end
    end
    
    def create
        user = User.find_by(email: params[:session][:email].downcase)
        if user && user.authenticate(params[:session][:password])
          session[:user_id] = user.id
          redirect_to user_video_games_path(user)
        else
          flash[:danger] = "Error: email and/or password is incorrect or not available"
          render :new
        end
    end
end