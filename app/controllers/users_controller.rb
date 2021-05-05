class UsersController < ApplicationController
    helper_method :logged_in?, :current_user

    def new
        if logged_in?
            redirect_to user_video_games_path(current_user)
        else
            @user = User.new
        end
    end

    def create
        @user = User.new(user_params)
        if @user.save
          session[:user_id] = @user.id
          redirect_to user_video_games_path(@user)
        else
          render :new
        end
    end

    def show
        @user = current_user
        if logged_in?
          if @user == User.find_by(id: params[:id])
            render :layout => "application"
          else
            flash[:danger] = "Error: you do not have access to view this user's settings"
            redirect_to user_video_games_path(@user)
          end
        else
          redirect_to login_path
        end
    end
end
