class VideoGamesController < ApplicationController
  before_action :require_login
  before_action :created_by_current_user, only: [:edit, :update]
  helper_method :current_user, :logged_in?

  def index
    @user = User.find_by(id: params[:user_id])
    
    if @user
      @video_games = @user.video_games
    else
      @video_games = VideoGame.all  
    end
  end

  def show
    @video_game = VideoGame.find(params[:id])
    @genre = @video_game.genre_attributes
  end

  def new
    @video_game = VideoGame.new
  end

  def create
    @video_game = VideoGame.new(video_game_params)
    if @video_game.save
      flash[:message] = "#{@video_game.title}"
      redirect_to video_game_path
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
      redirect_to video_game_path
    else
      render :edit
    end
   end

   private
    
   def video_game_params
    params.require(:video_game).permit( :title, :description, genres_attributes:[:name])
   end
   
   def set_video_game
    @video_game = VideoGames.find_by(id: params[:id])
   end
   
   def created_by_current_user
    unless @video_game.created_by == current_user.id
      flash[:danger] = "Error: cannot edit this video game because you did not create it"
      redirect_to video_games_path(@video_game)
    end
   end



end
