class VideoGamesController < ApplicationController
  before_action :require_login
  before_action :set_show, only: [:show, :edit, :update]
  before_action :created_by_current_user, only: [:edit, :update]
  helper_method :current_user

  def index
    @user = User.find_by(id: params[:user_id])
    if @user
      @video_games = @user.video_games
    else
      @video_games = VideoGames.all
    end
  end

  def show
    @genres = @video_game.video_games_genres_by_user(current_user.id)
  end

  def new
    @video_game = VideoGames.new
  end

  def create
    @video_game = VideoGames.new(video_game_params)
    if @video_game.save
      flash[:message] = "#{@video_game.title}"
      redirect_to video_game_path(@video_game)
    else
      render :new
    end
  end
 
   def edit
 
   end

end
