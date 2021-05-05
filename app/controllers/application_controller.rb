class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    helper_method :current_user, :logged_in?

    def current_user
        @user = User.find_by(id: session[:user_id])
    end


end
