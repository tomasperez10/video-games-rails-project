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

   def update
    @video_game.update(video_game_params)
    if @video_game.save
      flash[:message] = "#{@video_game.title}"
      redirect_to video_game_path(@video_game)
    else
      render :edit
    end
   end

   private
    
   def video_game_params
    params.require(:video_game).permit( :title, :description, genre_ids:[], genres_attributes:[:name])
   end
   
   def set_video_game
    @video_game = VideoGames.find_by(id: params[:id])
   end
   
   def created_by_current_user
    unless @video_game.created_by == current_user.id
      flash[:danger] = "Error: cannot edit this video game because you did not create it"
      redirect_to video_game_path(@video_game)
    end
   end



end
