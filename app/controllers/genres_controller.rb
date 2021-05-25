class GenresController < ApplicationController
    before_action :require_login

    helper_method :current_user, :logged_in?


    def index
        @genres = Genre.all  
    end

    def show
        @genre = Genre.find_by(id: params[:id])
        @video_games = @genre.video_games
    end
end
