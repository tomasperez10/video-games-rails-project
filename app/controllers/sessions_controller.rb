class SessionsController < ApplicationController
    helper_method :logged_in?, :current_user
    layout "static"
    
    def new
        if logged_in?
          redirect_to user_path(current_user)
        end
    end
    
    def create
        @user = User.find_by(email: params[:session][:email].downcase)
        if @user && @user.authenticate(params[:session][:password])
          session[:user_id] = @user.id
          redirect_to user_path(@user)
        else
          flash[:danger] = "Error: email and/or password is incorrect or not available"
          render :new
        end
    end

    def omniauth
      @user = User.from_omniauth(request.env['omniauth.auth'])
      if @user.valid?
        session[:user_id] = @user.id
        redirect_to user_path(@user)
      else
        redirect_to '/login'
      end
    end

    def destroy
        if logged_in?
          session.clear
          redirect_to '/'
        else
          redirect_back(fallback_location: root_path)
        end
    end
end