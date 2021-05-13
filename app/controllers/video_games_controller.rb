class VideoGamesController < ApplicationController
  before_action :require_login
  # before_action :created_by_current_user, only: [:edit, :update]
  # after_action :set_video_game
  helper_method :current_user, :logged_in?

  def index
    if logged_in?
      @video_games = current_user.video_games
    else
      @video_games = VideoGame.all  
    end
  end

  def show
    @video_game = VideoGame.find_by(id: params[:id])
    @genre = @video_game.genre
  end

  def new
    @video_game = VideoGame.new
  end

  def create
      @video_game = VideoGame.create(video_game_params.merge(user_id: current_user.id))
      if @video_game.save
        flash[:message] = "#{@video_game.title}"
        redirect_to video_game_path(@video_game)
      else
        render :new
      end
  end
 
   def edit
      @video_game = VideoGame.find_by(id: params[:id])
      @genre = Genre.find_by(id: params[:id])
   end

   def update
    @video_game = VideoGame.find_by(id: params[:id])
    @genre = Genre.find_by(id: params[:id])
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
    params.require(:video_game).permit(:title, :description, :genre_name)
   end
   
  #  def set_video_game
  #   @video_game = VideoGames.find_by(params[:id])
  #  end
   
    # def created_by_current_user
    #  unless @video_game == current_user
    #    flash[:danger] = "Error: cannot edit this video game because you did not create it"
    #    redirect_to video_games_path
    #  end
    # end



end
