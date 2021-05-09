class GenresController < ApplicationController
    before_action :require_login

    def index
        @genres = Genre.all
    end

    def show
        @genre = Genre.find_by(params[:id])
        @video_games = @genre.video_games
    end
end
